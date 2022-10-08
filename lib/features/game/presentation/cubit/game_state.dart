part of 'game_cubit.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class GameStart extends GameState{}

class GameRefresh extends GameState{}

class GameAnswerQuestion extends GameState{}

class GameAnswerQuestionMapFun extends GameState{}

class GameIndexKaitoChosen extends GameState{}

class GameChangeGamersExistsList extends GameState{}

class GameChangeLanguageCode extends GameState{}

class GameCountKaitoToken extends GameState{}
