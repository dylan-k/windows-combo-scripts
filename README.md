
Windows Combo Scripts
===============================================================================

Combo Scripts: Multi-launchers and Utility Routines for Windows

The start menu isn't enough for me. It only opens shortcuts to apps. The search, various launchers, mostly they just run shortcuts too. Sometimes you need to do a combination of things. It's a computer, after all.

These are scripts to do some more complex things like "setup the desktop to begin a writing session" or "open several apps together and close them together when I'm done". This saves me so much time overall and helps me switch tasks more easily.

Combined with Shortcuts and Scheduled Tasks, these scripts make Windows a lot more flexible and customized for me. They're mostly combo-launchers but there are some backup, maintenance, and cleanup routines in here as well.


Directory Structure
--------------------------------------------------------------------------------

  - `convert-html-markdown.bat`: Converts HTML files to Markdown format.
  - `invisible.vbs`: Runs scripts invisibly without showing a command prompt window.
  - `keyboard/`: Contains scripts related to keyboard configurations.
  - `launch_elite-dangerous.bat`: Launches the Elite Dangerous game.
  - `launch_qbittorrent.bat`: Launches qBittorrent application.
  - `office-cleanrun/`: Scripts for office-related tasks.
  - `outlook-obsidian/`: Scripts for integrating Outlook with Obsidian.
  - `show-desktop.bat`: Batch script to show the desktop.
  - `show-desktop.vbs`: M  ## Usage
  ### Running Scripts via Start Menu Shortcuts
  To quickly run these scripts using the Start menu, you can create shortcuts for each script. This allows you to press the Start key and type the name of the action, such as "space meeting," to quickly execute the script. Here's how to create a shortcut:
  1. **Navigate to the Script Location**: Open File Explorer and navigate to the directory where your script is located.
  2. **Create a Shortcut**:
     - Right-click on the script file (e.g., `space_meeting.bat`).
     - Select "Create shortcut."
  3. **Move the Shortcut**:
     - Move the created shortcut to a location indexed by the Start menu, such as the Desktop or a specific folder in the Start menu.
  4. **Rename the Shortcut**:
     - Rename the shortcut to a descriptive name, such as "Space Meeting."
  5. **Run the Script**:
     - Press the Start key, type the name of the shortcut (e.g., "Space Meeting"), and press Enter to run the script.
  ### Running Scripts from the Command Line
  You can also run these scripts from the command line. For example, to show the desktop, you can run:
  ```sh
  wscript.exe "H:\Config\Scripts\show-desktop.vbs"inimize all open windows and show the desktop.
  - `space_gaming.bat`: Sets up the desktop for gaming sessions.
  - `space_meeting.bat`: Sets up the desktop for meetings.
  - `space_notes.bat`: Sets up the desktop for note-taking.
  - `space_webdev.bat`: Sets up the desktop for web development.
  - `space_worknotes_vscode.bat`: Sets up the desktop for work notes in VS Code.
  - `space_worknotes.bat`: Sets up the desktop for general work notes.
  - `task_adobe-kill.bat`: Kills all Adobe-related processes.
  - `task_backup.bat`: Runs backup routines.
  - `task_checkup.bat`: Runs system checkup routines.
  - `task_clean-temp.bat`: Cleans temporary files.
  - `task_quit-all.ps1`: PowerShell script to quit all running applications.
  - `task_updates.bat`: Checks for system updates.
  - `vr-hotspot/`: Scripts related to VR hotspot configurations.
  - `webcam/`: Scripts related to webcam configurations.
  - `weekday-kickoff.bat`: Sets up the desktop for the start of the week.
  - `write_blog.bat`: Sets up the desktop for writing blog posts.


Usage
--------------------------------------------------------------------------------

To run any of these scripts, you can either double-click them or run them from the command line. For example, to show the desktop, you can run:

```powershell
wscript.exe "show-desktop.vbs"
```


Directory Structure
--------------------------------------------------------------------------------

  - `convert-html-markdown.bat`: Converts HTML files to Markdown format.
  - `invisible.vbs`: Runs scripts invisibly without showing a command prompt window.
  - `keyboard/`: Contains scripts related to keyboard configurations.
  - `launch_elite-dangerous.bat`: Launches the Elite Dangerous game.
  - `launch_qbittorrent.bat`: Launches qBittorrent application.
  - `office-cleanrun/`: Scripts for office-related tasks.
  - `outlook-obsidian/`: Scripts for integrating Outlook with Obsidian.
  - `show-desktop.bat`: Batch script to show the desktop.
  - `show-desktop.vbs`: [Script](show-desktop.vbs) to minimize all open windows and show the desktop.
  - `space_gaming.bat`: Sets up the desktop for gaming sessions.
  - `space_meeting.bat`: Sets up the desktop for meetings.
  - `space_notes.bat`: Sets up the desktop for note-taking.
  - `space_webdev.bat`: Sets up the desktop for web development.
  - `space_worknotes_vscode.bat`: Sets up the desktop for work notes in VS Code.
  - `space_worknotes.bat`: Sets up the desktop for general work notes.
  - `task_adobe-kill.bat`: Kills all Adobe-related processes.
  - `task_backup.bat`: Runs backup routines.
  - `task_checkup.bat`: Runs system checkup routines.
  - `task_clean-temp.bat`: Cleans temporary files.
  - `task_quit-all.ps1`: PowerShell script to quit all running applications.
  - `task_updates.bat`: Checks for system updates.
  - `vr-hotspot/`: Scripts related to VR hotspot configurations.
  - `webcam/`: Scripts related to webcam configurations.
  - `weekday-kickoff.bat`: Sets up the desktop for the start of the week.
  - `write_blog.bat`: Sets up the desktop for writing blog posts.


Usage
--------------------------------------------------------------------------------

To run any of these scripts, you can either double-click them or run them from the command line. For example, to show the desktop, you can run:

```powershell
wscript.exe "show-desktop.vbs"
```


Usage
--------------------------------------------------------------------------------

Most of these scripts are designed to help me do things quickly, either with the Windows Start Menu or at the Command Line.

### Running Scripts via Start Menu Shortcuts

With a Start Menu shortcut, you can press the Start key and type the name of the action, such as "meeting," to quickly open all the apps associated with a meeing: Outlook, Notes, Video Conference, etc. 

Here's how to create a shortcut:

1. **Navigate to the Script Location**: Open File Explorer and navigate to the directory where your script is located.
2. **Create a Shortcut**:
   - Right-click on a script file (e.g., `space_meeting.bat`).
   - Select "Create shortcut."
3. **Move the Shortcut**:
   - Move the created shortcut to a location indexed by the Start menu, such as the Desktop or a specific folder in the Start menu. For example, you can move the shortcut to the Start Menu directory:
     ```
     %APPDATA%\Microsoft\Windows\Start Menu\
     ```
4. **Rename the Shortcut**:
   - Rename the shortcut to a descriptive name, such as "meeting."
5. **Run the Script**:
   - Press the Start key, type the name of the shortcut (e.g., "Space Meeting"), and press Enter to run the script.

### Running Scripts from the Command Line

You can also run these scripts from the command line. For example, to show the desktop, you can run:

```powershell
wscript.exe "H:\Config\Scripts\show-desktop.vbs"
```
