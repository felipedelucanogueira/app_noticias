class SourceModel {
  final String id;
  final String name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
