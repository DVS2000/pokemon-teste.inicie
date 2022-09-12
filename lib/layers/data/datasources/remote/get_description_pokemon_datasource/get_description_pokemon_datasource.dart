import 'package:dartz/dartz.dart';

abstract class GetDescriptionPokemonDatasource {
  Future<Either<Exception, String>> call({required int id});
}