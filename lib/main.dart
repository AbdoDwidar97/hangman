import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_v2/app/game_play/view/game_play_screen.dart';
import 'package:hangman_v2/app/game_play/viewModel/game-play_view_model.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<GamePlayViewModel>(create: (_) => GamePlayViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GamePlayScreen(),
      ),
    );
  }
}