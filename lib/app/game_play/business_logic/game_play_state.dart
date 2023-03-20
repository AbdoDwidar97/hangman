import 'dart:collection';

abstract class BaseGamePlayState
{
  List<String> letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
    "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

  List<String> failSteps = [
    "assets/images/1.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
    "assets/images/7.jpg",
    "assets/images/8.jpg",
    "assets/images/9.jpg",
    "assets/images/10.jpg"
  ];

  String typedWord = "";

  int failStepIdx = 0;

  HashSet<String> selectedLetters = HashSet();
  HashMap<String, List<int>> targetWordLetterPosition = HashMap();

  String targetWord = "ORANGE";
  String topic = "Fruits";

  BaseGamePlayState clone();
}

class GamePlayInitState extends BaseGamePlayState
{
  GamePlayInitState({
    required typedWord,
    required selectedLetters,
    required targetWordLetterPosition,
    required targetWord,
    required topic
  });

  @override
  BaseGamePlayState clone() {
    // TODO: implement clone
    throw UnimplementedError();
  }

}

class GamePlayState extends BaseGamePlayState
{
  GamePlayState({
    required typedWord,
    selectedLetters,
    targetWordLetterPosition,
    targetWord,
    topic
  });

  @override
  BaseGamePlayState clone()
  {
    return GamePlayState(
      typedWord: typedWord,
      selectedLetters: selectedLetters,
      targetWord: targetWord,
      targetWordLetterPosition: targetWordLetterPosition,
      topic: topic
    );
  }
}