// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget radioButton({
  required Cubit,
  required index,
  required onChanged,
}) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Radio<String>(
                value: Cubit.radioButtonList[index - 2],
                groupValue: Cubit.character,
                onChanged: onChanged,
              ),
              Text(Cubit.radioButtonList[index - 2]),
            ],
          ),
        ),
        if (Cubit.radioButtonList!.length > index - 1)
          Expanded(
            child: Row(
              children: [
                Radio<String>(
                  value: Cubit.radioButtonList[index - 1],
                  groupValue: Cubit.character,
                  onChanged: onChanged,
                ),
                Text(Cubit.radioButtonList[index - 1]),
              ],
            ),
          ),
      ],
    );