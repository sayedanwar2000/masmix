// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';

class BuyProductsScreen extends StatelessWidget {
  TextEditingController SiteName = TextEditingController();
  TextEditingController SiteURL = TextEditingController();
  TextEditingController ItemName = TextEditingController();
  TextEditingController ItemURL = TextEditingController();
  TextEditingController Options = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController Quantity = TextEditingController();

  BuyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buy Products',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Image.asset(
          'asset/images/logo.png',
        ),
      ),
      endDrawer: defaultDrawer(context: context, homeCubit: homeCubit),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'WHERE WOULD YOU LIKE US TO PURCHASE FROM ?',
                style: TextStyle(fontSize: 13.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              myDivider(),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: defaultTextFormField(
                      controll: SiteName,
                      type: TextInputType.text,
                      label: 'Site Name',
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: defaultTextFormField(
                      controll: SiteURL,
                      type: TextInputType.text,
                      label: 'Site URL',
                      prefix: Icons.link,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                'PLEASE LET US KNOW WHAT ITEM(S) YOU\'D LIKE US TO PURCHASE',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              myDivider(),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: defaultTextFormField(
                      controll: ItemName,
                      type: TextInputType.text,
                      label: 'Item Name',
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: defaultTextFormField(
                      controll: ItemURL,
                      type: TextInputType.text,
                      label: 'Item URL',
                      prefix: Icons.link,
                    ),
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
                      controll: Options,
                      type: TextInputType.text,
                      label: 'Options (Size,Color..etc)',
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: defaultTextFormField(
                      controll: Price,
                      type: TextInputType.number,
                      label: 'Price (per piece)',
                      prefix: Icons.payments,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: defaultTextFormField(
                  controll: Quantity,
                  type: TextInputType.number,
                  label: 'Quantity',
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  defaultButton(
                    text: 'Add Another Item',
                    widt: 200,
                    function: () {},
                    color: const Color(0xff000236),
                  ),
                  const Spacer(),
                  defaultButton(
                    text: 'Submit',
                    widt: 100,
                    function: () {},
                    color: const Color(0xff000236),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
