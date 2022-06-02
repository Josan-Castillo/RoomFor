import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/PaginaInicial.dart';
import 'package:flutter_application_1/paginas/PaginaRegistro.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PaginaLogin> createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                height: 250,
              ),
              const Text(
                'Inicio de sesión',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  height: 3,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Por favor, ingresa un correo valido",
                      maxLines: 1,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepOrange),
                        ),
                        hintText: 'Ingresa tu correo',
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu contraseña';
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepOrange),
                        ),
                        prefixIcon:
                            const Icon(Icons.lock, color: Colors.deepOrange),
                        hintText: 'Ingresa tu contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text("Recuerdame"),
                      contentPadding: EdgeInsets.zero,
                      value: rememberValue,
                      activeColor: Colors.deepOrange[600],
                      onChanged: (newValue) {
                        setState(() {
                          rememberValue = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                        primary: Colors.deepOrange,
                      ),
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('¿Aún no estás registrado?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PaginaRegistro(title: 'Register UI'),
                              ),
                            );
                          },
                          child: const Text('Crea una cuenta'),
                          style: TextButton.styleFrom(
                            primary: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
