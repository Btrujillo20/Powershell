$ousheet = Import-Csv#pathtofile
$usersheet = Import-Csv#pathtofile

foreach($ou in $ousheet){
    $ouname = $ou.name
    $oupath = $ou.path
    new-adorganizationalunit -name $ouname -path $oupath
}

foreach ($user in $usersheet){
    $username = $user.username 
    $password = $user.password
    $firstname = $user.firstname 
    $lastname = $user.lastname 
    $ou = $user.ou 
    $email = $user.email 
    $city = $user.city 
    $state = $user.state 
    $country = $user.country 
    $jobtitle = $user.jobtitle 
   }

   if (get-aduser -F {SamAccountName -eq $username}){Write-Warning "User $username is already created"}
   else {
       new-aduser -samaccountname $username -userprinciplename "$username@domain.com" `
       -name "$firstname $lastname" -enable $true -displayname "$firstname $lastname" `
       -path $ou -city $city -state $state -country $country -title $jobtitle `
       -emailaddress $email -Accountpassword $password -changepasswordatlogon $true
   }
