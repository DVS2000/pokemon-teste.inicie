import 'package:dartz/dartz.dart';

abstract class GetDescriptionPokemonUsecase {
  Future<Either<Exception, String>> call({required int id});
}