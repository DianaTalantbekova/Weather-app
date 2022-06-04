import 'package:wether_api/models/weather_models.dart';
import 'package:wether_api/screens/main_screen/bloc/weather_provider.dart';

class WeatherRepository {
  Future<WeatherModel> getWeather(String city) {
    WeatherProvider provider = WeatherProvider();
    return provider.getWeather(city);
  }
}
