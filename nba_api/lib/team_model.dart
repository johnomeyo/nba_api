class Team {
  String name;
  String abbreviation;

  Team({required this.abbreviation, required this.name});
}

class Player {
  String firstName;
  String secondName;
  String position;

  Player(
      {required this.firstName,
      required this.position,
      required this.secondName});
}
