import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_v2/app/game_play/business_logic/game_play_state.dart';
import 'game_play_event.dart';

class GamePlayBloc extends Bloc<BaseGamePlayEvent, BaseGamePlayState>
{
  GamePlayBloc() : super(GamePlayState(
    typedWord: "",
    selectedLetters: HashSet<String>(),
    targetWord: 'ORANGE',
    targetWordLetterPosition: HashMap<String, List<int>>(),
    topic: 'Fruits',
    failSteps: [
      "assets/images/1.jpg",
      "assets/images/4.jpg",
      "assets/images/5.jpg",
      "assets/images/6.jpg",
      "assets/images/7.jpg",
      "assets/images/8.jpg",
      "assets/images/9.jpg",
      "assets/images/10.jpg"
    ],
    failStepIdx: 0,
    letters: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
      "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"] )
  )
  {
    on<GamePlayInitEvent>(_onInit);
    on<TypeWordEvent>(_onSelect);
  }

  void _onInit (GamePlayInitEvent event,  Emitter<BaseGamePlayState>  emit)
  {
    emit(_initTargetWord(state as GamePlayState));
  }

  GamePlayState _initTargetWord(GamePlayState state)
  {
    print("222222222222222222222222");

    state.targetWordLetterPosition.clear();
    state.selectedLetters.clear();
    state.typedWord = "";

    for (int i = 0; i < state.targetWord.length; i++)
    {
      state.typedWord += " ";
      if (state.targetWordLetterPosition.containsKey(state.targetWord[i]))
      {
        List<int> lst = state.targetWordLetterPosition[state.targetWord[i]]!;
        lst.add(i);
        state.targetWordLetterPosition[state.targetWord[i]] = lst;
      }
      else state.targetWordLetterPosition[state.targetWord[i]] = [i];
    }

    return state;
  }

  void _onSelect (TypeWordEvent event,  Emitter<BaseGamePlayState>  emit)
  {
    emit(_selectLetter(state as GamePlayState, event.typedLetter));
  }

  GamePlayState _selectLetter(GamePlayState state, String letter)
  {
    state.printState();
    if (state.targetWordLetterPosition.containsKey(letter))
    {
      List<int> positions = state.targetWordLetterPosition[letter]!;
      for(int idx in positions)
      {
        state.typedWord = state.typedWord.replaceRange(idx, idx + 1, letter);
      }
    }
    else
    {
      state.failStepIdx++;
    }

    state.selectedLetters.add(letter);

    print(state.typedWord);

    return state.clone() as GamePlayState;
  }

}