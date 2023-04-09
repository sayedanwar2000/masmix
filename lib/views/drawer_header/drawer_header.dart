import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/states/login_states.dart';
import 'package:masmix/views/home_screen/home_screen.dart';

class MyDrawerHeader extends StatelessWidget {
  String name = '';
  String phone = '';
  String email = '';
  String code = '';

  MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    email = cubit.loginModel.email.toString();
    name = '${cubit.loginModel.fName} ${cubit.loginModel.lName}';
    phone = '+${cubit.loginModel.phoneCountryCode} ${cubit.loginModel.mob}';
    code = cubit.loginModel.userCountryCode.toString();
    return Container(
      color: const Color(0xff000236),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          right: 20.0,
          left: 20.0,
          bottom: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    navigateto(context, HomeScreen());
                  },
                  icon: const Icon(
                    Icons.home,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    navigateto(context, HomeScreen());
                  },
                  icon: const Icon(
                    Icons.language,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              '$name\n'
              '$phone\n'
              '$email\n',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
