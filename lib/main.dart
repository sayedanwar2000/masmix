// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/air_cubit.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/land_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/mas4me_cubit.dart';
import 'package:masmix/controller/cubits/my_account_cubit.dart';
import 'package:masmix/controller/cubits/sea_cubit.dart';
import 'package:masmix/controller/cubits/service_cubit.dart';
import 'package:masmix/controller/cubits/signup_cubit.dart';
import 'package:masmix/controller/cubits/storage_cubit.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/controller/states/app_states.dart';
import 'package:masmix/views/splash_screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  String userid = CacheHelper.getData(key: 'userID') ?? '';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SignupCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..getCurrencys()
            ..getLanguage()
            ..getAccountType()
            ..getCountry()
            ..getCountryCode()
            ..getIPAddress()
            ..changeCity(),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => MyAccountCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              StorageCubit()..getRadioButton(fromCountryID: 30, toCityID: 85),
        ),
        BlocProvider(
          create: (BuildContext context) => ServiceCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AirCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LandCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SeaCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => Mas4meCubit()
          ..getMas4Me(currUserId: userid),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: defaultColorWhite,
              textTheme: TextTheme(
                titleMedium: TextStyle(
                  color: defaultColorNavyBlue,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                focusColor: defaultColorWhite,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: defaultColorOrange,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: defaultColorNavyBlue,
                  ),
                ),
                prefixIconColor: defaultColorNavyBlue,
                suffixIconColor: defaultColorNavyBlue,
                labelStyle: TextStyle(
                  color: defaultColorNavyBlue,
                ),
              ),
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: defaultColorNavyBlue, //<-- SEE HERE
              ),
              appBarTheme: AppBarTheme(
                foregroundColor: defaultColorBlack,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: defaultColorWhite,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: defaultColorWhite,
                iconTheme: IconThemeData(
                  color: defaultColorNavyBlue,
                ),
                elevation: 0.0,
              ),
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
