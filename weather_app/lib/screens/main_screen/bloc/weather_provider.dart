import 'package:dio/dio.dart';
import 'package:wether_api/helpers/api_requester.dart';
import 'package:wether_api/helpers/catch_exception.dart';
import 'package:wether_api/models/weather_models.dart';

class WeatherProvider {
  Future<WeatherModel> getWeather(String city) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(
        '',
        param: {
          'q': city,
          'appId':
              '622d6efcc5f0a866cc60a7134d0f73bc'
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        return WeatherModel.fromJson(response.data);
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
