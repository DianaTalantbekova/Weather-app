import 'package:flutter/material.dart';
import 'package:wether_api/commons/theme_helper.dart';
import 'package:wether_api/screens/main_screen/bloc/weather_bloc.dart';
import 'package:wether_api/screens/main_screen/widgets/custom_textField.dart';
import 'package:wether_api/screens/main_screen/widgets/custom_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late WeatherBloc weatherBloc;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter your city',
            style: TextHelper.bold40.copyWith(color: ThemeHelper.black),
          ),
          CustomTextField(controller: controller),
          CustomButton(controller: controller,),
        ],
      ),
    );
  }
}


