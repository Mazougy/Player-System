--create an account
addCommandHandler("register", function(player, command, username, password)
    if not username or not password then
<<<<<<< HEAD
        outputChatBox("/register [username]  [password]",player, 235, 64, 52)
    end
end)


--login to their account
=======
        return outputChatBox("Usage: /register [username] [password]", player, 235, 64, 52)
    end
    if getAccount(username) then
        return outputChatBox("An account already exixts with that name", player, 255, 100, 100)
    end
end)
--login to their account
if not isPasswordValid(password) then
    return outputChatBox("An account already exixts with that name", player, 255, 100, 100)
end
>>>>>>> b592c25 (main)


--logout of their account
