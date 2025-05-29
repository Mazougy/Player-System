MAXLEN = 6

function isPasswordValid(password)
    return string.len(password) >= MAXLEN
end

--Create an account

addCommandHandler("register", function(player, command, username, password)
    if not username or not password then
        outputChatBox("/register [username]  [password]", player, 235, 64, 52)
        return
    end

    if getAccount(username) then
        outputChatBox("An account already exixts with that name", player, 255, 100, 100)
        return
    end


    --Check if Password Valid to the requirements

    if not isPasswordValid(password) then
        outputChatBox("Your Password Didn't Match With Password's Requirement", player, 255, 100, 100)
        return
    end

    passwordHash(password, "bcrypt", {}, function(hashedPassword)
        local account = addAccount(username, hashedPassword)
        setAccountData(account, "hashed_password", hashedPassword)
        outputChatBox("You Successfully Registered Your Account. Use /accLogin ", player, 100, 255, 100)
    end)
end, false, false)

--login to their account

addCommandHandler('accLogin', function(player, command, username, password)
    if not username or not password then
        outputChatBox("/accLogin [username]  [password]", player, 235, 64, 52)
        return
    end
    local account = getAccount(username)
    if not account then
        outputChatBox("No Such Account Could Be Found With That Name Or Password", player, 255.100, 100)
    end

    local hashedPassword = getAccountData(account, 'hashed_password')

    passwordVerify(password, hashedPassword, function(isValid)
        if not isValid then
            outputChatBox("No Such Account Could Be Found With That Name Or Password", player, 255, 100, 100)
        end
    end)

    if logIn(player, account, hashedPassword) then
        outputChatBox("You have Successfully Logged Into Your Acccount",player,100,255,100)
        return 
    end
end,false,false)


--logout of their account
