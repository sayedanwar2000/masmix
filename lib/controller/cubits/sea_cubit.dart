import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/states/sea_states.dart';

class  SeaCubit extends Cubit<SeaStates>{
  SeaCubit() : super(InitialSeaStates());
  static SeaCubit get(context) => BlocProvider.of(context);

  late String? character = "";
  dynamic countryKey;
  dynamic country;
  dynamic cityKey;
  dynamic city;
  dynamic size;
  dynamic port;

  List<String> radioButtonList = [];
  var radioButtonIdList = <int, String>{};

  void changeCountry(value) {
    country = value;
    emit(SeaChangeCountryState());
  }

  void changeCity(value) {
    city = value;
    emit(SeaChangeCityState());
  }

  void changeCharacter(value) {
    character = value;
    emit(SeaChangeCharacterState());
  }

}