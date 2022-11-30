![logo](https://user-images.githubusercontent.com/442439/204402040-2f1aeb57-0955-4bd5-b1ba-a48ba43b4961.jpg)


# Cat Popper

A fun little game using the Cataas.com api.

<a href="https://shanecowherd.com/CatPopper.mp4"><img width="704" alt="Screenshot 2022-11-28 at 4 16 43 PM" src="https://user-images.githubusercontent.com/442439/204400807-74f6f6ab-e586-4a03-bbe6-d88e1423807b.png"></a>

## Technologies

1. SwiftUI
2. Realm Database - Stores the IDs for Gifs from the Cataas.com API.
3. SDWebImageSwiftUI - Displays Animated Gifs and caches the downloaded images for future gameplay.
4. ConfettiSwiftUI - SwiftUI Confetti when the game has finished.
5. Cataas.com API - https://cataas.com/api/cats?limit=16&skip=0&tags=gif

## Attributions

Meow Sound effects
1. https://soundbible.com/1290-Cat-Meowing.html
2. https://soundbible.com/1286-Kitten-Meow.html

## Distribution

Cat Popper is available on Testflight
https://testflight.apple.com/join/vvyplIsT

## Install manually

1. Clone Repo
2. Open `Smiley Cat/Smiley Cat.xcodeproj`
3. Change the Team under `Signing and Capabilities`
4. Select your iPhone
5. Run

The third party dependencies are managed by Swift Package Manager and should automatically install while you are changing the team.

