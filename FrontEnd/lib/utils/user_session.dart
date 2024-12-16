class UserSession {
  static final UserSession _instance = UserSession._internal();

  factory UserSession() => _instance;

  UserSession._internal();

  String? accessToken;
  String? refreshToken;
  Map<String, dynamic>? userDetails;

  void clearSession() {
    accessToken = null;
    refreshToken = null;
    userDetails = null;
  }
}
