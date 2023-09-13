class Message {
  final String id;
  final String profileId;
  final String content;
  final DateTime createdAt;
  final bool isMine;

  Message({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      profileId: json['profile_id'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      isMine: json['is_mine'],
    );
  }
}
