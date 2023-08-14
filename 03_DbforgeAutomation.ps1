$serverName=$args[0]
$database=$args[1]
$userName=$args[2]
$password=$args[3]
$source=$args[4]

#Write-Host "Test deploying $serverName, $database, $userName, $password, $source"

$connection = New-DevartSqlDatabaseConnection -Server $serverName -Database $database -UserName $userName -Password $password
Invoke-DevartExecuteScript -Connection $connection -Database $database -Input $source -IgnoreError