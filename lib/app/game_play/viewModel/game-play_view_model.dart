import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_v2/app/game_play/viewModel/game_play_event.dart';
import 'package:hangman_v2/app/game_play/viewModel/word_state.dart';

class GamePlayViewModel extends Bloc<GamePlayEvent, WordState>
{
  GamePlayViewModel() : super(WordState());
}