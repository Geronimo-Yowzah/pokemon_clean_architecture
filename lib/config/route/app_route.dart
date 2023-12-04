import 'package:clean_bloc_pokemon/features/pokemon/presentation/pages/bar_chart.dart';
import 'package:clean_bloc_pokemon/features/pokemon/presentation/pages/home.dart';
import 'package:clean_bloc_pokemon/features/pokemon/presentation/pages/line_chart.dart';
import 'package:clean_bloc_pokemon/features/pokemon/presentation/pages/pie_chart.dart';
import 'package:clean_bloc_pokemon/features/pokemon/presentation/pages/search_pokemon.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const MyHomePage(title: 'Pokedex')),
    GoRoute(
        name: 'searchPokemon',
        path: '/search',
        builder: (context, state) => const SearchPokemonPage(title: 'Pokedex')),
    GoRoute(
        name: 'BarChart',
        path: '/barchart',
        builder: (context, state) => const BarChartPage(title: 'Bar Chart')),
    GoRoute(
        name: 'PieChart',
        path: '/piechart',
        builder: (context, state) => const PieChartPage(title: 'Pie Chart')),
    GoRoute(
        name: 'LineChart',
        path: '/linechart',
        builder: (context, state) => const LineChartPage(title: 'Line Chart')),
  ]);
}
