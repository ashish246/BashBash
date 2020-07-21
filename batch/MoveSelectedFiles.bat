@Echo off
cd /D C:\Script\source

for /f "delims=" %%A in (C:\Script\batch\PartialFileNames.txt) do (
 dir /s /b /a-d *%%A*.* > "%temp%\@movelist" 
 for /f %%f in (%temp%\@movelist) do (move %%f "C:\Script\target\")
)