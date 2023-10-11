$SQLServer= "default68d.cyyrz1j3dt4l.us-east-1.rds.amazonaws.com:1433"
$SQLServer = $SQLServer.Replace(":",",")
$username = "sa"
$password = 'V1t03p4m'
$files = Get-ChildItem -Path ./DBCreation
$ConnectionString = "Server=$SQLServer;User Id=$username;Password=$password;TrustServerCertificate=True"
foreach ($query in $files){
    
    Invoke-Sqlcmd -ConnectionString $ConnectionString -InputFile $query

}
