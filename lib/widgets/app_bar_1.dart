// profile_app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_clipper.dart'; // Import your custom clipper if it's in a separate file

class AppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  const AppBar1({Key? key, required this.name}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: AppBar(
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
                  Color.fromARGB(255, 22, 28, 39),
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
      ),
    );
  }
}
