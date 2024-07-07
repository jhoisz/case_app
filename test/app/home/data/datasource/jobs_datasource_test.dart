import 'package:case_app/app/home/data/datasource/jobs_datasource.dart';
import 'package:case_app/core/service/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late IJobsDatasource datasource;
  late IHttpClient http;

  setUp(() {
    http = MockHttpClient();
    datasource = JobsDatasource(http: http);
  });

  group('Jobs datasource', () {
    const tUrl = 'https://img.elo7.com.br/mock-vagas.json';
    test('should return Response when http.get is successful', () async {
      when(
        () => http.get(tUrl),
      ).thenAnswer(
        (_) async => Response(
          '{"key": "value"}',
          200,
        ),
      );

      final result = await datasource.getJobs();

      expect(result, isA<Response>());
    });

    test('should rethrow when http.get fails', () {
      when(
        () => http.get(tUrl),
      ).thenThrow(
        Exception(),
      );

      expect(
        () => datasource.getJobs(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
