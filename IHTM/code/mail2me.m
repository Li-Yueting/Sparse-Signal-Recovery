function mail2me(subject,content,attachment)
mail =  'XXX@qq.com' ; % email address
password =  'XXX'; %email password(usually different from email login password)
setpref('Internet','E_mail',mail)
setpref('Internet','SMTP_Server','smtp.qq.com') %smtp.qq/163/126/gmail.com
setpref('Internet','SMTP_Username',mail)
setpref('Internet','SMTP_Password',password)
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465'); %usually 465(check pls)
sendmail(mail,subject,content,attachment);
end
