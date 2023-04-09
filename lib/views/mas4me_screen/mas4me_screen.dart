// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/views/mas4me_screen/buy_products_screen.dart';
import 'package:masmix/views/pending_screen/pendingbookingscreen.dart';

class MasForMeScreen extends StatelessWidget {
  const MasForMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mas4Me'),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context, homeCubit: homeCubit),
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
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(
                        color: Color(0xff000236),
                      ),//<-- SEE HERE
                    ),
                    child: Column(
                      children: [
                        Lottie.asset('asset/lottie/buy-basket.json'),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Buy Products',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        defaultButton(
                          text: 'GO',
                          function: () {
                            navigateto(context, BuyProductsScreen());
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
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(
                        color: Color(0xff000236),
                      ),//<-- SEE HERE
                    ),
                    child: Column(
                      children: [
                        Lottie.asset('asset/lottie/product-view-.json',
                            height: 175),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'View Products',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        defaultButton(
                          text: 'GO',
                          function: () {
                            navigateto(context, const PendingBookingScreen());
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
