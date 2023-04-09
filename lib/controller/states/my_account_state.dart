abstract class MyAccountStates{}

class MyAccountInitialState extends MyAccountStates{}

class MyAccountChangeCountryCodeState extends MyAccountStates{}

class MyAccountChangeCountryCode2State extends MyAccountStates{}

class MyAccountChangeAccountTypeState extends MyAccountStates{}

class MyAccountChangeLanguageState extends MyAccountStates{}

class MyAccountChangeCountryState extends MyAccountStates{}

class MyAccountChangeCityState extends MyAccountStates{}

class MyAccountChangeCurrencyState extends MyAccountStates{}

class MyAccountChangeItemCountAddressState extends MyAccountStates{}

class UpDateLoadingState extends MyAccountStates{}

class UpDateSuccessState extends MyAccountStates{}

class UpDateErrorState extends MyAccountStates{
  late final String error;

  UpDateErrorState(this.error);
}
