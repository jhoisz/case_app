import 'package:http/http.dart';

import '../../../../core/service/http_client.dart';

abstract class IJobsDatasource {
  Future<Response> getJobs();
}

class JobsDatasource implements IJobsDatasource {
  final IHttpClient http;

  JobsDatasource({required this.http});

  @override
  Future<Response> getJobs() async {
    try {
      final Response result = await http.get(
        'https://img.elo7.com.br/mock-vagas.json',
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
