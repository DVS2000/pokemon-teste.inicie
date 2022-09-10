import 'package:get_it/get_it.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_datasource_remote.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_datasource_remote_imp.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service_imp.dart';
import 'package:pokemon_teste/layers/data/repositories/get_pokemon_repository.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_pokemons_repository.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_usecase/get_pokemons_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_usecase/get_pokemons_usecase_imp.dart';
import 'package:pokemon_teste/layers/presenters/controllers/pokemon_controller/pokemon_controller.dart';

class Inject{
  static void init() {
    GetIt getIt = GetIt.instance;

    // Client Http
    getIt.registerLazySingleton<ClientHttpService>(() => ClientHttpServiceImp());

    // Datasources
    getIt.registerLazySingleton<GetPokemonDatasourceRemote>(() => GetPokemonDatasourceRemoteImp(getIt()));

    // Repositories
    getIt.registerLazySingleton<GetPokemonsRepository>(() => GetPokemonRepositoryImp(getIt()));

    // Usecases
    getIt.registerLazySingleton<GetPokemonUsecase>(() => GetPokemonUsecaseImp(getIt()));

    // Controllers
    getIt.registerLazySingleton<PokemonController>(() => PokemonController(getIt()));
  }
}