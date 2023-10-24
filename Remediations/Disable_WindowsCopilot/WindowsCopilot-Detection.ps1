$ErrActionPref = 'stop'
$RegPath       = 'HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot'
$RegName       = 'TurnOffWindowsCopilot'
$RegValue      = 1


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