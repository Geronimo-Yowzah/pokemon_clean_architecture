import 'package:clean_bloc_pokemon/features/pokemon/data/data_sources/remote/poke_api_service.dart';
import 'package:clean_bloc_pokemon/features/pokemon/data/repository/poke_repository_impl.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/repository/poke_respository.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/usecases/poke_usecase.dart';
import 'package:clean_bloc_pokemon/features/pokemon/presentation/bloc/pokedex_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<PokeAPIService>(PokeAPIService(sl()));

  sl.registerSingleton<PokeRepository>(
      PokeRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<PokeUseCase>(
      PokeUseCase(sl())
  );



  //Blocs
  sl.registerFactory<PokeDexBloc>(
          ()=> PokeDexBloc(sl())
  );

}