// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';

import 'easy2ship_details_screen.dart';

class EasyTowShipScreen extends StatelessWidget {
  var button = <String>[
    'Show Payment',
    'cancel',
    'Cancel Preparation',
    'Show Payment',
    'cancel',
    'Cancel Preparation',
    'Show Payment',
    'cancel',
    'Cancel Preparation',
    'Show Payment',
    'cancel',
    'Cancel Preparation',
    'Show Payment',
    'cancel',
    'Cancel Preparation',
    'Show Payment',
    'cancel',
    'Cancel Preparation',
    'Show Payment',
    'cancel',
    'Cancel Preparation',
    'Show Payment',
    'cancel',
    'Cancel Preparation',
    'Show Payment',
    'cancel',
    'Cancel Preparation',
  ];
  final List<Map<String, dynamic>> _items = List.generate(
      20,
      (index) => {
            'id': index,
            'title': 'Approve payment pending $index',
            'OrderID': index,
            'description':
                'This is the description of the item $index. There is nothing important here. In fact, it is meaningless.',
          });

  EasyTowShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy2Ship'),
        centerTitle: true,
        leading: Image.asset(
          'asset/images/logo-removebg.png',
        ),
      ),
      endDrawer: defaultDrawer(context: context, homeCubit: homeCubit),
      body: true
          ?SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xff000236),
              ),
            ),
            child: Column(
              children: [
                ExpansionPanelList.radio(
                  children: _items
                      .map(
                        (e) => ExpansionPanelRadio(
                      value: e['id'],
                      headerBuilder:
                          (BuildContext context, bool isExpanded) =>
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 10.0,
                              right: 10.0,
                              left: 20.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const Text('ID : '),
                                    Text(e['OrderID'].toString()),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text('Status : '),
                                    Text(
                                      e['title'].toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultButton(
                                  text: button[e['id']],
                                  widt: 200,
                                  function: () {
                                    if (button[e['id']] == 'Show Payment') {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: SizedBox(
                                                height: 555,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: const [
                                                        Text('Order ID :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text('Courier Name :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text('Country Name :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text('Service :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text('Delivery Time :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text('Tracking :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text(
                                                            'Charged Weight :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text(
                                                            'Shippment Cost :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text('Insurance :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text('Extra Service :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text(
                                                            'Dangerous Goods :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text('Total Price :'),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text('sayed'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    defaultButton(
                                                      text: 'Back',
                                                      widt: 100,
                                                      function: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      color: const Color(0xff000236),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  },
                                  color: const Color(0xff000236),
                                ),
                              ],
                            ),
                          ),
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
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
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  width: 2.0,
                                  height: 60,
                                  color: const Color(0xff000236),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: const [
                                        Text('Desc : '),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text('canada package 1'),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      children: const [
                                        Text('Barcode : '),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text('1234567890'),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                defaultButton(
                                  text: 'Photos',
                                  widt: 100,
                                  function: () {
                                    navigateto(context, const EasyTwoShipDetailsScreen());
                                  },
                                  color: const Color(0xff000236),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      )
          : isEmpty(name: 'packages'),
    );
  }
}
