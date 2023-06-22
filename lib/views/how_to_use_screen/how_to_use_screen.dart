import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/function_share/functions.dart';

class HowToUseScreen extends StatelessWidget {
  const HowToUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('How To Use'),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xff000236),
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Lottie.asset('asset/lottie/air.json'),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: 'Air Services',
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath: 'https://masmix.com/Air_Services');
                            },
                            color: const Color(0xff000236),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xff000236),
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Lottie.asset('asset/lottie/land.json'),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: 'Land Services',
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath: 'https://masmix.com/land_Services');
                            },
                            color: const Color(0xff000236),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xff000236),
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Lottie.asset(
                            'asset/lottie/shipp.json',
                            height: 170.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: 'Sea Services',
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath: 'https://masmix.com/sea_Services');
                            },
                            color: const Color(0xff000236),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xff000236),
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Lottie.asset(
                            'asset/lottie/easy.json',
                            height: 170,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: 'Easy2Ship Services',
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath:
                                      'https://masmix.com/consalidate_Services');
                            },
                            color: const Color(0xff000236),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xff000236),
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Lottie.asset(
                              'asset/lottie/packaging-for-delivery.json',
                              height: 170,
                              width: 100),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: 'Mas4me Services',
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath:
                                      'https://masmix.com/mas4me_Services',
                              );
                            },
                            color: const Color(0xff000236),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xff000236),
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      child: Column(
                        children: [
                          Lottie.asset(
                            'asset/lottie/storage.json',
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          defaultButton(
                            text: 'Storage Services',
                            function: () {
                              functionsShare.launchInBrowser(
                                  urlPath:
                                      'https://masmix.com/wharehouse_Services');
                            },
                            color: const Color(0xff000236),
                          ),
                        ],
                      ),
                    ),
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
