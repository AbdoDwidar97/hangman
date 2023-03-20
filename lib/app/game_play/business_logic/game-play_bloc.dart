import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_v2/app/game_play/business_logic/game_play_state.dart';
import 'game_play_event.dart';

class GamePlayBloc extends Bloc<BaseGamePlayEvent, BaseGamePlayState>
{
  GamePlayBloc() : super(GamePlayState(typedWord: ""))
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