abstract class BaseGamePlayEvent{}

class TypeWordEvent extends BaseGamePlayEvent
{
  String typedLetter = "";
  TypeWordEvent({required this.typedLetter});

}

class GamePlayInitEvent extends BaseGamePlayEvent
{

}