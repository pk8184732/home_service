

import 'package:flutter/material.dart';

import '../views/job_post/job_post_screen.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF2856A3),
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.home, 0),
            _buildNavItem(context, Icons.receipt_long, 1),
            _buildNavItem(context, Icons.add_circle, 2, isCenter: true),
            _buildNavItem(context, Icons.maps_ugc_sharp, 3),
            _buildNavItem(context, Icons.person, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context,
      IconData icon,
      int index, {
        bool isCenter = false,
      }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (index == 2) {
          // 👉 ADD ICON CLICK → PostScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>  PostJobScreen(),
            ),
          );
        } else {
          onTap(index);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: isCenter ? 38 : 26,
          color: isSelected ? Colors.white : Colors.white,
        ),
      ),
    );
  }
}
