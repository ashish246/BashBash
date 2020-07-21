echo First copy all the files and sub-folders from SOURCE folder to TARGET folder
xcopy /s C:\Script\source\*.* C:\Script\target\ /y

echo Change the directory to SOURCE
cd /D C:\Script\source

echo Deleting the matching files from SOURCE folder
for /f "delims=" %%A in (C:\Script\batch\PartialFileNames.txt) do (
 dir /s /b /a-d *%%A*.* > "%temp%\@movelist" 
 for /f %%f in (%temp%\@movelist) do del %%f
)

echo Change the directory to TARGET
cd /D C:\Script\target

echo Deleting the non-matching files from TARGET folder
for /f "delims=" %%A in (C:\Script\batch\PartialFileNames.txt) do (
 dir /s /b /a-d *%%A*.* > "%temp%\@movelist" 
 for /f %%f in (%temp%\@movelist) do del %%f
)
