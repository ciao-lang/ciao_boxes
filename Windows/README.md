# Virtual machines for Windows

## WSL

More recent images are available at https://developer.microsoft.com/en-us/windows/downloads/virtual-machines .
These contain full developer environment, WSL with preinstalled Ubuntu, etc.  

For GUI emacs the easiest option is installing
[vcxsrv](https://sourceforge.net/projects/vcxsrv/) and enable it with:
```
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /V VcxSrv /D "C:\Program Files\VcXSrv\vcxsrv.exe :0 -multiwindow -clipboard -wgl"
wsl bash -c "echo 'export DISPLAY=:0' >> $HOME/.profile"
```

NOTE: Accessing the Windows filesystem from Linux is easy. Doing the
reverse is tricky, see:
 - https://daverupert.com/2018/04/developing-on-windows-with-wsl-and-visual-studio-code/
 - https://superuser.com/questions/1324632/accessing-ubuntu-data-like-etc-from-windows   

## Native builds

 - TODO: Finish support for MSYS2, MinGW64, etc.
 - TODO: is cross compilation easier with WSL?
 
