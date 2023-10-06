import 'package:bloc/bloc.dart';
import 'package:clean_bloc_pokemon/core/resources/data_state.dart';
import 'package:clean_bloc_pokemon/features/pokemon/data/models/poke_model.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/poke_entity.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/usecases/poke_usecase.dart';
import 'package:equatable/equatable.dart';

part 'pokedex_event.dart';

part 'pokedex_state.dart';

class PokeDexBloc extends Bloc<PokeDexEvent, PokeDexState> {
  final PokeUseCase _pokeUseCase;

  PokeDexBloc(this._pokeUseCase) : super(const PokeLoading()) {
    on<GetPoke>(_onPoke);
    on<GetSearchPoke>(_onSearchPoke);
  }

  void _onPoke(GetPoke event, Emitter<PokeDexState> emit) async {
    final dataState = await _pokeUseCase();

    if (dataState is DataSuccess) {
      emit(PokeDone(dataState.data!,''));
    }
    if (dataState is DataFailed) {
      emit(PokeError(dataState.error!));
    }
  }

  void _onSearchPoke(GetSearchPoke event, Emitter<PokeDexState> emit) async{
    final keyword = event.keyword;
    final dataState = await _pokeUseCase.call(keyword: keyword);
    if (dataState is DataSuccess) {
      emit(PokeDone(dataState.data!,''));
    }
    if (dataState is DataFailed) {
      emit(PokeError(dataState.error!));
    }
  }
}

