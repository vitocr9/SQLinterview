$SQLServer= "interview728.cehiul4dwv3q.us-east-1.rds.amazonaws.com,3341"
$username = "sa"
$password = 'V3ry5tr0ngP455'
$files = Get-ChildItem -Path ./SetupSQL

$ConnectionString = "Server=$SQLServer;User Id=$username;Password=$password;TrustServerCertificate=True"


foreach ($query in $files){
    Invoke-Sqlcmd -ConnectionString $ConnectionString -InputFile $query

}


