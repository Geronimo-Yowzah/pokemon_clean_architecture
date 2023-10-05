import 'package:clean_bloc_pokemon/core/resources/data_state.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/poke.dart';

abstract class PokeRepository{

  Future<DataState<List<PokeEntity>>> getPoke(int? id);
}