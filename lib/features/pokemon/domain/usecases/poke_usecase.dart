import 'package:clean_bloc_pokemon/core/resources/data_state.dart';
import 'package:clean_bloc_pokemon/core/usecases/usecase.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/poke_entity.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/repository/poke_respository.dart';

class PokeUseCase implements UseCase<DataState<PokeEntity>,String>{

  final PokeRepository _pokeRepository;

  PokeUseCase(this._pokeRepository);

  @override
  Future<DataState<PokeEntity>> call({String? keyword}) {
    return _pokeRepository.getPokemon(keyword ?? '1');
  }

}