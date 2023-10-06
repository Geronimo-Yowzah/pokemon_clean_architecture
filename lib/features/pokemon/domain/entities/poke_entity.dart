import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/sub_entities.dart';

class PokeEntity {
  final String name;
  final int id;
  final SpritesEntity sprites;
  final List<TypesEntity> types;
  const PokeEntity({
    required this.name,
    required this.id,
    required this.sprites,
    required this.types,
  });
}