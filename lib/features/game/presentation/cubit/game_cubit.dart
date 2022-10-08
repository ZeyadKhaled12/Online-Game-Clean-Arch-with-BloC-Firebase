
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../room/presentation/cubit/room_cubit.dart';
import '../../data/repositories/game_repository.dart';
import '../screens/game_check_if_kaito_screen.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {

  final GameRepository gameRepository;
  late String idRoom;
  late String kaitoToken = '';
  late List answersList;
  late List indexTokens;
  late int hiringIndex;
  late int index;
  late bool isRefresh;
  late bool isAnswersShow = true;
  late int round = 0;
  late Map objectCategory;
  late Map<String, dynamic> answerQuestionMap = {};
  late Map<String, dynamic> kaitoTokensMap = {};
  late Set<String> gamersExistsList = {};
  late int indexKaitoChosen = -1;
  late Map question;
  String languageCode = 'ar';

  GameCubit(this.gameRepository) : super(GameInitial());


  setDataGame({required BuildContext ctx}) async{
    emit(GameInitial());
    final Map<String, dynamic> _map = await gameRepository.startGame(ctx: ctx,
      gamersExistsList: gamersExistsList);
    await _getQuestion();
    answersList =  _map['answers_list'];
    kaitoToken = _map['kaito_token'];
    idRoom = _map['id_room'];
    indexTokens = _map['index_tokens'];
    hiringIndex = _map['hiring_index'];
    kaitoTokensMap = _map['kaito_tokens_map'];
    objectCategory = _map['object_category'];
    index = 0;
    isRefresh = true;
    indexKaitoChosen = -1;
    emit(GameStart());
  }

  knowImposterIfTrue({required BuildContext ctx}) async{
    List _values = kaitoTokensMap.values.toList();
    List _keys = kaitoTokensMap.keys.toList();
    int _count = 0;
    int _index = 0;
    bool _isSkipped = false;
    int _container = 0;
    for (int i = 0; i < _values.length; i++) {
      if(_values[i] > _container){
        _container = _values[i];
        _index = i;
      }
      _count = _count + int.parse(_values[i].toString());
    }
    _values.remove(_container);
    if(_values.contains(_container)){
      _isSkipped = true;
    }

    if(_count > (kaitoTokensMap.keys.toList().length / 2).ceil() && !_isSkipped){
      await  Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context) =>
          GameCheckIfKaitoScreen(token: _keys[_index])));
    }else{
      await  Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context) =>
          const GameCheckIfKaitoScreen(token: '')));
    }
  }

  refresh() async{
    emit(GameInitial());
    final Map<String, dynamic> _map = await gameRepository.refresh(idRoom: idRoom);
    answersList =  _map['answers_list'];
    kaitoToken = _map['kaito_token'];
    idRoom = _map['id_room'];
    indexTokens = _map['index_tokens'];
    hiringIndex = _map['hiring_index'];
    kaitoTokensMap = _map['kaito_tokens_map'];
    objectCategory = _map['object_category'];
    emit(GameRefresh());
  }

  answerQuestion() async{
    emit(GameInitial());
    await _getQuestion();

    answerQuestionMap.isEmpty?
    await gameRepository.answerQuestion(
        index: hiringIndex, idRoom: idRoom,
        question: {'ar': '.........................', 'en': '.........................'},
        answer: 'Skipped',
        answersList: answersList, indexTokens: indexTokens):
      await gameRepository.answerQuestion(
        index: hiringIndex, idRoom: idRoom,
        question: answerQuestionMap['question'],
        answer: answerQuestionMap['answer'],
        answersList: answersList, indexTokens: indexTokens);
    answerQuestionMap = {};
    index++;
    isRefresh = !isRefresh;
    isAnswersShow = true;
    emit(GameAnswerQuestion());
  }

  answerQuestionMapFun({required Map question, required String answer}) async{
    emit(GameInitial());
    isAnswersShow = false;
    answerQuestionMap['question'] = question;
    answerQuestionMap['answer'] = answer;
    emit(GameAnswerQuestionMapFun());
  }

  indexKaitoChosenFun({required BuildContext ctx, required int index}) async{
    emit(GameInitial());
    if(indexKaitoChosen == -1) {
      indexKaitoChosen = index;
      await gameRepository.indexKaitoChosenFun(idRoom: idRoom,
          token: BlocProvider.of<RoomCubit>(ctx).gamersTokens[indexKaitoChosen]);
    }
    emit(GameIndexKaitoChosen());
  }

  nullGamersExistsList(){
    emit(GameInitial());
    gamersExistsList = {};
    round = 0;
    objectCategory = {};
    emit(GameChangeGamersExistsList());
  }

  gamersExistsListFun(String token){
    emit(GameInitial());
    gamersExistsList.add(token);
    emit(GameChangeGamersExistsList());
  }

  roundPLusPLus(){
    emit(GameInitial());
    round++;
    emit(GameChangeGamersExistsList());
  }

  _getQuestion() async{
    question = await gameRepository.getQuestion();
  }

  changeLanguageCodeFun(){
    emit(GameInitial());
    if(languageCode == 'ar'){
      languageCode = 'en';
    }else{
      languageCode = 'ar';
    }
    emit(GameChangeLanguageCode());
  }

  countKaitoToken({required String token}) async{
    emit(GameInitial());
    await gameRepository.countKaitoToken(token: token);
    emit(GameCountKaitoToken());
  }

}
