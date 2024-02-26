class UserDetail {
  final int id;
  final String title;

  const UserDetail({required this.id, required this.title});

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        UserDetail(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load user details.'),
    };
  }
}
