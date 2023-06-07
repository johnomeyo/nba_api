import 'package:flutter/material.dart';
import 'package:nba_api/home_page.dart';
import 'package:nba_api/players.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
                child: Image.network(
                    "https://static.vecteezy.com/system/resources/thumbnails/017/485/074/small/basketball-club-logo-emblem-designs-with-ball-sport-badge-illustration-free-vector.jpg")),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Text(
                          "Check Teams Stats",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlayersPage()));
                },
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 7, 11, 238),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Text(
                          "Check Player Stats",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
