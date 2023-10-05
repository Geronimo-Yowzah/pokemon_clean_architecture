import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/sub_entities.dart';
import 'package:equatable/equatable.dart';

class PokeEntity extends Equatable{
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

  @override
  List<Object?> get props => [name,id,sprites,types];

}