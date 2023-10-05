part of 'pokedex_bloc.dart';

abstract class PokeDexState extends Equatable {
  final List<PokeEntity>? pokemon;
  final String? error;
  const PokeDexState({this.pokemon,this.error});

  @override
  List<Object> get props => [pokemon!,error!];
}

class PokeLoading extends PokeDexState {
  const PokeLoading();
}

class PokeDone extends PokeDexState {
  const PokeDone(List<PokeEntity> poke) : super(pokemon: poke);
}

class PokeError extends PokeDexState {
  const PokeError(String error) : super(error: error);
}
