import 'package:get_it/get_it.dart';

import '../app/home/data/datasource/jobs_datasource.dart';
import '../app/home/data/repository/jobs_repository.dart';
import '../app/home/ui/bloc/jobs_bloc.dart';
import 'service/http_client.dart';

final sl = GetIt.instance;

void initGlobalContainer() {
  sl
    ..registerFactory<IHttpClient>(
      () => HttpClient(),
    )
    ..registerFactory<IJobsDatasource>(
      () => JobsDatasource(
        http: sl<IHttpClient>(),
      ),
    )
    ..registerFactory<IJobsRepository>(
      () => JobsRepository(
        datasource: sl<IJobsDatasource>(),
      ),
    )
    ..registerSingleton<IJobsBloc>(
      JobsBloc(
        repository: sl<IJobsRepository>(),
      ),
    );
}
