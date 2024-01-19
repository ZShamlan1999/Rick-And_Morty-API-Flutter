import 'package:flutter/material.dart';
import 'widget/build_divider_widget.dart';
import 'widget/build_sliver_appbar_widget.dart';
import 'widget/character_Info_widget.dart';
import '../../home_character/data/models/characters_model.dart';
import '../../../core/theming/colors.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.grey,
      body: CustomScrollView(slivers: [
        BuildSliverAppBarWidget(character: character),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharacterInfoWidget(title: 'Name : ', value: character.name),
                  const BuildDividerWidget(endIndent: 315),
                  CharacterInfoWidget(
                      title: 'Gender : ', value: character.gender),
                  const BuildDividerWidget(endIndent: 250),
                  CharacterInfoWidget(
                      title: 'Status : ', value: character.status),
                  const BuildDividerWidget(endIndent: 300),
                  CharacterInfoWidget(
                      title: 'Species : ', value: character.species),
                  const BuildDividerWidget(endIndent: 300),
                  const SizedBox(height: 20),
                ]),
          ),
          const SizedBox(height: 500),
        ]))
      ]),
    );
  }
}
