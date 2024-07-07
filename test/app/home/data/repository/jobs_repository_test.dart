import 'package:case_app/app/home/data/datasource/jobs_datasource.dart';
import 'package:case_app/app/home/data/models/job_model.dart';
import 'package:case_app/app/home/data/repository/jobs_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockJobsDatasource extends Mock implements IJobsDatasource {}

void main() {
  late IJobsRepository repository;
  late IJobsDatasource datasource;

  setUp(() {
    datasource = MockJobsDatasource();
    repository = JobsRepository(datasource: datasource);
  });

  group('getJobs', () {
    test('returns a list of jobs when the call is successful', () async {
      final mockResponse = http.Response(
        '{"jobs": [{"title": "especialista de fp&a", "type": "financeiro","level": "especialista", "location": "são paulo, sp, brasil","is_active": true}]}',
        200,
      );
      when(
        () => datasource.getJobs(),
      ).thenAnswer(
        (_) async => mockResponse,
      );

      final result = await repository.getJobs();

      expect(result, isA<List<JobModel>>());
      expect(result.first.title, 'especialista de fp&a');
    });

    test('returns an empty list when an exception occurs', () async {
      when(
        () => datasource.getJobs(),
      ).thenThrow(
        Exception(),
      );

      final result = await repository.getJobs();

      expect(result, isA<List<JobModel>>());
      expect(result, isEmpty);
    });
  });
}
