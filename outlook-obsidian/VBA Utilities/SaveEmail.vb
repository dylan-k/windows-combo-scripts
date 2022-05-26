Option Explicit
'============================================================================='
Sub ExtractEmail()

  Dim vaultPathToSaveFileTo As String
  Dim emailFileNameStartChr As String
  Dim emailTypeLink As String
  Dim personNameStartChar As String
  config vaultPathToSaveFileTo, personNameStartChar, emailFileNameStartChr, emailTypeLink

  ' Save as plain text
  Const OLTXT = 0
  ' Object holding variable
  Dim obj As Object
  ' Instantiate an Outlook Email Object
  Dim oMail As Outlook.MailItem
  ' If something breaks, skip to the end, tidy up and shut the door
  On Error GoTo EndClean:
  ' Establish the environment and selected items (emails)
  ' NOTE: selecting a conversation-view stack wont work
  '   you'll need to select one of the emails
  Dim fileName As String
  Dim temporarySubjectLineString As String
  Dim currentExplorer As Explorer
  Set currentExplorer = Application.ActiveExplorer
  Dim Selection As Selection
  Set Selection = currentExplorer.Selection
  ' For each email in the Selection
  ' Assigning email item to the `obj` holding variable
  For Each obj In Selection
  ' set the oMail object equal to that mail item
  Set oMail = obj
  ' Is it an Email?
  If oMail.Class <> 43 Then
    MsgBox "This code only works with Emails."
    GoTo EndClean: ' you broke it
  End If


'Extract Data from Email'
'============================================================================='

  ' Get the Subject line
  temporarySubjectLineString = oMail.Subject
  ' function call the name cleaner to remove any
  '  illegal characters from the subject line
  ReplaceCharsForFileName temporarySubjectLineString, ""

    ' List the recipients
    Dim recips As Outlook.Recipients
      Set recips = oMail.Recipients
    Dim recip As Outlook.Recipient
    'Dim result As String
    Dim recipString As String
      recipString = ""
    For Each recip In recips
      recipString = recipString & "  "
      recipString = recipString & "- "
      ' recipString = recipString & formatName(recip.name, personNameStartChar)
      recipString = recip.name & " <"

      ' recipient addresses differ with internal/exchange recipients
      If recip.AddressEntry Is Nothing Then
        recipString = recipString &  recip.Address
      ElseIf recip.AddressEntry.GetExchangeUser Is Nothing Then
        recipString = recipString & recip.Address
      Else
        recipString = recipString & recip.AddressEntry.GetExchangeUser.PrimarySmtpAddress
      End If
      recipString = recipString & recip.address & ">" & vbCrLf
    Next

  ' Get sender's name and email
  Dim sender As String
  ' sender = formatName(oMail.sender, personNameStartChar)
  ' sender addresses differ with internal/exchange senders
    If oMail.SenderEmailType = "SMTP" Then
      sender = oMail.sender & " <" & oMail.SenderEmailAddress & ">"
    Else
      If oMail.SenderEmailType = "EX" Then
        sender = oMail.sender & " <" & oMail.Sender.GetExchangeUser.PrimarySmtpAddress & ">"
      End If
    End If

  ' Get the email recieved date
  Dim dtDate As Date
    dtDate = oMail.ReceivedTime


'Create a Markdown File'
'============================================================================='

  ' For some reason, it adds a few empty lines to the start of the file?

  ' Make YAML Frontmatter
  Dim emailFrontmatter As String
  emailFrontmatter = "---" & vbCrLf
  emailFrontmatter = emailFrontmatter & "subject: " & Chr(34) & oMail.Subject & Chr(34) & vbCrLf
  emailFrontmatter = emailFrontmatter & "from: " & Chr(34) & sender & Chr(34) & vbCrLf
  emailFrontmatter = emailFrontmatter & "to: " & recipString & vbCrLf
  emailFrontmatter = emailFrontmatter & "date:" & Format(oMail.ReceivedTime, "yyyy-mm-dd") & Format(oMail.ReceivedTime, "hh:MM AM/PM") & vbCrLf
  emailFrontmatter = emailFrontmatter & "tags: email" & vbCrLf
  emailFrontmatter = emailFrontmatter & "---"

  ' Add Frontmatter to email body
  Dim emailContent As String
  emailContent = emailFrontmatter & vbCrLf & vbCrLf & vbCrLf & oMail.Body

  ' Make a dummy email to hold the details we're saving
  ' This way we dont get junk in the message header when saving
  Dim outputItem As MailItem
    Set outputItem = Application.CreateItem(olMailItem)
  outputItem.Body = emailContent
  outputItem.BodyFormat = olFormatPlain

  ' Make the file name
  ' format like YYYY-MM-DD_email_subjectlinegoeshere.md
  ' I used dated filenames for all notes to see them as a timeline
  ' and because git/pcloud can destroy filedates
  fileName = Format(dtDate, "yyyy-mm-dd", vbUseSystemDayOfWeek, vbUseSystem)
  fileName = fileName & "_" & emailFileNameStartChr & "_"
  fileName = fileName & temporarySubjectLineString & ".md"

  ' Save the result
  outputItem.SaveAs vaultPathToSaveFileTo & fileName, OLTXT

  Next
EndClean:
  Set obj = Nothing
  Set oMail = Nothing
  Set outputItem = Nothing
End Sub
