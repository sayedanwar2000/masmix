// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/storage_states.dart';
enum SingingCharacter { Parcel, OpenSpace, Documents, Pallet }

class StorageCubit extends Cubit<StorageStates> {
  StorageCubit() : super(StorageInitialState());

  static StorageCubit get(context) => BlocProvider.of(context);

  late SingingCharacter? character = SingingCharacter.Parcel;
  bool checkbox = false;
  dynamic countryKey;
  dynamic country;
  dynamic accountTypeKey;
  dynamic accountType;
  dynamic languageKey;
  dynamic language;
  dynamic cityKey;
  dynamic city;
  dynamic currencyKey;
  dynamic currency;

  void changeCheckBox(value) {
    checkbox = value;
    emit(StorageChangeCheckBoxState());
  }

  void changeCountry(value) {
    country = value;
    emit(StorageChangeCountryState());
  }

  void changeCity(value) {
    city = value;
    emit(StorageChangeCountryState());
  }

  void changeCharacter(value) {
    character = value;
    emit(StorageChangeCharacterState());
  }

  void submitStorageQuote({
    required storage_country,
    required storage_country_id,
    required storage_country_name,
    required storage_city_id,
    required storage_city_name,
    required radio_storage_service_type_id,
    required storage_from_date,
    required storage_to_date,
    required storage_size_dropdownlist_id,
    required storage_org_id,
    required is_storage_size,
    required storage_desc,
    required lang,
    required first_name,
    required email,
    required phone_country_code,
    required mob,
  }) {
    emit(StorageLoadingState());
    DioHelper.postData(
      url: Storage_quote,
      data: {
        "storage_country": storage_country,
        "storage_country_id": storage_country_id,
        "storage_country_name": storage_country_name,
        "storage_city_id": storage_city_id,
        "storage_city_name": storage_city_name,
        "radio_storage_service_type_id": radio_storage_service_type_id,
        "storage_from_date": storage_from_date,
        "storage_to_date": storage_to_date,
        "storage_size_dropdownlist_id": storage_size_dropdownlist_id,
        "storage_org_id": storage_org_id,
        "is_storage_size": is_storage_size,
        "storage_desc": storage_desc,
        "lang": lang,
        "first_name": first_name,
        "email": email,
        "phone_country_code": phone_country_code,
        "mob": mob,
      },
    ).then((value) {
      if (value.data.runtimeType == String) {
        emit(StorageErrorState(value.data));
      } else {
        //loginModel = UserModel.fromJson(value.data);
        emit(StorageSuccessState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(StorageErrorState(error.toString()));
    });
  }
}
