import 'package:flutter/material.dart';
import 'package:spotlessgo/widgets/booking_card.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'My Bookings',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
            ],
          ),
        ),
        body: TabBarView(children: [UpcomingBookings(), PastBookings()]),
      ),
    );
  }
}

// tabs for booking page
class UpcomingBookings extends StatelessWidget {
  const UpcomingBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: BookingCard(
              title: " House Cleaning",
              price: "₦15000",
              status: BookingStatus.confirmed,
              address: "Lagos, Nigeria",
              personName: "Grace",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: BookingCard(
              title: " Laundry Services",
              price: "₦2000",
              status: BookingStatus.booked,
              address: "Lagos, Nigeria",
              personName: "Grace",
            ),
          ),
        ],
      ),
    );
  }
}

class PastBookings extends StatelessWidget {
  const PastBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: BookingCard(
              title: "Office Cleaning",
              price: "₦10000",
              status: BookingStatus.pending,
              address: "Lagos, Nigeria",
              personName: "Grace",
            ),
          ),
        ],
      ),
    );
  }
}
