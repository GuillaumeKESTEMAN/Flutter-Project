enum Role {
  commercial,
  technician,
}

class User {
  final String _id;
  final String _authId;
  final String _username;
  final Role _role;

  User(
    this._id,
    this._authId,
    this._username,
    this._role,
  );

  String get authId => _authId;
  String get username => _username;
  Role get role => _role;
}
