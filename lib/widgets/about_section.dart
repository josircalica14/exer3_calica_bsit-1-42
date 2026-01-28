import 'package:flutter/material.dart';
import '../models/profile_data.dart';

class AboutSection extends StatelessWidget {
  final ProfileData profileData;
  
  const AboutSection({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            profileData.aboutText,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20), // Add some bottom padding
        ],
      ),
    );
  }
}