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
      jobsList = jobs.where((element) {
        return element.isActive ?? false;
      }).toList();

      emit(JobsLoaded(jobsList));
    } catch (e) {
      emit(JobsError('Ocorreu um erro ao buscar as vagas.'));
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
      emit(JobsError('Ocorreu um erro ao buscar as vagas.'));
    }
  }
}
