import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/cubits/mas4me_cubit.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/states/service_states.dart';
import 'package:masmix/views/air_service_screen/air_service_screen.dart';
import 'package:masmix/views/land_service_screen/land_service_screen.dart';
import 'package:masmix/views/mas4me_screen/mas4me_screen.dart';
import 'package:masmix/views/sea_service_screen/sea_service_screen.dart';
import 'package:masmix/views/easy2ship_screen/easy2ship_screen.dart';
import 'package:masmix/views/storage_screen/storage_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var serviceCubit = ServiceCubit.get(context);
    var masCubit = Mas4meCubit.get(context);
    return BlocConsumer<ServiceCubit,ServiceStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 30.0,
              bottom: 30.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: const Color(0xffffbd50),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xfff7921c),
                          ),
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Column(
                          children: [
                            Lottie.asset('asset/lottie/air.json'),
                            const Text(
                              'AIR SERVICE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'If you want to transport your shipments by air'
                                ' from the Kingdom of Saudi Arabia or the United States of America '
                                'to any destination',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            defaultButton(
                              text: 'GO',
                              function: () {
                                serviceCubit.getCountryAndCity(serviceID: 1);
                                if (state is ServiceCountrySuccessState) {
                                  navigateto(context, AirServiceScreen());
                                }

                              },
                              color: const Color(0xfff7921c),
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
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: const Color(0xffffbd50),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xfff7921c),
                          ),
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Column(
                          children: [
                            Lottie.asset('asset/lottie/land.json'),
                            const Text(
                              'LAND SERVICE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'If you want to transport your shipments by '
                                'land in the Kingdom of Saudi Arabia or '
                                'the United States of America',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            defaultButton(
                              text: 'GO',
                              function: () {
                                serviceCubit.getCountryAndCity(serviceID: 2);
                                if (state is ServiceCountrySuccessState) {
                                  navigateto(context, LandServiceScreen());
                                }
                              },
                              color: const Color(0xfff7921c),
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
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: const Color(0xffffbd50),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xfff7921c),
                          ),
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Column(
                          children: [
                            Lottie.asset('asset/lottie/ship.json'),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              'SEA SERVICE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'If you want to transfer your shipments by sea from the'
                                ' Kingdom of Saudi Arabia or the United States of '
                                'America to any destination',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            defaultButton(
                              text: 'GO',
                              function: () {
                                serviceCubit.getCountryAndCity(serviceID: 3);
                                if (state is ServiceCountrySuccessState) {
                                  navigateto(context, SeaServiceScreen());
                                }

                              },
                              color: const Color(0xfff7921c),
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
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: const Color(0xffffbd50),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xfff7921c),
                          ),
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Column(
                          children: [
                            Lottie.asset('asset/lottie/easy.json'),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              'EASY2SHIP',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Through this service, you can combine and consolidate an unlimited number of your'
                                ' shipments purchased from the United States of America'
                                ' through us and send them to you at your address registered with us in any country',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            defaultButton(
                              text: 'GO',
                              function: () {
                                navigateto(context, EasyTowShipScreen());
                              },
                              color: const Color(0xfff7921c),
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
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: const Color(0xffffbd50),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xfff7921c),
                          ),
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Column(
                          children: [
                            Lottie.asset(
                                'asset/lottie/packaging-for-delivery.json'),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              'MAS4ME',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Through this service, you can send the information of any '
                                'products you want to buy from the largest international brands to us so that we can buy'
                                ' them for you from within the United States of America,'
                                ' collect them and send them to you at your registered address in any country',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            defaultButton(
                              text: 'GO',
                              function: () {
                                navigateto(context, const MasForMeScreen());
                              },
                              color: const Color(0xfff7921c),
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
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: const Color(0xffffbd50),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xfff7921c),
                          ),
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Column(
                          children: [
                            Lottie.asset('asset/lottie/storage.json'),
                            const Text(
                              'STORAGE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'If you want to rent different storage spaces within the Kingdom of '
                                'Saudi Arabia or the United States of America, '
                                'here is the right place to find different storage solutions to suit your needs',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            defaultButton(
                              text: 'GO',
                              function: () {
                                serviceCubit.getCountryAndCity(serviceID: 4);
                                if (state is ServiceCountrySuccessState) {
                                  navigateto(context, StorageScreen());
                                }
                              },
                              color: const Color(0xfff7921c),
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
          );
        },
        listener: (context, state) {
          print(state);
        },);
  }
}
