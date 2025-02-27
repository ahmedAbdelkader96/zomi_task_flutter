import 'dart:async';
import 'dart:io';

class ExceptionHandlers {

  // static String handleApiError({required Response response}){
  //   int code = response.statusCode;
  //   if (code == 400) {
  //     var data = jsonDecode(response.body);
  //     String message = data['message'];
  //     return message;
  //   } else if (code == 400) {
  //     return 'HTTP error occurred.';
  //   }
  //
  //   switch (response.statusCode) {
  //     case 400:
  //       return "Bad request.";
  //     case 401:
  //     case 403:
  //       return "Unauthorized request.";
  //     default:
  //       return "Unknown Error!";
  //   }
  // }


  static String handlePlatformError({required dynamic error}) {
    if (error is SocketException) {
      return 'No internet connection.';
    } else if (error is HttpException) {
      return 'HTTP erro r occurred.';
    } else if (error is FormatException) {
      return 'Invalid data format.';
    } else if (error is TimeoutException) {
      return 'Request timeout.';
    } else {
      return 'Unknown error.';
    }
  }

}
