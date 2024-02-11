import 'package:flycode/core/exceptions/api_exception.dart';
import 'package:flycode/core/handle/global_handle_response.dart';

class HandleUserError extends GlobalResponseDialogs {
  dynamic dataError;
  HandleUserError(e) {
    dataError = e;
    verifyToken();
  }

  void verifyToken() {
    if (dataError.runtimeType == ApiException) {
      var apiError = (dataError as ApiException);

      if (apiError.statusCode == 401) {
        cerrarSession();
      }
    }
  }
}
