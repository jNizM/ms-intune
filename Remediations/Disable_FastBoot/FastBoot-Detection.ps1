$ErrActionPref = 'stop'
$RegPath       = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power'
$RegName       = 'HiberbootEnabled'
$RegValue      = 0


try
{
	$RegOutput = (Get-ItemPropertyValue -LiteralPath $RegPath -Name $RegName)
}
# KeyPath does not exist
catch [System.Management.Automation.ItemNotFoundException]
{
	Exit 1
}
# ValueName does not exist
catch [System.Management.Automation.PSArgumentException]
{
	Exit 1
}
finally
{
	$ErrActionPref = 'Continue'
}

if ($RegValue -eq $RegOutput)
{
	Exit 0
}

Exit 1