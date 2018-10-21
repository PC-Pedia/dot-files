#Set-ExecutionPolicy -ExecutionPolicy Unrestricted
#New-Item $profile -Type File -Force
#notepad $profile
function AsAdminOrNot {
	$wid = [System.Security.Principal.WindowsIdentity]::GetCurrent()
	$prp = New-Object System.Security.Principal.WindowsPrincipal($wid)
	$adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
	$prp.IsInRole($adm)
}
function turn-on-hotspot { netsh wla sta ho}
function turn-off-hotspot { netsh wla sto ho}
function fing {ping 1.1.1.1 -t}
function ding {ping 192.168.1.1 -t}
function adbconnect($_) {ADB connect $_}
function adbemulator($_) {cd $env:android_home/tools/ ; emulator.exe -avd $_}
function run-as-admin{Start-Process powershell -Verb runas}
function clean-bin{Get-ChildItem .\ -include bin,obj -Recurse | ForEach-Object ($_) { remove-item $_.fullname -Force -Recurse }}
function update-fork($_){git remote add upstream $_ ; git fetch upstream ; git pull upstream master}
function updatep {. $profile}
function editp {nano $profile}
function cr($_){code $_ -r}
function gcl($_){git clone $_}
function gad($_){git add $_}
function gpu($_){git push $_}
function gdi($_){git diff $_}
function gst(){git status}
#######
Set-Alias w turn-on-hotspot
Set-Alias w! turn-off-hotspot
Set-Alias c code
Set-Alias e explorer
Set-Alias su run-as-admin
$repo= Join-Path $env:USERPROFILE -ChildPath \Documents\Repos\
#######
if (AsAdminOrNot) {Write-Output "~Admin~Be careful!"}
else {Write-Output "~NotAdmin~"}
Start-Transcript
