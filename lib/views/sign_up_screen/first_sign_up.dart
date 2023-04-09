// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/signup_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/states/signup_states.dart';
import 'package:masmix/views/sign_in_screen/signin.dart';
import 'package:masmix/views/sign_up_screen/second_sign_up.dart';
import 'package:masmix/controller/share/function_share/functions.dart';

class FirstSignupScreen extends StatelessWidget {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // List of items in our dropdown menu

  FirstSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var signupCubit = SignupCubit.get(context);
        var appCubit = AppCubit.get(context);
        signupCubit.countryCode = signupCubit.countryCode ?? appCubit.countryCodeList[0];
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Container(
              child: Center(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xfff7921c),
                      ),
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xfff7921c),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              )),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                            ),
                            child: Center(
                              child: Text(
                                'Create an Account.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            bottom: 40.0,
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: defaultTextFormField(
                                        controll: firstName,
                                        type: TextInputType.text,
                                        validat: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'please enter your first name address';
                                          }
                                        },
                                        label: 'First Name',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: defaultTextFormField(
                                        controll: lastName,
                                        type: TextInputType.text,
                                        validat: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'please enter your last name address';
                                          }
                                        },
                                        label: 'Last Name',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultTextFormField(
                                  controll: email,
                                  type: TextInputType.emailAddress,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'please enter your Email address';
                                    }
                                  },
                                  label: 'E-mail',
                                  prefix: Icons.email,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: defaultDropdownSearch(
                                        items: appCubit.countryCodeList,
                                        onChang: (value) {
                                          signupCubit.changeCountryCode(value);
                                        },
                                        isSearch: true,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: defaultTextFormField(
                                        controll: phone,
                                        type: TextInputType.phone,
                                        validat: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'please enter your phone address';
                                          }
                                        },
                                        label: 'Phone',
                                        prefix: Icons.phone,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: signupCubit.checkbox,
                                      activeColor: const Color(0xfff7921c),
                                      onChanged: (value) {
                                        signupCubit.changeCheckbox(value!);
                                      },
                                    ),
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
                                              child: const Text(
                                                'Privacy Policy',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                  launchTo: 2,
                                                );
                                              },
                                              child: const Text(
                                                'Terms & Conditions',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                defaultButton(
                                  text: 'Register',
                                  function: () {
                                    if (formKey.currentState!.validate() &&
                                        signupCubit.checkbox) {
                                      signupCubit.firstName = firstName;
                                      signupCubit.lastName = lastName;
                                      signupCubit.phone = phone;
                                      signupCubit.email = email;
                                      navigateto(context, SecondSignupScreen());
                                    }
                                  },
                                  color: const Color(0xfff7921c),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: myDivider()),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: 5,
                                        end: 5,
                                      ),
                                      child: Text(
                                        'or countinue with',
                                      ),
                                    ),
                                    Expanded(
                                      child: myDivider(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: InkWell(
                                        child: Image.asset(
                                          'asset/images/google.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    InkWell(
                                      child: Image.asset(
                                        'asset/images/apple.png',
                                        width: 33,
                                        height: 33,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already have an account?'),
                                    defaultTextButton(
                                      function: () {
                                        navigateto(context, SigninScreen());
                                      },
                                      text: 'Log in',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
