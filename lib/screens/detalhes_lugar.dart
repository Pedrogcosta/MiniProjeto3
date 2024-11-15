import 'package:f05_lugares_app/main.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalhesLugarScreen extends StatelessWidget {
  const DetalhesLugarScreen({super.key});

  void _favoritarLugar(BuildContext context, Lugar lugar) {
    Provider.of<FavController>(context, listen: false).favoritoToggle(lugar);
  }

  @override
  Widget build(BuildContext context) {
    final lugar = ModalRoute.of(context)?.settings.arguments as Lugar;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().primaryColor,
        title: Text(
          lugar.titulo,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        // Torna o conteúdo scrollável
        child: Column(
          children: <Widget>[
            // Imagem do lugar
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                lugar.imagemUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Título "Dicas"
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Dicas',
                style: ThemeData().textTheme.displayLarge,
              ),
            ),
            // Lista de recomendações
            Container(
              width: 350,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                shrinkWrap:
                    true, // Impede que a ListView ocupe mais espaço que o necessário
                itemCount: lugar.recomendacoes.length,
                itemBuilder: (contexto, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(lugar.recomendacoes[index]),
                        subtitle: Text(lugar.titulo),
                        onTap: () {
                          print(lugar.recomendacoes[index]);
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Botão flutuante para favoritar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _favoritarLugar(context, lugar);
        },
        child: Icon(Icons.star_border),
      ),
    );
  }
}
