import 'package:flutter/material.dart';

import '../team_model.dart';

class TeamDisplay extends StatelessWidget {
  const TeamDisplay({super.key, required this.team});
  final Team team;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.deepPurpleAccent,),
      body: SafeArea(
        child: Center(child: Text(team.name,style: const TextStyle(color: Colors.white,fontSize: 30),)),
      ),
    );
  }
}
