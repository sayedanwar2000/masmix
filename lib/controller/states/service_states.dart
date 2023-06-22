abstract class ServiceStates {}

class ServiceInitialState extends ServiceStates {}

class ServiceCityChangeState extends ServiceStates {}

class StateChangeState extends ServiceStates {}

class ServiceCountryLoadingState extends ServiceStates {}

class ServiceCountrySuccessState extends ServiceStates {}

class ServiceCountryErrorState extends ServiceStates {
  final String error;

  ServiceCountryErrorState(this.error);
}

class ServiceCityLoadingState extends ServiceStates {}

class ServiceCitySuccessState extends ServiceStates {}

class ServiceCityErrorState extends ServiceStates {
  final String error;

  ServiceCityErrorState(this.error);
}

class GetAirPortLoadingState extends ServiceStates {}

class GetAirPortSuccessState extends ServiceStates {}

class GetAirPortErrorState extends ServiceStates {
  final String error;

  GetAirPortErrorState(this.error);
}
