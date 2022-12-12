select count(*) from user_auth
where reset_password_token = ${reset_password_token} and 
reset_password_expires < ${time}