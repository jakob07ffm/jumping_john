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
        on_ground = false,
        y_velocity = 0
    }

    platform_width = 100
    platform_height = 20
    platforms = {
        {x = 200, y = 500, width = platform_width, height = platform_height},
        {x = 400, y = 300, width = platform_width, height = platform_height},
        {x = 300, y = 400, width = platform_width, height = platform_height}
    }
end

function love.update(dt)
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end

    if player.x < 0 then
        player.x = 0
    elseif player.x + player.width > win.width then
        player.x = win.width - player.width
    end

    if love.keyboard.isDown("space") and player.on_ground then
        player.y_velocity = -math.sqrt(2 * player.jump_height * player.gravity)
        player.is_jumping = true
        player.on_ground = false
    end

    player.y_velocity = player.y_velocity + player.gravity * dt
    player.y = player.y + player.y_velocity * dt

    player.on_ground = false
    for _, platform in ipairs(platforms) do
        if player.x < platform.x + platform.width and
           player.x + player.width > platform.x and
           player.y + player.height > platform.y and
           player.y + player.height - player.y_velocity * dt <= platform.y then
            player.y = platform.y - player.height
            player.y_velocity = 0
            player.on_ground = true
        end
    end

    if player.y > win.height - player.height then
        player.y = win.height - player.height
        player.y_velocity = 0
        player.on_ground = true
    end
end

function love.draw()

    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)

    love.graphics.setColor(0, 1, 0)
    for _, platform in ipairs(platforms) do 
        love.graphics.rectangle("fill", platform.x, platform.y, platform.width, platform.height)
    end
end
