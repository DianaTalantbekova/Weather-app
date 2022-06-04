import 'package:flutter/material.dart';
import 'package:wether_api/commons/theme_helper.dart';

class WeatherCharacteristics extends StatelessWidget {
  final String title;
  final int subtitle;
  final String? value;

  const WeatherCharacteristics({
    Key? key,
    required this.title,
    required this.subtitle,
    this.value = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextHelper.medium18,
        ),
        Text(
          subtitle.toString() + value!,
          style: TextHelper.medium18,
        ),
      ],
    );
  }
}
