// ignore_for_file: must_be_immutable, constant_identifier_names, unrelated_type_equality_checks

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/cubits/storage_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/components/radio_button.dart';
import 'package:masmix/controller/states/storage_states.dart';
import 'package:masmix/views/pending_screen/pendingbookingscreen.dart';

class StorageScreen extends StatelessWidget {
  StorageScreen({super.key});

  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController description = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    var storageCubit = StorageCubit.get(context);
    var serviceCubit = ServiceCubit.get(context);
    var homeCubit = HomeCubit.get(context);
    var ind = 0;
    return BlocConsumer<StorageCubit, StorageStates>(
      builder: (context, state) {
        return true
            ? Scaffold(
                appBar: AppBar(
                  title: const Text('Storage'),
                  centerTitle: true,
                  leading: Image.asset(
                    'asset/images/logo-removebg.png',
                  ),
                ),
                endDrawer:
                    defaultDrawer(context: context),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xff000236),
                              ),
                              borderRadius:
                                  BorderRadius.circular(20.0), //<-- SEE HERE
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        'Geo Data',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: defaultField(
                                          label: 'Country',
                                          widget: defaultDropdownSearch(
                                            items: serviceCubit.countryList,
                                            onChang: (value) {
                                              serviceCubit.changeCity(value);
                                              storageCubit.changeCountry(value);
                                            },
                                            isSearch: true,
                                            selected: 'Select Country',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: defaultField(
                                          label: 'City',
                                          widget: defaultDropdownSearch(
                                            items: serviceCubit.city,
                                            onChang: (value) {
                                              storageCubit.changeCity(value);
                                              if (state is StorageChangeCountryState) {
                                                storageCubit.getRadioButton(
                                                  fromCountryID:
                                                  serviceCubit.getCountryKey(storageCubit.country),
                                                  toCityID:
                                                      serviceCubit.getCityKey(storageCubit.city),
                                                );
                                              }
                                            },
                                            isSearch: true,
                                            selected: 'Select City',
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
                                        child: defaultTextFormField(
                                          controll: fromDate,
                                          type: TextInputType.datetime,
                                          ontap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(5050),
                                            ).then((value) {
                                              fromDate.text = DateFormat.yMd()
                                                  .format(value!)
                                                  .replaceAll('/', '-');
                                            });
                                          },
                                          validat: (value) {
                                            if (value!.isEmpty) {
                                              return 'Date must be not empty';
                                            }
                                            return null;
                                          },
                                          label: 'From Date',
                                          prefix: Icons.calendar_today,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        child: defaultTextFormField(
                                          controll: toDate,
                                          type: TextInputType.datetime,
                                          ontap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(5050),
                                            ).then((value) {
                                              toDate.text = DateFormat.yMd()
                                                  .format(value!)
                                                  .replaceAll('/', '-');
                                            });
                                          },
                                          validat: (value) {
                                            if (value!.isEmpty) {
                                              return 'Date must be not empty';
                                            }
                                            return null;
                                          },
                                          label: 'To Date',
                                          prefix: Icons.calendar_today,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xff000236),
                              ),
                              borderRadius:
                                  BorderRadius.circular(20.0), //<-- SEE HERE
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.info,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('Service Data:'),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  myDivider(),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  if (storageCubit.radioButtonList.isNotEmpty)
                                    ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        ind += 2;
                                        return radioButton(
                                          Cubit: storageCubit,
                                          index: ind,
                                          onChanged: (String? value) {
                                            storageCubit.changeCharacter(value);
                                            storageCubit.getSize(
                                              fromCountryID: serviceCubit.getCountryKey(storageCubit.country),
                                              serviceSizeTypeId: storageCubit.getRadioKey(value),
                                              storageFromDate: fromDate.text,
                                              storageToDate: toDate.text,
                                              fromCityID: serviceCubit.getCityKey(storageCubit.city),
                                            );
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 0,
                                      ),
                                      itemCount: storageCubit
                                                  .radioButtonList.length ==
                                              1
                                          ? storageCubit.radioButtonList.length
                                          : (storageCubit
                                                  .radioButtonList.length) ~/
                                              2,
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    child: defaultField(
                                      label: 'Size',
                                      widget: defaultDropdownSearch(
                                        items: storageCubit.sizeList,
                                        onChang: (String? value) {
                                          storageCubit.changeSize(value);
                                        },
                                        isSearch: true,
                                        selected: 'Select Size',
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          value: storageCubit.checkbox,
                                          onChanged: (value) {
                                            storageCubit.changeCheckBox(value);
                                          }),
                                      const Text(
                                        'Another',
                                      ),
                                    ],
                                  ),
                                  if (storageCubit.checkbox)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        bottom: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Description'),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          defaultTextFormField(
                                            controll: description,
                                            type: TextInputType.text,
                                            maxline: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        defaultButton(
                                          text: 'ADD SIZE',
                                          function: () {},
                                          widt: 150,
                                          color: const Color(0xff000236),
                                        ),
                                        const Spacer(),
                                        defaultButton(
                                          text: 'SUBMIT',
                                          function: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              if (int.parse(fromDate.text.split('-')[0]) <
                                                      int.parse(toDate.text.split('-')[0]) ||
                                                  int.parse(fromDate.text.split('-')[1]) 
                                                      < int.parse(toDate.text.split('-')[1]))
                                              {
                                                if (storageCubit.size != null &&
                                                    storageCubit.city != null &&
                                                    storageCubit.country != null &&
                                                    storageCubit.character != null) {
                                                  storageCubit
                                                      .submitStorageQuote(
                                                    storage_country_id:
                                                        serviceCubit
                                                            .getCountryKey(
                                                                storageCubit
                                                                    .country),
                                                    storage_country_name:
                                                        storageCubit.country,
                                                    storage_city_id:
                                                        serviceCubit.getCityKey(
                                                            storageCubit.city),
                                                    storage_city_name:
                                                        storageCubit.city,
                                                    radio_storage_service_type_id:
                                                        storageCubit
                                                            .getRadioKey(
                                                                storageCubit
                                                                    .character),
                                                    storage_from_date:
                                                        fromDate.text,
                                                    storage_to_date:
                                                        toDate.text,
                                                    storage_size_dropdownlist_id:
                                                        storageCubit.getSizeKey(
                                                            storageCubit.size),
                                                    storage_org_id: 4,
                                                    is_storage_size: 1,
                                                    storage_desc:
                                                        description.text,
                                                    lang: 1,
                                                    first_name:
                                                        cubit.loginModel.fName,
                                                    email:
                                                        cubit.loginModel.email,
                                                    phone_country_code: cubit
                                                        .loginModel
                                                        .phoneCountryCode,
                                                    mob: cubit.loginModel.mob,
                                                  );
                                                  navigateto(context,
                                                      const PendingBookingScreen());
                                                }
                                              }
                                              else{
                                                final snackBar = SnackBar(
                                                  elevation: 0,
                                                  behavior: SnackBarBehavior.floating,
                                                  backgroundColor: Colors.transparent,
                                                  content: AwesomeSnackbarContent(
                                                    title: 'ُError!',
                                                    message: 'To Date Must be grater than From Date',
                                                    contentType: ContentType.failure,
                                                  ),
                                                );
                                                ScaffoldMessenger.of(context)
                                                  ..hideCurrentSnackBar()
                                                  ..showSnackBar(snackBar);
                                              }
                                            }
                                          },
                                          widt: 150,
                                          color: const Color(0xff000236),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
      listener: (context, state) {
        ind = 0;
        if(state is StorageChangeCityState) {
          storageCubit.size = '';
          storageCubit.character = '';
        }
        if(state is StorageSizeErrorState){
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'ُError!',
              message: 'Please Correct Data!',
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
