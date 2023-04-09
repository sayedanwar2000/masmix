import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masmix/controller/cubits/app_cubit.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/my_account_cubit.dart';
import 'package:masmix/controller/cubits/signup_cubit.dart';
import 'package:masmix/controller/cubits/storage_cubit.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/controller/share/network/remote/dio_helper.dart';
import 'package:masmix/controller/states/app_states.dart';
import 'package:masmix/views/splash_screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            ..getIPAddress(),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => MyAccountCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => StorageCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) { },
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                subtitle1: TextStyle(
                  color: Color(0xff000236),
                ),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                focusColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xfff7921c),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff000236),
                  ),
                ),
                prefixIconColor: Color(0xff000236),
                suffixIconColor: Color(0xff000236),
                labelStyle: TextStyle(
                  color: Color(0xff000236),
                ),
              ),
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Color(0xff000236), //<-- SEE HERE
              ),
              appBarTheme: const AppBarTheme(
                foregroundColor: Colors.black,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Color(0xff000236),
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
