import 'package:json_annotation/json_annotation.dart';

part 'characters_model.g.dart';

@JsonSerializable()
class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final Map<String, dynamic> origin;
  final Map<String, dynamic> location;
  final String image;
  final List<dynamic> episode;
  final String url;
  final DateTime created;

  Character(
      this.id,
      this.name,
      this.status,
      this.species,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created
      );

  factory Character.fromJson(json) => _$CharacterFromJson(json);
}
