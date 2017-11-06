<!--- Populate Image Gallery List --->
<cfinvoke component="model.admin.qryImageGallery" returnvariable="galleryList"  method="getGalleryList"/>
<!--- Populate Users List --->
<cfinvoke component="model.admin.qryUserManage" returnvariable="userList"  method="getNamesAndIDS"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to NASA's GOPDb</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #252525;
}
-->
</style>
<link href="/css/ui.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.mainbottom {	background-image: url(/media/compare/canvasbottomrepeat.png);
	background-repeat: repeat-x;
	background-position: top;
}
.mainleft {	background-image: url(/media/compare/canvasleftrepeast.png);
	background-repeat: repeat-y;
	background-position: right;
}
.mainright {	background-image: url(/media/compare/canvasrightrepeat.png);
	background-repeat: repeat-y;
	background-position: left;
}
.maintop {	background-image: url(/media/compare/canvastoprepeat.png);
	background-repeat: repeat-x;
	background-position: bottom;
}
.minibottom {	background-image: url(/media/compare/innercanvasbottomrepeat.png);
	background-repeat: repeat-x;
	background-position: top;
}
.minitop {	background-image: url(/media/compare/innercanvastoprepeat.png);
	background-repeat: repeat-x;
	background-position: bottom;
}
.titlestyles {	font-family: Arial, Helvetica, sans-serif;
	font-size: 18px;
	font-weight: bold;
	background-image: none;
	background-repeat: no-repeat;
	background-color: #f0f0f0;
}
.adminTitleRepeater {
	background-image: url(/media/admin/TitleMiddle.png);
	background-repeat: repeat-x;
}
.panelBottomRepeater {
	background-image: url(/media/admin/panel_bottomMiddle.png);
	background-repeat: repeat-x;
	background-position: top;
}
.panelLeftRepeater {
	background-image: url(/media/admin/panel_left.png);
	background-repeat: repeat-y;
}
.panelRepeaterRight {
	background-image: url(/media/admin/panel_right.png);
	background-repeat: repeat-y;
}

.formbox1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
			border: 0px solid #ccc;
			list-style: none;
			height: 10em;
			overflow: auto;
			width: 20em;
}

.formbox2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
			border: 0px solid #ccc;
			list-style: none;
			height: 10em;
			overflow: auto;
			width: 42em;
}
-->
</style>
<script src="/Scripts/swfobject_modified.js" type="text/javascript"></script>
</head>

<body>

<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><cfinclude template="/includes/menus/topmenu.cfc"></td>
      </tr>
      <tr>
        <td align="center"><table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><table width="1200" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="17" align="right" valign="bottom"><img src="/media/compare/canvastopleft.png" width="17" height="17" /></td>
                    <td width="*" class="maintop">&nbsp;</td>
                    <td width="17" align="left" valign="bottom"><img src="/media/compare/canvastopright.png" width="17" height="17" /></td>
                  </tr>
                  <tr>
                    <td class="mainleft">&nbsp;</td>
                    <td valign="top" bgcolor="#a4a4a4">
<CFSETTING ENABLECFOUTPUTONLY="Yes">
<!--- ############################################################# --->
<!--- # Before attempting to use, you must set a few variables..  # --->
<!--- ############################################################# --->
<CFSET INCLUDE_DIR = "#expandpath(".")#">
<CFSET FILEMGR_FILENAME = "index.cfm">
<CFSET INCLUDE_DIR_WWW = "https://gopdb-test.ksc.nasa.gov/GOPDb_Tech_Docs">
<!--- INCLUDE_DIR is top directory location for the files
      The user that the cold fusion server is running as MUST have read/write
      access to this directory. --->
<CFSET DIRECTORY_SEPARATOR = "\"> <!--- for DOS... for UNIX, use "/" --->
<CFSET ALLOW_CFM_FILES = "No"> <!--- whether or not .cfm/.cfml/.dbm files may be uploaded --->
<CFSET ALLOW_CGI_FILES = "No"> <!--- whether or not .cgi files may be uploaded --->
<CFSET ALLOW_PERL_FILES = "No"> <!--- whether or not .pl/.plx files may be uploaded --->
<!--- ################################# --->
<!--- # END OF CUSTOMIZATION SECTION  # --->
<!--- ################################# --->


<!--- make sure that the subdir value is valid and doesn't contain any dangerous characters --->
<CFPARAM NAME="SUBDIR" DEFAULT="">
<CFSET SUBDIR = Trim(SUBDIR)>
<CFSET OLD_SUBDIR = SUBDIR>
<CFIF SUBDIR neq "">
	<CFSWITCH EXPRESSION="#SUBDIR#">
	<CFCASE VALUE=".,..,../,/..,./,/.,..\,\..,.\,\.">
		<!--- The value of subdir may not equal any of the above character combinations --->
		<CFSET SUBDIR = "">	
	</CFCASE>
	</CFSWITCH>
</CFIF>
<CFIF SUBDIR neq "">
	<CFIF Find("/../",SUBDIR) OR Find("\..\",SUBDIR) OR Find("\../",SUBDIR) OR Find("/..\",SUBDIR)>
		<!--- The value of subdir may not contain any of the above character combinations --->
		<CFSET SUBDIR = "">
	</CFIF>
</CFIF>
<CFIF Len(SUBDIR) gt 3>
	<CFIF Left(SUBDIR,3) eq "../" OR Right(SUBDIR,3) eq "/.." OR  Left(SUBDIR,3) eq "..\" OR Right(SUBDIR,3) eq "\..">
		<!--- The value of subdir may not start or end with any of the above character combinations --->
		<CFSET SUBDIR = "">
	</CFIF>
</CFIF>
<CFPARAM NAME="ACTION" DEFAULT="">
<CFIF ACTION eq "DELETE">
	<CFPARAM NAME="FILENAME" DEFAULT="">
	<CFSET FILENAME = Trim(FILENAME)>
	<CFIF OLD_SUBDIR neq SUBDIR OR Find(" ",FILENAME) gt 0 OR Find("/",FILENAME) gt 0 OR Find("\",FILENAME) gt 0 OR Find("*",FILENAME) gt 0>
		<CFOUTPUT>
		<FONT FACE="ARIAL,HELVETICA">
		<H3>Error!</H3>
		<CFIF TYPE eq "Dir">
			The directory could not be removed.  Please go back and try again.
		<CFELSE>
			The file could not be removed.  Please go back and try again.
		</CFIF>
		</FONT>
		</CFOUTPUT>
		<CFABORT>
	</CFIF>
	
	<CFSET DeleteFile = "#INCLUDE_DIR##DIRECTORY_SEPARATOR##SUBDIR#">
	<CFIF SUBDIR neq ""><CFSET DeleteFile = DeleteFile & DIRECTORY_SEPARATOR></CFIF>
	<CFSET DeleteFile = DeleteFile & FILENAME>
	<CFIF TYPE eq "Dir">
		<CFDIRECTORY ACTION="DELETE" DIRECTORY="#DeleteFile#">
	<CFELSE>
		<CFFILE ACTION="DELETE" FILE="#DeleteFile#">
	</CFIF>
	<CFLOCATION URL="#FILEMGR_FILENAME#?SUBDIR=#URLEncodedFormat(SUBDIR)#">
<CFELSEIF ACTION eq "UPLOAD">
	<CFIF OLD_SUBDIR neq SUBDIR>
		<CFOUTPUT>
		<FONT FACE="ARIAL,HELVETICA">
		<H3>Error!</H3>
		The files were not uploaded.  Please go back and try again.
		</FONT>
		</CFOUTPUT>
		<CFABORT>
	</CFIF>
	
	<CFSET UploadDir = "#INCLUDE_DIR##DIRECTORY_SEPARATOR##SUBDIR#">
	<CFIF SUBDIR neq ""><CFSET UploadDir = UploadDir & DIRECTORY_SEPARATOR></CFIF>
	
	<CFLOOP FROM=1 TO=5 STEP=1 INDEX="FileNumber">
		<CFSET ThisFileExpression = "File#FileNumber#">
		<CFSET ThisFile = Evaluate(ThisFileExpression)>
		<CFIF Trim(ThisFile) neq "">
			<CFFILE ACTION="UPLOAD"
		        FILEFIELD="FILE#FileNumber#"
		        DESTINATION="#UploadDir#"
		        NAMECONFLICT="OVERWRITE">
			<CFIF File.FileWasSaved>
				<CFSET Filename="#File.ServerFile#">
				<CFSET EXTENSION = ListLast(Filename,'.')>
				<!--- delete any files in extensions that are not allowed --->
				<CFIF 
					( ALLOW_CFM_FILES AND (LCase(EXTENSION) eq "cfm" OR LCase(EXTENSION) eq "cfml" OR LCase(EXTENSION) eq "dbm" OR LCase(EXTENSION) eq "dbml") )
					OR
					( ALLOW_CGI_FILES AND LCase(EXTENSION) eq "cgi" )
					OR
					( ALLOW_PERL_FILES AND (LCase(EXTENSION) eq "pl" OR LCase(EXTENSION) eq "plx") )>
	
					<CFSET ERROR = 1>
					<CFIF SUBDIR neq "">
						<CFFILE ACTION="DELETE" FILE="#UploadDir##Filename#">
					<CFELSE>
						<CFFILE ACTION="DELETE" FILE="#INCLUDE_DIR##DIRECTORY_SEPARATOR##Filename#">
					</CFIF>
				</CFIF>
				<!--- delete any files where the filename contains a space or a slash --->
				<CFIF Find(" ",Filename) gt 0 OR Find("/",Filename) gt 0 OR Find("\",Filename) gt 0 OR Find("*",Filename) gt 0>
					<CFSET ERROR = 1>
					<CFIF SUBDIR neq "">
						<CFFILE ACTION="DELETE" FILE="#UploadDir##Filename#">
					<CFELSE>
						<CFFILE ACTION="DELETE" FILE="#INCLUDE_DIR##DIRECTORY_SEPARATOR##Filename#">
					</CFIF>
				</CFIF>
			</CFIF>
		</CFIF>
	</CFLOOP>
	
	<CFIF IsDefined("ERROR")>
		<CFLOCATION URL="#FILEMGR_FILENAME#?SUBDIR=#URLEncodedFormat(SUBDIR)#&ERROR=#ERROR#">
	<CFELSE>
		<CFLOCATION URL="#FILEMGR_FILENAME#?SUBDIR=#URLEncodedFormat(SUBDIR)#">
	</CFIF>
<CFELSEIF ACTION eq "MAKEDIR">
	<CFIF OLD_SUBDIR neq SUBDIR OR Find(" ",DIRNAME) gt 0 OR Find("/",DIRNAME) gt 0 OR Find("\",DIRNAME) gt 0 OR Find("*",DIRNAME) gt 0>
		<CFOUTPUT>
		<FONT FACE="ARIAL,HELVETICA">
		<H3>Error!</H3>
		The directory was not be created.  Please go back and try again.
		</FONT>
		</CFOUTPUT>
		<CFABORT>
	</CFIF>
	
	<CFSET NewDir = "#INCLUDE_DIR##DIRECTORY_SEPARATOR##SUBDIR#">
	<CFIF SUBDIR neq ""><CFSET NewDir = NewDir & DIRECTORY_SEPARATOR></CFIF>
	<CFSET NewDir = NewDir & DIRNAME>
	<CFTRY>
	<CFDIRECTORY ACTION="CREATE" DIRECTORY="#NewDir#">
		<CFCATCH TYPE="Any">
			<CFOUTPUT>
			<FONT FACE="ARIAL,HELVETICA">
			<H3>Error!</H3>
			The directory was not be created.  Please go back and try again.
			</FONT>
			</CFOUTPUT>
			<CFABORT>
		</CFCATCH>
	</CFTRY>
	<CFLOCATION URL="#FILEMGR_FILENAME#?SUBDIR=#URLEncodedFormat(SUBDIR)#">
</CFIF>
<CFPARAM NAME="SUBDIR" DEFAULT="">
<CFIF SUBDIR neq "">
	<CFSWITCH EXPRESSION="#SUBDIR#">
	<CFCASE VALUE=".,..,../,/..,./,/.,..\,\..,.\,\.">
		<CFSET SUBDIR = "">	
	</CFCASE>
	</CFSWITCH>
</CFIF>
<CFIF SUBDIR neq "">
	<CFIF Find("/../",SUBDIR) OR Find("\..\",SUBDIR) OR Find("\../",SUBDIR) OR Find("/..\",SUBDIR)>
		<CFSET SUBDIR = "">
	</CFIF>
</CFIF>
<CFIF Len(SUBDIR) gt 3>
	<CFIF Left(SUBDIR,3) eq "../" OR Right(SUBDIR,3) eq "/.." OR  Left(SUBDIR,3) eq "..\" OR Right(SUBDIR,3) eq "\..">
		<CFSET SUBDIR = "">
	</CFIF>
</CFIF>
<CFDIRECTORY ACTION="LIST" DIRECTORY="#INCLUDE_DIR##DIRECTORY_SEPARATOR##SUBDIR#" NAME="DIRLIST" SORT="TYPE,NAME">
<CFOUTPUT><FONT FACE="ARIAL,HELVETICA" SIZE="2"></CFOUTPUT>
<CFPARAM NAME="ERROR" DEFAULT="0">
<CFSWITCH EXPRESSION="#ERROR#">
	<CFCASE VALUE="1">
		<CFOUTPUT>
		<B>An error occurred while uploading files.  One or more files were not uploaded.  Please
		remember, filenames cannot contain spaces, slashes (\ or /), or asterisks (*).  Also, files
		cannot have ".cfm", ".cfml", or ".dbm" extensions.</B>
		<P>
		</CFOUTPUT>
	</CFCASE>
</CFSWITCH>
<CFSETTING ENABLECFOUTPUTONLY="No">

<B style="color:#fff;">
<cfoutput><A HREF="#FILEMGR_FILENAME#?SUBDIR=..">Document Home</A>
</cfoutput>&nbsp;&nbsp;&nbsp;Displaying directory: "<CFOUTPUT>#INCLUDE_DIR_WWW#/#SUBDIR#</CFOUTPUT>"</B>

<P>
<TABLE CELLPADDING="2" CELLSPACING="0" BORDER="1" BORDERCOLOR="Black" STYLE="BACKGROUND-COLOR:#ffffff" WIDTH="100%">
<TR BGCOLOR="Navy">
	<TD><FONT FACE="ARIAL,HELVETICA" COLOR="White" SIZE="2"><B>File/Directory Name</B></FONT></TD>
	<TD><FONT FACE="ARIAL,HELVETICA" COLOR="White" SIZE="2"><B>Date</B></FONT></TD>
	<TD><FONT FACE="ARIAL,HELVETICA" COLOR="White" SIZE="2"><B>Size</B></FONT></TD>
	<TD><FONT FACE="ARIAL,HELVETICA" COLOR="White" SIZE="2"><B>Action</B></FONT></TD>
</TR>
<CFOUTPUT QUERY="DIRLIST">
<CFIF (NAME neq ".userDiary") AND (NAME neq ".") AND NOT (NAME eq ".." AND SUBDIR eq "")>
<TR>
	<TD VALIGN="top" WIDTH="100%">
		<FONT FACE="ARIAL,HELVETICA" SIZE="2">
		<CFIF TYPE eq "Dir">
			<CFIF NAME neq "..">
				<CFSET FOLDER_IMAGE = "images/folder_closed.jpg">
				<CFIF SUBDIR eq "">
					<CFSET NEW_SUBDIR = "#NAME#">
				<CFELSE>
					<CFSET NEW_SUBDIR = "#SUBDIR##DIRECTORY_SEPARATOR##NAME#">
				</CFIF>
			<CFELSE>
				<CFSET FOLDER_IMAGE = "images/folder_up.jpg">
				<CFSET NEW_SUBDIR = ListDeleteAt(SUBDIR,ListLen(SUBDIR,DIRECTORY_SEPARATOR),DIRECTORY_SEPARATOR)>
				<CFIF Len(NEW_SUBDIR) gt 0 AND Right(NEW_SUBDIR,1) eq DIRECTORY_SEPARATOR>
					<CFSET NEW_SUBDIR = Left(NEW_SUBDIR,Len(NEW_SUBDIR)-1)>
				</CFIF>
			</CFIF>
			<A HREF="#FILEMGR_FILENAME#?SUBDIR=#URLEncodedFormat(NEW_SUBDIR)#"><IMG SRC="#FOLDER_IMAGE#" BORDER=0 VALIGN="MIDDLE" WIDTH="18" HEIGHT="18">#NAME#</A>
		<CFELSE>
			#NAME#
		</CFIF>
		</FONT>
	</TD>
	<TD VALIGN="top">
		<FONT FACE="ARIAL,HELVETICA" SIZE="2">
		#DateFormat(DateLastModified,'yyyy-mm-dd')#&nbsp;#TimeFormat(DateLastModified,'HH:mm:ss')#
		</FONT>
	</TD>
	<TD VALIGN="top">
		<FONT FACE="ARIAL,HELVETICA" SIZE="2">
		<CFIF TYPE eq "Dir">
			<CENTER>-</CENTER>
		<CFELSEIF SIZE lt 2000>
			#Trim(NumberFormat(SIZE,'____'))#&nbsp;bytes
		<CFELSEIF SIZE gt 2000000>
			<CFSET SIZE_IN_MEGS = SIZE/1024/1024>
			#Trim(NumberFormat(SIZE_IN_MEGS,'__________.0'))#&nbsp;M
		<CFELSE>
			<CFSET SIZE_IN_KILOBYTES = SIZE/1024>
			#Trim(NumberFormat(SIZE_IN_KILOBYTES,'____'))#&nbsp;K
		</CFIF>
		</FONT>
	</TD>
	<TD VALIGN="top">
		<FONT FACE="ARIAL,HELVETICA" SIZE="2">
		<CFIF NAME neq "..">
			<!---A HREF="#FILEMGR_FILENAME#?ACTION=DELETE&SUBDIR=#URLEncodedFormat(SUBDIR)#&FILENAME=#URLEncodedFormat(NAME)#&TYPE=#TYPE#" style="display:none;">Delete</A--->
		</CFIF>
		<CFIF TYPE eq "File">
			<CFIF SUBDIR eq "">
				<CFSET FILE_LINK = "#INCLUDE_DIR_WWW#/#NAME#">
			<CFELSE>
				<CFSET FILE_LINK = "#INCLUDE_DIR_WWW#/#SUBDIR#/#NAME#">
			</CFIF>			
			<A HREF="#FILE_LINK#">View</A>
		<CFELSEIF TYPE eq "Dir">
			<A HREF="#FILEMGR_FILENAME#?SUBDIR=#URLEncodedFormat(NEW_SUBDIR)#">View</A>		
		</CFIF>
		</FONT>
	</TD>
</TR>
</CFIF>
</CFOUTPUT>
</TABLE>

<cfinvoke component="model.users.qryGOPDbUsers" method="getUserLogin" returnvariable="userlogin"/>
<cfinvoke component="model.users.qryPermissions" method="refreshRoles" returnvariable="qryUserRole">
<cfinvokeargument name="userid" value="#userlogin#"/>
</cfinvoke>
<cfif #trim(qryUserRole.roleId)# is "developer">
<P>
<H3>Make Directory</H3>
Use this form to make a new directory at this level.
<P>
<CFFORM ACTION="#FILEMGR_FILENAME#" ENCTYPE="multipart/form-data" NAME="frmMakeDir">
<INPUT TYPE="hidden" NAME="ACTION" VALUE="MAKEDIR">
<INPUT TYPE="hidden" NAME="SUBDIR" VALUE="<CFOUTPUT>#SUBDIR#</CFOUTPUT>">
<CFINPUT TYPE="TEXT" SIZE="20" MAXLENGTH="40" NAME="DIRNAME" REQUIRED="Yes" MESSAGE="You must enter a new directory name.">
<INPUT TYPE="SUBMIT" VALUE="Make Directory">
</CFFORM>
<P>
<H3>Upload New Files</H3>
Use the following forms to upload new files to the current directory.  <B>Warning:</B> existing
files with the same names will be overwritten.
<P>
<CFFORM ACTION="#FILEMGR_FILENAME#" ENCTYPE="multipart/form-data">
<INPUT TYPE="hidden" NAME="ACTION" VALUE="UPLOAD">
<INPUT TYPE="hidden" NAME="SUBDIR" VALUE="<CFOUTPUT>#SUBDIR#</CFOUTPUT>">
<OL>
<LI><INPUT TYPE="File" NAME="File1" SIZE=30>
<LI><INPUT TYPE="File" NAME="File2" SIZE=30>
<LI><INPUT TYPE="File" NAME="File3" SIZE=30>
<LI><INPUT TYPE="File" NAME="File4" SIZE=30>
<LI><INPUT TYPE="File" NAME="File5" SIZE=30>
</OL>
<P>
<INPUT TYPE="SUBMIT" VALUE="Upload These Files">
</CFFORM>
</cfif>
</FONT>
                    <!---
                    <cfinclude template="filemanager.cfm"/>
					--->
                    <!---iframe width="1000" height="600" src="filemanager.cfm" frameborder="0"/--->
					</td>
                    <td class="mainright">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="17" align="right" valign="top"><img src="/media/compare/canvasbottomleft.png" width="17" height="17" /></td>
                    <td width="*" class="mainbottom">&nbsp;</td>
                    <td width="17" align="left" valign="top"><img src="/media/compare/canvasbottomright.png" width="17" height="17" /></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center"><img src="/media/spacer.gif" width="20" height="20" /></td>
      </tr>
      <tr>
        <td align="center"><table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="21"><img src="/media/ui/leftbottombar.png" width="21" height="28" /></td>
            <td width="*"class="bottomrepeater">&nbsp;</td>
            <td width="17"align="right"><img src="/media/ui/rightbottombar.png" width="17" height="28" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center"><img src="/media/spacer.gif" width="30" height="20" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>