import 'package:flutter/material.dart';
import '../models/profile_data.dart';
import '../widgets/profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileData profileData;
  final VoidCallback onEdit;
  
  const ProfileScreen({
    super.key,
    required this.profileData,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 48), // Balance the row
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.orange,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Large Profile Avatar
          const ProfileAvatar(size: 120, fontSize: 60),
          const SizedBox(height: 24),
          
          // Name and Title
          Text(
            profileData.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            profileData.bio,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          
          // Profile Details
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileItem(
                    Icons.location_on,
                    'Location',
                    profileData.location,
                  ),
                  _buildProfileItem(
                    Icons.school,
                    'Full Name',
                    profileData.fullName,
                  ),
                  _buildProfileItem(
                    Icons.camera_alt,
                    'Photography Handle',
                    profileData.photographyHandle,
                  ),
                  _buildProfileItem(
                    Icons.email,
                    'Email',
                    profileData.email,
                  ),
                  _buildProfileItem(
                    Icons.phone,
                    'Phone',
                    profileData.phone,
                  ),
                  _buildProfileItem(
                    Icons.cake,
                    'Birthday',
                    profileData.birthday,
                  ),
                  const SizedBox(height: 20),
                  
                  // Bio Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          profileData.aboutText,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.orange,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}