// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spotlessgo/models/job_model.dart'; // Import JobModel
import 'package:spotlessgo/pages/cleaner_job_details_page.dart';
import 'package:spotlessgo/utlis/currency_formatter.dart';
import 'package:spotlessgo/widgets/info_row.dart';

class CleanerJobsPage extends StatefulWidget {
  const CleanerJobsPage({super.key});

  @override
  State<CleanerJobsPage> createState() => _CleanerJobsPageState();
}

class _CleanerJobsPageState extends State<CleanerJobsPage> {
  int _selectedIndex = 0; // 0 for Available, 1 for My Jobs

  // Mock Data using JobModel
  final List<JobModel> availableJobs = [
    JobModel(
      id: '1',
      title: "Home Cleaning",
      address: "789 Oak Street, House 12",
      date: "2025-11-02",
      time: "10:00 AM",
      amount: 10000.0,
      status: "Pending",
      customerName: "John Doe",
      customerPhone: "+234 812 345 6789",
    ),
    JobModel(
      id: '2',
      title: "Office Cleaning",
      address: "321 Corporate Ave, Floor 5",
      date: "2025-11-03",
      time: "09:00 AM",
      amount: 7500.0,
      status: "Pending",
      customerName: "Jane Smith",
      customerPhone: "+234 809 987 6543",
    ),
    JobModel(
      id: '3',
      title: "Deep Cleaning",
      address: "456 Pine Road, Apt 4B",
      date: "2025-11-04",
      time: "02:00 PM",
      amount: 15000.0,
      status: "Pending",
      customerName: "Mike Johnson",
      customerPhone: "+234 703 111 2222",
    ),
  ];

  final List<JobModel> myJobs = []; // Empty for now

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Job Requests',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Custom Tab Switcher
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildTabButton(
                    text: "Available (${availableJobs.length})",
                    isSelected: _selectedIndex == 0,
                    onTap: () => setState(() => _selectedIndex = 0),
                  ),
                ),
                Expanded(
                  child: _buildTabButton(
                    text: "My Jobs (${myJobs.length})",
                    isSelected: _selectedIndex == 1,
                    onTap: () => setState(() => _selectedIndex = 1),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: _selectedIndex == 0
                ? _buildAvailableJobsList()
                : _buildMyJobsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2196F3) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableJobsList() {
    if (availableJobs.isEmpty) {
      return Center(
        child: Text(
          "No available jobs",
          style: TextStyle(color: Colors.grey.shade500),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      itemCount: availableJobs.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => _buildJobCard(availableJobs[index]),
    );
  }

  Widget _buildMyJobsList() {
    if (myJobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.calendar_today_outlined,
                size: 40,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "No accepted jobs yet",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Start accepting jobs to grow your earnings",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: myJobs.length,
      itemBuilder: (context, index) =>
          ListTile(title: Text(myJobs[index].title)),
    );
  }

  Widget _buildJobCard(JobModel job) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          // Header: Title & Price/Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      job.status,
                      style: const TextStyle(
                        color: Color(0xFF2196F3),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                nairaFormatter.format(job.amount),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2196F3),
                ),
              ),
            ],
          ),

          const Divider(height: 32),

          // Details List
          InfoRow(icon: Icons.calendar_today_outlined, text: job.date),
          const SizedBox(height: 12),
          InfoRow(icon: Icons.access_time, text: job.time),
          const SizedBox(height: 12),
          InfoRow(icon: Icons.location_on_outlined, text: job.address),
          const SizedBox(height: 12),
          InfoRow(icon: Icons.person_outline, text: job.customerName),
          const SizedBox(height: 12),
          InfoRow(icon: Icons.phone_outlined, text: job.customerPhone),

          const SizedBox(height: 24),

          // Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Accept Logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Accept Job",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CleanerJobDetailsPage(job: job),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
