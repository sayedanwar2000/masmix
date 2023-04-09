// ignore_for_file: must_be_immutable, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/storage_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/states/storage_states.dart';
import 'package:masmix/views/pending_screen/pendingbookingscreen.dart';



class StorageScreen extends StatelessWidget {
  StorageScreen({super.key});

  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController description = TextEditingController();
  var sizeList = [
    'X',
    'Item 21',
    'Item 31',
    'Item 41',
    'Item 51',
    'Item 61',
    'Item 71',
  ];

  @override
  Widget build(BuildContext context) {
    var appCubit = AppCubit.get(context);
    var storageCubit = StorageCubit.get(context);
    var homeCubit = HomeCubit.get(context);
    return BlocConsumer<StorageCubit, StorageStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Storage'),
            centerTitle: true,
            leading: Image.asset(
              'asset/images/logo-removebg.png',
            ),
          ),
          endDrawer: defaultDrawer(context: context, homeCubit: homeCubit),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xff000236),
                      ),
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
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
                                    items: appCubit.countryList,
                                    onChang: (value){
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
                                    items: ['sdsd'],
                                    onChang: (value){
                                      storageCubit.changeCity(value);
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
                                      lastDate: DateTime.parse('2024-01-01'),
                                    ).then((value) {
                                      fromDate.text =
                                          DateFormat.yMMMd().format(value!);
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
                                      lastDate: DateTime.parse('2024-01-01'),
                                    ).then((value) {
                                      toDate.text =
                                          DateFormat.yMMMd().format(value!);
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
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio<SingingCharacter>(
                                        value: SingingCharacter.Parcel,
                                        groupValue: storageCubit.character,
                                        onChanged: (SingingCharacter? value) {
                                          storageCubit.changeCharacter(value);
                                        },
                                      ),
                                      const Text('Parcel'),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Radio<SingingCharacter>(
                                        value: SingingCharacter.OpenSpace,
                                        groupValue: storageCubit.character,
                                        onChanged: (SingingCharacter? value) {
                                          storageCubit.changeCharacter(value);
                                        },
                                      ),
                                      const Text('Open Space'),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio<SingingCharacter>(
                                        value: SingingCharacter.Documents,
                                        groupValue: storageCubit.character,
                                        onChanged: (SingingCharacter? value) {
                                          print(storageCubit.character.toString());
                                          storageCubit.changeCharacter(value);
                                          print(storageCubit.character);
                                        },
                                      ),
                                      const Text('Documents'),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Radio<SingingCharacter>(
                                        value: SingingCharacter.Pallet,
                                        groupValue: storageCubit.character,
                                        onChanged: (SingingCharacter? value) {
                                          storageCubit.changeCharacter(value);
                                        },
                                      ),
                                      const Text('Pallet'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                            ),
                            child: defaultField(
                              label: 'Size',
                              widget: defaultDropdownSearch(
                                items: sizeList,
                                onChang: print,
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
                          if(storageCubit.checkbox)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              bottom: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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

                                    navigateto(
                                        context, const PendingBookingScreen());
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
        );
      },
      listener: (context, state) {},
    );
  }
}
