import 'package:f05_lugares_app/data/dados.dart';
import 'package:f05_lugares_app/main.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController paisesController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController avaliacaoController = TextEditingController();
  final TextEditingController custoMedioController = TextEditingController();
  final TextEditingController recomendacoesController = TextEditingController();
  final TextEditingController imageurlController = TextEditingController();

  List<String> paisesSelecionados = [];
  List<String> recomendacoes = [];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    List<Pais> listaPaises =
        Provider.of<PaisProvider>(context, listen: false).Paises;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().primaryColor,
        title: const Text(
          'Cadastro',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Cadastro de Lugares',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Cadastre um objeto',
                  style: TextStyle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Nome',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: tituloController,
                  style: theme.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Digite aqui',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um nome';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Países
                const Text(
                  'Países - Scroll',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: listaPaises.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(listaPaises[index].titulo),
                        value:
                            paisesSelecionados.contains(listaPaises[index].id),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              paisesSelecionados.add(listaPaises[index].id);
                            } else {
                              paisesSelecionados.remove(listaPaises[index].id);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Descrição',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: paisesController,
                  style: theme.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Digite aqui',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma descrição';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                const Text(
                  'Recomendações',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: recomendacoesController,
                        decoration: const InputDecoration(
                          labelText: 'Adicione uma recomendação',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          if (recomendacoesController.text.isNotEmpty) {
                            recomendacoes.add(recomendacoesController.text);
                            recomendacoesController.clear();
                          }
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: recomendacoes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(recomendacoes[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            recomendacoes.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                const Text(
                  'URL da imagem',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: imageurlController,
                  style: theme.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Insira a URL aqui',
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Avaliação',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: avaliacaoController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: theme.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Insira a avaliação',
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Custo Médio',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: custoMedioController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: theme.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    labelText: 'Insira o valor aqui',
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double avaliacao =
                            double.tryParse(avaliacaoController.text) ?? 0.0;
                        double custoMedio =
                            double.tryParse(custoMedioController.text) ?? 0.0;
                        String imageUrl = imageurlController.text.isNotEmpty
                            ? imageurlController.text
                            : 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png';

                        Provider.of<LugarController>(context, listen: false)
                            .adicionarLugar(
                          paisesSelecionados,
                          tituloController.text,
                          avaliacao,
                          custoMedio,
                          recomendacoes,
                          imageUrl,
                        );

                        Navigator.pushNamed(context, '/');

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Lugar Adicionado!'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Cadastrar',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
