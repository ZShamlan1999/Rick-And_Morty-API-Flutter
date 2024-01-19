import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theming/colors.dart';
import '../data/models/characters_model.dart';
import '../logic/cubit/characters_cubit.dart';
import '../logic/cubit/characters_state.dart';
import 'widget/build_character_list_widget.dart';
import 'widget/show_loaded_indicator.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> characters = [];
  List<Character> searchedForCharacter = [];
  bool isSearched = false;
  TextEditingController searchTextController = TextEditingController();

  Future<void> fetchAllCharacter() async {
    List<Character> fetchedCharacters =
        await BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    setState(() {
      characters = fetchedCharacters;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManger.yellow,
          title: isSearched ? _buildSearchField() : _buildAppBarTitle(),
          actions: _buildAppBarActions(),
          leading: isSearched
              ? const BackButton(
                  color: ColorsManger.grey,
                )
              : Container(),
        ),
        body:
            // OfflineBuilder(
            // connectivityBuilder: (context, value, child) {
            //   final bool connected = value != ConnectivityResult.none;
            //  if (connected) {
            //  return
            BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is Success) {
              return BuildCharacterListWidget(
                characters: characters,
                searchTextController: searchTextController,
                searchedForCharacter: searchedForCharacter,
              );
            } else {
              return const ShowLoadedIndicator();
            }
          },
        )
        //   }
        // else {
        //   return const BuildNoInternetWidget();
        // }
        //  },
        //   child: const ShowLoadedIndicator(),
        // ),
        );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: ColorsManger.grey,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: ColorsManger.grey, fontSize: 18),
      ),
      style: const TextStyle(color: ColorsManger.grey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacter = characters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearched) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear, color: ColorsManger.grey))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(Icons.search, color: ColorsManger.grey))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearched = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearched = false;
    });
  }

  void _clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  Widget _buildAppBarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: ColorsManger.grey),
    );
  }
}
