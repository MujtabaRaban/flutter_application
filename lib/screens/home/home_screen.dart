import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../blocs/home_Screen_bloc/home_screen_bloc.dart';
import '../../blocs/home_Screen_bloc/home_screen_event.dart';
import '../../blocs/home_Screen_bloc/home_screen_state.dart';
import '../../database/event.dart';
import '../../database/tournament_event.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/home_app_bar.dart';
import '../Bracket/brackt.dart';
import '../game/game_page.dart';
import '../profile/profile.dart';
import '../tournement/tournament.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(LoadHomeDataEvent()),
      child: _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreenContent> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(LoadHomeDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const ProfileAppBar(name: 'Welcome'),
        backgroundColor: appTheme.blueGray90002,
        body: _buildInitialState(),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildInitialState() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadedHomeState) {
          final List<Event> events = state.loadedEvents;
          final List<Tournamentsevent> tournamentsevents =
              state.loadedTournamentsevents;

          return Stack(
            children: [
              Positioned(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/img_hero.png"),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Text(
                          "Popular events",
                          style: TextStyle(color: Colors.white, fontSize: 20.h),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      _buildEventScroll(events),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.h, top: 20.h),
                                child: Text(
                                  "Tournaments",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23.h),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePage()));
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, right: 15.h),
                                  child: Text(
                                    "See all",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 15.h),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 7),
                        child: _buildGridView(tournamentsevents),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is LoadingHomeState) {
          return _buildLoadingState();
        } else if (state is ErrorHomeState) {
          return _buildErrorState(state.errorMessage);
        } else {
          return _buildLoadingState(); // Adjust this based on your requirements
        }
      },
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState(String errorMessage) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildEventScroll(List<Event> events) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.dg),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: events.map((event) => _buildImageContainer(event)).toList(),
        ),
      ),
    );
  }

  Widget _buildImageContainer(Event event) {
    return GestureDetector(
      onTap: () {
        if (context != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BracketPage()));
        }
      },
      child: Container(
        width: 300,
        margin: EdgeInsets.only(right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(event.imagePath),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    margin: EdgeInsets.only(right: 6.h, top: 6.h),
                    decoration: BoxDecoration(
                      color: event.topRightTextColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(event.borderRadius),
                    ),
                    child: Text(
                      event.topRightText,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    color: Colors.black.withOpacity(0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Time: ${event.time}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
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

  Widget _buildGridView(List<Tournamentsevent> tournamentsevents) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
      ),
      itemCount: tournamentsevents.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle grid item tap, you can navigate to a specific page or perform an action
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new BracketPage()));
          },
          child: _buildGridItem(tournamentsevents[index]),
        );
      },
    );
  }

  Widget _buildGridItem(Tournamentsevent tournamentsevents) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.dg),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.dg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                tournamentsevents.imagePath,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tournamentsevents.title,
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    tournamentsevents.time,
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.h),
                          color: Colors.transparent,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.h),
                          child: Container(
                            padding: EdgeInsets.all(4.h),
                            color: const Color.fromARGB(255, 69, 71, 117),
                            child: Text(
                              tournamentsevents.catagory,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.h),
                          color: Colors.transparent,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.h),
                          child: Container(
                            padding: EdgeInsets.all(4.h),
                            color: const Color.fromARGB(255, 69, 71, 117),
                            child: Text(
                              tournamentsevents.price,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }
}
