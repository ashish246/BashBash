@Echo off

rem for /f "delims=" %%A in (C:\Script\batch\PartialFileNames.txt) do (
rem  dir /s /b /a-d *%%A*.* > "%temp%\@movelist" 
rem  for /f %%f in (%temp%\@movelist) do xcopy %%f "C:\Script\target\" /y
rem )
cd /D C:\Script\source

for /f "delims=" %%A in (C:\Script\batch\PartialFileNames.txt) do (
	 in (*%%A*.*) xcopy /s C:\Script\source\*.* C:\Script\target\ /y
)