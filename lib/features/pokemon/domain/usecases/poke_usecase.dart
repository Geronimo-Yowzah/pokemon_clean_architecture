import 'package:clean_bloc_pokemon/core/resources/data_state.dart';
import 'package:clean_bloc_pokemon/core/usecases/usecase.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/poke.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/repository/poke_respository.dart';

class PokeUseCase implements UseCase<DataState<List<PokeEntity>>,int>{

  final PokeRepository _pokeRepository;

  PokeUseCase(this._pokeRepository);

  @override
  Future<DataState<List<PokeEntity>>> call({int? id}) {
    return _pokeRepository.getPoke(id);
  }

}