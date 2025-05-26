--create an account
addCommandHandler("register", function(player, command, username, password)
    if not username or not password then
        outputChatBox("/register [username]  [password]", player, 235, 64, 52)
        return
    end

    --login to their accounts

    if getAccount(username) then
        outputChatBox("An account already exixts with that name", player, 255, 100, 100)
        return
    end

    --login to their account

    if not isPasswordValid(password) then
        outputChatBox("An account already exixts with that name", player, 255, 100, 100)
        return
    end
end)



--logout of their account
