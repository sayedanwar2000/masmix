import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';

class ViewDetailsServiceScreen extends StatelessWidget {
  const ViewDetailsServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context, homeCubit: homeCubit),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                width: 350,
                child: Card(
                  elevation: 10,
                  color: const Color(0xff000236),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xff000236),
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          width: 2.0,
                          height: 2130,
                          color: Colors.white,
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
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
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
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                AutoSizeText(
                                  'Storage Service',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
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
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '67',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
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
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Service Date :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Weight Charge :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Total Amount :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Total Tax Amount :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Currency :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Cumulative Weight :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Origin Coutnry :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Origin City :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Origin Airport/Port :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Courier :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '864.795',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            myDivider(Width: 250),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 90,
                                  child: AutoSizeText(
                                    'Destination Coutnry',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' : ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: AutoSizeText(
                                    'Next wave of invites will be sent on 12/16/2022 to '
                                    'qualifying customers.While supplies last Model Number'
                                    ' CFI-1215A01X Stunning Games - Marvel at incredible graphics'
                                    ' and experience new PS5 features.Breathtaking Immersion - Discover'
                                    ' a deeper gaming experience with support for haptic feedback, adaptive'
                                    ' triggers, and 3D Audio technology.Lightning Speed - Harness the power'
                                    ' of a custom CPU, GPU, and SSD with Integrated I/O that rewrite the rules'
                                    ' of what a PlayStation console can do.',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            myDivider(Width: 250),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 90,
                                  child: AutoSizeText(
                                    'Destination City',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' : ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: AutoSizeText(
                                    'Next wave of invites will be sent on 12/16/2022 to '
                                    'qualifying customers.While supplies last Model Number'
                                    ' CFI-1215A01X Stunning Games - Marvel at incredible graphics'
                                    ' and experience new PS5 features.Breathtaking Immersion - Discover'
                                    ' a deeper gaming experience with support for haptic feedback, adaptive'
                                    ' triggers, and 3D Audio technology.Lightning Speed - Harness the power'
                                    ' of a custom CPU, GPU, and SSD with Integrated I/O that rewrite the rules'
                                    ' of what a PlayStation console can do.',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            myDivider(Width: 250),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 90,
                                  child: AutoSizeText(
                                    'Destination Airport/Port',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' : ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: AutoSizeText(
                                    'Next wave of invites will be sent on 12/16/2022 to '
                                    'qualifying customers.While supplies last Model Number'
                                    ' CFI-1215A01X Stunning Games - Marvel at incredible graphics'
                                    ' and experience new PS5 features.Breathtaking Immersion - Discover'
                                    ' a deeper gaming experience with support for haptic feedback, adaptive'
                                    ' triggers, and 3D Audio technology.Lightning Speed - Harness the power'
                                    ' of a custom CPU, GPU, and SSD with Integrated I/O that rewrite the rules'
                                    ' of what a PlayStation console can do.',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              defaultButton(
                  text: 'Back',
                  widt: 100,
                  function: () {
                    Navigator.of(context).pop();
                  },
                  color: const Color(0xff000236)),
            ],
          ),
        ),
      ),
    );
  }
}
