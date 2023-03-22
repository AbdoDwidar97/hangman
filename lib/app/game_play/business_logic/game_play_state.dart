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

  BaseGamePlayState({
    required this.selectedLetters,
    required this.targetWord,
    required this.targetWordLetterPosition,
    required this.topic,
    required this.failSteps,
    required this.typedWord,
    required this.failStepIdx,
    required this.letters
  });

  BaseGamePlayState clone();

  void printState();
}

class GamePlayInitState extends BaseGamePlayState
{
  GamePlayInitState({
    required typedWord,
    required selectedLetters,
    required targetWordLetterPosition,
    required targetWord,
    required topic,
    required failStepIdx,
    required letters,
    required failSteps
  }): super(
      typedWord: typedWord,
      selectedLetters: selectedLetters,
      targetWordLetterPosition: targetWordLetterPosition,
      targetWord: targetWord,
      topic: topic,
      failStepIdx: failStepIdx,
      letters: letters,
      failSteps: failSteps
  );

  @override
  BaseGamePlayState clone() {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  void printState() {
    // TODO: implement printState
  }

}

class GamePlayState extends BaseGamePlayState
{
  GamePlayState({
    required typedWord,
     selectedLetters,
     targetWordLetterPosition,
     targetWord,
     topic,
     failStepIdx,
     letters,
     failSteps
  }): super(
      typedWord: typedWord,
      selectedLetters: selectedLetters,
      targetWordLetterPosition: targetWordLetterPosition,
      targetWord: targetWord,
      topic: topic,
      failStepIdx: failStepIdx,
      letters: letters,
      failSteps: failSteps
  );

  @override
  BaseGamePlayState clone()
  {
    return GamePlayState(
      typedWord: typedWord,
      selectedLetters: selectedLetters,
      targetWord: targetWord,
      targetWordLetterPosition: targetWordLetterPosition,
      topic: topic,
      letters: letters,
      failSteps: failSteps,
      failStepIdx: failStepIdx
    );
  }

  @override
  void printState()
  {
    print("typed Word: $typedWord");
  }

}