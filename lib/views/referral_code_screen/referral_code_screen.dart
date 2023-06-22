// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/views/referral_code_screen/view_people_screen.dart';

class ReferralCodeScreen extends StatelessWidget {
  String referral = 'sayed';

  ReferralCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral Code'),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 10.0,
          end: 10.0,
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 330,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                    ),
                    child: Column(
                      children: [
                        Lottie.asset('asset/lottie/referral.json'),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Get Code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        defaultButton(
                          text: 'GO',
                          function: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Generate Referral Code'),
                                    content: SizedBox(
                                      height: 200,
                                      child: Column(
                                        children: [
                                          const Text('sayed'),
                                          const SizedBox(
                                            height: 40.0,
                                          ),
                                          defaultButton(
                                            text: 'Create',
                                            function: () {},
                                            color: const Color(0xff000236),
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
                                  );
                                });
                          },
                          color: const Color(0xff000236),
                          widt: 100,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 330,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                    ),
                    child: Column(
                      children: [
                        Lottie.asset('asset/lottie/people.json', height: 175),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'View People',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        defaultButton(
                          text: 'GO',
                          function: () {
                            navigateto(context, ViewPeopleScreen());
                          },
                          color: const Color(0xff000236),
                          widt: 100,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
