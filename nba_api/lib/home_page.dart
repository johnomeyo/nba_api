import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:nba_api/team_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Team> teams = [];

  Future<void> getUsers() async {
    //fetching the data from the internet
    const url = "https://www.balldontlie.io/api/v1/teams";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    //converting the data into that thick ass block of a string
    final finalResponse = jsonDecode(response.body);
//creating instance of teams or players in that large string and pushing them into the list
    for (var eachTeam in finalResponse['data']) {
      final team = Team(
          abbreviation: eachTeam['abbreviation'], name: eachTeam['full_name']);
      teams.add(team);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 43, 252),
        title: const Center(child: Text("NBA TEAMS")),
      ),
      body: FutureBuilder(
          future: getUsers(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor:  Colors.grey.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Text(
                          teams[index].name,
                          style:  const TextStyle(
                              color: Colors.white , fontSize: 20, letterSpacing: 2),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 10),
                          child: Text(
                            teams[index].abbreviation,
                            style:   TextStyle(
                              color:  Colors.grey.shade300 , fontSize: 15
                            ),
                          ),
                        ),
                        trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next_sharp,color: Colors.red,)),
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
