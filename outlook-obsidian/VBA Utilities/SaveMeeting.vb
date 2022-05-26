Option Explicit
'=============================================================================='
Sub GetAttendeeList(meetingType As String)

  Dim vaultPathToSaveFileTo As String
  Dim personNameStartChar As String

  Dim trainingFileNameStartChr As String
  Dim trainingTypeLink As String

  Dim meetingFileNameStartChr As String
  Dim meetingTypeLink As String

  Dim fileNameStartChr As String
  Dim typeLink As String


  Select Case meetingType
    Case "Meeting"
      config vaultPathToSaveFileTo, personNameStartChar, , , meetingFileNameStartChr, meetingTypeLink
      ' use the meeting data variables
      fileNameStartChr = meetingFileNameStartChr
      typeLink = meetingTypeLink
    Case "Training"
      config vaultPathToSaveFileTo, personNameStartChar, , , , , trainingFileNameStartChr, trainingTypeLink
      ' use the training data variables
      fileNameStartChr = trainingFileNameStartChr
      typeLink = trainingTypeLink
  End Select



  ' Instantiate an Outlook application instance
  Dim objApp As Outlook.Application
    Set objApp = CreateObject("Outlook.Application")
  ' Grab the currently selected item by using the function declare above
  Dim objItem As Object
    Set objItem = GetCurrentItem()
    Dim objAttendees As Outlook.Recipients
      ' For the currently selected item, we're getting a copy of the recipients
      Set objAttendees = objItem.Recipients

  ' If something breaks, skip to the end, tidy up and shut the door
  On Error GoTo EndClean:

  ' Is it an appointment
  If objItem.Class <> 26 Then
    MsgBox "This code only works with meetings."
    GoTo EndClean: ' you broke it
  End If
  '=======================================================



'Extract Data from Meeting'
'============================================================================='

  Dim dtStart As Date
    dtStart = objItem.Start

  Dim dtEnd As Date
    dtEnd = objItem.End

  Dim strSubject As String
    strSubject = objItem.Subject
    ' Clean up meeting title of invalid characters
    ReplaceCharsForFileName strSubject, ""

  Dim strLocation As String
    strLocation = objItem.Location

  Dim strNotes As String
    strNotes = objItem.Body

  Dim objOrganizer As String
    objOrganizer = objItem.Organizer

  Dim objAttendeeReq As String
    objAttendeeReq = ""

  Dim objAttendeeOpt As String
    objAttendeeOpt = ""
  '=======================================================
  ' ListAttendees is really just an email item now
  Dim ListAttendees As MailItem
    Set ListAttendees = Application.CreateItem(olMailItem)
  '=======================================================
  ' Get The Attendee List
  Dim x As Long
  Dim attendeeName As String
  ' For each recipient on the selected meeting
  For x = 1 To objAttendees.Count
    ' For `REQUIRED` Attendee's Separate them out
    If objAttendees(x).Type = olRequired Then
      ' Format Names of attendees correctly
      attendeeName = formatName(objAttendees(x).name, personNameStartChar)
      ' List the name in a markdown/yaml list of strings
      ' two spaces(32), a hyphen(45), space(32), quotationmark(34), name, quotationmark(34)
      ' all these characters are escaped because they wouldn't work otherwise
      objAttendeeReq = objAttendeeReq & Chr(32) & Chr(32) & Chr(45) & Chr(32) & Chr(34) & attendeeName & Chr(34) & vbCrLf
      ' objAttendeeReq = objAttendeeReq & vbCrLf & "  - " & attendeeName & vbCrLf
    Else ' For `OPTIONAL` Attendees, make separate list
      ' Format and list optional Attendee names
      attendeeName = formatName(objAttendees(x).name, personNameStartChar)
      objAttendeeOpt = objAttendeeOpt & vbCrLf
      objAttendeeOpt = objAttendeeOpt & "- "
      objAttendeeOpt = objAttendeeOpt & attendeeName
      objAttendeeOpt = objAttendeeOpt & vbCrLf
    End If
  Next
  '=======================================================



'Create a Markdown File'
'============================================================================='

  ' Make YAML frontmatter
  Dim meetingFrontmatter As String
  meetingFrontmatter = "---" & vbCrLf
  meetingFrontmatter = meetingFrontmatter & "title: " & Chr(34) & objItem.Subject & Chr(34) & vbCrLf
  meetingFrontmatter = meetingFrontmatter & "date: " & Format(dtStart, "yyyy-mm-dd") & vbCrLf
  meetingFrontmatter = meetingFrontmatter & "tags: " & "[meeting]" & vbCrLf
  meetingFrontmatter = meetingFrontmatter & "---"

  ' Add frontmatter
  Dim strCopyData As String
  strCopyData = meetingFrontmatter & vbCrLf & vbCrLf & vbCrLf

  ' Add heading/subject line
  strCopyData = strCopyData & objItem.Subject & vbCrLf
  strCopyData = strCopyData & "==============================================================================="
  strCopyData = strCopyData & vbCrLf & vbCrLf & vbCrLf

  ' Add details to body not frontmatter, so preview won't hide precious location, moments before meeting
  strCopyData = strCopyData & "## Meeting Details" & vbCrLf & vbCrLf
  strCopyData = strCopyData & "```yaml" & vbCrLf
  strCopyData = strCopyData & "- location: " & strLocation & vbCrLf
  strCopyData = strCopyData & "- organizer: " & Chr(34) & formatName(objOrganizer, personNameStartChar) & Chr(34) & vbCrLf
  strCopyData = strCopyData & "- required: " & vbCrLf & objAttendeeReq
  strCopyData = strCopyData & "```" & vbCrLf & vbCrLf & vbCrLf

  ' Add body text from Outlook appointment
  strCopyData = strCopyData & strNotes & vbCrLf & vbCrLf & vbCrLf & vbCrLf

  ' Add section for next actions
  strCopyData = strCopyData & "Next Actions" & vbCrLf
  strCopyData = strCopyData & "--------------------------------------------------------------------------------" & vbCrLf
  strCopyData = strCopyData & "<!-- *person* will *action* *when* -->" & vbCrLf & vbCrLf
  ' placeholder list item for faster entry during meeting
  strCopyData = strCopyData & "- [ ] xxx" & vbCrLf & vbCrLf & vbCrLf

  ' Add section for asides
  strCopyData = strCopyData & "Any Other Business" & vbCrLf
  strCopyData = strCopyData & "--------------------------------------------------------------------------------" & vbCrLf & vbCrLf & vbCrLf

  Const OLTXT = 0

  ' Put the output into the Email item body
  ListAttendees.Body = strCopyData

  ' Make filename
  Dim fileName As String
  fileName = Format(dtStart, "yyyy-mm-dd ") & fileNameStartChr & " " & strSubject & ".md"

  ' Save file
  ListAttendees.SaveAs vaultPathToSaveFileTo & fileName, OLTXT



'Tidy up and shut the door
'============================================================================='

EndClean:
  Set objApp = Nothing
  Set objItem = Nothing
  Set objAttendees = Nothing
End Sub

Sub ExtractMeeting()
  GetAttendeeList "Meeting"
End Sub

Sub ExtractTraining()
  GetAttendeeList "Training"
End Sub
