import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get email_hint => 'johnmac@gmail.com';

  @override
  String get password => 'Password';

  @override
  String get password_hint => 'Your Password';

  @override
  String get forget_password => 'Do you forget your password?';

  @override
  String get no_account => 'Don’t have an account?';

  @override
  String get register_now => 'Register Now';

  @override
  String get login_button => 'Login';

  @override
  String get logout_button => 'Logout';

  @override
  String get created_with => 'Crafted with ❤ by';

  @override
  String get company => 'Fenix HUB';
}
