import 'dart:convert';

import 'package:case_app/app/home/data/datasource/jobs_datasource.dart';
import 'package:case_app/app/home/data/models/job_model.dart';
import 'package:case_app/app/home/data/repository/jobs_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockJobsDatasource extends Mock implements IJobsDatasource {}

class MockResponse extends Mock implements http.Response {}

void main() {
  late IJobsRepository repository;
  late IJobsDatasource datasource;
  late http.Response mockResponse;

  setUp(() {
    datasource = MockJobsDatasource();
    repository = JobsRepository(
      datasource: datasource,
    );
    mockResponse = MockResponse();
  });

  group('getJobs', () {
    test('returns a list of jobs when the call is successful', () async {
      when(
        () => datasource.getJobs(),
      ).thenAnswer(
        (_) async => mockResponse,
      );

      when(
        () => mockResponse.bodyBytes,
      ).thenReturn(
        utf8.encode(
          '{"jobs": [{"title": "especialista de fp&a", "type": "financeiro","level": "especialista", "location": "são paulo, sp, brasil","is_active": true}]}',
        ),
      );

      final result = await repository.getJobs();

      expect(result, isA<List<JobModel>>());
      expect(result.length, 1);
      expect(result.first.title, 'especialista de fp&a');
    });

    test('should rethrow when getJobs fails', () async {
      when(
        () => datasource.getJobs(),
      ).thenThrow(
        Exception(),
      );

      expect(
        () => repository.getJobs(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
