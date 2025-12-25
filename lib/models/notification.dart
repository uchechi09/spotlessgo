import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final IconData icon;
  final Color iconColor;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    required this.icon,
    required this.iconColor,
  });
   NotificationItem copyWith({
    bool? isRead,
  }) {
    return NotificationItem(
      title: title,
      message: message,
      time: time,
      isRead: isRead ?? this.isRead,
      icon: icon,
      iconColor: iconColor,
    );
  }
}

