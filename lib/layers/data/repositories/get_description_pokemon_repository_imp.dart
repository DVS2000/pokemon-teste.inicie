import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_description_pokemon_datasource/get_description_pokemon_datasource.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_description_pokemon_repository.dart';

class GetDescriptionPokemonRepositoryImp implements GetDescriptionPokemonRepository {
  final GetDescriptionPokemonDatasource _getDescriptionPokemonDatasource;

  GetDescriptionPokemonRepositoryImp(this._getDescriptionPokemonDatasource);

  @override
  Future<Either<Exception, String>> call({required int id}) => _getDescriptionPokemonDatasource(id: id);
}