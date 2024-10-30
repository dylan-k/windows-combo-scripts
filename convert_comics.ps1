<#
.SYNOPSIS
    This script converts all .cbr (Comic Book RAR) files in a specified directory (and its subdirectories) to .cbz (Comic Book ZIP) format using 7-Zip.
.DESCRIPTION
    This script is a fork of an original PowerShell script posted by Reddit user @callesnut. It converts .cbr to .cbz but removes the WebP conversion feature. It also provides recursive functionality and the option to specify the starting directory for the conversion process.
.PARAMETER StartDir
    The directory where the script should start searching for .cbr files.
.EXAMPLE
    .\convert_comics.ps1
    Prompts the user for a directory path. If no path is provided, it uses the current directory and converts all .cbr files to .cbz.
.EXAMPLE
    .\convert_comics.ps1 -StartDir "C:\Comics"
    Starts from the specified directory "C:\Comics" and recursively converts all .cbr files in the directory and its subdirectories to .cbz.
.NOTES
    Requirements:
        - Windows PowerShell 5.0 or higher
        - 7-Zip installed and added to the system PATH
.LINK
    https://www.7-zip.org/
.LINK
    https://www.reddit.com/r/comicrackusers/comments/pxfp66/powershell_script_to_convert_cbr_to_cbz_and/
.LINK
    https://pastebin.com/5dEE48xv
#>

param (
    [string]$StartDir
)

# Clear host
Clear-Host

# Prompt the user for the directory if not provided as a parameter
if (-not $StartDir) {
    $StartDir = Read-Host "Please enter the directory path to start from (leave blank to use the current directory)"
    if (-not $StartDir) {
        $StartDir = Get-Location
        Write-Host "No directory entered. Using the current directory: $StartDir"
    } else {
        Write-Host "Using directory: $StartDir"
    }
} else {
    Write-Host "Using directory from parameter: $StartDir"
}

# Print info to console
Write-Host "Starting the .cbr to .cbz conversion process."
Write-Host "Searching for .cbr files in the directory and subdirectories...`n"

# Create stopwatch to check total time used
$stopWatch = [System.Diagnostics.Stopwatch]::StartNew()

# Create a unique temporary directory used for unpacking/converting/packing
$tempDirName = [System.IO.Path]::GetRandomFileName()
$temppath = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath $tempDirName
New-Item $temppath -ItemType "Directory" | Out-Null

# Parameters for 7-Zip
$7zPath = "7z"  # Assumes 7z is in the system PATH
$7xoutpath = "-o$temppath"
$7ainpath = "$temppath\*"

# Function to delete files to Recycle Bin
function Move-ToRecycleBin {
    param ([string]$Path)
    try {
        [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile(
            $Path,
            [Microsoft.VisualBasic.FileIO.UIOption]::OnlyErrorDialogs,
            [Microsoft.VisualBasic.FileIO.RecycleOption]::SendToRecycleBin
        )
    } catch {
        Write-Host "Failed to move $Path to Recycle Bin: $_" -ForegroundColor Red
    }
}

# Function to clean up temporary directory
function Cleanup-TempDir {
    if (Test-Path $temppath) {
        Remove-Item -Path $temppath -Force -Recurse -ErrorAction SilentlyContinue
    }
}

# Initialize counters and lists
$totalFiles = 0
$successCount = 0
$failureCount = 0
$failedFiles = @()
$fileConversionTimes = @()

# Ensure cleanup happens even if script encounters an error
try {
    # Find all .cbr files in the specified directory and subdirectories
    $files = Get-ChildItem -Path $StartDir -Recurse -Filter *.cbr -File

    $totalFiles = $files.Count

    if ($totalFiles -eq 0) {
        Write-Host "No .cbr files found in the specified directory."
    } else {
        Write-Host "Total .cbr files found: $totalFiles"
    }

    # For all files (.cbr) found:
    foreach ($f in $files) {
        $fileStopwatch = [System.Diagnostics.Stopwatch]::StartNew()

        Write-Host "Processing: $($f.FullName)"

        # Extract to the temporary directory
        $extractProcess = Start-Process -FilePath $7zPath -ArgumentList "e", "`"$($f.FullName)`"", $7xoutpath, "-y" -NoNewWindow -Wait -PassThru
        if ($extractProcess.ExitCode -ne 0) {
            Write-Host "Extraction failed for $($f.FullName)" -ForegroundColor Red
            $failureCount++
            $failedFiles += $f.FullName
            continue
        }

        # Check if extraction was successful by verifying if files exist in the temp folder
        $extractedFiles = Get-ChildItem -Path $temppath -File
        if ($extractedFiles.Count -eq 0) {
            Write-Host "Extraction succeeded but no files found for $($f.FullName)" -ForegroundColor Red
            $failureCount++
            $failedFiles += $f.FullName
            continue
        } else {
            Write-Host "Extraction successful for $($f.FullName). Files found: $($extractedFiles.Count)"
        }

        # Use 7-Zip to create new .cbz file with all the files in the temporary directory
        $7newname = Join-Path -Path $f.DirectoryName -ChildPath "$($f.BaseName).cbz"
        $packProcess = Start-Process -FilePath $7zPath -ArgumentList "a", "`"$7newname`"", "$temppath\*", "-tzip", "-y" -NoNewWindow -Wait -PassThru
        if ($packProcess.ExitCode -ne 0) {
            Write-Host "Failed to create .cbz for $($f.FullName)" -ForegroundColor Red
            $failureCount++
            $failedFiles += $f.FullName
            continue
        }

        # Check if packing was successful and if the .cbz file has a valid size
        if (-not (Test-Path $7newname)) {
            Write-Host "Failed to create .cbz for $($f.FullName)" -ForegroundColor Red
            $failureCount++
            $failedFiles += $f.FullName
            continue
        } else {
            $fileSizeKB = (Get-Item $7newname).Length / 1KB
            if ($fileSizeKB -le 1) {
                Write-Host "Warning: The file $7newname is only $([math]::Round($fileSizeKB,2)) KB, which seems too small." -ForegroundColor Yellow
                $failureCount++
                $failedFiles += $f.FullName
                continue
            } else {
                Write-Host "Converted: $($f.FullName) to $7newname"
                $successCount++
            }
        }

        # Only move the original .cbr to Recycle Bin if the .cbz file exists and is valid
        if ((Test-Path $7newname) -and ($fileSizeKB -gt 1)) {
            Write-Host "Moving $($f.FullName) to Recycle Bin"
            Move-ToRecycleBin -Path $f.FullName
        } else {
            Write-Host "Not moving $($f.FullName) to Recycle Bin due to previous errors." -ForegroundColor Yellow
            $failureCount++
            $failedFiles += $f.FullName
            continue
        }

        # Record file processing time
        $fileStopwatch.Stop()
        $fileConversionTimes += $fileStopwatch.Elapsed.TotalSeconds

        # Clean up the temporary directory for the next iteration
        Remove-Item -Path "$temppath\*" -Force -Recurse -ErrorAction SilentlyContinue
    }
}
finally {
    # Ensure the temporary directory is cleaned up
    Cleanup-TempDir

    # Stop the stopwatch and display elapsed time
    $stopWatch.Stop()
    $totalTime = [math]::Round($stopWatch.Elapsed.TotalSeconds, 2)
    Write-Host "`nConversion process completed."

    # Calculate average time per file
    if ($fileConversionTimes.Count -gt 0) {
        $averageTime = [math]::Round(($fileConversionTimes | Measure-Object -Average).Average, 2)
    } else {
        $averageTime = 0
    }

    # Display summary
    Write-Host "`nSummary:"
    Write-Host "Total files found: $totalFiles"
    Write-Host "Successfully converted: $successCount"
    Write-Host "Failed to convert: $failureCount"
    Write-Host "Total time elapsed: $totalTime seconds"
    Write-Host "Average time per file: $averageTime seconds"

    if ($failedFiles.Count -gt 0) {
        Write-Host "`nFiles that failed to convert:"
        foreach ($file in $failedFiles) {
            Write-Host " - $file"
        }
    }
}
