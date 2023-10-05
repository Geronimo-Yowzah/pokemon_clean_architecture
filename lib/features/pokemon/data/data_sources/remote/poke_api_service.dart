import 'package:clean_bloc_pokemon/features/pokemon/data/models/poke.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'poke_api_service.g.dart';

@RestApi(baseUrl:'https://pokeapi.co/api/v2')
abstract class PokeAPIService {
  factory PokeAPIService(Dio dio) = _PokeAPIService;

  @GET('/pokemon/{id}')
  Future<HttpResponse<List<PokeModel>>> getPoke(@Path('id') int id);
}
