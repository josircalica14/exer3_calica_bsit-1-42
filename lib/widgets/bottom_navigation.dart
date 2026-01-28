import 'package:flutter/material.dart';
import '../widgets/profile_avatar.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => onTap(0),
            child: Icon(
              Icons.home,
              color: currentIndex == 0 ? Colors.orange : Colors.grey,
              size: 28,
            ),
          ),
          GestureDetector(
            onTap: () => onTap(1),
            child: Icon(
              Icons.grid_view,
              color: currentIndex == 1 ? Colors.orange : Colors.grey,
              size: 28,
            ),
          ),
          GestureDetector(
            onTap: () => onTap(2),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: currentIndex == 2 
                  ? Border.all(color: Colors.orange, width: 2)
                  : null,
              ),
              child: ProfileAvatar(
                size: 40, 
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}