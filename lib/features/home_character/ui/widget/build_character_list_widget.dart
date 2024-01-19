import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../data/models/characters_model.dart';
import 'character_item.dart';

class BuildCharacterListWidget extends StatelessWidget {
  const BuildCharacterListWidget(
      {super.key,
      required this.characters,
      required this.searchTextController,
      required this.searchedForCharacter});

  final List<Character> characters;
  final List<Character> searchedForCharacter;
  final TextEditingController searchTextController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ColorsManger.grey,
        child: Column(children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: searchTextController.text.isEmpty
                ? characters.length
                : searchedForCharacter.length,
            itemBuilder: (context, index) {
              return CharacterItem(
                character: searchTextController.text.isEmpty
                    ? characters[index]
                    : searchedForCharacter[index],
              );
            },
          )
        ]),
      ),
    );
  }
}
