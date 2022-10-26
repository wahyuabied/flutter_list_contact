class UserApi {
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String avatar;

  const UserApi(
      {required this.id, required this.first_name, required this.last_name, required this.email, required this.avatar});

  factory UserApi.fromJson(Map<String, dynamic> json) {
    return UserApi(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
