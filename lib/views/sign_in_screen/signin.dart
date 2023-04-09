// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/my_account_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/states/login_states.dart';
import 'package:masmix/views/sign_up_screen/first_sign_up.dart';
import 'package:masmix/views/home_screen/home_screen.dart';

class SigninScreen extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appCubit = AppCubit.get(context);
    var loginCubit = LoginCubit.get(context);
    var myAccountCubit = MyAccountCubit.get(context);

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is LoginSuccessState) {
          CacheHelper.saveData(key: 'username', value: username.text).then((value){
            print(value);
            if(value){
              CacheHelper.saveData(key: 'password', value: password.text).then((value) {
                print(value);
                if(value){
                  navigateAndFinish(context, HomeScreen());
                }
              });
            }
          });
        }else if (state is LoginErrorState){
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'ُError!',
              message: 'Incorrect E-mail or Password',
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
      },
      builder: (context,state){

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
                                'Welcome back',
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
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultTextFormField(
                                  controll: username,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'please enter your Username';
                                    }
                                  },
                                  label: 'Username',
                                  prefix: Icons.person,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultTextFormField(
                                  controll: password,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'please enter your Password address';
                                    }
                                  },
                                  label: 'Password',
                                  prefix: Icons.lock,
                                  isPassword: loginCubit.isPassword,
                                  suffix: loginCubit.suffix,
                                  suffixPressed: (){
                                    loginCubit.changePasswordVisibility();
                                  },
                                ),
                                defaultTextButton(
                                  function: () {},
                                  text: 'Forgot password?',
                                ),
                                state is! LoginLoadingState ? defaultButton(
                                  text: 'Log in',
                                  function: () {
                                    if(formKey.currentState!.validate()) {
                                      loginCubit.userLogin(
                                          email: username.text,
                                          password: password.text
                                      );
                                    }
                                  },
                                  color: const Color(0xfff7921c),
                                ) : const Center(child: CircularProgressIndicator(color: Color(0xfff7921c),),),
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
                                        'or continue with',
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
                                    const Text('Don\'t have an account?'),
                                    defaultTextButton(
                                      function: () {
                                        navigateto(context, FirstSignupScreen());
                                      },
                                      text: 'Sign Up',
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
