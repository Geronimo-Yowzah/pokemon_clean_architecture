import 'package:clean_bloc_pokemon/features/pokemon/data/models/poke_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'poke_api_service.g.dart';

@RestApi(baseUrl:'https://pokeapi.co/api/v2/')
abstract class PokeAPIService {
  factory PokeAPIService(Dio dio) = _PokeAPIService;

  @GET('pokemon/{keyword}')
  Future<HttpResponse<PokeModel>> getPoke(@Path('keyword') String keyword);
}
