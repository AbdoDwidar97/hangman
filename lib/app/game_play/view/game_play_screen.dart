import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman_v2/app/game_play/business_logic/game-play_bloc.dart';
import 'package:hangman_v2/app/game_play/business_logic/game_play_event.dart';
import 'package:hangman_v2/app/game_play/business_logic/game_play_state.dart';

class GamePlayScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => GamePlayScreenState();
  final GamePlayBloc _gamePlayBloc = GamePlayBloc();
}

class GamePlayScreenState extends State<GamePlayScreen>
{
  double widthUnit = 0, heightUnit = 0;

  /*List<String> letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
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

  int failStepIdx = 0;

  HashSet<String> selectedLetters = HashSet();
  HashMap<String, List<int>> targetWordLetterPosition = HashMap();

  String typedWord = "";
  String targetWord = "ORANGE";
  String topic = "Fruits";*/

  @override
  void initState()
  {
    super.initState();
    // setupTargetWord();
   widget._gamePlayBloc.add(GamePlayInitEvent());
  }

  @override
  Widget build(BuildContext context)
  {
    widthUnit = MediaQuery.of(context).size.width / 50;
    heightUnit = MediaQuery.of(context).size.height / 50;

    return Scaffold(
      body: BlocProvider<GamePlayBloc>(
        create: (context) => widget._gamePlayBloc,
        child: BlocBuilder<GamePlayBloc, BaseGamePlayState>(
          builder: (context, state){

            print("5555555555555555555555555");

            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  /// Hangman Situation Image
                  SizedBox(
                    width: widthUnit * 50,
                    height: heightUnit * 20,
                    child: Image.asset(state.failSteps[state.failStepIdx],
                      width: widthUnit * 50,
                      height: heightUnit * 20,
                      fit: BoxFit.fill,
                    ),
                  ),

                  SizedBox(height: heightUnit * 2),

                  /// topic Text
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthUnit * 2,
                        vertical: heightUnit * 0.6
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: Colors.black,
                            width: widthUnit * heightUnit * 0.004
                        )
                    ),
                    child: Text(state.topic, style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),

                  SizedBox(height: heightUnit * 2),

                  /// Typed Word
                  SizedBox(
                    height: heightUnit * 3,
                    child: ListView.separated(
                      itemCount: state.typedWord.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: widthUnit * 1.6),
                      itemBuilder: (context, idx)
                      {
                        return Column(
                          children: [
                            Text(state.typedWord[idx], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                            SizedBox(height: heightUnit * 0.2),

                            SizedBox(
                              width: widthUnit * 4,
                              child: Divider(
                                color: Colors.blue[700],
                                thickness: widthUnit * heightUnit * 0.026,
                              ),
                            )

                          ],
                        );
                      },
                    ),

                  ),

                  SizedBox(height: heightUnit * 2),

                  /// Letters Board
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.letters.length,
                      padding: EdgeInsets.all(0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          crossAxisSpacing: widthUnit,
                          mainAxisSpacing: heightUnit
                      ),
                      itemBuilder: (BuildContext context, int index){
                        return Center(
                            child: InkWell(
                              onTap: () => (state.selectedLetters.contains(state.letters[index])) ?
                              null :
                              widget._gamePlayBloc.add(TypeWordEvent(typedLetter: state.letters[index])), // selectLetter(index),
                              child: Text(state.letters[index],
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: (state.selectedLetters.contains(state.letters[index]) &&
                                          state.targetWordLetterPosition.containsKey(state.letters[index])) ? Colors.blue :
                                      (state.selectedLetters.contains(state.letters[index]) &&
                                          !state.targetWordLetterPosition.containsKey(state.letters[index])) ? Colors.red : Colors.black
                                  )
                              ),
                            )
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /*void setupTargetWord()
  {

    targetWordLetterPosition.clear();
    selectedLetters.clear();
    typedWord = "";

    for (int i = 0; i < targetWord.length; i++)
    {
        typedWord += " ";
        if (targetWordLetterPosition.containsKey(targetWord[i]))
        {
            List<int> lst = targetWordLetterPosition[targetWord[i]]!;
            lst.add(i);
            targetWordLetterPosition[targetWord[i]] = lst;
        }
        else targetWordLetterPosition[targetWord[i]] = [i];
    }

    setState(() {

    });
  }

  void selectLetter(int letterIdx)
  {
    setState(() {

      if (targetWordLetterPosition.containsKey(letters[letterIdx]))
      {
        List<int> positions = targetWordLetterPosition[letters[letterIdx]]!;
        for(int idx in positions)
        {
          typedWord = typedWord.replaceRange(idx, idx + 1, letters[letterIdx]);
        }
      }
      else
      {
        failStepIdx++;
      }

      selectedLetters.add(letters[letterIdx]);

      print(typedWord);
    });
  }*/

}