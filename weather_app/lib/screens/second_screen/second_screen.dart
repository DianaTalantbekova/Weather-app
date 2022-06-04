import 'package:flutter/material.dart';
import 'package:wether_api/commons/theme_helper.dart';
import 'package:wether_api/helpers/converter.dart';
import 'package:wether_api/models/weather_models.dart';
import 'package:wether_api/screens/second_screen/widgets/weather_characteristics.dart';

class SecondScreen extends StatefulWidget {
  final WeatherModel weatherModel;

  const SecondScreen({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple[100],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ThemeHelper.black,
          ),
        ),
      ),
      backgroundColor: Colors.purple[100],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              getDateFormat(widget.weatherModel.dt!),
              style: TextHelper.medium18,
            ),
            Text(
              widget.weatherModel.sys!.country.toString(),
              style: TextHelper.medium18.copyWith(color: ThemeHelper.black),
            ),
            const SizedBox(
              height: 200,
            ),
            Image.network(
              'http://openweathermap.org/img/wn/${widget.weatherModel.weather!.first.icon}@2x.png',
            ),
            WeatherCharacteristics(
              title: 'Temperature:',
              subtitle: getTemp(widget.weatherModel.main!.temp!),
              value: '°C',
            ),
            const Divider(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherCharacteristics(
                  title: 'Pressure',
                  subtitle: widget.weatherModel.main!.pressure!,
                ),
                WeatherCharacteristics(
                  title: 'Wind speed',
                  subtitle: widget.weatherModel.wind!.speed!.toInt(),
                  value: ' m/s',
                ),
                WeatherCharacteristics(
                  title: 'Feels like',
                  subtitle: getTemp(widget.weatherModel.main!.feelsLike!),
                  value: '°C',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
