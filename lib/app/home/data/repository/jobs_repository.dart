import 'dart:convert';

import '../datasource/jobs_datasource.dart';
import '../models/job_model.dart';

abstract class IJobsRepository {
  Future<List<JobModel>> getJobs();
}

class JobsRepository implements IJobsRepository {
  final IJobsDatasource datasource;

  JobsRepository({required this.datasource});

  @override
  Future<List<JobModel>> getJobs() async {
    try {
      final result = await datasource.getJobs();

      final data = jsonDecode(result.body);

      final List<JobModel> jobs = List<JobModel>.from(
        data['jobs'].map(
          (model) => JobModel.fromJson(model),
        ),
      );

      return jobs;
    } catch (e) {
      return [];
    }
  }
}
