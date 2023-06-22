// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/sea_cubit.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/states/sea_states.dart';
import 'package:masmix/views/pending_screen/pendingbookingscreen.dart';

class SeaServiceScreen extends StatelessWidget {
  TextEditingController serviceDate = TextEditingController();
  TextEditingController pickupDate = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController deliveryAddress = TextEditingController();
  TextEditingController numberofpieces = TextEditingController();
  TextEditingController descriptionofgoods = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController zipCodeO = TextEditingController();
  TextEditingController zipCodeD = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController hsCode = TextEditingController();
  TextEditingController delcaredValue = TextEditingController();
  bool checkbox = false;
  var countryList = [
    'Ivory Coast',
    'Ghana',
    'Turkey',
    'Ethiopia',
    'Australia',
    'India',
    'India',
    'Syria',
    'Egypt',
    'Algeria',
    'India',
    'Kazakhstan',
    'Jordan',
    'India',
    'Turkey',
    'China',
    'Iraq',
  ];
  var cityList = [
    'Cairo',
    'Abidjan',
    'ACCRA',
    'Adana',
    'ADDIS ABABA',
    'Adelaide',
    'Agra',
    'Ahmadabad',
    'Aleppo(Halab)',
    'Alexandria',
    'ALGIERS',
    'Allahabad',
    'ALMATY',
    'AMMAN',
    'Amritsar',
    'ANKARA',
    'Anshan',
    'BAGHDAD',
  ];
  var PortList = [
    'Cairo',
    'Abidjan',
    'ACCRA',
    'Adana',
    'ADDIS ABABA',
    'Adelaide',
    'Agra',
    'Ahmadabad',
    'Aleppo(Halab)',
    'Alexandria',
    'ALGIERS',
    'Allahabad',
    'ALMATY',
    'AMMAN',
    'Amritsar',
    'ANKARA',
    'Anshan',
    'BAGHDAD',
  ];
  var unit1 = [
    'KG',
    'LB',
  ];
  var unit2 = [
    'Inch',
    'CM',
  ];
  var sizeList = [
    'X',
    'Item 21',
    'Item 31',
    'Item 41',
    'Item 51',
    'Item 61',
    'Item 71',
  ];

  SeaServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    var serviceCubit = ServiceCubit.get(context);
    var seaCubit = SeaCubit.get(context);
    return BlocConsumer<SeaCubit,SeaStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sea Service'),
            centerTitle: true,
          ),
          endDrawer: defaultDrawer(context: context),
          body: SingleChildScrollView(
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xff000236),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          defaultField(
                            label: 'Service Date',
                            widget: defaultTextFormField(
                              controll: serviceDate,
                              type: TextInputType.datetime,
                              ontap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(5050),
                                ).then((value) {
                                  serviceDate.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              validat: (value) {
                                if (value!.isEmpty) {
                                  return 'Date must be not empty';
                                }
                                return null;
                              },
                              prefix: Icons.calendar_today,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: defaultField(
                                  label: 'Origin Country :',
                                  widget: defaultDropdownSearch(
                                    items: serviceCubit.countryList,
                                    isSearch: true,
                                    onChang: (value) {
                                      serviceCubit.changeCity(value);
                                      seaCubit.changeCountry(value);
                                      serviceCubit.getAirPortOrPort(
                                        fromCountryID:
                                            serviceCubit.getCountryKey(value),
                                        portType: 1,
                                      );
                                    },
                                    selected: 'Select Coun..',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: defaultField(
                                  label: 'Origin City :',
                                  widget: defaultDropdownSearch(
                                    items: serviceCubit.city,
                                    isSearch: true,
                                    onChang: (value) {
                                      seaCubit.changeCity(value);
                                    },
                                    selected: 'Select City',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: defaultField(
                                  label: 'Origin Zip code :',
                                  widget: defaultTextFormField(
                                    controll: zipCodeO,
                                    type: TextInputType.number,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: defaultField(
                                  label: 'Origin Port :',
                                  widget: defaultDropdownSearch(
                                      items: serviceCubit.airPort_PortList,
                                      isSearch: true,
                                      onChang: print,
                                      selected: 'Select Port'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: defaultField(
                                  label: 'Destination Country :',
                                  widget: defaultDropdownSearch(
                                    items: countryList,
                                    isSearch: true,
                                    onChang: print,
                                    selected: 'Select Coun..',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: defaultField(
                                  label: 'Destination City :',
                                  widget: defaultDropdownSearch(
                                      items: cityList,
                                      isSearch: true,
                                      onChang: print,
                                      selected: 'Select City'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: defaultField(
                                  label: 'Destination Zip code :',
                                  widget: defaultTextFormField(
                                    controll: zipCodeO,
                                    type: TextInputType.number,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: defaultField(
                                  label: 'Destination Port :',
                                  widget: defaultDropdownSearch(
                                      items: PortList,
                                      isSearch: true,
                                      onChang: print,
                                      selected: 'Select Port'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.directions_boat,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Shipment Type',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xff000236),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 20.0,
                        bottom: 20.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              //to do
                              /*Radio<SingingCharacter>(
                            value: SingingCharacter.Parcel,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              _character = value;
                            },
                          ),*/
                              Text('20` Container'),
                            ],
                          ),
                          Row(
                            children: [
                              /*Radio<SingingCharacter>(
                            value: SingingCharacter.Parcel,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              _character = value;
                            },
                          ),*/
                              const Text('40` Container'),
                            ],
                          ),
                          Row(
                            children: [
                              /*Radio<SingingCharacter>(
                            value: SingingCharacter.Parcel,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              _character = value;
                            },
                          ),*/
                              const Text('other container'),
                            ],
                          ),
                          Row(
                            children: [
                              /* Radio<SingingCharacter>(
                            value: SingingCharacter.Parcel,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              _character = value;
                            },
                          ),*/
                              const Text('shipment'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.info,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Service Data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xff000236),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 20.0,
                        bottom: 20.0,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                            ),
                            child: Column(
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
                                      'Origin',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                myDivider(),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: checkbox,
                                  onChanged: (value) {
                                    checkbox = value!;
                                  }),
                              const Text('Pick-UP'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultField(
                                  label: 'Pick-up Date',
                                  widget: defaultTextFormField(
                                    controll: pickupDate,
                                    type: TextInputType.datetime,
                                    ontap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2024-01-01'),
                                      ).then((value) {
                                        serviceDate.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    validat: (value) {
                                      if (value!.isEmpty) {
                                        return 'Date must be not empty';
                                      }
                                      return null;
                                    },
                                    prefix: Icons.calendar_today,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultField(
                                  label: 'Pick-up City :',
                                  widget: defaultDropdownSearch(
                                      items: cityList,
                                      isSearch: true,
                                      onChang: print,
                                      selected: 'Select City'),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: checkbox,
                                  onChanged: (value) {
                                    checkbox = value!;
                                  }),
                              const Text('Use your Address'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                            ),
                            child: defaultField(
                              label: 'Address',
                              widget: defaultTextFormField(
                                  controll: address, type: TextInputType.text),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                            ),
                            child: Column(
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
                                      'Destination',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                myDivider(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              top: 10,
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.check_box,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Sea Port',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: checkbox,
                                  onChanged: (value) {
                                    checkbox = value!;
                                  }),
                              const Text('Delivery'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultField(
                                  label: 'Delivery Date',
                                  widget: defaultTextFormField(
                                    controll: pickupDate,
                                    type: TextInputType.datetime,
                                    ontap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2024-01-01'),
                                      ).then((value) {
                                        serviceDate.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    validat: (value) {
                                      if (value!.isEmpty) {
                                        return 'Date must be not empty';
                                      }
                                      return null;
                                    },
                                    prefix: Icons.calendar_today,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultField(
                                  label: 'Delivery City :',
                                  widget: defaultDropdownSearch(
                                      items: cityList,
                                      isSearch: true,
                                      onChang: print,
                                      selected: 'Select City'),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultField(
                                  label: 'Delivery Address',
                                  widget: defaultTextFormField(
                                      controll: deliveryAddress,
                                      type: TextInputType.text),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.date_range,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Shipment Data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultShipmentData(
                    weight: weight,
                    height: height,
                    length: length,
                    width: width,
                    unit1: unit1,
                    unit2: unit2,
                    wid: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultTextFormField(
                                label: 'HS Code',
                                controll: hsCode,
                                type: TextInputType.number,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: defaultTextFormField(
                                label: 'Delcared Value',
                                controll: delcaredValue,
                                type: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.add,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Additional Services',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color(0xff000236),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: checkbox,
                                  onChanged: (value) {
                                    checkbox = value!;
                                  }),
                              const Text('I Need Storage Service'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Row(
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
                                            lastDate:
                                                DateTime.parse('2024-01-01'),
                                          ).then((value) {
                                            fromDate.text = DateFormat.yMMMd()
                                                .format(value!);
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
                                            lastDate:
                                                DateTime.parse('2024-01-01'),
                                          ).then((value) {
                                            toDate.text = DateFormat.yMMMd()
                                                .format(value!);
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
                              ),
                              const SizedBox(
                                height: 10.0,
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
                                      value: checkbox,
                                      onChanged: (value) {
                                        checkbox = value!;
                                      }),
                                  const Text(
                                    'Another',
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
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
                                      maxline: 5,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'SUBMIT',
                    function: () {
                      navigateto(context, const PendingBookingScreen());
                    },
                    color: const Color(0xff000236),
                  ),
                  const SizedBox(
                    height: 10.0,
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
