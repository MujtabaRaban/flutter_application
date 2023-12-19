import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/games_bloc/games_bloc.dart';
import '../../blocs/games_bloc/games_event.dart';
import '../../blocs/games_bloc/games_state.dart';
import '../../database/games.dart';

import '../../theme/theme_helper.dart';
import '../../widgets/app_bar_1.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../home/home_screen.dart';
import '../profile/profile.dart';
import '../tournement/tournament.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../tournement/tournament_onegame.dart';

// Import other necessary files
class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GamePageBloc>(
      create: (context) => GamePageBloc()..add(LoadGameDataEvent()),
      child: _GamePageContent(),
    );
  }
}

class _GamePageContent extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<_GamePageContent> {
  late final GamePageBloc _gamePageBloc;

  @override
  void initState() {
    super.initState();
    _gamePageBloc = BlocProvider.of<GamePageBloc>(context);
    _gamePageBloc.add(LoadGameDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamePageBloc, GamePageState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar1(
              name: 'Games',
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
                                    "The games of the moment",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.h,
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

  Widget _buildGridView(GamePageState state) {
    if (state is LoadedGameDataState) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemCount: state.games.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new TournementPageone()));
            },
            child: _buildGridItem(state.games[index]),
          );
        },
      );
    } else if (state is LoadingGameDataState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ErrorGameDataState) {
      return Center(
        child: Text(
          state.errorMessage,
          style: TextStyle(color: Colors.red),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildGridItem(Games games) {
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
                games.imagePath,
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
                    games.title,
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
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
                              games.catagory,
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
                              games.price,
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
    _gamePageBloc.close();
    super.dispose();
  }
}
