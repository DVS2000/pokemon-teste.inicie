import 'package:dartz/dartz.dart';

abstract class GetDescriptionPokemonRepository {
  Future<Either<Exception, String>> call({required int id});
}