import 'package:firebase_auth_youtube/app_view.dart';
import 'package:firebase_auth_youtube/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:firebase_auth_youtube/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_auth_youtube/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_repository/user_repository.dart';

import 'blocs/wellcome_page/welcome_bloc.dart';
import 'firebase_options.dart';

import 'screens/Bracket/brackt.dart';
import 'screens/game/game_page.dart';

import 'screens/profile/profile.dart';
import 'screens/tournement/tournament.dart';
import 'screens/tournement/tournament_onegame.dart';
import 'screens/welcome/welcome.dart';
import 'simple_bloc_observer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();

  UserRepository userRepository = FirebaseUserRepo(); // Use UserRepository

  runApp(MyApp(userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository, {Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WelcomeBloc>(create: (_) => WelcomeBloc()),
        Provider<UserRepository>(
          create: (_) => userRepository,
        ),
        // Provide UserRepository
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(
            userRepository: userRepository,
          ),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.transparent,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/welcome',
          routes: {
            '/brack': (context) => BracketPage(),
            '/welcome': (context) => WelcomePage(), // Welcome page route
            '/myAppView': (context) => NyApp1(), // MyAppView route
            '/homescreen': (context) => HomeScreen(),
            '/tournement': (context) => TournementPage(),
            '/profile': (context) => ProfilePage(),
            '/game': (context) => GamePage(),
            '/tournementPageone': (context) => TournementPageone(),
          },
        ),
      ),
    );
  }
}

class NyApp1 extends StatelessWidget {
  const NyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) =>
          AuthenticationBloc(userRepository: context.read<UserRepository>()),
      child: const MyAppView(),
    );
  }
}
