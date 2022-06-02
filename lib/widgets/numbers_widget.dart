import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '4.8', 'Calificacion'),
          buildDivider(),
          buildButton(context, '35', 'Rentas'),
          buildDivider(),
          buildButton(context, '50', 'Inquilinos'),
        ],
      );

  Widget buildDivider() => Container(
        height: 25,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 3),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1),
          ],
        ),
      );
}
