// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rivertodo/core/di/di_module.dart' as _i788;
import 'package:rivertodo/features/todo/data/datasources/category_remote_data_source.dart'
    as _i24;
import 'package:rivertodo/features/todo/data/datasources/todo_remote_data_source.dart'
    as _i391;
import 'package:rivertodo/features/todo/data/repositories/category_repository_impl.dart'
    as _i783;
import 'package:rivertodo/features/todo/data/repositories/todo_repository_impl.dart'
    as _i181;
import 'package:rivertodo/features/todo/domain/repositories/category_repository.dart'
    as _i609;
import 'package:rivertodo/features/todo/domain/repositories/todo_repository.dart'
    as _i864;
import 'package:rivertodo/features/todo/domain/usecases/add_todo.dart' as _i638;
import 'package:rivertodo/features/todo/domain/usecases/get_categories.dart'
    as _i573;
import 'package:rivertodo/features/todo/domain/usecases/get_filled_todos.dart'
    as _i129;
import 'package:rivertodo/features/todo/domain/usecases/get_todo_by_id.dart'
    as _i62;
import 'package:rivertodo/features/todo/domain/usecases/get_todos.dart'
    as _i976;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i24.CategoryRemoteDataSource>(
      () => _i24.CategoryRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i391.ToDoRemoteDataSource>(
      () => _i391.ToDoRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i609.CategoryRepository>(
      () => _i783.CategoryRepositoryImpl(
        categoryRemoteDataSource: gh<_i24.CategoryRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i864.ToDoRepository>(
      () => _i181.ToDoRepositoryImpl(
        toDoRemoteDataSource: gh<_i391.ToDoRemoteDataSource>(),
      ),
    );
    gh.factory<_i129.GetFilledTodos>(
      () => _i129.GetFilledTodos(
        repository: gh<_i864.ToDoRepository>(),
        categoryRepository: gh<_i609.CategoryRepository>(),
      ),
    );
    gh.factory<_i573.GetCategories>(
      () => _i573.GetCategories(gh<_i609.CategoryRepository>()),
    );
    gh.factory<_i62.GetToDoById>(
      () => _i62.GetToDoById(gh<_i864.ToDoRepository>()),
    );
    gh.factory<_i976.GetTodos>(
      () => _i976.GetTodos(gh<_i864.ToDoRepository>()),
    );
    gh.factory<_i638.AddToDo>(() => _i638.AddToDo(gh<_i864.ToDoRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i788.RegisterModule {}
