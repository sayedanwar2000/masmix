import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/login_cubit.dart';
import 'package:masmix/controller/cubits/mas4me_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/network/local/cache_helper/cache.dart';
import 'package:masmix/views/calculate_screen/calculate_screen.dart';
import 'package:masmix/views/contact_screen/contact_screen.dart';
import 'package:masmix/views/drawer_header/drawer_header.dart';
import 'package:masmix/views/easy2ship_screen/easy2ship_settings_screen.dart';
import 'package:masmix/views/home_screen/home_screen.dart';
import 'package:masmix/views/how_to_use_screen/how_to_use_screen.dart';
import 'package:masmix/views/my_account_screen/my_account_screen.dart';
import 'package:masmix/views/pending_screen/pendingbookingscreen.dart';
import 'package:masmix/views/referral_code_screen/referral_code_screen.dart';
import 'package:masmix/views/welcome_screen/welcome.dart';
import 'package:masmix/controller/share/function_share/functions.dart';


Widget defaultDrawer({
  required context,
}) {
  var homeCubit = HomeCubit.get(context);
  var mas4meCubit = Mas4meCubit.get(context);
  var id = LoginCubit.get(context).loginModel.id;
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        MyDrawerHeader(),
        ListTile(
          leading: const Icon(Icons.person_outline_outlined),
          title: const Text('Profile'),
          onTap: () {
            navigateto(context, MyAccountScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.code),
          title: const Text('Referral code'),
          onTap: () {
            navigateto(context, ReferralCodeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.calculate_outlined),
          title: const Text('Easy2Ship Cost Calculator'),
          onTap: () {
            navigateto(context, CalculateScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.warehouse_outlined),
          title: const Text('My Storage'),
          onTap: () {
            homeCubit.changePageNumber(4);
            navigateto(context, HomeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.dataset_outlined),
          title: const Text('My Quotation'),
          onTap: () {
            homeCubit.changePageNumber(1);
            navigateto(context, HomeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.storage_outlined),
          title: const Text('My Packages'),
          onTap: () {
            homeCubit.changePageNumber(3);
            navigateto(context, HomeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.inventory_sharp),
          title: const Text('Invoices'),
          onTap: () {
            homeCubit.changePageNumber(0);
            navigateto(context, HomeScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.payments_outlined),
          title: const Text('Pending'),
          onTap: () {
            mas4meCubit.getMas4Me(currUserId: id);
            navigateto(context, const PendingBookingScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.data_usage_outlined),
          title: const Text('How To Use'),
          onTap: () {
            navigateto(context, const HowToUseScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.quiz_outlined),
          title: const Text('FAQ'),
          onTap: () {
            functionsShare.launchInBrowser(launchTo: 3);
          },
        ),
        ListTile(
          leading: const Icon(Icons.support_agent),
          title: const Text('Contact'),
          onTap: () {
            navigateto(context, ContactScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('EASY2SHIP Settings'),
          onTap: () {
            navigateto(context, EASY2SHIPSettingsScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text('Log out'),
          onTap: () {
            CacheHelper.removeData(key: 'username');
            CacheHelper.removeData(key: 'userID');
            CacheHelper.removeData(key: 'password');
            navigateAndFinish(context, ShowScreen());
          },
        ),
      ],
    ),
  );
}