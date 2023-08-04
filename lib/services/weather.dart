import 'package:cima_2/services/location.dart';
import 'package:cima_2/services/networking.dart';

const apikey = '13b129d3e2fad15c6108ca7d0058832b';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherDataCity(String cityname) async {
    NetworkHelper networkHelper = NetworkHelper(
      Uri.parse('$openWeatherMapURL?q=$cityname&appid=$apikey&units=metric'),
    );
    var networkData =await networkHelper.getData();
    return networkData;
  }

  Future<dynamic> getWeatherLocationData() async {
    Location gps = Location();
    await gps.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
      Uri.parse(
          '$openWeatherMapURL?lat=${gps.latitude}&lon=${gps.longitude}&appid=$apikey&units=metric'),
    );
    var networkData = await networkHelper.getData();
    return networkData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
