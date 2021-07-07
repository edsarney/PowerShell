$AppInfo = Get-WmiObject Win32_Product -Filter "Name Like 'Google Chrome'"

If ($AppInfo) {& ${env:WINDIR}\System32\msiexec /x $AppInfo.IdentifyingNumber /Quiet /Passive /NoRestart}

$Reg32Key = Get-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome" -name "Version" -ErrorAction SilentlyContinue

$Ver32Path = $Reg32Key.Version

If ($Ver32Path) {& ${env:ProgramFiles}\Google\Chrome\Application\$Ver32Path\Installer\setup.exe --uninstall --multi-install --chrome --system-level --force-uninstall}

$Reg64Key = Get-ItemProperty -path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome' -name "Version" -ErrorAction SilentlyContinue

$Ver64Path = $Reg64Key.Version

If ($Ver64Path) {& ${env:ProgramFiles(x86)}\Google\Chrome\Application\$Ver64Path\Installer\setup.exe --uninstall --multi-install --chrome --system-level --force-uninstall}