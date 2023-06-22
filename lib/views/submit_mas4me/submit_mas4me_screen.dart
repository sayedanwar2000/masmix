// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/mas4me_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/mas4me_statets.dart';

class SubmitMas4MeScreen extends StatelessWidget {
  TextEditingController SiteName = TextEditingController();
  TextEditingController SiteURL = TextEditingController();
  TextEditingController ItemName = TextEditingController();
  TextEditingController ItemURL = TextEditingController();
  TextEditingController Options = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController Quantity = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SubmitMas4MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit = LoginCubit.get(context);
    var mas4meCubit = Mas4meCubit.get(context);
    return BlocConsumer<Mas4meCubit, Mas4meStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Buy Products',
              style: TextStyle(color: defaultColorBlack),
            ),
            centerTitle: true,
            leading: Image.asset(
              'asset/images/logo.png',
            ),
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'WHERE WOULD YOU LIKE US TO PURCHASE FROM ?',
                      style: TextStyle(fontSize: 13.0),
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
                          child: defaultTextFormField(
                            controll: SiteName,
                            type: TextInputType.text,
                            label: 'Site Name',
                            validat: (String? value){
                              if (value!.isEmpty) {
                                return 'Site name must be not null';
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: defaultTextFormField(
                            controll: SiteURL,
                            type: TextInputType.text,
                            label: 'Site URL',
                            prefix: Icons.link,
                            validat: (String? value){
                              if (value!.isEmpty) {
                                return 'Site URL must be not null';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    const Text(
                      'PLEASE LET US KNOW WHAT ITEM(S) YOU\'D LIKE US TO PURCHASE',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.0),
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
                          child: defaultTextFormField(
                            controll: ItemName,
                            type: TextInputType.text,
                            label: 'Item Name',
                            validat: (String? value){
                              if (value!.isEmpty) {
                                return 'Item Name must be not null';
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: defaultTextFormField(
                            controll: ItemURL,
                            type: TextInputType.text,
                            label: 'Item URL',
                            prefix: Icons.link,
                            validat: (String? value){
                              if (value!.isEmpty) {
                                return 'Item URL must be not null';
                              }
                            },
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
                          child: defaultTextFormField(
                            controll: Options,
                            type: TextInputType.text,
                            label: 'Options (Size,Color..etc)',
                            validat: (String? value){
                              if (value!.isEmpty) {
                                return 'Options must be not null';
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: defaultTextFormField(
                            controll: Price,
                            type: TextInputType.number,
                            label: 'Price (per piece)',
                            prefix: Icons.payments,
                            validat: (String? value){
                              if (value!.isEmpty) {
                                return 'Price must be not null';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: defaultTextFormField(
                        controll: Quantity,
                        type: TextInputType.number,
                        label: 'Quantity',
                        validat: (String? value){
                          if (value!.isEmpty) {
                            return 'Quantity must be not null';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      children: [
                        defaultButton(
                          text: 'Add Another Item',
                          widt: 200,
                          function: () {
                            SiteName.text = '';
                            SiteURL.text = '';
                            ItemName.text = '';
                            ItemURL.text = '';
                            Options.text = '';
                            Price.text = '';
                            Quantity.text = '';
                            mas4meCubit.getMas4Me(currUserId: 55);
                          },
                          color: defaultColorNavyBlue,
                        ),
                        const Spacer(),
                        defaultButton(
                          text: 'Submit',
                          widt: 100,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              mas4meCubit.submitMas4Me(
                                currUserId: loginCubit.loginModel.id,
                                siteName: SiteName.text,
                                siteUrl: SiteURL.text,
                                itemName: ItemName.text,
                                itemUrl: ItemURL.text,
                                options: Options.text,
                                price: Price.text,
                                quantity: Quantity.text,
                                firstName: loginCubit.loginModel.fName,
                                phoneCountryCode:
                                    loginCubit.loginModel.phoneCountryCode,
                                mobile: loginCubit.loginModel.mob,
                                email: loginCubit.loginModel.email,
                              );
                            }
                          },
                          color: defaultColorNavyBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is Mas4meSuccessState) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Oh Hey!!',
              message: 'Item Add Done',
              contentType: ContentType.success,
              // to configure for material banner
              inMaterialBanner: true,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          mas4meCubit.getMas4Me(currUserId: loginCubit.loginModel.id);
        }
        if (state is Mas4meErrorState){
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'ُError!',
              message: 'Please Enter correct data',
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
    );
  }
}
