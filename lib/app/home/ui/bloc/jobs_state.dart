import '../../data/models/job_model.dart';

abstract class JobsState {}

class JobsInitial extends JobsState {}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {
  final List<JobModel> jobs;

  JobsLoaded(this.jobs);
}

class JobsError extends JobsState {
  final String message;

  JobsError(this.message);
}
