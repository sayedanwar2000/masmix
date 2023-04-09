// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/function_share/functions.dart';

class ContactScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController email = TextEditingController();
  bool checkbox = false;

  ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      backgroundColor: const Color(0xff000236),
      appBar: AppBar(
        backgroundColor: const Color(0xff000236),
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff000236),
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      endDrawer: defaultDrawer(context: context, homeCubit: homeCubit),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff000236),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 15.0,
                  left: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Contact Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'For registration questions please get in touch using the contact details below.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'For any questions use the form.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(40),
                        topStart: Radius.circular(40),
                        bottomEnd: Radius.circular(40),
                        bottomStart: Radius.circular(40),
                      ),
                      color: Colors.white),
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
                                        functionsShare.launchInBrowser(launchTo: 1);
                                      },
                                      child: const Text(
                                        'Privacy Policy',
                                        style: TextStyle(
                                            color: Colors.blue,
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
                                        functionsShare.launchInBrowser(launchTo: 2);
                                      },
                                      child: const Text(
                                        'Terms & Conditions',
                                        style: TextStyle(
                                            color: Colors.blue,
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
                          color: const Color(0xff000236),
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
