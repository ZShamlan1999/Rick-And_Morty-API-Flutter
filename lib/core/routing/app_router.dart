import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home_character/data/models/characters_model.dart';

import '../helpers/strings.dart';
import '../../features/character_details/ui/character_details_screen.dart';
import '../../features/home_character/logic/cubit/characters_cubit.dart';
import '../../features/home_character/ui/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<CharactersCubit>(
                create: (_) => CharactersCubit(),
                child: const CharactersScreen()));
      case AppStrings.characterDetailsScreen:
      final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character: character,));
    }
    return null;
  }
}
