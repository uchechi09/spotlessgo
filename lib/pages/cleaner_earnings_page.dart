// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spotlessgo/models/transaction_model.dart';
import 'package:spotlessgo/utlis/currency_formatter.dart';

class CleanerEarningsPage extends StatelessWidget {
  const CleanerEarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryBlue = const Color(0xFF2196F3);

    // Mock Data using TransactionModel
    final List<TransactionModel> transactions = [
      TransactionModel(
        id: '1',
        jobId: '101',
        title: "Home Cleaning - Lekki",
        date: "Today, 10:30 AM",
        amount: 15000,
        status: JobPaymentStatus.paid,
      ),
      TransactionModel(
        id: '2',
        jobId: '102',
        title: "Office Cleaning - VI",
        date: "Yesterday, 2:15 PM",
        amount: 25000,
        status: JobPaymentStatus.pending,
      ),
      TransactionModel(
        id: '3',
        jobId: '103',
        title: "Laundry Service",
        date: "Nov 12, 09:00 AM",
        amount: 5000,
        status: JobPaymentStatus.paid,
      ),
      TransactionModel(
        id: '4',
        jobId: '104',
        title: "Home Cleaning - Ikeja",
        date: "Nov 10, 11:45 AM",
        amount: 15000,
        status: JobPaymentStatus.pending,
      ),
      TransactionModel(
        id: '5',
        jobId: '105',
        title: "Deep Cleaning - Surulere",
        date: "Nov 08, 08:30 AM",
        amount: 45000,
        status: JobPaymentStatus.paid,
      ),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Earnings',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
        body: Column(
          children: [
            // Top Section (Balance & Stats)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Balance Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: primaryBlue.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Total Balance",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          nairaFormatter.format(124500), // Mock data
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Implement Withdraw Logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: primaryBlue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Withdraw Funds",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Stats Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          context,
                          title: "This Month",
                          amount: 85000,
                          icon: Icons.calendar_month,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildStatCard(
                          context,
                          title: "Pending",
                          amount: 15000,
                          icon: Icons.hourglass_top,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Tab Bar
            Container(
              color: Colors.white,
              child: TabBar(
                labelColor: primaryBlue,
                unselectedLabelColor: Colors.grey,
                indicatorColor: primaryBlue,
                tabs: const [
                  Tab(text: "All Jobs"),
                  Tab(text: "Paid"),
                  Tab(text: "Pending"),
                ],
              ),
            ),

            // Tab Content
            Expanded(
              child: TabBarView(
                children: [
                  _buildTransactionList(transactions), // All
                  _buildTransactionList(
                    transactions
                        .where((t) => t.status == JobPaymentStatus.paid)
                        .toList(),
                  ), // Paid
                  _buildTransactionList(
                    transactions
                        .where((t) => t.status == JobPaymentStatus.pending)
                        .toList(),
                  ), // Pending
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required double amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            nairaFormatter.format(amount),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList(List<TransactionModel> transactions) {
    if (transactions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment_outlined,
              size: 48,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              "No transactions found",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: transactions.length,
      separatorBuilder: (context, index) =>
          Divider(color: Colors.grey.shade200),
      itemBuilder: (context, index) {
        return _buildTransactionItem(transactions[index]);
      },
    );
  }

  Widget _buildTransactionItem(TransactionModel transaction) {
    final isPaid = transaction.status == JobPaymentStatus.paid;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isPaid
              ? Colors.green.withOpacity(0.1)
              : Colors.orange.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isPaid ? Icons.arrow_downward : Icons.hourglass_empty,
          color: isPaid ? Colors.green : Colors.orange,
          size: 20,
        ),
      ),
      title: Text(
        transaction.title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        transaction.date,
        style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "+${nairaFormatter.format(transaction.amount)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            isPaid ? "Paid" : "Pending",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isPaid ? Colors.green : Colors.orange,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
