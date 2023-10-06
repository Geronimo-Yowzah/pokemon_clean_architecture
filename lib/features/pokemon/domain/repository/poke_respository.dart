import 'package:clean_bloc_pokemon/core/resources/data_state.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/poke_entity.dart';

abstract class PokeRepository{

  Future<DataState<PokeEntity>> getPokemon(String id);
}