import 'dart:io';

import 'package:clean_bloc_pokemon/core/resources/data_state.dart';
import 'package:clean_bloc_pokemon/features/pokemon/data/data_sources/remote/poke_api_service.dart';
import 'package:clean_bloc_pokemon/features/pokemon/data/models/poke_model.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/repository/poke_respository.dart';

class PokeRepositoryImpl implements PokeRepository{
  final PokeAPIService _pokeAPIService;
  PokeRepositoryImpl(this._pokeAPIService);

  @override
  Future<DataState<PokeModel>> getPokemon(String keyword) async {
    final httpResponse = await _pokeAPIService.getPoke(keyword);

    if(httpResponse.response.statusCode == HttpStatus.ok){
      return DataSuccess(httpResponse.data);
    }else{
      return DataFailed(httpResponse.response.statusMessage);
    }
  }
}