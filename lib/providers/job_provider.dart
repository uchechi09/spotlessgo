import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spotlessgo/models/job_model.dart';

class JobProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<JobModel> _availableJobs = [];
  final bool _isLoading = false;

  List<JobModel> get availableJobs => _availableJobs;
  bool get isLoading => _isLoading;

  // Stream of jobs from Firestore
  Stream<List<JobModel>> get jobsStream {
    return _firestore
        .collection('jobs')
        .where('status', isEqualTo: 'Pending')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return JobModel.fromJson({...doc.data(), 'id': doc.id});
          }).toList();
        });
  }

  Future<void> acceptJob(String jobId) async {
    try {
      await _firestore.collection('jobs').doc(jobId).update({
        'status': 'Accepted',
        // In a real app, you'd also record WHICH cleaner accepted it
      });
    } catch (e) {
      rethrow;
    }
  }
}
