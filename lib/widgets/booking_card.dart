import 'package:flutter/material.dart';
import 'package:spotlessgo/pages/models/status.dart';
import 'package:spotlessgo/widgets/info_row.dart';

enum BookingStatus { confirmed, booked, pending }

class BookingCard extends StatelessWidget {
  BookingCard({
    super.key,
    required this.title,
    required this.price,
    required this.status,
    required this.address,
    required this.personName,
  });

  final String title;
  final String price;
  final BookingStatus status;
  final String address;
  final String personName;

  @override
  Widget build(BuildContext context) {
    final statusData = statusStyle(status);

    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ],
          ),

          SizedBox(height: 6),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusData.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              statusData.label,
              style: TextStyle(
                fontSize: 12,
                color: statusData.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: 12),

          InfoRow(icon: Icons.calendar_today, text: '2025-11-10'),
          InfoRow(icon: Icons.access_time, text: '02:00 PM'),
          InfoRow(icon: Icons.location_on_outlined, text: address),
          InfoRow(icon: Icons.person_outline, text: personName),
        ],
      ),
    );
  }

  StatusData statusStyle(BookingStatus status) {
    switch (status) {
      case BookingStatus.confirmed:
        return StatusData(
          label: 'Confirmed',
          background: Colors.blue.shade50,
          textColor: Colors.blue,
        );
      case BookingStatus.booked:
        return StatusData(
          label: 'Booked',
          background: Colors.green.shade50,
          textColor: Colors.green,
        );
      case BookingStatus.pending:
        return StatusData(
          label: 'Pending',
          background: Colors.orange.shade50,
          textColor: Colors.orange,
        );
    }
  }
}
