import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/Pagina_resul_busq.dart';
import 'package:flutter_application_1/widgets/appbar_widget.dart';
import 'package:flutter_application_1/paginas/PaginaInicial.dart';

class AddInmu extends StatefulWidget {
  @override
  _AddInmuPageState createState() => _AddInmuPageState();
}

class _AddInmuPageState extends State<AddInmu> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  String _radioTipoRoom = '';
  Set<String> _valoresRadio = {'Departamento', 'Cuarto', 'Casa'};
  bool _switchRoomies = false;

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                _pedirEncabezado(),
                Divider(
                  color: Colors.transparent,
                  thickness: 5,
                ),
                _pedirDescripcion(),
                Divider(
                  color: Colors.transparent,
                  thickness: 5,
                ),
                buildDivider(),
                Divider(
                  color: Colors.transparent,
                  thickness: 5,
                ),
                _pedirCosto(),
                Divider(
                  color: Colors.transparent,
                  thickness: 5,
                ),
                Text("Tipo de inmueble:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                _crearRadio(),
                _crearSwitch(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        primary: Colors.deepOrange[300],
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    buildDivider(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        primary: Colors.deepOrange[300],
                      ),
                      child: const Text(
                        'Añadir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildDivider() => Container(
        height: 0,
        width: 40,
        color: Colors.transparent,
        child: VerticalDivider(),
      );

  Widget _pedirEncabezado() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      maxLength: 20,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          // Establece un borde cicular/otro  alrededor de la caja de texto
          borderRadius: BorderRadius.circular(15.0),
        ),
        counterText:
            'Número de caracteres: 0', // Texto que aparece a la derecha y debajo de la caja
        hintText:
            'Encabezado', // Texto que aparece dentro de la caja y desaparece al escribir
        labelText:
            'Encabezado del inmueble', // Texto qye aparece encima de la caja AL PULSAR EN EL INTERIOR PARA ESCRIBIR
        helperText:
            'Introduce el encabezado de tu inmueble', // Texto que aparece a la izquierda y abajo de la caja
        suffixIcon: Icon(
            Icons.home), // Widget que aparece a la derecha dentro de la caja
      ),
    );
  }

  Widget _pedirDescripcion() {
    return TextField(
        textCapitalization: TextCapitalization.words,
        maxLength: 300,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              // Establece un borde cicular/otro  alrededor de la caja de texto
              borderRadius: BorderRadius.circular(15.0),
            ),
            counterText:
                'Número de caracteres: 0', // Texto que aparece a la derecha y debajo de la caja
            hintText:
                'Descripcion', // Texto que aparece dentro de la caja y desaparece al escribir
            labelText:
                'Descripcion del inmueble', // Texto qye aparece encima de la caja AL PULSAR EN EL INTERIOR PARA ESCRIBIR
            helperText:
                'Introduce la descripcion de tu inmueble', // Texto que aparece a la izquierda y abajo de la caja
            suffixIcon: Icon(Icons
                .featured_play_list_outlined) // Widget que aparece a la derecha dentro de la caja),
            ));
  }

  Widget _pedirCosto() {
    return TextField(
        textCapitalization: TextCapitalization.words,
        maxLength: 5,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            // Establece un borde cicular/otro  alrededor de la caja de texto
            borderRadius: BorderRadius.circular(15.0),
          ), // Texto que aparece a la derecha y debajo de la caja
          hintText:
              'Costo', // Texto que aparece dentro de la caja y desaparece al escribir
          labelText:
              'Costo de la renta mensual del inmueble', // Texto qye aparece encima de la caja AL PULSAR EN EL INTERIOR PARA ESCRIBIR
          helperText:
              'Introduce el costo de la renta mensual del inmueble', // Texto que aparece a la izquierda y abajo de la caja
          suffixIcon: Icon(Icons
                  .monetization_on // Widget que aparece a la derecha dentro de la caja
              ),
        ));
  }

  Widget _crearRadio() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _elemsRadio(),
    );
  }

  List<Widget> _elemsRadio() {
    List<Widget> lista = [];
    _valoresRadio.forEach((element) {
      RadioListTile r = RadioListTile(
        activeColor: Colors.deepOrange[600],
        title: Text(element),
        value: element,
        groupValue: _radioTipoRoom,
        onChanged: (valor) {
          setState(() {
            _radioTipoRoom = valor;
          });
        },
      );
      lista.add(r);
    });
    return lista;
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Roomies'),
        subtitle: Text('Indica si el inmueble lo quieres con roomies'),
        secondary: Icon(Icons.group_sharp),
        value: _switchRoomies,
        activeColor: Colors.deepOrange[600],
        onChanged: (valor) {
          setState(() {
            _switchRoomies = valor;
          });
        });
  }
}
