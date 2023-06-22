import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/views/submit_mas4me/submit_mas4me_screen.dart';

Widget mas4MeCard({
  required context,
  required String lottie,
  required String title,
  required goPage,
  height,
}) =>
    Expanded(
      child: SizedBox(
        height: 330,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: defaultColorNavyBlue,
            ), //<-- SEE HERE
          ),
          child: Column(
            children: [
              Lottie.asset(
                lottie,
                height: height,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              defaultButton(
                text: 'GO',
                function: () {
                  navigateto(context, goPage);
                },
                color: defaultColorNavyBlue,
                widt: 100,
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
