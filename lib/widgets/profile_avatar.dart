import 'package:flutter/material.dart';
import '../services/image_service.dart';

class ProfileAvatar extends StatefulWidget {
  final double size;
  final double fontSize;

  const ProfileAvatar({
    super.key,
    this.size = 60,
    this.fontSize = 30,
  });

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  String? _profileImagePath;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    try {
      final imagePath = await ImageService.loadProfilePicture();
      debugPrint('Profile image loaded: $imagePath');
      setState(() {
        _profileImagePath = imagePath;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading profile image: $e');
      setState(() {
        _profileImagePath = null;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: _profileImagePath == null
            ? const LinearGradient(
                colors: [Colors.orange, Colors.yellow],
              )
            : null,
      ),
      child: _isLoading
          ? const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            )
          : _profileImagePath != null
              ? ClipOval(
                  child: Image.asset(
                    _profileImagePath!,
                    width: widget.size,
                    height: widget.size,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      debugPrint('Error displaying profile image: $error');
                      return _buildEmojiAvatar();
                    },
                  ),
                )
              : _buildEmojiAvatar(),
    );
  }

  Widget _buildEmojiAvatar() {
    return Center(
      child: Text(
        '😊',
        style: TextStyle(fontSize: widget.fontSize),
      ),
    );
  }
}