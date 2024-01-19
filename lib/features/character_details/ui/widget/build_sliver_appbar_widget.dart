import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../home_character/data/models/characters_model.dart';

class BuildSliverAppBarWidget extends StatelessWidget {
  const BuildSliverAppBarWidget({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: ColorsManger.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(color: ColorsManger.white),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
