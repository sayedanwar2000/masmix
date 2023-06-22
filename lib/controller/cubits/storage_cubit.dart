// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/storage_states.dart';
// enum SingingCharacter { Parcel, OpenSpace, Documents, Pallet }

class StorageCubit extends Cubit<StorageStates> {
  StorageCubit() : super(StorageInitialState());

  static StorageCubit get(context) => BlocProvider.of(context);

  late String? character = "";
  bool checkbox = false;
  dynamic countryKey;
  dynamic country;
  dynamic cityKey;
  dynamic city;
  dynamic size;
  List<String> radioButtonList = [];
  var radioButtonIdList = <int, String>{};
  List<String> sizeList = [];
  var sizeIdList = <int, String>{};


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
    emit(StorageChangeCityState());
  }

  void changeSize(value) {
    size = value;
    emit(StorageChangeSizeState());
  }

  void changeCharacter(value) {
    character = value;
    emit(StorageChangeCharacterState());
  }

  void getRadioButton({
    required fromCountryID,
    required toCityID,
  }) {
    radioButtonList = [];
    radioButtonIdList = <int, String>{};
    emit(StorageRadioButtonLoadingState());
    DioHelper.postData(
      url: StorageRadioButton,
      data: {
        "from_country_id": fromCountryID,
        "to_city_id": toCityID,
      },
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        radioButtonList.add(item['service_type_size_name']);
        radioButtonIdList[item['service_type_size_id'].toInt()] =
        item['service_type_size_name'];
      }
      emit(StorageRadioButtonSuccessState());
    }).catchError((error) {
      emit(StorageRadioButtonErrorState(error.toString()));
    });
  }

  int getRadioKey(var value) {
    var radioKey = radioButtonIdList.keys
        .firstWhere((k) => radioButtonIdList[k] == value, orElse: () => 1);
    return radioKey;
  }

  void getSize({
    required fromCountryID,
    required serviceSizeTypeId,
    required storageFromDate,
    required storageToDate,
    required fromCityID,
  }) {
    sizeList = [];
    sizeIdList = <int, String>{};
    emit(StorageSizeLoadingState());
    DioHelper.postData(
      url: StorageSize,
      data: {
        "from_country_id": fromCountryID,
        "service_size_type_id": serviceSizeTypeId,
        "storage_from_date":storageFromDate,
        "storage_to_date":storageToDate,
        "from_city_id":fromCityID
      },
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        sizeList.add(item['wharehouse_size_desc']);
        sizeIdList[item['id'].toInt()] =
        item['wharehouse_size_desc'];
      }
      emit(StorageSizeSuccessState());
    }).catchError((error) {
      emit(StorageSizeErrorState(error.toString()));
    });
  }

  int getSizeKey(var value) {
    var sizeKey = sizeIdList.keys
        .firstWhere((k) => sizeIdList[k] == value, orElse: () => 1);
    return sizeKey;
  }

  void submitStorageQuote({
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
        "storage_country": 0,
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
        emit(StorageSuccessState());
      }
    }).catchError((error) {
      emit(StorageErrorState(error.toString()));
    });
  }
}
