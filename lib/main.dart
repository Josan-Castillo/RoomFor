import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/paginas/PaginaInicial.dart';
import 'package:flutter_application_1/paginas/PaginaLogin.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:flutter_application_1/themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(PantallaInicial());
}

class PantallaInicial extends StatelessWidget {
  static final String title = 'User Profile';
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'rutaInicial',
          routes: {
            'ruta0': (context) => ProfilePage(),
            'rutaInicial': (context) => PaginaLogin(title: 'Login UI')
          },
          //theme: ThemeProvider.of(context),
          title: title,
          home: PaginaLogin(title: 'Login UI'),
        ),
      ),
    );
  }
}
