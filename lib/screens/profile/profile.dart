import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth_youtube/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_repository/user_repository.dart';

import '../../blocs/profile_bloc/profile_bloc.dart';
import '../../blocs/profile_bloc/profile_event.dart';
import '../../blocs/profile_bloc/profile_state.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar_1.dart';
import '../../widgets/centered_container.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../game/game_page.dart';
import '../home/home_screen.dart';
import '../tournement/tournament.dart';

// Import other necessary files
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilePageBloc>(
      create: (context) => ProfilePageBloc()..add(LoadProfileDataEvent()),
      child: _ProfilePageContent(),
    );
  }
}

class _ProfilePageContent extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<_ProfilePageContent> {
  final _formKey = GlobalKey<FormState>();

  late final ProfilePageBloc _profilePageBloc;

  String name = "mujtaba";
  String email = "mujtabaraban@gmail.com";

  @override
  void initState() {
    super.initState();
    _profilePageBloc = BlocProvider.of<ProfilePageBloc>(context);
    _profilePageBloc.add(LoadProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar1(
          name: 'Profile Page',
        ),
        backgroundColor: appTheme.blueGray90002,
        bottomNavigationBar: _buildBottomBar(context),
        body: Column(
          children: [
            Center(
              child: CenteredContainerImage(
                outerContainerSize: 200.0,
                innerContainerSize: 170.0,
                firstImageAsset: 'assets/images/img_frame_4.png',
                secondImageAsset: 'assets/images/img_img.png',
                borderRadius: 0,
              ),
            ),
            SizedBox(height: 4.h),
            const Text(
              "Mapple",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 4.h),
            const Text(
              "Player",
              style: TextStyle(fontSize: 16),
            ),
            _buildProfileInfo(name, email),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String name, String email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 35.h, top: 20.h),
          child: Row(
            children: [
              Text(
                name,
                style: TextStyle(
                  color: const Color.fromARGB(255, 183, 166, 166),
                  fontSize: 18.h,
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () => _showEditDialog(),
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 32, 32),
                    fontSize: 18.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 35.h, top: 20.h),
          child: Text(
            email,
            style: TextStyle(
              color: const Color.fromARGB(255, 183, 166, 166),
              fontSize: 18.h,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _showAnimatedDialog(context);
              
            },
            style: ElevatedButton.styleFrom(
              primary: appTheme.red500,
            ),
            child: Text("Sign Out"),
          ),
        ),
      ],
    );
  }

  Widget _buildEditTextField(String labelText, ValueChanged<String> onChanged) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: appTheme.blueGray90002,
          ),
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildEditEmailField(
      String labelText, ValueChanged<String> onChanged) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: appTheme.blueGray90002,
          ),
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter an email address.';
          } else if (!EmailValidator.validate(value)) {
            return 'Please enter a valid email address.';
          } else if (value.contains(RegExp(r'[0-9]'))) {
            return 'Email should not contain numbers.';
          }
          return null;
        },
      ),
    );
  }

  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop();
    }
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

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: contentBox(context),
        );
      },
    );
  }

  Widget contentBox(context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: appTheme.indigo100,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: appTheme.blueGray90002,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _buildEditTextField("New Name", (value) {
              setState(() {
                name = value;
              });
            }),
            _buildEditEmailField("New Email", (value) {
              setState(() {
                email = value;
              });
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: appTheme.blueGray90002,
                  ),
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: appTheme.blueGray90002,
                  ),
                  child: Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => getPageByType(type)),
        );
      },
    );
  }

  Widget getPageByType(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return HomeScreen();
      case BottomBarEnum.Swordonsecondarycontainer:
        return TournementPage();
      case BottomBarEnum.Game:
        return GamePage();
      case BottomBarEnum.Account:
        return ProfilePage();
      // Default to BracketPage for unknown type
    }
  }
}
