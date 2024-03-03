import 'package:flycode/core/exceptions/api_exception.dart';
import 'package:flycode/core/handle/global_handle_response.dart';
import 'package:http/http.dart';

class HandleUserError extends GlobalResponseDialogs {
  dynamic dataError;
  HandleUserError(e) {
    dataError = e;
    print(e);
    verifyToken();
    timeOut();
  }

  void verifyToken() {
    if (dataError.runtimeType == ApiException) {
      var apiError = (dataError as ApiException);

      if (apiError.statusCode == 401) {
        cerrarSession();
      }
    }
  }

  void timeOut() {
    if (dataError.runtimeType == ClientException) {
      cerrarSession();
    }
  }
}
