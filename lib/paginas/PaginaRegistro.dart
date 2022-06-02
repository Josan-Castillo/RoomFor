import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/PaginaLogin.dart';

class PaginaRegistro extends StatefulWidget {
  const PaginaRegistro({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PaginaRegistro> createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
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
                cacheHeight: 250,
              ),
              const SizedBox(
                height: 1,
              ),
              const Text(
                'Creación de cuenta',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  height: 3,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) =>
                                EmailValidator.validate(value!)
                                    ? null
                                    : "Por favor, ingresa un nombre valido",
                            maxLines: 1,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepOrange, width: 2.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepOrange),
                              ),
                              hintText: 'Nombre(s)',
                              prefixIcon: const Icon(Icons.person,
                                  color: Colors.deepOrange),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) =>
                                EmailValidator.validate(value!)
                                    ? null
                                    : "Por favor, ingresa un apellido valido",
                            maxLines: 1,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepOrange, width: 2.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.deepOrange),
                              ),
                              hintText: 'Apellidos',
                              prefixIcon: const Icon(Icons.person,
                                  color: Colors.deepOrange),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                        primary: Colors.deepOrange,
                      ),
                      child: const Text(
                        'Crear cuenta',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('¿Ya estás registrado?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PaginaLogin(title: 'Login UI'),
                              ),
                            );
                          },
                          child: const Text('Inicia sesión'),
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
