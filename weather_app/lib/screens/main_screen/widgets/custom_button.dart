import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_api/commons/theme_helper.dart';
import 'package:wether_api/screens/main_screen/bloc/weather_bloc.dart';
import 'package:wether_api/screens/second_screen/second_screen.dart';

class CustomButton extends StatefulWidget {
  final TextEditingController controller;
  const CustomButton({Key? key, required this.controller}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late WeatherBloc weatherBloc;

  @override
  void initState() {
    weatherBloc = WeatherBloc();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      listener: (context, state) {
        if (state is WeatherErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.message.toString()),
              duration: Duration(
                seconds: 1,
              ),
            ),
          );
        }
        if (state is WeatherFetchedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(
                weatherModel: state.weatherModel,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ThemeHelper.black,
          ),
          onPressed: () {
            weatherBloc.add(GetWeatherEvent(city: widget.controller.text));
          },
          child: Text(
            'Search city',
            style: TextHelper.medium14.copyWith(
              color: ThemeHelper.white,
            ),
          ),
        );
      },
    );
  }
}
