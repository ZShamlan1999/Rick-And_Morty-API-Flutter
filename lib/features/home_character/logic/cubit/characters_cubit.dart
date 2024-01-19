import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/strings.dart';
import '../../data/models/characters_model.dart';
import 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  Character? character;
  CharactersCubit() : super(const CharactersState.initial());

  final dio = Dio();

  Future<List<Character>> getAllCharacters() async {
    List<Character> characters = [];
    try {
      emit(const CharactersState.loading());
      Response response =
          await dio.get(AppStrings.baseUrl + AppStrings.character);
      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        characters = results
            .map((characterJson) => Character.fromJson(characterJson))
            .toList();
        emit(CharactersState.success(results));
      }
    } catch (e) {
      emit(CharactersState.error(error: 'Error fetching characters: $e'));
    }
    return characters;
  }
}
