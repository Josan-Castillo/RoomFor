import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/Pagina_add_inmu.dart';
import 'package:flutter_application_1/paginas/Pagina_buscar.dart';
import 'package:flutter_application_1/widgets/Profile_widget.dart';
import 'package:flutter_application_1/paginas/user.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/paginas/Pagina_editar_perfil.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:flutter_application_1/widgets/appbar_widget.dart';
import 'package:flutter_application_1/widgets/button_widget.dart';
import 'package:flutter_application_1/widgets/numbers_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 2),
              buildName(user),
              const SizedBox(height: 2),
              NumbersWidget(),
              const SizedBox(height: 2),
              buildAbout(user),
              const SizedBox(height: 2),
              buildRenta(user),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchRoom(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(80, 10, 70, 10),
                  primary: Colors.deepOrange[300],
                ),
                child: const Text(
                  'Realizar una busqueda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddInmu(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(80, 10, 70, 10),
                  primary: Colors.deepOrange[300],
                ),
                child: const Text(
                  'Añadir inmueble',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 3),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Requisitos de busqueda',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildRenta(User user) => Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tu inmueble en renta actual',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/inmueble.png',
                  height: 200,
                  width: 220,
                ),
                const SizedBox(height: 3),
                buildDivider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.deepOrange[300],
                      iconSize: 40,
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Cancelar la renta'),
                          content: const Text(
                              '¿Seguro que desea cancelar la renta? Tendra 1 semana para desalojar'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Cancelar'),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Aceptar'),
                              child: const Text('Aceptar'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.call),
                      color: Colors.deepOrange[300],
                      iconSize: 40,
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Llamar al dueño'),
                          content:
                              const Text('¿Seguro que desea llamar al dueño?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Cancelar'),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Aceptar'),
                              child: const Text('Aceptar'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.payment),
                      color: Colors.deepOrange[300],
                      iconSize: 40,
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Pagar renta del mes de junio'),
                          content:
                              const Text('¿Seguro que desea pagar la renta?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Cancelar'),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Aceptar'),
                              child: const Text('Aceptar'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              'El proximo pago de tu renta es el 10 de junio: \$3200.00',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 1),
          ],
        ),
      );

  Widget buildDivider() => Container(
        height: 170,
        width: 80,
        child: VerticalDivider(),
      );
}
