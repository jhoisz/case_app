import 'package:bloc_test/bloc_test.dart';
import 'package:case_app/app/home/data/models/job_model.dart';
import 'package:case_app/app/home/data/repository/jobs_repository.dart';
import 'package:case_app/app/home/ui/bloc/jobs_bloc.dart';
import 'package:case_app/app/home/ui/bloc/jobs_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockJobsRepository extends Mock implements IJobsRepository {}

void main() {
  late IJobsBloc bloc;
  late IJobsRepository repository;

  setUp(() {
    repository = MockJobsRepository();
    bloc = JobsBloc(repository: repository);
  });

  blocTest(
    'emits [JobsLoading, JobsLoaded] when getJobs succeeds',
    build: () {
      when(
        () => repository.getJobs(),
      ).thenAnswer(
        (_) async => [JobModel()],
      );
      return bloc;
    },
    act: (bloc) => bloc.getJobs(),
    expect: () => [
      isA<JobsLoading>(),
      isA<JobsLoaded>(),
    ],
  );

  blocTest(
    'emits [JobsLoading, JobsError] when getJobs fails',
    build: () {
      when(
        () => repository.getJobs(),
      ).thenThrow(
        Exception(),
      );
      return bloc;
    },
    act: (bloc) => bloc.getJobs(),
    expect: () => [
      isA<JobsLoading>(),
      isA<JobsError>(),
    ],
  );
}
