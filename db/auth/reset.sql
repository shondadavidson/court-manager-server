update user_auth
set 
    reset_password_token = '',
    password = ${password}
    
where reset_password_token = ${reset_password_token} and email = ${email}