import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  const Failure(this.errmessage);
}

class ServerFaliure extends Failure {
  ServerFaliure(super.errmessage);

  factory ServerFaliure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      // ignore: deprecated_member_use
      case DioErrorType.connectionTimeout:
        return ServerFaliure('Connection timeout with ApiServer');

      // ignore: deprecated_member_use
      case DioErrorType.sendTimeout:
        return ServerFaliure('Send timeout with ApiServer');

      // ignore: deprecated_member_use
      case DioErrorType.receiveTimeout:
        return ServerFaliure('Receive timeout with ApiServer');

      // ignore: deprecated_member_use
      case DioErrorType.badResponse:
        return ServerFaliure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      // ignore: deprecated_member_use
      case DioErrorType.cancel:
        return ServerFaliure('Request to ApiServer was canceld');

      // ignore: deprecated_member_use
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFaliure('No Internet Connection');
        }
        return ServerFaliure('Unexpected Error, Please try again!');
      default:
        return ServerFaliure('No Internet Connection');
    }
  }

  factory ServerFaliure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFaliure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFaliure('Internal Server error, Please try later');
    } else {
      return ServerFaliure('Opps There was an Error, Please try again');
    }
  }
}
