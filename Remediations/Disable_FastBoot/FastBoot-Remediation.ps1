$RegPath  = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power'
$RegName  = 'HiberbootEnabled'
$RegValue = 0
$RegType  = 'DWord'


if ((Test-Path -LiteralPath $RegPath) -ne $true)
{
	New-Item $RegPath -force -ea SilentlyContinue
}

try
{
	New-ItemProperty -LiteralPath $RegPath -Name $RegName -Value $RegValue -PropertyType $RegType -Force -ea SilentlyContinue
}
catch
{
	Exit 1
}
Exit 0
