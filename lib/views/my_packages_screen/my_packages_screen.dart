import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/views/easy2ship_screen/easy2ship_details_screen.dart';

class MyPackagesScreen extends StatelessWidget {
  const MyPackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return true
        ? ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 10.0,
              ),
              child: Card(
                elevation: 10,
                shadowColor: const Color(0xffffbd50),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xfff7921c),
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 2.0,
                        height: 60,
                        color: const Color(0xfff7921c),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: const [
                              Text('Desc : '),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text('canada package 1'),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: const [
                              Text('Barcode : '),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text('1234567890'),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      defaultButton(
                        text: 'Photos',
                        widt: 100,
                        function: () {
                          navigateto(context, const EasyTwoShipDetailsScreen());
                        },
                        color: const Color(0xfff7921c),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 10,
          )
        : isEmpty(name: 'packages');
  }
}
