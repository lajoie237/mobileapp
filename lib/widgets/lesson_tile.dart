import 'package:flutter/material.dart';

class LessonTile extends StatelessWidget {
  final String lessonId;
  final bool isCompleted;
  final VoidCallback onTap;
  final ValueChanged<bool?> onCheckboxChanged;

  LessonTile({
    required this.lessonId,
    required this.isCompleted,
    required this.onTap,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.book, color: isCompleted ? Colors.green : Colors.grey),
      title: Text('Leçon $lessonId'),
      trailing: Checkbox(
        value: isCompleted,
        onChanged: onCheckboxChanged,
      ),
      onTap: onTap,
    );
  }
}
