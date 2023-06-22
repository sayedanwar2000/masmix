// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/my_account_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/states/my_account_state.dart';

class MyAccountScreen extends StatelessWidget {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController State = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController companyCode = TextEditingController();
  TextEditingController voucherCode = TextEditingController();
  TextEditingController phone2 = TextEditingController();

  MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    var appCubit = AppCubit.get(context);
    var myAccountCubit = MyAccountCubit.get(context);
    var userData = LoginCubit
        .get(context)
        .loginModel;
    firstName.text = userData.fName.toString();
    lastName.text = userData.lName.toString();
    email.text = userData.email.toString();
    phone1.text = userData.mob.toString();
    State.text = userData.invoiceStateCode.toString();
    postalCode.text = userData.invoiceZipPostalCode.toString();
    address.text = userData.invoiceAddress.toString();
    companyCode.text = userData.companyCode.toString();
    voucherCode.text = userData.voucherCode.toString();
    phone2.text = userData.mob1.toString();
    myAccountCubit.language = myAccountCubit.language ??
        appCubit.getLanguageValue(userData.defaultLanguage);
    myAccountCubit.country = myAccountCubit.country ??
        appCubit.getCountryValue(userData.invoiceCountryCode);
    myAccountCubit.city =
        myAccountCubit.city ?? appCubit.getCityValue(userData.invoiceCityCode);
    print(myAccountCubit.language);
    print(myAccountCubit.country);
    print(myAccountCubit.city);

    return BlocConsumer<MyAccountCubit, MyAccountStates>(
      listener: (context, state) {
        if(state is UpDateSuccessState){
          userData.fName = firstName.text;
          userData.lName = lastName.text;
          userData.email = email.text;
          userData.mob = phone1.text;
          userData.invoiceStateCode = State.text;
          userData.invoiceZipPostalCode = postalCode.text;
          userData.invoiceAddress = address.text;
          userData.companyCode = companyCode.text;
          userData.voucherCode = voucherCode.text;
          userData.mob1 = phone2.text;
          userData.defaultLanguage = appCubit.getLanguageKey(myAccountCubit.language);
          userData.invoiceCountryCode = appCubit.getCountryKey(myAccountCubit.country);
          userData.invoiceCityCode = appCubit.getCityKey(myAccountCubit.city);
          userData.accountType = appCubit.getAccountTypKey(myAccountCubit.accountType);
          userData.accountTypeName = myAccountCubit.accountType;
          userData.phoneCountryCode = myAccountCubit.countrycode;
          userData.currency = appCubit.getCurrencyKey(myAccountCubit.currency).toString();
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oh Hey!!',
              message: 'UPDATE SUCCESS',
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        else if(state is UpDateErrorState){
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error!',
              message:
              'UPDATE FAILED!',

              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Account'),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 30.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Account Info:',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
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
                          label: 'First Name',
                          widget: defaultTextFormField(
                            controll: firstName,
                            type: TextInputType.text,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: 'Last Name',
                          widget: defaultTextFormField(
                            controll: lastName,
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
                          label: 'Country Code',
                          widget: defaultDropdownSearch(
                            items: appCubit.countryCodeList,
                            isSearch: true,
                            onChang: (value) {
                              myAccountCubit.changeCountryCode(value);
                            },
                            selected: userData.phoneCountryCode.toString(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: 'Phone No',
                          widget: defaultTextFormField(
                            controll: phone1,
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
                    label: 'Email Address',
                    widget: defaultTextFormField(
                      controll: email,
                      type: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultField(
                          label: 'Account Type',
                          widget: defaultDropdownSearch(
                            items: appCubit.accountTypeList,
                            onChang: (value) {
                              myAccountCubit.changeAccountType(value);
                            },
                            height: 120,
                            selected: userData.accountTypeName.toString(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: 'Choose your language',
                          widget: defaultDropdownSearch(
                            items: appCubit.languageList,
                            onChang: (value) {
                              myAccountCubit.changeLanguage(value);
                            },
                            height: 120,
                            selected: myAccountCubit.language,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  myDivider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultField(
                    label: 'Choose your currency',
                    widget: defaultDropdownSearch(
                      items: appCubit.currencyList,
                      onChang: (value) {
                        myAccountCubit.changeCurrency(value);
                      },
                      height: 170,
                      selected: userData.currencyName.toString(),
                    ),
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
                        width: 10.0,
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
                      Expanded(
                        child: defaultField(
                          label: 'Country Code',
                          widget: defaultDropdownSearch(
                            items: appCubit.countryCodeList,
                            isSearch: true,
                            onChang: (value) {
                              myAccountCubit.changeCountryCode2(value);
                            },
                            selected: userData.phoneCountryCode2.toString(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: 'PHONE NO.2',
                          widget: defaultTextFormField(
                            controll: phone2,
                            type: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Address Info:',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
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
                                    label: 'Country',
                                    widget: defaultDropdownSearch(
                                      items: appCubit.countryList,
                                      isSearch: true,
                                      onChang: (value) {
                                        myAccountCubit.changeCountry(value);
                                      },
                                      selected: myAccountCubit.country,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
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
                                      isSearch: true,
                                      onChang: (value) {
                                        myAccountCubit.changeCity(value);
                                      },
                                      selected: myAccountCubit.city,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
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
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            myDivider(),
                          ],
                        ),
                    separatorBuilder: (context, index) =>
                    const SizedBox(
                      height: 20.0,
                    ),
                    itemCount: myAccountCubit.itemCountAddress,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children: [
                      defaultButton(
                        text: 'ADD ANOTHER ADDRESS',
                        function: () {
                          myAccountCubit.changeItemCountAddress(
                              ++myAccountCubit.itemCountAddress);
                        },
                        color: const Color(0xff000236),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        text: 'UPDATE ACCOUNT',
                        function: () {
                          myAccountCubit.userUpDate(
                            id: userData.id.toString(),
                            accountType: appCubit.getAccountTypKey(myAccountCubit.accountType).toString(),
                            accountTypeName: myAccountCubit.accountType.toString(),
                            defaultLanguage: appCubit.getLanguageKey(myAccountCubit.language).toString(),
                            fName: firstName.text,
                            lNme: lastName.text,
                            mob: phone1.text,
                            phoneCountryCode: myAccountCubit.countrycode.toString(),
                            invoiceAddress: address.text ,
                            invoiceCountryCode: appCubit.getCountryKey(myAccountCubit.country).toString(),
                            invoiceCityCode: appCubit.getCityKey(myAccountCubit.city).toString(),
                            emailSent: userData.emailSent.toString(),
                            currency: appCubit.getCurrencyKey(myAccountCubit.currency).toString(),
                            voucherCode: voucherCode.text,
                            companyCode: companyCode.text,
                            invoiceStateCode: State.text,
                            invoiceZipPostalCode: postalCode.text,
                            referralCode: userData.referralCode.toString(),
                          );
                        },
                        color: const Color(0xff000236),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
