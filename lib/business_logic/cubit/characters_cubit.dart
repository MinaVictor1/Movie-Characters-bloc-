// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:breaking_bad/data/models/charactera/charactera.dart';
import 'package:breaking_bad/data/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharacterRepo characterRepo;
  late List<Charactera> characters;

  CharactersCubit(
    this.characterRepo,
  ) : super(CharactersInitial());

  List<Charactera> getcharacters() {
    characterRepo.getCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
