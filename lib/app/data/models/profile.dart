class Profile {
  final String id;
  final String username;
  final DateTime createdAt;

  Profile({
    required this.id,
    required this.username,
    required this.createdAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      username: json['username'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
