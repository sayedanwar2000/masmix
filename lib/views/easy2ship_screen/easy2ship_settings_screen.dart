// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:flag/flag.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/style/colors.dart';

class EASY2SHIPSettingsScreen extends StatelessWidget {
  bool value = true;

  EASY2SHIPSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EASY2SHIP Settings'),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: defaultColorNavyBlue,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.present_to_all,
                            size: 150,
                            color: defaultColorNavyBlue,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Switch(
                                value: value,
                                activeColor: defaultColorNavyBlue,
                                onChanged: (va) {
                                  value = va;
                                },
                              ),
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  'Remove Shoe Box',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: defaultColorNavyBlue,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.hide_image,
                            size: 150,
                            color: defaultColorNavyBlue,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Switch(
                                value: value,
                                activeColor: defaultColorNavyBlue,
                                onChanged: (va) {
                                  value = va;
                                },
                              ),
                              const Text('No images'),
                              const SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
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
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: defaultColorNavyBlue,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 150,
                            color: defaultColorNavyBlue,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Switch(
                                value: value,
                                activeColor: defaultColorNavyBlue,
                                onChanged: (va) {
                                  value = va;
                                },
                              ),
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  'Get Notifications',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: defaultColorNavyBlue,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            size: 150,
                            color: defaultColorNavyBlue,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Switch(
                                value: value,
                                activeColor: defaultColorNavyBlue,
                                onChanged: (va) {
                                  value = va;
                                },
                              ),
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  'Available Wallet Credit',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: defaultColorNavyBlue,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flag.fromCode(
                                  FlagsCode.US,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Text(
                                  'MY US SHIPPING ADDRESS',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Address :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    '601 Cornell DRIVE, UNIT G6 , #165 WILMINGTON,DE 19801,USA',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: defaultColorNavyBlue,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flag.fromCode(
                                  FlagsCode.SA,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Text(
                                  'MY KSA SHIPPING ADDRESS',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Address :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    'طريق صلاح الدين الايوبي - الصفا - الرياض',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Address :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    'مجد الدين - حي النهضة - الدمام',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Address :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    'طريق الملك فيصل - الكورنيش الجنوبي - جدة',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: defaultColorNavyBlue,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flag.fromCode(
                                  FlagsCode.EG,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Text(
                                  'MY ADDRESS',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const SizedBox(
                              width: 240,
                              child: Text(
                                'Momen Mohamed',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const SizedBox(
                              width: 240,
                              child: Text(
                                'lyxurz@gmail.com',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const SizedBox(
                              width: 240,
                              child: Text(
                                'wqdqwdqwdqwdqwdqwdqwd',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const SizedBox(
                              width: 240,
                              child: Text(
                                'Mexico City',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const SizedBox(
                              width: 240,
                              child: Text(
                                'Egypt',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const SizedBox(
                              width: 240,
                              child: Text(
                                '5501167379',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'Update',
                    function: () {},
                    color: defaultColorNavyBlue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
