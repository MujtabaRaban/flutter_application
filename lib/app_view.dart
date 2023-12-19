import 'package:firebase_auth_youtube/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_auth_youtube/screens/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bracket_bloc/bracket_bloc.dart';
import 'blocs/games_bloc/games_bloc.dart';
import 'blocs/home_Screen_bloc/home_screen_bloc.dart'; // Import the HomeBloc file
import 'blocs/profile_bloc/profile_bloc.dart';
import 'blocs/sign_in_bloc/sign_in_bloc.dart';
import 'blocs/tournements_bloc/tournement_bloc.dart';
import 'screens/home/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Color(0XFF334155),
          onBackground: Colors.black,
          primary: Color(0XFF9074FF),
          onPrimary: Colors.black,
          secondary: Color(0XFF475569),
          onSecondary: Colors.white,
          tertiary: Color.fromRGBO(255, 204, 128, 1),
          error: Colors.red,
          outline: Color(0xFF424242),
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<SignInBloc>(
                  create: (context) => SignInBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository,
                  ),
                ),
                BlocProvider<HomeBloc>(
                  create: (context) => HomeBloc(),
                ),
                BlocProvider<BracketPageBloc>(
                  // Add this BlocProvider for BracketPageBloc
                  create: (context) => BracketPageBloc(),
                ),
                BlocProvider<ProfilePageBloc>(
                  // Add this BlocProvider for BracketPageBloc
                  create: (context) => ProfilePageBloc(
                      userRepository:
                          context.read<AuthenticationBloc>().userRepository),
                ),
                BlocProvider<TournamentPageBloc>(
                  // Add this BlocProvider for BracketPageBloc
                  create: (context) => TournamentPageBloc(),
                ),
                BlocProvider<GamePageBloc>(
                  // Add this BlocProvider for BracketPageBloc
                  create: (context) => GamePageBloc(),
                ),
              ],
              child: HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
