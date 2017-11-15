$name="Bryan A"
$Email = "user@gmail.com";
$Password= "password";

Function MAIL{
      Param (
          [Parameter(Mandatory=$true)]  [String]$s,
          [Parameter(Mandatory=$true)]  [String]$c,
          [Parameter(mandatory=$false)] [String]$a="none",
          [Parameter(Mandatory=$true)]  [String]$to
      )
            $message = new-object Net.Mail.MailMessage;
            $message.From = "$name <$Email>";
            $message.To.Add($to);
            $message.Subject = $s;
            $message.Body = $c;

          if(($PSBoundParameters.ContainsKey('a')) -and $a){
              $attachment = New-Object Net.Mail.Attachment($a);
              $message.Attachments.Add($attachment);
            }

            $smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com", "587");
            $smtp.EnableSSL = $true;
            $smtp.Credentials = New-Object System.Net.NetworkCredential($Email, $Password);
            $smtp.send($message);
            write-host "Mail Sent" ;

          if(($PSBoundParameters.ContainsKey('a')) -and $a){
                $attachment.Dispose();
            }

  }

$BM ="lo que sea awe"

#atachment
#MAIL  -s "subject hello" -c "body text" -a 'C:\backup\file.txt' "user@gmail.com";

#simple
#MAIL  -s "subject hello" -c "body text" -to "user@gmail.com";

