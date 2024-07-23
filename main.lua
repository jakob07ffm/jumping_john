function love.load()
    win = {width = love.graphics.getWidth(), height = love.graphics.getHeight()}
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
    player = {
        x = 100,
        y = win.height - 60,
        width = 50,
        height = 50,
        speed = 400,
        jump_height = 200,
        gravity = 500,
        is_jumping = false,
        jump_start_y = 0,
        on_ground = false
    }

    platfor_width = 100
    platfor_height = 20
    platforms = {
        {x = 200, y = 500, width = platfor_width, height = platfor_height},
        {x = 400, y = 300, width = platfor_width, height = platfor_height},
        {x = 300, y = 400, width = platfor_width, height = platfor_height}
    }
end

function love.update(dt)
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end

    if player.x <= 0 then
        player.x = 0
    end

    if player.x + player.width >= win.width then
        player.x = win.width - player.width
    end

    if love.keyboard.isDown("space") and player.on_ground and love.keyboard.isUp("space") then
        player.is_jumping = true
        player.jump_start_y = player.y
        player.on_ground = false
    end

    if player.is_jumping then
        player.y = player.y - player.gravity * dt

        if player.jump_start_y - player.y >= player.jump_height then
            player.is_jumping = false
        end
    else
        player.y = player.y + player.gravity * dt
    end

    player.on_ground = false
    for _, platfor in ipairs(platforms) do
        if player.x < platfor.x + platfor.width and
           player.x + player.width > platfor.x and
           player.y + player.height > platfor.y and
           player.y < platfor.y + platfor.height then

            if player.y + player.height - player.gravity * dt <= platfor.y then
                player.y = platfor.y - player.height
                player.on_ground = true
                player.is_jumping = false
            end
        end
    end

    if player.y > win.height - player.height then
        player.y = win.height - player.height
        player.on_ground = true
    end
end

function love.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)

    love.graphics.setColor(0, 1, 0)
    for _, platfor in ipairs(platforms) do 
        love.graphics.rectangle("fill", platfor.x, platfor.y, platfor.width, platfor.height)
    end
end
