# 🕹️ Tic Tac Toe (Command Line)

This is a console-based implementation of the classic game Tic Tac Toe, built using Ruby as part of The Odin Project curriculum.

## 🌟 Features

* Two main game modes: Player vs. Player (PvP) and Player vs. Computer (PvCPU).
* The computer opponent uses random move selection.
=======
## Gameplay Tutorial
Choose the number corresponding with the field you want to input your \
symbol into ('X' or 'O')

## 🚀 Setup and Execution

To run the game, follow these steps to clone the repository and execute the main script from your terminal:

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/teomeoteo/tic-tac-toe](https://github.com/teomeoteo/tic-tac-toe)
    cd tic-tac-toe
    ```

2.  **Set Permissions:**
    The executable file in the `bin/` directory needs execute permissions.
    ```bash
    chmod +x bin/tictactoe
    ```

3.  **Run the Game:**
    The script runs directly via the Shebang (`#!/usr/bin/env ruby`) within the `bin/` directory.
    ```bash
    ./bin/tictactoe
    ```

## 🎮 Game Modes

At the start of the game, you will be prompted to choose a mode:

### Player vs Player (PvP)
* **Selection:** Choose **1** to play this mode.
* **Symbol Defaults:** Player 1 is always **'X'** and Player 2 is always **'O'**.

### Player vs Computer (PvCPU)
* **Selection:** Choose **2** to play this mode.
* **Symbol Default:** The human player is always **'X'** by default.
* **CPU Moves:** The computer makes random moves.

## 🧑‍💻 Gameplay Tutorial

To select a move, choose the number corresponding to the field you want to place your symbol into ('X' or 'O').

### Board Layout
The board is referenced by numbers `1` through `9` for easy selection:

1 | 2 | 3

4 | 5 | 6

7 | 8 | 9

## 📂 Project Structure

This project follows a common Ruby structure for command-line applications:

* **`bin/`**: Contains the main executable script (`tictactoe`) which includes the Shebang line and initiates the application.
* **`lib/`**: Contains the core logic, classes, and modules of the game (e.g., `Game`, `Board`, `Player` classes).
* **`README.md`**: This file, providing documentation and instructions.

***
*Built for The Odin Project | GitHub: [teomeoteo](https://github.com/teomeoteo)*
