import 'package:f05_lugares_app/components/item_lugar.dart';
import 'package:f05_lugares_app/main.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavController>(builder: (context, favcontroller, child) {
      if (favcontroller.favLugares.isEmpty) {
        return const Center(
          child: Text(
            'Nenhum Lugar Marcado como Favorito!',
            style: TextStyle(fontSize: 20),
          ),
        );
      } else {
        return ListView.builder(
            itemCount: favcontroller.favLugares.length,
            itemBuilder: (ctx, index) {
              return ItemLugar(
                lugar: favcontroller.favLugares.elementAt(index),
              );
            });
      }
    });
  }
}
