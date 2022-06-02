import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/user.dart';
import 'package:flutter_application_1/widgets/Profile_widget.dart';
import 'package:flutter_application_1/utils/user_preferences.dart';
import 'package:flutter_application_1/widgets/appbar_widget.dart';
import 'package:flutter_application_1/widgets/text_field_widget.dart';
import 'package:flutter_application_1/paginas/PaginaInicial.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  String nuevoNombre = ' ';
  String nuevoEmail = ' ';
  String nuevoAbout = ' ';

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Nombre',
                  text: user.name,
                  onChanged: (name) {
                    nuevoNombre = name;
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {
                    nuevoEmail = email;
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Requisitos de busqueda',
                  text: user.about,
                  maxLines: 5,
                  onChanged: (about) {
                    nuevoAbout = about;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    //user.name = nuevoNombre;
                    //user.email = nuevoEmail;
                    //user.about = nuevoAbout;
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    primary: Colors.deepOrange[300],
                  ),
                  child: const Text(
                    'Guardar cambios',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
