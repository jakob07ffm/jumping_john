
# Simple LOVE2D Platformer

This is a simple platformer game created using the LOVE2D framework. The player can move left, right, and jump onto platforms. The game features basic physics, including gravity and collision detection with platforms.

## Features
- **Player Movement**: The player can move left (`A` key) and right (`D` key).
- **Jumping**: The player can jump using the `Space` key. The jump height and gravity are adjustable.
- **Platform Collision**: The player can land on platforms and cannot move through them.

## How to Run
1. Make sure you have LOVE2D installed. You can download it from the [official website](https://love2d.org/).
2. Place the code in a file named `main.lua`.
3. Create a directory and place `main.lua` inside.
4. Run the game by dragging the directory onto the LOVE2D executable or using the command line:

```bash
love <directory_name>
```

## Code Overview
- **love.load()**: Initializes the game window, player properties, and platform positions.
- **love.update(dt)**: Handles player movement, jumping, gravity, and collision detection with platforms.
- **love.draw()**: Renders the player and platforms on the screen.

## Controls
- **Move Left**: `A`
- **Move Right**: `D`
- **Jump**: `Space`

![](jump_screenshot.JPG)
