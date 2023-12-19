import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/wellcome_page/welcome_bloc.dart';
import '../../blocs/wellcome_page/welcome_event.dart';
import '../../blocs/wellcome_page/welcome_state.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/theme.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Make scaffold background transparent
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.w),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      state.page = index;
                    },
                    children: [
                      _page(
                        1,
                        context,
                        pageController,
                        "next",
                        "Introduction",
                        "Discover, Participate, and Conquer. Join us on a journey of thrilling competitions and exciting victories.",
                        "assets/images/first page .png",
                      ),
                      _page(
                        2,
                        context,
                        pageController,
                        "next",
                        "Explore Tournaments",
                        "From esports to traditional sports, find the tournaments that match your passion. Compete with the best and climb the ranks.",
                        "assets/images/man.png",
                      ),
                      _page(
                        3,
                        context,
                        pageController,
                        "Get Started",
                        "Join the Action Today ",
                        "Ready to showcase your skills? Dive into the world of competitive gaming. Sign up for tournaments, challenge opponents, and make your mark! ",
                        "assets/images/boy.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 50.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: const Size.square(8.0),
                        activeColor: Color(0XFF9074FF),
                        activeSize: const Size(10.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _page(
  int index,
  BuildContext context,
  PageController pageController,
  String buttonName,
  String title,
  String subTitle,
  String imagePath,
) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: Image.asset(imagePath),
      ),
      Container(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(
          subTitle,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          if (index < 3) {
            pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          } else {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/myAppView", (route) => false);
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 98, 81, 167),
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 128, 128, 128).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
