// ignore_for_file: must_be_immutable, non_constant_identifier_names, override_on_non_overriding_member

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/signup_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/states/signup_states.dart';
import 'package:masmix/views/sign_in_screen/signin.dart';

class SecondSignupScreen extends StatelessWidget {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController State = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  TextEditingController companyCode = TextEditingController();
  TextEditingController voucherCode = TextEditingController();
  PageController page = PageController(initialPage: 0);
  dynamic countryKey;
  dynamic accountTypeKey;
  dynamic languageKey;
  dynamic cityKey;
  dynamic currencyKey;


  SecondSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var signupCubit = SignupCubit.get(context);
    var appCubit = AppCubit.get(context);
    TextEditingController firstName = signupCubit.firstName;
    TextEditingController lastName = signupCubit.lastName;
    TextEditingController email = signupCubit.email;
    TextEditingController phone = signupCubit.phone;
    var formKey = GlobalKey<FormState>();
    var formkey = GlobalKey<FormState>();
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {
        if(state is SignupSuccessState){
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oh Hey!!',
              message:
              '${signupCubit.State}',
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          navigateAndFinish(context, SigninScreen());
        }
        else if(state is SignupErrorState){
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error!',
              message:
              '${signupCubit.State}!',

              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        signupCubit.accountType = signupCubit.accountType ?? appCubit.accountTypeList[0];
        accountTypeKey = appCubit.getAccountTypKey(appCubit.accountTypeList[0]);
        signupCubit.language = signupCubit.language ?? appCubit.languageList[0];
        languageKey = appCubit.getLanguageKey(appCubit.languageList[0]);
        signupCubit.city = signupCubit.city ?? appCubit.city[0];
        cityKey = appCubit.getCityKey(appCubit.city[0]);
        signupCubit.country = signupCubit.country ?? appCubit.countryList[0];
        countryKey = appCubit.getCountryKey(appCubit.countryList[0]);
        signupCubit.currency = signupCubit.currency ?? appCubit.currencyList[0];
        currencyKey = appCubit.getCurrencyKey(appCubit.currencyList[0]);
        return Scaffold(
          appBar: AppBar(),
          body: PageView(
            controller: page,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Account Info:'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        myDivider(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: 'FIRST NAME',
                                widget: defaultTextFormField(
                                  controll: firstName,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'First Name must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: defaultField(
                                label: 'LAST NAME',
                                widget: defaultTextFormField(
                                  controll: lastName,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Last Name must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: 'Country Code',
                                widget: defaultDropdownSearch(
                                  items: appCubit.countryCodeList,
                                  onChang: (value) {
                                    signupCubit.changeCountryCode(value);
                                  },
                                  isSearch: true,
                                  selected: signupCubit.countryCode,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label: 'PHONE NO.',
                                widget: defaultTextFormField(
                                  controll: phone,
                                  type: TextInputType.phone,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'phone must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultField(
                          label: 'Email address',
                          widget: defaultTextFormField(
                            controll: email,
                            type: TextInputType.emailAddress,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return 'E-mail must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultField(
                          label: 'Password',
                          widget: defaultTextFormField(
                            controll: password,
                            type: TextInputType.visiblePassword,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return 'password must not be empty';
                              }
                              return null;
                            },
                            isPassword: signupCubit.isPassword,
                            suffix: signupCubit.suffix,
                            suffixPressed: () {
                              signupCubit.changePasswordVisibility();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultField(
                          label: 'Confirm Password',
                          widget: defaultTextFormField(
                            controll: confirmPassword,
                            type: TextInputType.visiblePassword,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return 'Confirm Password must not be empty';
                              }
                              if (password.text != confirmPassword.text) {
                                return 'Password must be matching';
                              }
                              return null;
                            },
                            isPassword: signupCubit.isPasswordConfirm,
                            suffix: signupCubit.confirmSuffix,
                            suffixPressed: () {
                              signupCubit.changePasswordConfirmVisibility();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: 'Account type',
                                widget: defaultDropdownSearch(
                                  items: appCubit.accountTypeList,
                                  height: 100,
                                  onChang: (value) {
                                    signupCubit.accountType = value;
                                    accountTypeKey = appCubit.getAccountTypKey(value);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: defaultField(
                                label: 'Language',
                                widget: defaultDropdownSearch(
                                  items: appCubit.languageList,
                                  height: 100,
                                  onChang: (value) {
                                    signupCubit.language = value;
                                    languageKey = appCubit.getLanguageKey(value);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            defaultButton(
                              text: 'Next',
                              widt: 100,
                              function: () {
                                print(signupCubit.accountType);
                                print(signupCubit.language);
                                if (formKey.currentState!.validate()) {
                                  signupCubit.password = password;
                                  signupCubit.confirmPassword = confirmPassword;
                                  page.animateToPage(++signupCubit.pageIndex,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.linearToEaseOut);
                                }
                              },
                              color: const Color(0xfff7921c),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Address Info:'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        myDivider(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: 'Country',
                                widget: defaultDropdownSearch(
                                  items: appCubit.countryList,
                                  onChang: (value) {
                                    signupCubit.country = value;
                                    countryKey = appCubit.getCountryKey(value);
                                  },
                                  isSearch: true,
                                  selected: signupCubit.country,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label: 'State',
                                widget: defaultTextFormField(
                                  controll: State,
                                  type: TextInputType.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: 'City',
                                widget: defaultDropdownSearch(
                                  items: appCubit.city,
                                  onChang: (value) {
                                    signupCubit.city = value;
                                    cityKey = appCubit.getCityKey(value);
                                  },
                                  isSearch: true,
                                  selected: signupCubit.city,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label: 'Postal Code/ZIP',
                                widget: defaultTextFormField(
                                  controll: postalCode,
                                  type: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultField(
                          label: 'Address',
                          widget: defaultTextFormField(
                            controll: address,
                            type: TextInputType.text,
                            validat: (String? value) {
                              if (value!.isEmpty) {
                                return 'Address must not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        myDivider(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: 'Currency',
                                widget: defaultDropdownSearch(
                                  height: 160,
                                  items: appCubit.currencyList,
                                  onChang: (value) {
                                    signupCubit.currency = value;
                                    currencyKey = appCubit.getCurrencyKey(value);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label: 'Referral Code',
                                widget: defaultTextFormField(
                                  controll: referralCode,
                                  type: TextInputType.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultField(
                                label: 'Company Code',
                                widget: defaultTextFormField(
                                  controll: companyCode,
                                  type: TextInputType.text,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: defaultField(
                                label: 'Voucher Code',
                                widget: defaultTextFormField(
                                  controll: voucherCode,
                                  type: TextInputType.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            defaultButton(
                              text: 'Back',
                              widt: 100,
                              function: () {
                                page.animateToPage(--signupCubit.pageIndex,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linearToEaseOut);
                              },
                              color: const Color(0xfff7921c),
                            ),
                            const Spacer(),
                            defaultButton(
                              text: 'Register',
                              widt: 100,
                              function: () {
                                if (formkey.currentState!.validate()) {
                                  signupCubit.userSigup(
                                    email: email.text,
                                    password: password.text,
                                    IPAddress: appCubit.ipAddress,
                                    country_code: '',
                                    account_type: accountTypeKey,
                                    account_type_name: signupCubit.accountType,
                                    default_language: languageKey,
                                    referral_code: referralCode.text,
                                    f_name: firstName.text,
                                    l_name: lastName.text,
                                    mob: phone.text,
                                    phone_country_code: signupCubit.countryCode,
                                    invoice_address: address.text,
                                    invoice_country_code: countryKey,
                                    invoice_state_code: State.text,
                                    invoice_city_code: cityKey,
                                    invoice_zip_postal_code: postalCode.text,
                                    currency: currencyKey,
                                    voucher_code: companyCode.text,
                                    company_code: voucherCode.text,
                                  );

                                }
                              },
                              color: const Color(0xfff7921c),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
