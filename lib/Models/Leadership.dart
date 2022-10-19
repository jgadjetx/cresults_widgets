
class Position {
    Position({
        required this.name,
        required this.count,
    });

    String name;
    int count;

    factory Position.fromJson(Map<String, dynamic> json) => Position(
        name: json["name"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
    };
}
