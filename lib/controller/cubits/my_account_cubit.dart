// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/my_account_state.dart';
import 'package:masmix/controller/share/network/endpointer.dart';

class MyAccountCubit extends Cubit<MyAccountStates> {
  MyAccountCubit() : super(MyAccountInitialState());

  static MyAccountCubit get(context) => BlocProvider.of(context);
  dynamic countrycode;
  dynamic countrycode2;
  dynamic accountType;
  dynamic language;
  dynamic country;
  dynamic city;
  dynamic currency;
  int itemCountAddress = 1;

  void changeCountryCode(var value) {
    countrycode = value;
    emit(MyAccountChangeCountryCodeState());
  }

  void changeCountryCode2(var value) {
    countrycode2 = value;
    emit(MyAccountChangeCountryCode2State());
  }

  void changeAccountType(var value) {
    accountType = value;
    emit(MyAccountChangeAccountTypeState());
  }

  void changeLanguage(var value) {
    language = value;
    emit(MyAccountChangeLanguageState());
  }

  void changeCountry(var value) {
    country = value;
    emit(MyAccountChangeCountryState());
  }

  void changeItemCountAddress(var value) {
    itemCountAddress = value;
    emit(MyAccountChangeItemCountAddressState());
  }

  void userUpDate({
    required String id,
    required String accountType,
    required String accountTypeName,
    required String defaultLanguage,
    required String fName,
    required String lNme,
    required String mob,
    required String phoneCountryCode,
    required String invoiceAddress,
    required String invoiceCountryCode,
    required String invoiceCityCode,
    required String emailSent,
    required String currency,
    String? referralCode,
    String? invoiceStateCode,
    String? invoiceZipPostalCode,
    String? voucherCode,
    String? companyCode,
  }){
    emit(UpDateLoadingState());
    DioHelper.postData(
      url: UpDate,
      data: {
        'id':id,
        'account_type': accountType,
        'account_type_name': accountTypeName,
        'default_language': defaultLanguage,
        'referral_code': referralCode,
        'f_name': fName,
        'l_name': lNme,
        'mob': mob,
        'phone_country_code': phoneCountryCode,
        'invoice_address': invoiceAddress,
        'invoice_country_code': invoiceCountryCode,
        'invoice_state_code': invoiceStateCode,
        'invoice_city_code': invoiceCityCode,
        'invoice_zip_postal_code': invoiceZipPostalCode,
        'email_sent': emailSent,
        'currency': currency,
        'voucher_code': voucherCode,
        'company_code': companyCode,
      },
    ).then((value) {
      if(value.data.runtimeType == String) {
        emit(UpDateSuccessState());
      }
    }).catchError((error){
      print(error.toString());
      emit(UpDateErrorState(error.toString()));
    });
  }

  void changeCity(var value) {
    city = value;
    emit(MyAccountChangeCityState());
  }

  void changeCurrency(var value) {
    currency = value;
    emit(MyAccountChangeCurrencyState());
  }

}
