import 'package:flutter/material.dart';
import '../models/profile_data.dart';

class EditProfileScreen extends StatefulWidget {
  final ProfileData profileData;
  final Function(ProfileData) onSave;

  const EditProfileScreen({
    super.key,
    required this.profileData,
    required this.onSave,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _locationController;
  late TextEditingController _fullNameController;
  late TextEditingController _photographyHandleController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _birthdayController;
  late TextEditingController _aboutTextController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profileData.name);
    _bioController = TextEditingController(text: widget.profileData.bio);
    _locationController = TextEditingController(text: widget.profileData.location);
    _fullNameController = TextEditingController(text: widget.profileData.fullName);
    _photographyHandleController = TextEditingController(text: widget.profileData.photographyHandle);
    _emailController = TextEditingController(text: widget.profileData.email);
    _phoneController = TextEditingController(text: widget.profileData.phone);
    _birthdayController = TextEditingController(text: widget.profileData.birthday);
    _aboutTextController = TextEditingController(text: widget.profileData.aboutText);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _fullNameController.dispose();
    _photographyHandleController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
    _aboutTextController.dispose();
    super.dispose();
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
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(
                      onPressed: _saveProfile,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Form
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildTextField('Name', _nameController),
                      _buildTextField('Bio', _bioController),
                      _buildTextField('Location', _locationController),
                      _buildTextField('Full Name', _fullNameController),
                      _buildTextField('Photography Handle', _photographyHandleController),
                      _buildTextField('Email', _emailController),
                      _buildTextField('Phone', _phoneController),
                      _buildTextField('Birthday', _birthdayController),
                      _buildTextField(
                        'About Text',
                        _aboutTextController,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: maxLines,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF2A2A2A),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.orange, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveProfile() {
    final updatedProfile = ProfileData(
      name: _nameController.text,
      bio: _bioController.text,
      location: _locationController.text,
      fullName: _fullNameController.text,
      photographyHandle: _photographyHandleController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      birthday: _birthdayController.text,
      aboutText: _aboutTextController.text,
    );
    
    widget.onSave(updatedProfile);
    Navigator.pop(context);
  }
}