// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad/data/API/charactee_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:breaking_bad/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/constant/strings.dart';
import 'package:breaking_bad/data/repo/characters_repo.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:breaking_bad/presentation/screens/charactersdetailes.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  late CharactersCubit characterCubit;

  AppRouter() {
    characterRepo = CharacterRepo(CharacterApi());
    characterCubit = CharactersCubit(characterRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => characterCubit,
                  child: const CharacterScreen(),
                ));
      case characterDetailesscreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
    return null;
  }
}
