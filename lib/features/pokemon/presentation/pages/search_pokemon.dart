import 'package:clean_bloc_pokemon/features/pokemon/presentation/bloc/pokedex_bloc.dart';
import 'package:clean_bloc_pokemon/features/pokemon/presentation/widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({super.key, required this.title});

  final String title;

  @override
  State<SearchPokemonPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchPokemonPage> {
  TextEditingController _controller = TextEditingController();
  bool isShiny = false;

  @override
  void initState() {
    context.read<PokeDexBloc>().add(const GetPoke());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokeDexBloc, PokeDexState>(
      builder: (context, state) {
        final data = state.pokemon;
        if (state is PokeLoading) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text(
                widget.title,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
              leading: GestureDetector(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  context.go('/');
                },
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PokeDone) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text(
                widget.title,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
              leading: GestureDetector(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  context.go('/');
                },
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Search Pokemon by Name or ID....',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                context
                                    .read<PokeDexBloc>()
                                    .add(GetSearchPoke(_controller.text));
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onChanged: (query) {},
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isShiny,
                      activeColor: Colors.red,
                      onChanged: (newBool) {
                        setState(() {
                          isShiny = newBool!;
                        });
                      },
                    ),
                const Text('Is Shiny'),
                  ],
                ),
                Expanded(
                  child: DataWidget(
                    pokemon: data!,
                    isShiny: isShiny,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
