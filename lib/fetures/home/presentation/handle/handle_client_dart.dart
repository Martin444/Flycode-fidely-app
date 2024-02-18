import 'package:flycode/core/handle/global_handle_response.dart';

class HandleClientData extends GlobalResponseDialogs {
  dynamic error;
  HandleClientData(e) {
    error = e;
  }

  bool isEmptyList() {
    return error.runtimeType == NoSuchMethodError;
  }
}
