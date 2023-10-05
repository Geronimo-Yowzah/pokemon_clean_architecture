import 'package:clean_bloc_pokemon/config/route/app_route.dart';
import 'package:clean_bloc_pokemon/features/pokemon/presentation/bloc/pokedex_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRoute = AppRoute();
    final searchPokemon =
        BlocProvider<PokeDexBloc>(create: (context) => PokeDexBloc());

    return MultiBlocProvider(
        providers: [searchPokemon],
        child: MaterialApp.router(
          routerConfig: appRoute.router,
          title: 'Pokedex',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
        )
    );
  }
}
