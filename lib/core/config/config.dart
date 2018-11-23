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

  /// cache auth config
  static const CACHE_AUTH_KEY = 'authorizationCode';

  /// local storage config
  static const STORE_TOKEN_KEY = 'token';
  static const STORE_BASIC_CODE_KEY = 'user-basic-code';
  static const STORE_USER_NAME_KEY = 'user-name';
  static const STORE_USER_PASSWORD_KEY = 'user-password';
  static const STORE_USER_INFO_KEY = 'user-info';
  static const STORE_THEME_COLOR = 'theme-color';
  static const STORE_LOCALE = 'locale';
}
