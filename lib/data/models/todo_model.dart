import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  final String id;
  final String title;
  final bool isCompleted;

  Todo({
    String? id, // If ID is null, generate a new one.
    required this.title,
    this.isCompleted = false,
  }) : id = id ?? uuid.v4(); // Generate unique ID if not provided.

  // Copy method to create new instances with updated fields.
  Todo copyWith({String? title, bool? isCompleted}) {
    return Todo(
      id: id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
