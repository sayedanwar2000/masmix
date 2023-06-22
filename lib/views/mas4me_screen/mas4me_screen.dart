// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/card_mas4me.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/views/submit_mas4me/submit_mas4me_screen.dart';
import 'package:masmix/views/pending_screen/pendingbookingscreen.dart';

class MasForMeScreen extends StatelessWidget {
  const MasForMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mas4Me'),
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
              mas4MeCard(
                context: context,
                lottie: 'asset/lottie/buy-basket.json',
                title: 'Buy Products',
                goPage: SubmitMas4MeScreen(),
              ),
              const SizedBox(
                width: 5.0,
              ),
              mas4MeCard(
                context: context,
                lottie: 'asset/lottie/product-view-.json',
                title: 'View Products',
                goPage: const PendingBookingScreen(),
                height: 175.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
