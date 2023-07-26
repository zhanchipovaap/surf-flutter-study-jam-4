import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/magic_ball_bloc.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: BlocBuilder<MagicBallBloc, MagicBallState>(
        builder: (context, state) {
          if (state is MagicBallInitialState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      context
                          .read<MagicBallBloc>()
                          .add(MagicBallLoadinglEvent());
                    },
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
                    style: TextStyle(
                      fontFamily: 'Grillsans',
                      color: Color(0xff727272),
                    )),
              ],
            );
          }
          if (state is MagicBallAnswerState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<MagicBallBloc>()
                              .add(MagicBallLoadinglEvent());
                        },
                        icon: Image.asset(
                          "assets/images/main_ball.png",
                          width: 319,
                          height: 319,
                        )),
                    SizedBox(
                      width: 243,
                      height: 105,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<MagicBallBloc>()
                              .add(MagicBallLoadinglEvent());
                        },
                        child: Text(
                          textAlign: TextAlign.center,
                          state.text,
                          style: const TextStyle(
                            fontSize: 32,
                            fontFamily: 'Grillsans',
                            color: Colors.white,
                          ),
                          softWrap: true,
                          maxLines: 2,
                          // overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/start_elipse.png",
                  width: 202,
                  height: 30,
                ),
                const Text('Нажмите на шар или потрясите телефон',
                    style: TextStyle(
                      fontFamily: 'Grillsans',
                      color: Color(0xff727272),
                    )),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/error_ball.png",
                      width: 319,
                      height: 319,
                    )),
                Image.asset(
                  "assets/images/error_elipse.png",
                  width: 202,
                  height: 30,
                ),
                const Text('Нажмите на шар или потрясите телефон',
                    style: TextStyle(
                      fontFamily: 'Grillsans',
                      color: Color(0xff727272),
                    )),
              ],
            );
          }
        },
      ),
    );
  }
}
