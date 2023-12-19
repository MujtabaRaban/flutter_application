// profile_app_bar.dart

import 'package:flutter/material.dart';

import 'custom_clipper.dart'; // Import your custom clipper if it's in a separate file

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  const AppBar2({Key? key, required this.name}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 110,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipPath(
        clipper: AppBarCustomClipper(),
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0XFF1E293B),
                Color(0XFF273346),
              ],
            ),
          ),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
