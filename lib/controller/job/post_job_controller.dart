
import 'package:flutter/material.dart';

import '../../models/job_model.dart';
import '../../views/job_service/job_service_screen.dart';

class PostJobController {
  final JobModel jobModel = JobModel();

  void updateJobTitle(String value) {
    jobModel.jobTitle = value;
  }

  void updateDetails(String value) {
    jobModel.details = value;
  }

  void updateCategory(String value) {
    jobModel.category = value;
  }

  void updateRequiredSkills(String value) {
    jobModel.requiredSkills = value;
  }

  bool validateForm() {
    return jobModel.jobTitle.isNotEmpty &&
        jobModel.details.isNotEmpty &&
        jobModel.category.isNotEmpty &&
        jobModel.requiredSkills.isNotEmpty;
  }

  void submitJob(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ServicePage()),
    );
  }
}