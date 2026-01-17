class JobModel {
  final String id;
  final String title;
  final String address;
  final String
  date; // Keeping as String for now to match UI, can upgrade to DateTime later
  final String time;
  final double amount;
  final String status;
  final String customerName;
  final String customerPhone;

  JobModel({
    required this.id,
    required this.title,
    required this.address,
    required this.date,
    required this.time,
    required this.amount,
    required this.status,
    required this.customerName,
    required this.customerPhone,
  });

  // Factory constructor for creating a JobModel from a Map (e.g. from API)
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? 'Pending',
      customerName: json['customerName'] ?? 'Unknown',
      customerPhone: json['customerPhone'] ?? 'Unknown',
    );
  }
}
