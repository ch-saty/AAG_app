import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AppBar(
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Container(
          width: 20, // Size for the circular background
          height: screenSize.height * 0.04, // Size for the circular background
          padding:
              const EdgeInsets.all(5), // Padding inside the circular background
          decoration: BoxDecoration(
            color:
                Colors.white.withOpacity(0.1), // White background with opacity
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'lib/images/ch.png',
            height: screenSize.height * 0.04, // Set the image height smaller
            width: 20, // Set the image width smaller
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(10), // Padding for title
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'lib/images/aag_white.png',
              height: screenSize.height * 0.04, // Responsive height
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 5), // Padding for action item
          child: Image.asset(
            'lib/images/chakra.png',
            height: screenSize.height * 0.25, // Responsive height
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2),
        child: Container(
          height: 4,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(239, 119, 17, 0),
                Color.fromRGBO(239, 119, 17, 1),
                Color.fromRGBO(239, 119, 17, 0),
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 2);
}
