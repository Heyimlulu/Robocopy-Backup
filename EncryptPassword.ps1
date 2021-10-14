function encryptPassword () {
    $secureStringPwd = Read-Host -AsSecureString
    $secureStringText = $secureStringPwd | ConvertFrom-SecureString
    Set-Content "C:\temp\EncryptedPassword.txt" $secureStringText
}

# Simply run the function
encryptPassword