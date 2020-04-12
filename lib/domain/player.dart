import 'package:flutter/services.dart';

class Player {

  final String firstName;
  final String lastName;

  final String nickName;
  final int number;
  final String position;

  final int nbrGoal;
  final int nbrPass;
  final int nbrGame;
  final int gameTime;
  final int nbrMissingGame;
  final int nbrLateGame;
  final int nbrYellowCard;
  final int nbrStarter;
  final int nbrSubstitute;
  final int lateTime;
  final int nbrHurt;
  final int nbrAbsent;
  final int nbrRest;

  String avatar;

  getId() {
    return (this.firstName + this.lastName + this.number.toString())
        .replaceAll(" ", "");
  }

  getName() {
    return this.firstName + " " + this.lastName;
  }

  buildAvatar() async {
    rootBundle.load("assets/img/player/" + this.getId() + ".png").then((value) {
      this.avatar = this.getId();
    }).catchError((_) {
      this.avatar = "avatar";
    });
  }

  Player({
    this.firstName,
    this.lastName,
    this.number = 0,
    this.position = "Joueur",
    this.nickName = "",
    this.nbrGoal = 0,
    this.nbrPass = 0,
    this.nbrGame = 0,
    this.gameTime = 0,
    this.lateTime = 0,
    this.nbrMissingGame = 0,
    this.nbrLateGame = 0,
    this.nbrYellowCard = 0,
    this.nbrStarter = 0,
    this.nbrSubstitute = 0,
    this.nbrHurt = 0,
    this.nbrAbsent = 0,
    this.nbrRest = 0,
    this.avatar = "avatar"});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        firstName: json['firstName'],
        lastName: json['lastName'],
        number: json['number'],
        nbrGoal: json['goal'],
        nbrPass: json['decisivePass'],
        nbrGame: json['present'],
        gameTime: json['gameMinute'],
        lateTime: json['lateMinute'],
        nbrMissingGame: json['absent'],
        nbrYellowCard: json['yellowCard'],
        nbrLateGame: json['late'],
        position: json['position'],
        nickName: json['nickName'],
        nbrStarter: json['starting'],
        nbrSubstitute: json['substitued'],
        nbrHurt: json['hurt'],
        nbrAbsent: json['absent'],
        nbrRest: json['notTaken']
    );
  }
}
