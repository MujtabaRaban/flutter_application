import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/onegame_bloc/tournementonepage_bloc.dart';
import '../../database/tournament_event.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar_1.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../Bracket/brackt.dart';
import '../game/game_page.dart';
import '../home/home_screen.dart';
import '../profile/profile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'tournament.dart';

// Import other necessary files

class TournementPageone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TournementonepageBloc>(
      create: (context) =>
          TournementonepageBloc()..add(LoadTournementonepageDataEvent()),
      child: _TournementPageoneContent(),
    );
  }
}

class _TournementPageoneContent extends StatefulWidget {
  @override
  _TournementPageState createState() => _TournementPageState();
}

class _TournementPageState extends State<_TournementPageoneContent> {
  late final TournementonepageBloc _tournamentPageBloc;

  @override
  void initState() {
    super.initState();
    _tournamentPageBloc = BlocProvider.of<TournementonepageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournementonepageBloc, TournementonepageState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: const AppBar1(
              name: 'Tournaments',
            ),
            backgroundColor: appTheme.blueGray90002,
            bottomNavigationBar: _buildBottomBar(context),
            body: Stack(
              children: [
                Positioned(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 8.h, top: 10.h),
                                  child: Text(
                                    "Open Tournaments",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: _buildGridView(state),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
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

  Widget _buildGridView(TournementonepageState state) {
    if (state is LoadedTournamentOneDataState) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemCount: state.tournamentsevents.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (context != null) {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new BracketPage()));
              }
            },
            child: _buildGridItem(state.tournamentsevents[index]),
          );
        },
      );
    } else if (state is LoadingTournamentOneDataState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ErrorTournamentOneDataState) {
      return Center(
        child: Text(
          state.errorMessage,
          style: TextStyle(color: Colors.red),
        ),
      );
    } else {
      return Container(); // Adjust this based on your requirements
    }
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
                                color: Colors.white,
                                fontSize: 13,
                              ),
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
    _tournamentPageBloc.close();
    super.dispose();
  }
}
