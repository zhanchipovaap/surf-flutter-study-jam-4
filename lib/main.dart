import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/bloc/bloc/magic_ball_bloc.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MagicBallBloc magicBallBloc = MagicBallBloc();
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: 
        // BlocProvider(
        //   create: (context) => MagicBallBloc(),
        //   child: MagicBallScreen(),
        // )

        const MagicBallScreen(),
        );
  }
}
