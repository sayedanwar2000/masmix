import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/views/payment_screen/second_payment_screen.dart';

class FirstPaymentScreen extends StatelessWidget {
  const FirstPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000236),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff000236),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff000236),
          statusBarIconBrightness: Brightness.light,


        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 130,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Storage',
                      style: TextStyle(color: Colors.grey, fontSize: 30.0),
                    ),
                    Text(
                      '\$55.00',
                      style: TextStyle(
                        color: Color(0xff000236),
                        fontSize: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            defaultButton(
              text: 'Pay',
              widt: 100.0,
              colorText: const Color(0xff000236),
              function: (){
                navigateto(context,  SecondPaymentScreen());
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
