// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/function_share/functions.dart';
import 'package:masmix/views/home_screen/home_screen.dart';

class SecondPaymentScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardName = TextEditingController();
  TextEditingController yearNumber = TextEditingController();
  TextEditingController cvcNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  bool checkbox = true;
  var countryList = [
    'Ivory Coast',
    'Ghana',
    'Turkey',
    'Ethiopia',
    'Australia',
    'India',
    'India',
    'Syria',
    'Egypt',
    'Algeria',
    'India',
    'Kazakhstan',
    'Jordan',
    'India',
    'Turkey',
    'China',
    'Iraq',
  ];

  SecondPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000236),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Colors.white,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    defaultButton(
                      wid: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('link'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 1.0,
                            height: 15.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text('Pay faster'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            Icons.lock,
                            size: 20.0,
                          ),
                        ],
                      ),
                      function: () {},
                      color: Colors.cyan,
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
                            'Or pay with card',
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
                    defaultField(
                      label: 'Email',
                      widget: defaultTextFormField(
                        controll: email,
                        type: TextInputType.emailAddress,
                        colorBorder: const Color(0xfff7921c),
                        colorBorderFocuse: const Color(0xff000236),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultField(
                      label: 'Card information',
                      widget: defaultTextFormField(
                        controll: cardNumber,
                        hintText: '1234 1234 1234 1234',
                        type: TextInputType.number,
                        colorBorder: const Color(0xfff7921c),
                        colorBorderFocuse: const Color(0xff000236),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: defaultTextFormField(
                            controll: yearNumber,
                            hintText: 'MM/YY',
                            type: TextInputType.number,
                            colorBorder: const Color(0xfff7921c),
                            colorBorderFocuse: const Color(0xff000236),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: defaultTextFormField(
                            controll: cvcNumber,
                            hintText: 'CVC',
                            type: TextInputType.number,
                            colorBorder: const Color(0xfff7921c),
                            colorBorderFocuse: const Color(0xff000236),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultField(
                      label: 'Name on card',
                      widget: defaultTextFormField(
                        controll: cardName,
                        type: TextInputType.text,
                        colorBorder: const Color(0xfff7921c),
                        colorBorderFocuse: const Color(0xff000236),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultField(
                      label: 'Country or region',
                      widget: defaultDropdownSearch(
                        items: countryList,
                        onChang: print,
                        isSearch: true,
                        colorBorder: const Color(0xfff7921c),
                        colorBorderFocuse: const Color(0xff000236), selected: 'Select Country',
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xfff7921c),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: checkbox,
                                  onChanged: (value) {
                                    checkbox = value!;
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                  left: 10.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      width: 280,
                                      child: AutoSizeText(
                                        'Securely save my information for 1-click checkout',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 280,
                                      child: AutoSizeText(
                                        'pay faster on Mas mix and thousands of sites',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: defaultDropdownSearch(
                                    items: countryList,
                                    isSearch: true,
                                    onChang: print,
                                    colorBorder: const Color(0xfff7921c),
                                    colorBorderFocuse: const Color(0xff000236), selected: 'Select Country',
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: defaultTextFormField(
                                    controll: phoneNumber,
                                    hintText: 'Phone Number',
                                    type: TextInputType.number,
                                    colorBorder: const Color(0xfff7921c),
                                    colorBorderFocuse: const Color(0xff000236),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'By saving my info, I agree to the ',
                                    ),
                                    InkWell(
                                      onTap: () {
                                        functionsShare.launchInBrowser(
                                          urlpath: 'https://link.co/terms',
                                        );
                                      },
                                      child: const Text(
                                        'Link Terms',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('and '),
                                    InkWell(
                                      onTap: () {
                                        functionsShare.launchInBrowser(
                                          urlpath: 'https://link.co/privacy',
                                        );
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Link'),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.black,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: SizedBox(
                                      width: 500,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const AutoSizeText(
                                              'Mas mix uses Link to securely save your payment information.',
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            const AutoSizeText(
                                              'Link autofills your contact information, card details, and shipping addresses for future purchases on Link-supported sites.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.lock,
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: const [
                                                    Text('Mobile verification'),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        'You’re protected with mobile authentication designed to ensure that you’re the only person who can access your information.',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.verified_user,
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: const [
                                                    Text('Data encryption'),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        'Your card information stays secure with data encryption on servers that meet the highest PCI standards available in the payment industry.',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            const Text(
                                              'You can review every order before you pay.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            defaultButton(
                                              text: 'Close',
                                              function: () {
                                                Navigator.of(context).pop();
                                              },
                                              color: const Color(0xfff7921c),
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            InkWell(
                                              onTap: (){
                                                functionsShare.launchInBrowser(
                                                  urlpath: 'https://link.co/privacy',
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    'Learn more about privacy',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Icon(
                                                    Icons.open_in_new,
                                                    color: Colors.grey,
                                                    size: 20.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.all(0.0),
                                  );
                                });
                          },
                          child: const Text(
                            'More info',
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultButton(
                          text: 'Back',
                          widt: 100,
                          function: () {
                            navigateto(context, HomeScreen());
                          },
                          color: const Color(0xfff7921c),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        defaultButton(
                          text: 'Pay',
                          widt: 100,
                          function: () {},
                          color: const Color(0xfff7921c),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
