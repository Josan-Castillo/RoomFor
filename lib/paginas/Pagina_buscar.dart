import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/Pagina_resul_busq.dart';
import 'package:flutter_application_1/widgets/appbar_widget.dart';
import 'package:flutter_application_1/paginas/PaginaInicial.dart';

class SearchRoom extends StatefulWidget {
  @override
  _SearchRoomPageState createState() => _SearchRoomPageState();
}

class _SearchRoomPageState extends State<SearchRoom> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  String _radioTipoRoom = '';
  Set<String> _valoresRadio = {'Departamento', 'Cuarto', 'Casa'};
  bool _switchRoomies = false;
  double __sliderValorMin = 1000.0;
  double __sliderValorMax = 20000.0;

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                Text("Tipo de inmueble:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                _crearRadio(),
                _crearSwitch(),
                const SizedBox(height: 20),
                Text("Presupuesto minimo:",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                _crearSliderMini(),
                Text('\$${__sliderValorMin.toInt()}',
                    textAlign: TextAlign.center),
                const SizedBox(height: 15),
                Text(
                    "Presupuesto maximo (asegurate que sea mayor que el minimo):",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                _crearSliderMax(),
                Text('\$${__sliderValorMax.toInt()}',
                    textAlign: TextAlign.center),
                const SizedBox(height: 15),
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
                            builder: (context) => Result(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        primary: Colors.deepOrange[300],
                      ),
                      child: const Text(
                        'Buscar',
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
        width: 50,
        child: VerticalDivider(),
      );

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

  Widget _crearSliderMini() {
    return Row(
      children: [
        Expanded(
          child: Slider(
              value: __sliderValorMin,
              onChanged: (nuevoValor) {
                setState(() {
                  __sliderValorMin = (nuevoValor.toInt()).toDouble();
                });
              },
              label: 'Presupuesto minimo mensual:',
              divisions: 20,
              min: 1000,
              max: 20000),
        )
      ],
    );
  }

  Widget _crearSliderMax() {
    return Row(
      children: [
        Expanded(
          child: Slider(
              value: __sliderValorMax,
              onChanged: (nuevoValor) {
                setState(() {
                  __sliderValorMax = (nuevoValor.toInt()).toDouble();
                });
              },
              label: 'Presupuesto maximo mensual:',
              divisions: 20,
              min: 1000,
              max: 20000),
        )
      ],
    );
  }
}
