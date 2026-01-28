# Cupoflay Portfolio App

A beautiful personal portfolio app built with Flutter showcasing photography work and personal information.

## Features

- 📱 **Responsive Design** - Works on mobile, tablet, and desktop
- 🖼️ **Dynamic Image Loading** - Automatically detects and loads your photos
- ✏️ **Editable Profile** - Update your information with a built-in editor
- 🎨 **Modern UI** - Dark theme with orange accents
- 📸 **Photo Gallery** - Adaptive grid that handles portrait and landscape images
- 🔄 **Featured Works Carousel** - Swipeable showcase of your best work

## Screenshots

*Add screenshots of your app here*

## Getting Started

### Prerequisites
- Flutter SDK (3.10.7 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/flutter-portfolio.git
cd flutter-portfolio
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Adding Your Own Content

### Profile Picture
1. Add your profile picture to `assets/images/profile/`
2. Any filename works (profile.jpg, me.png, etc.)
3. Square images work best for circular cropping

### Featured Photos
1. Add 3-5 landscape photos to `assets/images/featured/`
2. These appear in the home screen carousel

### Gallery Photos
1. Add any number of photos to `assets/images/gallery/`
2. Both portrait and landscape orientations supported
3. Tap any image to view full-size

### Profile Information
- Use the built-in profile editor (tap the edit icon in profile screen)
- All changes reflect immediately across the app

## Project Structure

```
lib/
├── data/           # Data models and image paths
├── models/         # Profile data model
├── screens/        # Main app screens
├── services/       # Image loading service
└── widgets/        # Reusable UI components
```

## Built With

- **Flutter** - UI framework
- **Dart** - Programming language
- **Material Design** - Design system

## Author

**Josir James Calica** - BSIT Student & Photography Enthusiast
- Location: San Pedro, Laguna
- Instagram: @cupoflayyy_

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- Flutter team for the amazing framework
- Material Design for the design guidelines
- Picsum for placeholder images during development