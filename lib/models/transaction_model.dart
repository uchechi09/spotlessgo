enum JobPaymentStatus { paid, pending }

class TransactionModel {
  final String id;
  final String jobId; // Link to a specific job if needed
  final String title;
  final String date;
  final double amount;
  final JobPaymentStatus status;

  TransactionModel({
    required this.id,
    required this.jobId,
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] ?? '',
      jobId: json['jobId'] ?? '',
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] == 'paid'
          ? JobPaymentStatus.paid
          : JobPaymentStatus.pending,
    );
  }
}
