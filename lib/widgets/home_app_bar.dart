import 'package:firebase_auth_youtube/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_youtube/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'custom_clipper.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  const ProfileAppBar({Key? key, required this.name}) : super(key: key);

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
      leading: Hero(
        tag: 'profileImage', // Provide a unique tag
        child: GestureDetector(
          onTap: () {
            // Navigate to the screen where you want to display the full image
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImage(),
              ),
            );
          },
          child: Image.asset("assets/images/img_img_100x100.png"),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Show a customized animated confirmation dialog
            _showAnimatedDialog(context);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  void _showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Sign Out',
            style: TextStyle(
              color: Color.fromARGB(130, 241, 249, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to sign out?',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: const Color.fromARGB(255, 214, 199, 199),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: appTheme.blueGray900,
        );
      },
    );
  }
}

class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'profileImage', // Same tag as used in the ProfileAppBar
          child: Image.asset("assets/images/img_img_100x100.png"),
        ),
      ),
    );
  }
}
