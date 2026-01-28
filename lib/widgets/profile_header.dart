import 'package:flutter/material.dart';
import '../models/profile_data.dart';
import '../widgets/profile_avatar.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileData profileData;
  
  const ProfileHeader({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const ProfileAvatar(size: 60, fontSize: 30),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profileData.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      profileData.bio,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on, color: Colors.grey, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    profileData.location,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.school, color: Colors.grey, size: 16),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      profileData.fullName,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt, color: Colors.grey, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    profileData.photographyHandle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}