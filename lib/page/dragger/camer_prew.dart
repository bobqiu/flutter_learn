import 'package:flutter/material.dart';

class CamerPrew extends StatefulWidget {
  const CamerPrew({super.key});

  @override
  State<CamerPrew> createState() => _CamerPrewState();
}

class _CamerPrewState extends State<CamerPrew> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.black),
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 20,
                    right: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(.5),
                          child: const Icon(
                            Icons.bolt,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
                Positioned(
                  bottom: 50,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Colors.grey[300],
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
