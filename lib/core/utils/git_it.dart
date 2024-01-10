import 'package:books_online/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:books_online/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:books_online/Features/home/domain/entities/repo/home_repo_impl.dart';
import 'package:books_online/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.asNewInstance();
HomeRepoImpl setupServiceLocator() {
  return getIt.registerSingleton(HomeRepoImpl(
    homeLocalDataSource: HomeLocalDataSourceImpl(),
    homeRemoteDataSource: HomeRemoteDataSourceImpl(ApiService(Dio())),
  ));
}
