import 'package:dio/dio.dart';

abstract class Fialure {
  final String errorMassge;

  Fialure(this.errorMassge);
}

class ServerFialure extends Fialure {
  ServerFialure(super.errorMassge);
  factory ServerFialure.fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFialure('Send Timeout');

      case DioExceptionType.sendTimeout:
        return ServerFialure('Send Timeout');

      case DioExceptionType.badCertificate:
        return ServerFialure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFialure('Bad Response');

      case DioExceptionType.cancel:
        return ServerFialure(
            'Yor request with api server is cancel,Try leater');
      case DioExceptionType.connectionError:
        return ServerFialure('No internet connection');
      case DioExceptionType.unknown:
        return ServerFialure('There was an error,Please try leater');
      case DioExceptionType.receiveTimeout:
        return ServerFialure('Receive Timeout');
    }
  }
  factory ServerFialure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 200) {
      return ServerFialure('Your was request  not found,Please Try leater');
    } else if (statusCode >= 500) {
      return ServerFialure('There was problem with server,Please Try leater');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFialure(response['error']['message']);
    } else {
      return ServerFialure('There was an error,Please try leater');
    }
  }
}
