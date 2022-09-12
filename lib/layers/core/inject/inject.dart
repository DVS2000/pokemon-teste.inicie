import 'package:get_it/get_it.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_description_pokemon_datasource/get_description_pokemon_datasource.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_description_pokemon_datasource/get_description_pokemon_datasource_imp.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_by_type_datasource_remote/get_pokem_by_type_datasource_remote_imp.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_by_type_datasource_remote/get_pokems_by_type_datasource_remote.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_datasource_remote/get_pokem_datasource_remote.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_datasource_remote/get_pokem_datasource_remote_imp.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/search_pokemon_datasource/search_pokemon_datasource.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/search_pokemon_datasource/search_pokemon_datasource_imp.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service_imp.dart';
import 'package:pokemon_teste/layers/data/repositories/get_description_pokemon_repository_imp.dart';
import 'package:pokemon_teste/layers/data/repositories/get_pokemon_by_type_repository_imp.dart';
import 'package:pokemon_teste/layers/data/repositories/get_pokemon_repository_imp.dart';
import 'package:pokemon_teste/layers/data/repositories/search_pokemon_repository_imp.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_description_pokemon_repository.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_pokemons_by_type_repository.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_pokemons_repository.dart';
import 'package:pokemon_teste/layers/domain/repositories/search_pokemon_repository.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_description_pokemon/get_description_pokemon_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_description_pokemon/get_description_pokemon_usecase_imp.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_by_type_usecase/get_pokemons_by_type_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_by_type_usecase/get_pokemons_by_type_usecase_imp.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_usecase/get_pokemons_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_usecase/get_pokemons_usecase_imp.dart';
import 'package:pokemon_teste/layers/domain/usecases/search_pokemon_usecase/search_pokemon_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/search_pokemon_usecase/search_pokemon_usecase_imp.dart';
import 'package:pokemon_teste/layers/presenters/controllers/pokemon_controller/pokemon_controller.dart';

class Inject{
  static void init() {
    GetIt getIt = GetIt.instance;

    // Client Http
    getIt.registerLazySingleton<ClientHttpService>(() => ClientHttpServiceImp());

    // Datasources
    getIt.registerLazySingleton<GetPokemonDatasourceRemote>(() => GetPokemonDatasourceRemoteImp(getIt()));
    getIt.registerLazySingleton<GetPokemonsByTypeDatasourceRemote>(() => GetPokemonsByTypeDatasourceRemoteImp(getIt()));
    getIt.registerLazySingleton<GetDescriptionPokemonDatasource>(() => GetDescriptionPokemonDatasourceImp(getIt()));
    getIt.registerLazySingleton<SearchPokemonDatasource>(() => SearchPokemonDatasourceImp(getIt()));

    // Repositories
    getIt.registerLazySingleton<GetPokemonsRepository>(() => GetPokemonRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetPokemonsByTypeRepository>(() => GetPokemonsByTypesRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetDescriptionPokemonRepository>(() => GetDescriptionPokemonRepositoryImp(getIt()));
    getIt.registerLazySingleton<SearchPokemonRepository>(() => SearchPokemonRepositoryImp(getIt()));

    // Usecases
    getIt.registerLazySingleton<GetPokemonUsecase>(() => GetPokemonUsecaseImp(getIt()));
    getIt.registerLazySingleton<GetPokemonByTypeUsecase>(() => GetPokemonByTypeUsecaseImp(getIt()));
    getIt.registerLazySingleton<GetDescriptionPokemonUsecase>(() => GetDescriptionPokemonUsecaseImp(getIt()));
    getIt.registerLazySingleton<SearchPokemonUsecase>(() => SearchPokemonUsecaseImp(getIt()));

    // Controllers
    getIt.registerLazySingleton<PokemonController>(() => PokemonController(getIt(), getIt(), getIt(), getIt()));
  }
}