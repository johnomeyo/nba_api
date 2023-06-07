import 'package:flutter/material.dart';

import '../team_model.dart';

class PlayerDisplay extends StatelessWidget {
  const PlayerDisplay({super.key,  required this.player});
  final Player player;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.red,),
      body: SafeArea(
        child: Center(child: Text(player.firstName,style: const TextStyle(color: Colors.white,fontSize: 30),)),
      ),
    );
  }
}