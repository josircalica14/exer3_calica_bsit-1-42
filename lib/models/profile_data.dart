class ProfileData {
  String name;
  String bio;
  String location;
  String fullName;
  String photographyHandle;
  String email;
  String phone;
  String birthday;
  String aboutText;

  ProfileData({
    required this.name,
    required this.bio,
    required this.location,
    required this.fullName,
    required this.photographyHandle,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.aboutText,
  });

  ProfileData copyWith({
    String? name,
    String? bio,
    String? location,
    String? fullName,
    String? photographyHandle,
    String? email,
    String? phone,
    String? birthday,
    String? aboutText,
  }) {
    return ProfileData(
      name: name ?? this.name,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      fullName: fullName ?? this.fullName,
      photographyHandle: photographyHandle ?? this.photographyHandle,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      aboutText: aboutText ?? this.aboutText,
    );
  }
}