# iOS Book/Reading App Page Flipping 3D Animation
This project showcases an iOS Book App interface built using SwiftUI. It provides an interactive experience with top-rated books, displaying book covers with 3D effects as the user navigates through the collection. The visual emphasis of this project is to leverage 3D animations to enhance user interaction and experience.

## 📱 Demo Video


https://github.com/ceciliachenguo/BookPageFlipAnimation/assets/121702916/cf087a89-069c-45ae-b9d4-716fe3a50596



## 🌟 Features

- **Top Rated Books Header**: A header view displaying the title "Top Rated".
- **Book Slider**: A horizontal book slider with a custom tab view design, allowing users to scroll through a collection of top-rated books. Each book is presented with an isometric design and 3D rotation effect as it gets into focus.
- **Book Details**: Displays the title and author of the current book in view, using interactive spring animations.
- **Isometric View Design**: A custom SwiftUI view that presents content with isometric depth and shadows, adding a 3D feel to the design.
- **Custom Projection**: An animatable geometry effect that customizes the projection of views, enhancing the 3D appearance.

## 🛠 Tools & Techniques

- **SwiftUI**: The project is built using SwiftUI, Apple's framework for declarative UI design.
- **GeometryReader**: Extensively used for responsive layouts and to access view size and position for dynamic animations.
- **3D Animations**: The app uses 3D animations to rotate book covers and provide a dynamic and interactive experience to users. This is achieved using `rotation3DEffect` and custom projections.
- **Interactive Spring Animation**: Provides fluidity and responsiveness to user interactions, making animations feel more natural.
