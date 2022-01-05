import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formularios_guide/app/core/masks/cpf_mask.dart';
import 'package:formularios_guide/app/core/masks/money_mask.dart';
import 'package:formularios_guide/app/core/models/user_model.dart';
import 'package:formularios_guide/app/pages/review_page.dart';
import 'package:formularios_guide/app/widgets/g_button.dart';
import 'package:formularios_guide/app/widgets/g_textfield.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  var user = const UserModel();

  var cachedPassword = "";
  var cachedConfirmPassword = "";

  var obscureTextPassword = true;
  var obscureTextConfirmPassword = true;
  bool checkTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GTextfield(
                  label: "Saldo",
                  prefixIcon: const Icon(Icons.attach_money),
                  inputFormatters: [MoneyMask()],
                  keyboardType: TextInputType.number,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Este campo deve ser preenchido";
                    }
                  },
                  onSaved: (text) => user = user.copyWith(saldo: text),
                ),
                GTextfield(
                  label: "Nome",
                  prefixIcon: const Icon(Icons.person_outline),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Este campo deve ser preenchido";
                    }
                  },
                  onSaved: (text) => user = user.copyWith(nome: text),
                ),
                GTextfield(
                  label: "CPF",
                  inputFormatters: [
                    CpfMask(mask: "###.###.###-##"),
                  ],
                  keyboardType: TextInputType.number,
                  prefixIcon: const Icon(Icons.format_list_numbered),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Este campo deve ser preenchido";
                    }
                  },
                  onSaved: (text) => user = user.copyWith(cpf: text),
                ),
                GTextfield(
                  keyboardType: TextInputType.emailAddress,
                  label: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Este campo deve ser preenchido";
                    }
                    if (!string_validator.isEmail(text)) {
                      return "Este campo deve ser um email";
                    }
                  },
                  onSaved: (text) => user = user.copyWith(email: text),
                ),
                GTextfield(
                  obscureText: obscureTextPassword,
                  label: "Senha",
                  prefixIcon: const Icon(Icons.vpn_key_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureTextPassword = !obscureTextPassword;
                        });
                      },
                      icon: Icon((obscureTextPassword)
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Este campo deve ser preenchido";
                    }
                  },
                  onSaved: (text) => user = user.copyWith(password: text),
                  onChanged: (text) => cachedPassword = text!,
                ),
                GTextfield(
                  obscureText: obscureTextConfirmPassword,
                  label: "Confirmar senha",
                  prefixIcon: const Icon(Icons.vpn_key_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureTextConfirmPassword =
                              !obscureTextConfirmPassword;
                        });
                      },
                      icon: Icon((obscureTextConfirmPassword)
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Este campo deve ser preenchido";
                    }
                    if (cachedConfirmPassword != cachedPassword) {
                      return "As senhas não conferem";
                    }
                  },
                  onSaved: (text) => user = user.copyWith(password: text),
                  onChanged: (text) => cachedConfirmPassword = text!,
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.deepPurple,
                        value: checkTerms,
                        onChanged: (value) {
                          setState(() {
                            checkTerms = value!;
                          });
                        }),
                    const Text(
                      "Aceitar termos de condição",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30.0),
                GButton(
                    text: "Confirmar",
                    color: Colors.deepPurple,
                    onTap: !checkTerms
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReviewPage(model: user)),
                              );
                            }
                          }),
                const SizedBox(height: 20.0),
                GButton(
                  text: "Resetar",
                  color: Colors.redAccent,
                  onTap: () {
                    formKey.currentState?.reset();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
