// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/function_share/functions.dart';
import 'package:masmix/controller/share/style/colors.dart';

class ContactScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController email = TextEditingController();
  bool checkbox = false;

  ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColorNavyBlue,
      appBar: AppBar(
        backgroundColor: defaultColorNavyBlue,
        elevation: 0.0,
        iconTheme: IconThemeData(color: defaultColorWhite),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultColorNavyBlue,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      endDrawer: defaultDrawer(context: context),
      body: SingleChildScrollView(
        child: Container(
          color: defaultColorNavyBlue,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 15.0,
                  left: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Details',
                      style: TextStyle(
                        color: defaultColorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'For registration questions please get in touch using the contact details below.',
                      style: TextStyle(
                        color: defaultColorWhite,
                      ),
                    ),
                    Text(
                      'For any questions use the form.',
                      style: TextStyle(
                        color: defaultColorWhite,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(40),
                      topStart: Radius.circular(40),
                      bottomEnd: Radius.circular(40),
                      bottomStart: Radius.circular(40),
                    ),
                    color: defaultColorWhite,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        defaultTextFormField(
                          controll: name,
                          type: TextInputType.text,
                          prefix: Icons.person_outline_outlined,
                          label: 'Name',
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          controll: email,
                          type: TextInputType.emailAddress,
                          prefix: Icons.alternate_email_outlined,
                          label: 'E-mail',
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormField(
                          controll: message,
                          type: TextInputType.text,
                          prefix: Icons.email_outlined,
                          label: 'Message',
                          maxline: 5,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: checkbox,
                                onChanged: (value) {
                                  checkbox = value!;
                                }),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'i have read Mas MIX ',
                                    ),
                                    InkWell(
                                      onTap: () {
                                        functionsShare.launchInBrowser(
                                            launchTo: 1);
                                      },
                                      child: Text(
                                        'Privacy Policy',
                                        style: TextStyle(
                                            color: defaultColorBlue,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'and ',
                                    ),
                                    InkWell(
                                      onTap: () {
                                        functionsShare.launchInBrowser(
                                            launchTo: 2);
                                      },
                                      child: Text(
                                        'Terms & Conditions',
                                        style: TextStyle(
                                            color: defaultColorBlue,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                          text: 'Submit',
                          function: () {},
                          color: defaultColorNavyBlue,
                        ),
                        const SizedBox(
                          height: 40.0,
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
