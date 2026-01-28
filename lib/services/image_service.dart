import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ImageService {
  // Known image paths from your assets folder
  static const List<String> _knownFeaturedImages = [
    'assets/images/featured/516273947_1249504250041985_4286811713813658683_n.jpg',
    'assets/images/featured/516839660_1722432168638645_6412024241690487634_n.jpg',
    'assets/images/featured/edit1.jpg',
  ];

  static const List<String> _knownGalleryImages = [
    'assets/images/gallery/516273947_1249504250041985_4286811713813658683_n.jpg',
    'assets/images/gallery/516310583_1675658643145248_2670513868460839409_n.jpg',
    'assets/images/gallery/516839660_1722432168638645_6412024241690487634_n.jpg',
    'assets/images/gallery/517172253_623288700797299_6979490713843406651_n.jpg',
    'assets/images/gallery/517569735_1081842733339972_7010575714460780144_n.jpg',
    'assets/images/gallery/edit1.jpg',
  ];

  // Common profile picture names to check for
  static const List<String> _possibleProfilePictures = [
    'assets/images/profile/profile.jpg',
    'assets/images/profile/profile.png',
    'assets/images/profile/profile.jpeg',
    'assets/images/profile/profile2.jpeg', // Your specific file
    'assets/images/profile/avatar.jpg',
    'assets/images/profile/avatar.png',
    'assets/images/profile/avatar.jpeg',
    'assets/images/profile/me.jpg',
    'assets/images/profile/me.png',
    'assets/images/profile/me.jpeg',
    'assets/images/profile/photo.jpg',
    'assets/images/profile/photo.png',
    'assets/images/profile/photo.jpeg',
    'assets/images/profile/pic.jpg',
    'assets/images/profile/pic.png',
    'assets/images/profile/pic.jpeg',
  ];

  static Future<String?> loadProfilePicture() async {
    // First try the specific file we know exists
    try {
      await rootBundle.load('assets/images/profile/profile2.jpeg');
      return 'assets/images/profile/profile2.jpeg';
    } catch (e) {
      // Continue to other methods
    }
    
    // Then try common names
    for (final imagePath in _possibleProfilePictures) {
      try {
        await rootBundle.load(imagePath);
        return imagePath;
      } catch (e) {
        // Continue to next possible path
      }
    }
    
    // If no common names found, try to scan the profile folder using AssetManifest
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      
      // Simple parsing to find profile images
      final lines = manifestContent.split('\n');
      for (final line in lines) {
        if (line.contains('assets/images/profile/')) {
          // Look for image extensions
          final imageExtensions = ['.jpg', '.jpeg', '.png', '.webp', '.gif', '.bmp'];
          for (final ext in imageExtensions) {
            if (line.contains(ext) && !line.contains('.gitkeep')) {
              // Try to extract the asset path
              final regex = RegExp(r'"(assets/images/profile/[^"]*\.(jpg|jpeg|png|webp|gif|bmp))"');
              final match = regex.firstMatch(line);
              if (match != null) {
                final assetPath = match.group(1)!;
                try {
                  await rootBundle.load(assetPath);
                  return assetPath;
                } catch (e) {
                  // Continue searching
                }
              }
            }
          }
        }
      }
    } catch (e) {
      debugPrint('Could not scan profile folder: $e');
    }
    
    return null; // No profile picture found
  }

  static Future<List<String>> loadFeaturedImages() async {
    final List<String> validImages = [];
    
    for (final imagePath in _knownFeaturedImages) {
      try {
        await rootBundle.load(imagePath);
        validImages.add(imagePath);
      } catch (e) {
        debugPrint('Could not load image: $imagePath');
      }
    }
    
    return validImages.isNotEmpty ? validImages : fallbackFeaturedImages;
  }

  static Future<List<String>> loadGalleryImages() async {
    final List<String> validImages = [];
    
    for (final imagePath in _knownGalleryImages) {
      try {
        await rootBundle.load(imagePath);
        validImages.add(imagePath);
      } catch (e) {
        debugPrint('Could not load image: $imagePath');
      }
    }
    
    return validImages.isNotEmpty ? validImages : fallbackGalleryImages;
  }

  // Fallback images if no assets are found
  static const List<String> fallbackFeaturedImages = [
    'https://picsum.photos/300/200?random=1',
    'https://picsum.photos/300/200?random=2',
    'https://picsum.photos/300/200?random=3',
  ];

  static const List<String> fallbackGalleryImages = [
    'https://picsum.photos/200/200?random=10',
    'https://picsum.photos/200/200?random=11',
    'https://picsum.photos/200/200?random=12',
    'https://picsum.photos/200/200?random=13',
    'https://picsum.photos/200/200?random=14',
    'https://picsum.photos/200/200?random=15',
    'https://picsum.photos/200/200?random=16',
    'https://picsum.photos/200/200?random=17',
  ];
}