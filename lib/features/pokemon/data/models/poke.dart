import 'package:clean_bloc_pokemon/core/constants/constants.dart';
import 'package:clean_bloc_pokemon/features/pokemon/data/models/sub_models.dart';
import 'package:clean_bloc_pokemon/features/pokemon/domain/entities/poke.dart';

class PokeModel extends PokeEntity {
  const PokeModel({
    required String name,
    required int id,
    required SpritesModel sprites,
    required List<TypesModel> types,
  }) : super(
    name: name,
    id: id,
    sprites: sprites,
    types: types,
  );

  factory PokeModel.fromJson(Map<String, dynamic> json) {
    return PokeModel(
      name: json[kName],
      id: json[kId],
      sprites: SpritesModel.fromJson(json[kSprites]),
      types: TypesModel.fromJson(json[kTypes]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kName: name,
      kId: id,
      kSprites: sprites,
      kTypes: types,
    };
  }



}