// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/service_states.dart';

class ServiceCubit extends Cubit<ServiceStates> {
  ServiceCubit() : super(ServiceInitialState());

  static ServiceCubit get(context) => BlocProvider.of(context);

  List<String> countryList = [];
  List<String> radioButtonList = [];
  List<String>? city = [];
  var countryIdList = <int, String>{};
  var radioButtonIdList = <int, String>{};
  var cityIdList = <int, String>{};
  var cityList = <int, List<String>>{};
  var cityList2 = <int, List<String>>{};
  List<String> airPort_PortList = [];
  var airPort_PortIdList = <int, String>{};

  bool done = false;

  getCountryAndCity({
    required serviceID,
  }) {
    emit(ServiceCountryLoadingState());
    if (countryList.isEmpty) {
      DioHelper.postData(
        url: countriesService,
        data: {
          'service_type_id': serviceID,
        },
      ).then((value) async {
        var list = value.data;
        for (var item in list) {
          countryList.add(item['route_from_country_name']);
          countryIdList[item['route_from_country'].toInt()] =
              item['route_from_country_name'];
        }
        emit(ServiceCityLoadingState());
        for (int K in countryIdList.keys) {
          await DioHelper.postData(
            url: citiesService,
            data: {
              "service_type_id": serviceID,
              "from_country_id": K,
            },
          ).then((value) {
            var list = value.data;
            List<String> city2 = [];
            for (var item in list) {
              city!.add(item['city_name']);
              city2.add(item['city_name']);
              cityIdList[item['city_id'].toInt()] = item['city_name'];
            }
            cityList[K] = city2;
            emit(ServiceCitySuccessState());
          }).catchError((error) {
            emit(ServiceCityErrorState(error.toString()));
          });
        }
        emit(ServiceCountrySuccessState());
      }).catchError((error) {
        emit(ServiceCountryErrorState(error.toString()));
      });
    } else {
      emit(ServiceCountrySuccessState());
    }
  }



  int getCountryKey(var value) {
    var countryKey = countryIdList.keys
        .firstWhere((k) => countryIdList[k] == value, orElse: () => 1);
    return countryKey;
  }

  int getCityKey(var value) {
    var cityKey = cityIdList.keys
        .firstWhere((k) => cityIdList[k] == value, orElse: () => 1);
    return cityKey;
  }

  void changeCity(var country) {
    int key = getCountryKey(country);
    city = [];

    city = cityList[key];
    emit(ServiceCityChangeState());
  }

  void changeState() {
    done = !done;
    emit(StateChangeState());
  }

  void getAirPortOrPort({
    required fromCountryID,
    required portType,
  }) {
    airPort_PortList = [];
    airPort_PortIdList = <int, String>{};
    emit(GetAirPortLoadingState());
    DioHelper.postData(
      url: getAirPorts,
      data: {
        "port_type": portType,
        "from_country_id": fromCountryID
      } ,
    ).then((value) async {
      var list = value.data;
      for (var item in list) {
        airPort_PortList.add(item['port_name']);
        airPort_PortIdList[item['id'].toInt()] =
        item['port_name'];
      }
      emit(GetAirPortSuccessState());
    }).catchError((error) {
      emit(GetAirPortErrorState(error.toString()));
    });
  }

  int getAirPortKey(var value) {
    var radioKey = airPort_PortIdList.keys
        .firstWhere((k) => airPort_PortIdList[k] == value, orElse: () => 1);
    return radioKey;
  }
}
