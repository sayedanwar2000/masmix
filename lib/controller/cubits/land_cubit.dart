import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/states/land_states.dart';

class LandCubit extends Cubit<LandStates>{
  LandCubit() : super(InitialLandStates());
  static LandCubit get(context) => BlocProvider.of(context);

  late String? character = "";
  dynamic countryKey;
  dynamic country;
  dynamic cityKey;
  dynamic city;
  dynamic size;
  dynamic airPort;

  List<String> airPortList = [];
  var airPortIdList = <int, String>{};
  List<String> radioButtonList = [];
  var radioButtonIdList = <int, String>{};

  void changeCountry(value) {
    country = value;
    emit(LandChangeCountryState());
  }

  void changeCity(value) {
    city = value;
    emit(LandChangeCityState());
  }

  void changeCharacter(value) {
    character = value;
    emit(LandChangeCharacterState());
  }

}