function sendMail() 
{
    param (
        [string]$from,
        [string]$to,
        [string]$subject,
        [string]$body,
        [System.Net.NetworkCredential]$credit
    )
    
    $emailSmtpServer = "smtp.office365.com"
    $emailSmtpServerPort = "587"
 
    $emailMessage = New-Object System.Net.Mail.MailMessage
    $emailMessage.From = $from
    $emailMessage.To.Add( $to )
    $emailMessage.Subject = $subject
    $emailMessage.IsBodyHtml = $true
    $emailMessage.Body = $body
 
    $SMTPClient = New-Object System.Net.Mail.SmtpClient( $emailSmtpServer , $emailSmtpServerPort )
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = $credit;
 
    $SMTPClient.Send( $emailMessage )
}
