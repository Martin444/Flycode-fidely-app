import 'package:flycode/core/exceptions/api_exception.dart';
import 'package:flycode/core/handle/global_handle_response.dart';

class HandleCreateClient extends GlobalResponseDialogs {
  dynamic error;
  HandleCreateClient(e) {
    error = e;
    handleCreate();
  }

  void handleCreate() {
    if (error.runtimeType == ApiException) {
      var apiError = (error as ApiException);

      switch (apiError.statusCode) {
        case 401:
          cerrarSession();
          break;
        case 409:
          showSnackError('Este correo ya está en tu lista de clientes');
          break;
        default:
      }
    }
  }
}
