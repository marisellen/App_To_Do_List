import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _phoneController = TextEditingController();
  final _mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Chave para o formulário

  @override
  void initState() {
    super.initState();
    // Preenchendo os campos com dados de exemplo no formato DDI + DDD + Número
    _phoneController.text = '+55 (11) 1234-5678'; // Telefone fixo
    _mobileController.text = '+55 (11) 98765-4321'; // Telefone celular
  }

  void _clearFields() {
    setState(() {
      _phoneController.clear();
      _mobileController.clear();
    });
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      // Exibir a mensagem de sucesso quando a validação estiver ok
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Alteração feita com sucesso!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(168, 204, 171, 244),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contato"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Atribui a chave do formulário
          child: Column(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Telefone Fixo'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha o telefone fixo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _mobileController,
                decoration:
                    const InputDecoration(labelText: 'Telefone Celular'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha o telefone celular';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _clearFields,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 123, 126, 122),
                      foregroundColor: Colors.white,
                      minimumSize:
                          const Size(10, 30), // Largura e altura do botão
                    ),
                    child: const Text('Limpar'),
                  ),
                  const SizedBox(width: 10), // Espaçamento entre os botões
                  ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(168, 204, 171, 244),
                      foregroundColor: Colors.white,
                      minimumSize:
                          const Size(30, 35), // Largura e altura do botão
                    ),
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
