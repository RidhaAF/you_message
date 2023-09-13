import 'package:you_message/app/data/models/message.dart';

class Room {
  final String id;
  final DateTime createdAt;
  final String otherUserId;
  final Message? lastMessage;

  Room({
    required this.id,
    required this.createdAt,
    required this.otherUserId,
    this.lastMessage,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  Room.fromRoomParticipants(Map<String, dynamic> json)
      : id = json['room_id'],
        otherUserId = json['profile_id'],
        createdAt = DateTime.parse(json['created_at']),
        lastMessage = null;

  Room copyWith({
    String? id,
    DateTime? createdAt,
    String? otherUserId,
    Message? lastMessage,
  }) {
    return Room(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      otherUserId: otherUserId ?? this.otherUserId,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }
}
