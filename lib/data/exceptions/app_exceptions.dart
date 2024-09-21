class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    // TODO: implement toString
    return '$_message $_prefix';   // returns the formatted error message
  }
}


// set all type of Exception for this screen

     // Internet Exception;
class NoInternetException extends  AppException {
  NoInternetException([String? message]) : super(message, "No Internet Connection");
}
      // when hit api and set no token or other exception
class UnauthorisedException extends  AppException {
  UnauthorisedException([String? message]) : super(message, "You don't have access to this");
}

      // api request time out exception
class RequestTimeOutException extends  AppException {
  RequestTimeOutException([String? message]) : super(message, "Request time out");
}

      // when fetch data but show exception
class FetchDataException extends  AppException {
  FetchDataException([String? message]) : super(message, " ");
}
