import 'package:breaking_bad/data/API/charactee_service.dart';
import 'package:flutter/material.dart';

import '../../data/repo/characters_repo.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () {
            CharacterRepo(CharacterApi()).getCharacters();
          },
          child: const Text('click')),
    );
  }
}
