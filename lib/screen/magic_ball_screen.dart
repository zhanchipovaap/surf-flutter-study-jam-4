import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../bloc/bloc/magic_ball_bloc.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        context.read<MagicBallBloc>().add(MagicBallLoadinglEvent());
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );

    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.centerStart,
      backgroundColor: Theme.of(context).disabledColor,
      body: BlocBuilder<MagicBallBloc, MagicBallState>(
        builder: (context, state) {
          if (state is MagicBallInitialState) {
            return Center(
              child: Column(
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
                        width: !kIsWeb ? 319 : 665,
                        height: !kIsWeb ? 319 : 665,
                      )),
                  Image.asset(
                    "assets/images/start_elipse.png",
                    width: !kIsWeb ? 202 : 551,
                    height: !kIsWeb ? 30 : 95,
                  ),
                  // const SizedBox(
                  //   height: 50, //<-- SEE HERE
                  // ),
                  const Text(
                    kIsWeb
                        ? 'Нажмите на шар'
                        : 'Нажмите на шар или потрясите телефон',
                    style: TextStyle(
                      fontSize: !kIsWeb ? 16 : 32,
                      fontFamily: 'Grillsans',
                      color: Color(0xff727272),
                    ),
                    softWrap: true,
                    maxLines: 2,
                  ),
                ],
              ),
            );
          }
          if (state is MagicBallAnswerState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            width: !kIsWeb ? 319 : 665,
                            height: !kIsWeb ? 319 : 665,
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
                              fontSize: !kIsWeb ? 16 : 32,
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
                    width: !kIsWeb ? 202 : 551,
                    height: !kIsWeb ? 30 : 95,
                  ),
                  const Text(
                      !kIsWeb
                          ? 'Нажмите на шар или потрясите телефон'
                          : 'Нажмите на шар',
                      style: TextStyle(
                        fontSize: !kIsWeb ? 16 : 32,
                        fontFamily: 'Grillsans',
                        color: Color(0xff727272),
                      )),
                ],
              ),
            );
          }
          if (state is MagicBallErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<MagicBallBloc>()
                            .add(MagicBallLoadinglEvent());
                      },
                      icon: Image.asset(
                        "assets/images/error_ball.png",
                        width: !kIsWeb ? 319 : 665,
                        height: !kIsWeb ? 319 : 665,
                      )),
                  Image.asset(
                    "assets/images/error_elipse.png",
                    width: !kIsWeb ? 202 : 551,
                    height: !kIsWeb ? 30 : 95,
                  ),
                  const Text(
                      !kIsWeb
                          ? 'Нажмите на шар или потрясите телефон'
                          : 'Нажмите на шар',
                      style: TextStyle(
                        fontSize: !kIsWeb ? 16 : 32,
                        fontFamily: 'Grillsans',
                        color: Color(0xff727272),
                      )),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
