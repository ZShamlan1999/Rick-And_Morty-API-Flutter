import 'package:flutter/material.dart';

import '../../../../core/helpers/strings.dart';
import '../../../../core/theming/colors.dart';
import '../../data/models/characters_model.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: ColorsManger.white, borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
            context, AppStrings.characterDetailsScreen,
            arguments: character),
        child: GridTile(
          footer: Hero(
            tag: character.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name.toString(),
                style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: ColorsManger.white,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: ColorsManger.grey,
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: character.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const Center(
                    child: Text('Not Image'),
                  ),
          ),
        ),
      ),
    );
  }
}
