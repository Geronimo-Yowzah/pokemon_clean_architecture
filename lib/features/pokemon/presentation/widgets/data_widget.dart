import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/poke_entity.dart';
import 'package:clean_bloc_pokemon/features/pokemon/presentation/widgets/poke_images_data_widget.dart';
import 'package:flutter/material.dart';

class DataWidget extends StatefulWidget {
  DataWidget({super.key, required this.pokemon});

  PokeEntity pokemon;

  @override
  State<DataWidget> createState() => _DataWidget();
}

class _DataWidget extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
    return PokeImagesDataWidget(
      picUrl: widget.pokemon.sprites.other.officialArtwork.frontDefault,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: SingleChildScrollView(
                child: FittedBox(
                  child: Text(
                    '#${widget.pokemon.id} ${widget.pokemon.name.toUpperCase()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      shadows: <Shadow>[
                        Shadow(
                          blurRadius: 20.0,
                          color: Colors.black45,
                        ),
                      ],
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 5,
              runSpacing: 5,
              children: List.generate(
                widget.pokemon.types.length,
                (index) => Chip(
                  backgroundColor: Colors.white,
                  label: Text(
                    widget.pokemon.types
                        .elementAt(index)
                        .type
                        .name
                        .toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
