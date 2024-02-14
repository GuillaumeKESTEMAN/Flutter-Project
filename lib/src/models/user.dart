class User {
  int _id;
  int _authId;
  String _username;
  String _role;

  User(
    this._id,
    this._authId,
    this._username,
    this._role,
  );

  int get authId => _authId;
  String get username => _username;
  String get role => _role;
}
