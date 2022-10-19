// To parse this JSON data, do
//
//     final program = programFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Program programFromJson(String str) => Program.fromJson(json.decode(str));

String programToJson(Program data) => json.encode(data.toJson());

class Program {
    Program({
        required this.name,
        required this.rounds,
        required this.time,
        required this.rest,
        required this.exercises,
    });

    String name;
    String rounds;
    String time;
    String rest;
    List<Exercise> exercises;

    factory Program.fromJson(Map<String, dynamic> json) => Program(
        name: json["name"],
        rounds: json["rounds"],
        time: json["time"],
        rest: json["rest"],
        exercises: List<Exercise>.from(json["exercises"].map((x) => Exercise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "rounds": rounds,
        "time": time,
        "rest": rest,
        "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
    };
}

class Exercise {
    Exercise({
        required this.name,
        required this.duration,
    });

    String name;
    String duration;

    factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        name: json["name"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "duration": duration,
    };
}
