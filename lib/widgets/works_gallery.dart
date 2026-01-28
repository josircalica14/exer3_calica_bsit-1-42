import 'package:flutter/material.dart';
import '../services/image_service.dart';

class WorksGallery extends StatefulWidget {
  const WorksGallery({super.key});

  @override
  State<WorksGallery> createState() => _WorksGalleryState();
}

class _WorksGalleryState extends State<WorksGallery> {
  List<String> _images = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    try {
      final assetImages = await ImageService.loadGalleryImages();
      
      setState(() {
        _images = assetImages;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _images = ImageService.fallbackGalleryImages;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CupofJay\'s Works',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  )
                : _images.isEmpty
                    ? const Center(
                        child: Text(
                          'No gallery images found',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : AdaptiveImageGrid(images: _images),
          ),
        ],
      ),
    );
  }
}

class AdaptiveImageGrid extends StatelessWidget {
  final List<String> images;

  const AdaptiveImageGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(context),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8, // Slightly taller to accommodate different orientations
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return AdaptiveImageTile(
          imagePath: images[index],
          onTap: () => _showImageDialog(context, images[index]),
        );
      },
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 600) return 4; // Tablet/Desktop
    if (width > 400) return 3; // Large phone
    return 2; // Small phone
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.height * 0.8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: imagePath.startsWith('assets/')
                        ? AssetImage(imagePath) as ImageProvider
                        : NetworkImage(imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdaptiveImageTile extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const AdaptiveImageTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            image: imagePath.startsWith('assets/')
                ? AssetImage(imagePath) as ImageProvider
                : NetworkImage(imagePath),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade800,
                child: const Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                    size: 40,
                  ),
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey.shade800,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    color: Colors.orange,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}