import 'package:bloc_test/bloc_test.dart';
import 'package:case_app/app/home/data/models/job_model.dart';
import 'package:case_app/app/home/data/repository/jobs_repository.dart';
import 'package:case_app/app/home/ui/bloc/jobs_bloc.dart';
import 'package:case_app/app/home/ui/bloc/jobs_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockJobsRepository extends Mock implements IJobsRepository {}

class MockJobModel extends Mock implements JobModel {}

void main() {
  late IJobsBloc bloc;
  late IJobsRepository repository;
  late JobModel mockJob;
  setUp(() {
    repository = MockJobsRepository();
    bloc = JobsBloc(repository: repository);
    mockJob = MockJobModel();
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

  blocTest(
    'emits [JobsLoading, JobsLoaded, JobsLoading, JobsLoaded] when searchJobs succeeds',
    build: () {
      when(() => mockJob.title).thenReturn('test');
      when(() => mockJob.isActive).thenReturn(true);
      when(() => repository.getJobs()).thenAnswer((_) async => [mockJob]);
      return bloc;
    },
    act: (bloc) async {
      await bloc.getJobs();
      bloc.searchJobs(searchText: 'test');
    },
    expect: () => [
      isA<JobsLoading>(),
      const TypeMatcher<JobsLoaded>().having(
        (state) => state.jobs,
        '',
        hasLength(1),
      ),
      isA<JobsLoading>(),
      const TypeMatcher<JobsLoaded>().having(
        (state) => state.jobs,
        '',
        hasLength(1),
      ),
    ],
  );

  blocTest(
    'emits [JobsLoading, JobsError, JobsLoading, JobsLoaded] when searchJobs succeeds',
    build: () {
      when(
        () => repository.getJobs(),
      ).thenThrow(
        Exception(),
      );

      return bloc;
    },
    act: (bloc) async {
      await bloc.getJobs();
      return bloc.searchJobs(searchText: 'a');
    },
    expect: () => [
      isA<JobsLoading>(),
      isA<JobsError>(),
      isA<JobsLoading>(),
      const TypeMatcher<JobsLoaded>().having(
        (state) => state.jobs,
        '',
        hasLength(0),
      ),
    ],
  );
}
