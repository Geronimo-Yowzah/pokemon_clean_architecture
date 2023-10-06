part of 'pokedex_bloc.dart';

abstract class PokeDexState extends Equatable {
  final PokeEntity? pokemon;
  final String? error;
  const PokeDexState({this.pokemon,this.error});

  @override
  List<Object> get props => [pokemon!,error!];
}

class PokeLoading extends PokeDexState {
  const PokeLoading();
}

class PokeDone extends PokeDexState {
  const PokeDone(PokeEntity poke,String error) : super(pokemon: poke,error: error);
}

class PokeError extends PokeDexState {
  const PokeError(String error) : super(error: error);
}
