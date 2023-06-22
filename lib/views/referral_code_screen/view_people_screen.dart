import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/menu.dart';

class ViewPeopleScreen extends StatelessWidget {
  const ViewPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'People',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context),
      body: true
          ? ListView.separated(
              itemBuilder: (context,index) => Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                  left: 10.0,
                ),
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
                          width: 10.0,
                        ),
                        Container(
                          width: 2.0,
                          height: 60,
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
                                  'Customer Number :',
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
                                  'Sales Number :',
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
                          ],
                        ),
                        const Spacer(),
                        defaultButton(
                            function: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        height: 240,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Text('Name :'),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                SizedBox(
                                                  width: 200,
                                                  child: Text(
                                                    'Customer Name',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              children: const [
                                                Text('Sale Value :'),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text('Customer Name'),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              children: const [
                                                Text('Sale Price :'),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text('Customer Name'),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              children: const [
                                                Text('Value :'),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text('Customer Name'),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            defaultButton(
                                              text: 'Back',
                                              function: () {
                                                Navigator.of(context).pop();
                                              },
                                              color: const Color(0xff000236),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            color: Colors.white,
                            text: 'Details',
                            colorText: Colors.black,
                            widt: 85),
                      ],
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context,index) => const SizedBox(height: 10,),
              itemCount: 10,)
          : isEmpty(name: 'people'),
    );
  }
}
