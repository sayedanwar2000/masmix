// ignore_for_file: non_constant_identifier_names

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/share/function_share/functions.dart';
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

void navigateto(context, Widget Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

void navigateAndFinish(context, Widget Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
    (route) => false);

Widget defaultTextFormField({
  required TextEditingController controll,
  required TextInputType type,
  validat,
  String? label,
  String? hintText,
  IconData? prefix,
  onSubmit,
  onChange,
  ontap,
  bool isEnabled = true,
  bool isPassword = false,
  IconData? suffix,
  suffixPressed,
  maxline = 1,
  dynamic colorBorderFocuse,
  dynamic colorBorder,
}) =>
    TextFormField(
      maxLines: maxline,
      controller: controll,
      keyboardType: type,
      validator: validat,
      obscureText: isPassword,
      enabled: isEnabled,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: ontap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorBorderFocuse ?? const Color(0xfff7921c),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorBorder ?? const Color(0xff000236),
          ),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        prefixIcon: prefix != null
            ? Icon(
                prefix,
              )
            : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

Widget defaultDrawer({
  required context,
  required homeCubit,
}) =>
    Drawer(
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
              navigateAndFinish(context, const WelcomeScreen());
            },
          ),
        ],
      ),
    );

Widget defaultButton({
  String? text,
  required function,
  required Color color,
  colorText,
  wid,
  double? widt,
}) =>
    Container(
      width: widt ?? double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: function,
        child: wid ?? Text(
          text??'',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorText?? Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required function,
  required String text,
  TextStyle? textstyle,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        //style: textstyle,
      ),
    );

Widget myDivider({
  double? Width,
}) =>
    Container(
      width: Width ?? double.infinity,
      height: 2.0,
      color: Colors.grey[300],
    );

Widget defaultDropdownSearch({
  required var items,
  required onChang,
  selected,
  bool isSearch = false,
  double height = 350,
  dynamic colorBorderFocuse,
  dynamic colorBorder,
  validat,
}) =>
    DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: DropdownSearch<String>(
        popupProps: PopupProps.menu(
          constraints: BoxConstraints(maxHeight: height,),
          showSelectedItems: true,
          showSearchBox: isSearch,
        ),
        items: items,
        onChanged: onChang,
        validator: validat,
        selectedItem: selected??items[0],
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorderFocuse ?? const Color(0xfff7921c),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorBorder ?? const Color(0xff000236),
              ),
            ),
          ),
        ),
      ),
    );

Widget defaultDropdownButton({
  required String dropdownvalue,
  required var items,
}) =>
    DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 7,
          right: 7,
          top: 7,
          bottom: 7,
        ),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(10),
          underline: Container(),
          // Initial Value
          value: dropdownvalue,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: items.map<DropdownMenuItem<String>>((String items) {
            return DropdownMenuItem<String>(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            dropdownvalue = newValue!;
          },
        ),
      ),
    );

Widget defaultField({
  required String label,
  required Widget widget,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        const SizedBox(
          height: 15.0,
        ),
        widget,
      ],
    );

Widget defaultshipmentData({
  required TextEditingController weight,
  required TextEditingController height,
  required TextEditingController length,
  required TextEditingController width,
  required var unit1,
  required var unit2,
  Widget? wid,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: const Color(0xff000236),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: defaultTextFormField(
                      controll: weight,
                      type: TextInputType.number,
                      label: 'Weight'),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: defaultDropdownSearch(
                      items: unit1, height: 120.0, onChang: print, selected: 'select Unit'),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: defaultTextFormField(
                      controll: height,
                      type: TextInputType.number,
                      label: 'Height'),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: defaultTextFormField(
                      controll: length,
                      type: TextInputType.number,
                      label: 'Length'),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: defaultTextFormField(
                      controll: width,
                      type: TextInputType.number,
                      label: 'Width'),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: defaultDropdownSearch(
                    items: unit2,
                    height: 120,
                    onChang: print, selected: 'select Unit',
                  ),
                ),
              ],
            ),
            wid ??
            const SizedBox(
              height: 20.0,
            ),
            defaultButton(
              text: 'ADD Package',
              function: () {},
              color: const Color(0xff000236),
              colorText: Colors.white,
            ),
          ],
        ),
      ),
    );

Widget isEmpty({
  required String name,
}) => Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.menu,
        size: 100,
        color: Colors.grey,
      ),
      Text(
        'You don\'t have $name yet',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.grey,
        ),
      ),
    ],
  ),
);
