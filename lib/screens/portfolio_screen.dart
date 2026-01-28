import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/featured_works.dart';
import '../widgets/about_section.dart';
import '../widgets/works_gallery.dart';
import '../widgets/bottom_navigation.dart';
import '../models/profile_data.dart';
import 'profile_screen.dart';
import 'edit_profile_screen.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int _currentIndex = 0;
  
  late ProfileData _profileData;

  @override
  void initState() {
    super.initState();
    _profileData = ProfileData(
      name: 'CupofJay',
      bio: 'BSIT Student & Loves Photography 📸',
      location: 'San Pedro, Laguna',
      fullName: 'Josir James Calica',
      photographyHandle: 'cupofjayyy_',
      email: 'josirjamesc@gmail.com',
      phone: '+63 920 221 3585',
      birthday: 'October 1, 2004',
      aboutText: 'BSIT Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with',
    );
  }

  void _updateProfile(ProfileData newProfileData) {
    setState(() {
      _profileData = newProfileData;
    });
  }

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          profileData: _profileData,
          onSave: _updateProfile,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2A2A),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              if (_currentIndex == 0) ProfileHeader(profileData: _profileData),
              Expanded(
                child: _currentIndex == 0 
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          const FeaturedWorks(),
                          AboutSection(profileData: _profileData),
                        ],
                      ),
                    )
                  : _currentIndex == 1
                    ? const WorksGallery()
                    : ProfileScreen(
                        profileData: _profileData,
                        onEdit: _editProfile,
                      ),
              ),
              BottomNavigation(
                currentIndex: _currentIndex,
                onTap: (index) => setState(() => _currentIndex = index),
              ),
            ],
          ),
        ),
      ),
    );
  }
}