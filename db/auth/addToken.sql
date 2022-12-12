update user_auth
set 
    reset_password_token = ${reset_password_token},
    reset_Password_Expires = ${reset_Password_Expires}
where email iLike ${email};