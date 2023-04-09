// ignore_for_file: non_constant_identifier_names, unnecessary_new, prefer_typing_uninitialized_variables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/share/network/endpointer.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/signup_states.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility_outlined;
  IconData confirmSuffix = Icons.visibility_outlined;
  bool isPassword = true;
  bool isPasswordConfirm = true;
  bool checkbox = false;
  var countryCode;
  var country;
  var city;
  var currency;
  var accountType;
  var language;
  var State;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  int pageIndex = 0;

  void userSigup({
    required var email,
    required var password,
    required var IPAddress,
    required var country_code,
    required var account_type,
    required var account_type_name,
    required var default_language,
    required var referral_code,
    required var f_name,
    required var l_name,
    required var mob,
    required var phone_country_code,
    required var invoice_address,
    required var invoice_country_code,
    required var invoice_state_code,
    required var invoice_city_code,
    required var invoice_zip_postal_code,
    required var currency,
    required var voucher_code,
    required var company_code,
  }) {
    emit(SignupLoadingState());
    DioHelper.postData(
      url: Register,
      data: {
        "IPAddress": IPAddress,
        "country_code": country_code,
        "email": email,
        "user_password": password,
        "account_type": account_type,
        "account_type_name": account_type_name,
        "default_language": default_language,
        "referral_code": referral_code,
        "f_name": f_name,
        "l_name": l_name,
        "mob": mob,
        "phone_country_code": phone_country_code,
        "invoice_address": invoice_address,
        "invoice_country_code": invoice_country_code,
        "invoice_state_code": invoice_state_code,
        "invoice_city_code": invoice_city_code,
        "invoice_zip_postal_code": invoice_zip_postal_code,
        "email_sent": "1",
        "currency": currency,
        "voucher_code": voucher_code,
        "company_code": company_code,
      },
    ).then((value) {
      State = value.data;
      if(State == "Added successfuly") {
        emit(SignupSuccessState());
      }else{
        emit(SignupErrorState(value.data));
      }
    }).catchError((error) {
      emit(SignupErrorState(error.toString()));
    });
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisbilitySignupState());
  }

  void changePasswordConfirmVisibility() {
    isPasswordConfirm = !isPasswordConfirm;
    confirmSuffix = isPasswordConfirm ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordConfirmVisbilitySignupState());
  }

  void changeCheckbox(bool value) {
    checkbox = value;
    emit(ChangeCheckboxState());
  }

  void changeCountryCode(var value) {
    countryCode = value;
    emit(SignupChangeCountryCodeState());
  }
}
