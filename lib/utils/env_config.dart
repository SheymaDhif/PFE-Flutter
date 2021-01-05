enum Environment { DEV, PROD }

class EnvironmentConfig {
  static Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get BACKEND_URL {
    return _config[_Config.BACKEND_URL];
  }
}

class _Config {
  static const BACKEND_URL = "BACKEND_URL";

  static Map<String, dynamic> debugConstants = {
    BACKEND_URL: "https://0a4c5c63f54f.ngrok.io/api",
  };

  static Map<String, dynamic> prodConstants = {
    BACKEND_URL: "https://0a4c5c63f54f.ngrok.io/api",
  };
}
