import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formularios_guide/app/core/models/user_model.dart';

import 'package:formularios_guide/app/widgets/g_button.dart';

class ReviewPage extends StatefulWidget {
  final UserModel model;

  const ReviewPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text("Saldo"),
                  subtitle: Text(widget.model.saldo),
                ),
                ListTile(
                  title: const Text("Nome"),
                  subtitle: Text(widget.model.nome),
                ),
                ListTile(
                  title: const Text("CPF"),
                  subtitle: Text(widget.model.cpf),
                ),
                ListTile(
                  title: const Text("Email"),
                  subtitle: Text(widget.model.email),
                ),
                ListTile(
                  title: const Text("Senha"),
                  subtitle: Text(widget.model.password),
                ),
                const SizedBox(height: 50.0),
                GButton(
                  text: "Salvar",
                  color: Colors.deepPurple,
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Salvo com sucesso!',
                        ),
                      ),
                    );
                  },
                )
              ],
            )),
      ),
    );
  }
}
