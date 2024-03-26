import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(
      {super.key, required this.navigationIndex, required this.onTap});

  final int navigationIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: const EdgeInsets.only(bottom: 42, left: 32, right: 32),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 25,
          offset: const Offset(8, 20),
        ),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          onTap: onTap,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: navigationIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'All Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Starred',
            )
          ],
        ),
      ),
    );
  }
}
