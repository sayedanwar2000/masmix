import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/cubits/home_cubit.dart';
import 'package:masmix/controller/cubits/mas4me_cubit.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/components/item_mas4me_pending.dart';
import 'package:masmix/controller/share/components/menu.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/views/payment_screen/first_payment_screen.dart';
import 'package:masmix/views/pending_screen/view_details_storage_screen.dart';

class PendingBookingScreen extends StatelessWidget {
  const PendingBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    var mas4MeCubit = Mas4meCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Booking'),
        centerTitle: true,
      ),
      endDrawer: defaultDrawer(context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(mas4MeCubit.mas4MeList.isNotEmpty)
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10.0,
                        end: 10.0,
                      ),
                      child: itemCardMas4me(
                        context: context,
                        mas4Me: mas4MeCubit.mas4MeList[index],
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: 10),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 10.0,
                  end: 10.0,
                ),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: defaultColorNavyBlue,
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
                          color: defaultColorNavyBlue,
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
                              children: [
                                const AutoSizeText(
                                  'Service Name :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: const AutoSizeText(
                                    'Storage Service Service Service',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultButton(
                              text: 'Pay',
                              function: () {
                                navigateto(context, const FirstPaymentScreen());
                              },
                              color: defaultColorNavyBlue,
                              widt: 100,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            defaultButton(
                              text: 'Details',
                              function: () {
                                navigateto(
                                    context, const ViewDetailsStorageScreen());
                              },
                              color: defaultColorNavyBlue,
                              widt: 100,
                            ),
                          ],
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
            ),
          ],
        ),
      ),
    );
  }
}
