///
/// @author MichaelChou
/// @date 2018/11/8 8:10 PM
///

class Config {
  static const DEBUG = true;
  /// http config
  static const HTTP_TIMEOUT_KEY = 'timeoutMs';
  static const HTTP_TIMEOUT = 15 * 1000;
  static const HTTP_AUTH_KEY = 'Authorization';

  /// page config
  static const PAGE_SIZE = 20;

  /// auth config
  static const AUTH_TOKEN_KEY = 'token';
  static const AUTH_KEY = 'authorizationCode';

  /// local storage config
  static const USER_BASIC_CODE = 'user-basic-code';
  static const USER_NAME_KEY = 'user-name';
  static const USER_PASSWORD_KEY = 'user-password';
}