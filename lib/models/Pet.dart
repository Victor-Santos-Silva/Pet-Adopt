class Pet {
  final String id;
  final String name;
  final int age;
  final double weight;
  final String color;
  final List<String> images;

  /// Construtor principal com inicialização obrigatória dos campos
  const Pet({
    required this.id,
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.images,
  });

  /// Factory para criar um pet a partir de um JSON
  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'Sem nome',
      age: json['age'] ?? 0,
      weight: (json['weight'] ?? 0).toDouble(),
      color: json['color'] ?? 'Desconhecida',
      images: _parseImages(json['images']),
    );
  }

  /// Método para mapear e validar a lista de imagens
  static List<String> _parseImages(dynamic imagesJson) {
    if (imagesJson is List) {
      return imagesJson.map((image) => image.toString()).toList();
    }
    return [];
  }
}
