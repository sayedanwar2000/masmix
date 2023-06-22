import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/air_states.dart';

class AirCubit extends Cubit<AirStates>{
  AirCubit() : super(InitialAirStates());
  static AirCubit get(context) => BlocProvider.of(context);

  late String? character = "";
  dynamic countryKey;
  dynamic country;
  dynamic cityKey;
  dynamic city;
  dynamic size;
  dynamic airPort;

  List<String> radioButtonList = [];
  var radioButtonIdList = <int, String>{};

  void changeCountry(value) {
    country = value;
    emit(AirChangeCountryState());
  }

  void changeCity(value) {
    city = value;
    emit(AirChangeCityState());
  }

  void changeCharacter(value) {
    character = value;
    emit(AirChangeCharacterState());
  }

  void changeAirPort(value) {
    airPort = value;
    emit(AirChangeAirPortState());
  }


}