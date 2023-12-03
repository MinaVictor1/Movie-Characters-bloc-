import 'package:breaking_bad/data/API/charactee_service.dart';
import 'package:breaking_bad/data/models/charactera/charactera.dart';

class CharacterRepo {
  final CharacterApi characterApi;
  CharacterRepo(this.characterApi);
  Future<List<Charactera>> getCharacters() async {
    final characters = await characterApi.getCharacters();
    print(
        characters.map((character) => Charactera.fromJson(character)).toList());
    return characters
        .map((character) => Charactera.fromJson(character))
        .toList();
  }
}
