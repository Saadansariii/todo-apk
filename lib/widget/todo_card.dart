import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateToEditPage;
  final Function(String) deleteById;
  const TodoCard({super.key , required this.index , required this.item , required this.navigateToEditPage , required this.deleteById});

  @override
  Widget build(BuildContext context) {
    final id = item['_id']as String;
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text('${index + 1}')),
        title: Text(item['title']),
        subtitle: Text(item['description']),
        trailing: PopupMenuButton(onSelected: (value) {
          if (value == 'edit') {
            navigateToEditPage(item);
          } else if (value == 'delete') {
            deleteById(id);
          } else {}
        }, itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: Text('Edit'),
              value: 'edit',
            ),
            PopupMenuItem(
              child: Text('Delete'),
              value: 'delete',
            )
          ];
        }),
      ),
    );
  }
}
