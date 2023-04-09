// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';

class CalculateScreen extends StatelessWidget {
  TextEditingController zipCode = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
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
  var unit1 = [
    'KG',
    'LB',
  ];
  var unit2 = [
    'Inch',
    'CM',
  ];

  CalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context, homeCubit: homeCubit),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: defaultField(
                          label: 'Destination Country :',
                          widget: defaultDropdownSearch(
                              items: countryList,
                              isSearch: true,
                              onChang: print, selected: 'Select Country'),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: defaultField(
                          label: 'Destination Zip code :',
                          widget: defaultTextFormField(
                            controll: zipCode,
                            type: TextInputType.text,
                          ),
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
              defaultshipmentData(
                weight: weight,
                height: height,
                length: length,
                width: width,
                unit1: unit1,
                unit2: unit2,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: defaultButton(
                  text: 'Calculator',
                  widt: 120.0,
                  function: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: SizedBox(
                              height: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: const Color(0xff000236),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Text(
                                                  'Courier Name :',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text('DHL'),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  'Service :',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text('Easy2Ship'),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  'Charged Weight :',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text('67'),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  'Cost :',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text('864.795'),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              children: const [
                                                Text(
                                                  'Currency :',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                Text('USD'),
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
                                      text: 'Back',
                                      function: () {
                                        Navigator.of(context).pop();
                                      },
                                      color: const Color(0xff000236),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(0.0),
                          );
                        });
                  },
                  color: const Color(0xff000236),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
