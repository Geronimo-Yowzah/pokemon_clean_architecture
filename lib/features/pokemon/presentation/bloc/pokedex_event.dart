part of 'pokedex_bloc.dart';

abstract class PokeDexEvent {
  const PokeDexEvent();
}

class GetPoke extends PokeDexEvent{
  const GetPoke();
}

class GetSearchPoke extends PokeDexEvent{
  final String keyword;
  const GetSearchPoke(this.keyword);
}