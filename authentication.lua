--create an account
addCommandHandler("register", function(player, command, username, password)
    if not username or not password then
        outputChatBox("/register [username]  [password]",player, 235, 64, 52)
    end
end)


--login to their account


--logout of their account
