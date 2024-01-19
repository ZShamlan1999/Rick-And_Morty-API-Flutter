// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['id'] as int,
      json['name'] as String,
      json['status'] as String,
      json['species'] as String,
      json['gender'] as String,
      json['origin'] as Map<String, dynamic>,
      json['location'] as Map<String, dynamic>,
      json['image'] as String,
      json['episode'] as List<dynamic>,
      json['url'] as String,
      DateTime.parse(json['created'] as String),
    );
