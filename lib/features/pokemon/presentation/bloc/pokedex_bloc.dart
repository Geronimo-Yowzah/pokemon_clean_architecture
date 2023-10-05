
import 'package:bloc/bloc.dart';
import 'package:clean_bloc_pokemon/core/resources/data_state.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/poke.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/usecases/poke_usecase.dart';
import 'package:equatable/equatable.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokeDexBloc extends Bloc<PokeDexEvent, PokeDexState> {
  final PokeUseCase _pokeUseCase;

  PokeDexBloc(this._pokeUseCase) : super(const PokeLoading()) {
    on<Poke>(onPoke);
  }

  void onPoke(Poke event, Emitter <PokeDexState> emit) async {
    final dataState = await _pokeUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
          PokeDone(dataState.data!)
      );
    }
  }
}
