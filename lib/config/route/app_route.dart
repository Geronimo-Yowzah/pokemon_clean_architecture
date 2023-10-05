
import 'package:clean_bloc_pokemon/features/pokemon/presentation/pages/home.dart';
import 'package:clean_bloc_pokemon/features/pokemon/presentation/pages/search_pokemon.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
            name: 'home',
            path: '/',
            builder: (context, state) => const MyHomePage(title: 'Pokedex')
        ),
          GoRoute(
            name: 'searchPokemon',
            path: '/search',
            builder: (context, state) => const SearchPokemonPage(title: 'Pokedex')
          )
      ]
  );
}
