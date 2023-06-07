import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:nba_api/team_model.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  State<PlayersPage> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  List<Player> players = [];

  Future<void> getPlayers() async {
    print("I'm fetching data;");
    const url = "https://www.balldontlie.io/api/v1/players";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final finalResponse = jsonDecode(response.body);

    for (var eachPlayer in finalResponse['data']) {
      final player = Player(
          firstName: eachPlayer['first_name'],
          position: eachPlayer['position'],
          secondName: eachPlayer['last_name']);
      var fullName = player.firstName + player.secondName;
      players.add(player);
    }
    print(players.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 30, 236),
        title: const Center(child: Text("NBA PLAYERS")),
      ),
      body: FutureBuilder(
          future: getPlayers(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: players.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.grey.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Text(
                          players[index].firstName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            players[index].position,
                            style: TextStyle(
                                color: Colors.grey.shade300, fontSize: 15),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.navigate_next_sharp,
                              color: Colors.red,
                            )),
                      ),
                    );
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            }
          })),
    );
  }
}
