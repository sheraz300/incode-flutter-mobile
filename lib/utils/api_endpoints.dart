class ApiEndPoints {
  static const String baseUrl = 'https://reqres.in/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'login';
}
