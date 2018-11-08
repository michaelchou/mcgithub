import 'package:event_bus/event_bus.dart';

///
/// @author MichaelChou
/// @date 2018/11/8 8:59 PM
///

class HttpData {
  var data;
  bool result;
  int code;
  var headers;

  HttpData(this.data, this.result, this.code, {this.headers});
}

class HttpErrorEvent {
  final int code;
  final String message;

  HttpErrorEvent(this.code, this.message);
}

class Code {
  static const NETWORK_ERROR = -1;
  static const NETWORK_TIMEOUT = -2;
  static const NETWORK_JSON_EXCEPTION = -3;
  static const SUCCESS = 200;

  static final EventBus eventBus = new EventBus();

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    eventBus.fire(new HttpErrorEvent(code, message));
    return message;
  }
}
