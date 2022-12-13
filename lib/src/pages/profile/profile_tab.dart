import 'package:flutter/material.dart';
import 'package:green_grocery/src/pages/common_widgets/custom_text_field.dart';
import 'package:green_grocery/src/config/app_data.dart' as appData;

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            initialValue: appData.user.email,
            icon: Icons.email,
            label: 'Email',
            readOnly: true,
          ),
          CustomTextField(
            initialValue: appData.user.name,
            icon: Icons.person,
            label: 'Nome',
            readOnly: true,
          ),
          CustomTextField(
            initialValue: appData.user.phone,
            icon: Icons.phone,
            label: 'Celular',
            readOnly: true,
          ),
          CustomTextField(
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            readOnly: true,
          ),
          SizedBox(
              height: 50,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: const Text('Atualizar senha')))
        ],
      ),
    );
  }
}
