import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "05/10/2024",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            "Tarefa123",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
