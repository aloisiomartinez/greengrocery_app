import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_grocery/src/pages/common_widgets/app_name_widget.dart';
import 'package:green_grocery/src/pages/common_widgets/custom_text_field.dart';
import 'package:green_grocery/src/config/custom_colors.dart';
import 'package:green_grocery/src/pages_routes/app_pages.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome do App
                    const AppNameWidget(
                      greenTitleColor: Colors.white,
                      textSize: 40,
                    ),

                    //Categorias
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                            pause: Duration.zero,
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText("Frutas"),
                              FadeAnimatedText("Verduras"),
                              FadeAnimatedText("Legumes"),
                              FadeAnimatedText("Carnes"),
                              FadeAnimatedText("Cereais"),
                              FadeAnimatedText("Laticíneos"),
                            ]),
                      ),
                    )
                  ],
                ),
              ),

              //Formulário
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        icon: Icons.email,
                        label: "Email",
                        validator: (email) {
                          print("emaill $email");
                          if (email == null || email.isEmpty) {
                            return 'Digite seu email!';
                          }

                          if (!email.isEmail) return 'Digite um email válido!';
                          return null;

                         
                        },
                      ),
                      CustomTextField(
                        icon: Icons.lock,
                        label: "Senha",
                        isSecret: true,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Digite sua senha!';
                          }

                          if (password.length < 7) {
                            return "Digite uma senha com pelo menos 7 caracteres.";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: () {
                              if(_formKey.currentState!.validate()) {
                                print("Todos os campos estão validos");
                              } else {
                                print("Campos não validos");

                              }

                              //Get.offNamed(PagesRoutes.baseRoute);
                            },
                            child: const Text(
                              "Entrar",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                  color: CustomColors.customContrastColor),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text("Ou"),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 2, color: Colors.green),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            onPressed: () {
                              Get.toNamed(PagesRoutes.signUpRoute);
                            },
                            child: const Text(
                              "Criar conta",
                              style: TextStyle(fontSize: 18),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
