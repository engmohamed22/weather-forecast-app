class AppStrings {
  static const String appName = 'WebKeyz Task';
  static const String apiKey = 'd1139bf40b5b4c9a65bbe7e90ed041b3';
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weatherEndPoint = '$baseUrl/weather';
  static const forecastEndPoint = '$baseUrl/forecast';
  static  paramsWeatherByLatLonEndPint(lat,lon) => '$weatherEndPoint?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  static  paramsForecastByLatLonEndPint(lat,lon) => '$forecastEndPoint?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  static  paramsWeatherByCityNameEndPint(cityName) => '$weatherEndPoint?q=$cityName&appid=$apiKey&units=metric';
  static  paramsForecastByCityNameEndPint(cityName) => '$forecastEndPoint?q=$cityName&appid=$apiKey&units=metric';

  static const noRouteFound = 'no Route Found';
  static const serverFailure = 'Server Failure';
  static const cacheFailure = 'Cache Failure';
  static const errorDuringCommunication = "Error During Communication";
  static const badRequest = "Bad Request";
  static const unauthorized = "Unauthorized";
  static const requestedInfoNotFound = "Requested Info Not Found";
  static const conflictOccurred = "Conflict Occurred";
  static const internalServerError = "Internal Server Error";
  static const noInternetConnection = 'No Internet connection';
  static const errorOccurredDuringReadingData =
      "Error Occurred During Reading Data";
  static const unexpectedError = 'Unexpected Error';
  static const somethingWentWrong = 'Something Went Wrong';
  static const appFont = 'Roboto';
}
