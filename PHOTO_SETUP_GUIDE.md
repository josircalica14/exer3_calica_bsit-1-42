# How to Add Your Own Photos to the Portfolio App

## 🎯 Super Simple Setup (New!)

The app now **automatically detects** any images you put in the asset folders! No need to manually update file paths.

## Step 1: Add Your Photos

1. **Profile Picture** → Drop it in `assets/images/profile/`
2. **Featured Photos** → Drop them in `assets/images/featured/`
3. **Gallery Photos** → Drop them in `assets/images/gallery/`

**That's it!** The app will automatically find and display them.

## Step 2: Refresh the App

1. Run `flutter pub get` in your terminal
2. Hot restart the app (press 'R' in the terminal)

## Photo Types & Recommendations

### 📸 Profile Picture
- **Location**: `assets/images/profile/`
- **Best format**: Square (1:1 ratio) for perfect circular crop
- **Size**: 200x200px or larger
- **Name**: Anything works (profile.jpg, me.png, avatar.jpg, etc.)
- **Shows up**: Header, profile screen, bottom navigation

### 🌟 Featured Photos  
- **Location**: `assets/images/featured/`
- **Best format**: Landscape orientation for carousel
- **Size**: 800x600px or larger
- **Shows up**: Home screen carousel

### 🖼️ Gallery Photos
- **Location**: `assets/images/gallery/`
- **Format**: Any orientation (portrait/landscape both work great!)
- **Size**: 400x400px or larger  
- **Shows up**: Gallery grid (tap to view full-size)

## Supported Formats

- `.jpg` / `.jpeg`
- `.png` 
- `.webp`
- `.gif`
- `.bmp`

## Tips

- **Any file names work** - `photo1.jpg`, `sunset.png`, `IMG_001.jpeg`, etc.
- **Any number of photos** - Add as many as you want
- **File sizes**: Keep under 2MB each for best performance
- **Profile pic**: Square photos work best for the circular avatar
- **Gallery**: Both portrait and landscape photos display beautifully

## What Happens

- ✅ **Has your photos**: Shows your images
- ✅ **No photos yet**: Shows placeholder images/emoji avatar
- ✅ **Mixed**: Shows your photos + fills remaining with placeholders

## Troubleshooting

- **Photos not showing?** Make sure you ran `flutter pub get` and restarted the app
- **App slow?** Your images might be too large - try compressing them
- **Profile pic not circular?** Make sure it's square (same width and height)
- **Some photos missing?** Check the file format is supported

## Old Manual Method (Not Needed Anymore)

~~You used to need to manually update `lib/data/image_data.dart` with exact file paths. This is no longer necessary!~~ The app now automatically scans the folders and loads whatever images it finds.