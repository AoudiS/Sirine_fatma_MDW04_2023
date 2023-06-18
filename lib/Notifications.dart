import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<dynamic> notifications;

  const NotificationPage({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final String title = notification['title'] ?? '';
          final String body = notification['body'] ?? '';
          return ListTile(
            leading: _getNotificationIcon(notification),
            title: Text(title),
            subtitle: Text(body),
            onTap: () {
              // Action when a notification is tapped
            },
          );
        },
      ),
    );
  }

  Icon _getNotificationIcon(Map<String, dynamic> notification) {
    final String level = notification['title'] ?? '';
    switch (level) {
      case 'High Water Level Alert':
        return Icon(Icons.warning, color: Colors.red);
      case 'Elevated temperature Alert':
        return Icon(Icons.warning, color: Colors.orange);
      case 'Low Water Level Alert':
        return Icon(Icons.warning, color: Colors.green);
      case 'Low longitude Alert':
        return Icon(Icons.warning, color: Colors.blue);
      case 'High temperature Alert':
        return Icon(Icons.warning, color: Colors.redAccent);
      default:
        return Icon(Icons.notification_important, color: Colors.black);
    }
  }
}
