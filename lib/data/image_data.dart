// Image paths for your portfolio
// To add your own photos:
// 1. Create folders in assets/images/ like: featured/, gallery/
// 2. Add your images to these folders
// 3. Update the paths below to match your image names
// 4. Run 'flutter pub get' after adding new assets

class ImageData {
  // Featured Works Images (3-5 images recommended)
  static const List<String> featuredImages = [
    'assets/images/featured/photo1.jpg',
    'assets/images/featured/photo2.jpg', 
    'assets/images/featured/photo3.jpg',
    // Add more featured images here
    // 'assets/images/featured/photo4.jpg',
    // 'assets/images/featured/photo5.jpg',
  ];

  // Gallery Images (as many as you want)
  static const List<String> galleryImages = [
    'assets/images/gallery/img1.jpg',
    'assets/images/gallery/img2.jpg',
    'assets/images/gallery/img3.jpg',
    'assets/images/gallery/img4.jpg',
    'assets/images/gallery/img5.jpg',
    'assets/images/gallery/img6.jpg',
    'assets/images/gallery/img7.jpg',
    'assets/images/gallery/img8.jpg',
    // Add more gallery images here
    // 'assets/images/gallery/img9.jpg',
    // 'assets/images/gallery/img10.jpg',
  ];

  // Fallback to network images if local assets don't exist
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