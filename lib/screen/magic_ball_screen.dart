import 'package:flutter/material.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/start_ball.png",
              width: 319,
              height: 319,
            )),
        Image.asset(
          "assets/images/start_elipse.png",
          width: 202,
          height: 30,
        ),
        const Text('Нажмите на шар или потрясите телефон',
            style: TextStyle(fontFamily: 'Grillsans', color: Color(0xff727272), )),
      ]),
    );
  }
}