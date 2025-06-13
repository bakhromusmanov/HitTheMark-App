# Hit The Mark 🎯
**Created by Bakhrom Usmanov** using UIKit

Welcome to **Hit The Mark**, an intuitive and fun game built for iOS where players aim to get as close to a randomly chosen target value as possible using a slider.

![Simulator Screenshot 1](Simulator%20Screenshot%20-%200.png)

## 🎮 Gameplay Objective

The goal of the game is to put the bull’s eye (located on a slider that ranges from 1 to 100) as close to a randomly selected target number as possible. 

### How it works:
1. A target value is randomly generated at the beginning of each round (e.g., 84).
2. The player cannot see the current slider value, so they must estimate (or "eyeball") the correct position on the slider.
3. Once confident in their estimate, the player presses the **"Hit Me!"** button.
4. An alert will pop up, showing the score based on how close the player was to the target value.

- The closer the estimate is to the target value, the higher the score.
- After dismissing the alert, a new round begins with a different random target.

### Restarting the game:
Players can press the **"Start Over"** button (represented by the curly arrow at the bottom-left corner of the screen) to reset the score to 0 and start fresh.

## 🚀 Features
- Random target generation each round.
- User-friendly slider with no visible current value, adding to the challenge.
- Score feedback through a pop-up alert after each round.
- "Start Over" button to reset the game at any time.
