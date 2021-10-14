function passwordDecryption () {
    $username = "<username>"
    $pwdTxt = Get-Content "C:\temp\EncryptedPassword.txt"
    $securePwd = $pwdTxt | ConvertTo-SecureString 
    $credObject = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securePwd
    return $credObject
}