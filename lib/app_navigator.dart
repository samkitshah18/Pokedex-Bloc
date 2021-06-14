import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/nav_cubit.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';
import 'package:pokedex/pokedex_view.dart';
import 'package:pokedex/pokemonDetailsView.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator() : super();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(
      builder: (context, pokemonId) {
        return Navigator(
          pages: [
            MaterialPage(child: PokedexView()),
            if (pokemonId != null) MaterialPage(child: PokemonDetailsView())
          ],
          onPopPage: (route, result){
            BlocProvider.of<NavCubit>(context).popToPokedex();
            return route.didPop(result);
          },
        );
      },
    );
  }
}