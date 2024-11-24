class Pet {
  final String id;
  final String name;
  final String age;
  final String breed;

  Pet({required this.id, required this.name, required this.age, required this.breed});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['_id'],
      name: json['name'],
      age: json['age'],
      breed: json['breed'],
    );
  }
}
