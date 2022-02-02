import './message_type.dart';
export './message_type.dart';

class MessageModel {
  String title;
  String message;
  MessageType type;

  MessageModel({
    required this.title,
    required this.message,
    required this.type
  });
}
