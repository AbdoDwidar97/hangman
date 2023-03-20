import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_v2/app/game_play/business_logic/game-play_bloc.dart';
import 'package:hangman_v2/app/game_play/view/game_play_screen.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp>
{
  @override
  Widget build(BuildContext context)
  {
  /* return MultiBlocProvider(
      providers: [
        // BlocProvider<GamePlayBloc>(create: (_) => GamePlayBloc()),
      ],
      child:*/ return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GamePlayScreen(),
   );
  }
}