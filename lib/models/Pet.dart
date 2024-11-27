class Pet {
  final String id;
  final String name;
  final int age;
  final double weight;
  final String color;
  final List<String> images;

  Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.images,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'Sem nome',
      age: json['age'] ?? 0,
      weight: (json['weight'] ?? 0).toDouble(),
      color: json['color'] ?? 'Desconhecida',
      images: (json['images'] as List<dynamic>?)
              ?.map((image) => image as String)
              .toList() ??
          [],
    );
  }
}
