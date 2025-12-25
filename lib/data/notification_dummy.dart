import 'package:flutter/material.dart';
import 'package:spotlessgo/models/notification.dart';

final List<NotificationItem> dummyNotifications = [
  NotificationItem(
    title: 'Booking Confirmed',
    message: 'Your home cleaning is confirmed for tomorrow at 10:00 AM',
    time: '2h ago',
    isRead: false,
    icon: Icons.check_circle,
    iconColor: Colors.green,
  ),
  NotificationItem(
    title: 'Cleaner Assigned',
    message: 'A cleaner has been assigned to your booking',
    time: '5h ago',
    isRead: false,
    icon: Icons.person,
    iconColor: Colors.blue,
  ),
  NotificationItem(
    title: 'Service Reminder',
    message: 'Your cleaning service starts in 2 hours',
    time: 'Yesterday',
    isRead: true,
    icon: Icons.alarm,
    iconColor: Colors.orange,
  ),
  NotificationItem(
    title: 'Payment Successful',
    message: 'Your payment has been processed successfully',
    time: '3 days ago',
    isRead: true,
    icon: Icons.payment,
    iconColor: Colors.purple,
  ),
];