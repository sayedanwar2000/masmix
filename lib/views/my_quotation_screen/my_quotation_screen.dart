import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/views/my_quotation_screen/view_details_screen.dart';

class MyQuotationScreen extends StatelessWidget {
  const MyQuotationScreen({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 2.0,
                        height: 130.0,
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
                              Text(
                                'Service ID :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('DHL'),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Service Name :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                width: 90,
                                child: AutoSizeText('Storage Service'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Service Status :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('67'),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Request Date :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('864.795'),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                      const Spacer(),
                      defaultButton(
                        text: 'Details',
                        function: () {
                          navigateto(
                              context, const ViewDetailsBookingsScreen());
                        },
                        color: const Color(0xfff7921c),
                        widt: 100,
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
        : isEmpty(name: 'quotations');
  }
}
