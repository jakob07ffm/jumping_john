function love.load()
    win = {width = love.graphics.getWidth(), height = love.graphics.getHeight()}
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
    player = {
        x = 100,
        y = win.height - 60,
        width = 50,
        height = 50,
        speed = 400,
        jump_height = 100,
        gravity = 1000,
        is_jumping = false,
        jump_start_y = 0
    }

end

function love.update(dt)
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end

    if love.keyboard.isDown("space") and not player.is_jumping then
        player.is_jumping = true
        player.jump_start_y = player.y
    end

    if player.is_jumping then
        player.y = player.y - player.gravity * dt

        if player.jump_start_y - player.y >= player.jump_height then
        end
    else
        if player.y < win.height - player.height then
            player.y = player.y + player.gravity * dt
        end

        if player.y > win.height - player.height then
            player.y = win.height - player.height
        end
    end

end

function love.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    
end
