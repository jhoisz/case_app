import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/job_model.dart';
import '../../data/repository/jobs_repository.dart';
import 'jobs_state.dart';

abstract class IJobsBloc extends Cubit<JobsState> {
  IJobsBloc() : super(JobsInitial());

  Future<void> getJobs();
  Future<void> searchJobs({required String searchText});
}

class JobsBloc extends IJobsBloc {
  final IJobsRepository repository;
  List<JobModel> jobsList = [];

  JobsBloc({required this.repository});

  @override
  Future<void> getJobs() async {
    emit(JobsLoading());

    try {
      final jobs = await repository.getJobs();
      jobsList = jobs;
      emit(JobsLoaded(jobs));
    } catch (e) {
      emit(JobsError('Error to get jobs'));
    }
  }

  @override
  Future<void> searchJobs({required String searchText}) async {
    emit(JobsLoading());

    try {
      final List<JobModel> list = jobsList.where((element) {
        final title = element.title;

        return title != null &&
            title.toLowerCase().contains(searchText.toLowerCase());
      }).toList();

      emit(JobsLoaded(list));
    } catch (e) {
      emit(JobsError('Error to get jobs'));
    }
  }
}
