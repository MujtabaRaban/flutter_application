import 'package:flutter/cupertino.dart';

Widget buildpage(int index) {
  List<Widget> _widget = [
    Center(child: Text("home")),
    Center(child: Text("tournement")),
    Center(child: Text("games")),
    Center(child: Text("matches")),
    Center(child: Text("profile")),
  ];

  return _widget[index];
}
