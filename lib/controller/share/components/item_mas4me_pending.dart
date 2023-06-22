import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:masmix/controller/share/components/component.dart';
import 'package:masmix/controller/share/style/colors.dart';
import 'package:masmix/views/details_mas4me/details_product_mas4me_screen.dart';
import 'package:masmix/views/payment_screen/first_payment_screen.dart';

Widget itemCardMas4me({
  required context,
  required mas4Me,
}) =>
    Card(
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
                  children: [
                    const AutoSizeText(
                      'Site Name :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: AutoSizeText(
                        '${mas4Me['site_name']}',
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
                  children: [
                    const AutoSizeText(
                      'Item Name :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: AutoSizeText(
                        '${mas4Me['item_name']}',
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
                  children: [
                    const AutoSizeText(
                      'Quantity :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: AutoSizeText(
                        '${mas4Me['quantity']}',
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
                  children: [
                    const AutoSizeText(
                      'Price :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: AutoSizeText(
                        '${mas4Me['price']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
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
                    navigateto(context, const DetailsProductMas4MeScreen());
                  },
                  color: defaultColorNavyBlue,
                  widt: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );