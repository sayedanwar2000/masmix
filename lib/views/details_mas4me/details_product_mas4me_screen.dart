import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/style/colors.dart';

class DetailsProductMas4MeScreen extends StatelessWidget {
  const DetailsProductMas4MeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(
            color: defaultColorBlack,
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 350,
                child: Card(
                  elevation: 10,
                  color: defaultColorNavyBlue,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: defaultColorNavyBlue,
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
                          height: MediaQuery.of(context).size.height,
                          color: defaultColorWhite,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Service ID :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Service Name :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Service Date :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Request Date :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'status :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Height :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Width :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Length :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Dimension Unit :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Weight :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total Price :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Weight Unit :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Courier Name :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Service Price :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Currency :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Date :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: defaultColorWhite,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  'DHL',
                                  style: TextStyle(
                                    color: defaultColorWhite,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
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
                  color: defaultColorNavyBlue),
            ],
          ),
        ),
      ),
    );
  }
}
