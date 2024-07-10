class BitNavModel {
  final int id;
  final String name;

  final int? type;
  final String? title;
  final String? value;

  BitNavModel({
    required this.id,
    required this.name,
    this.type,
    this.title,
    this.value});

  factory BitNavModel.fromJson(Map<String, dynamic> json) =>
      BitNavModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        type: json['type'],
        title: json['title'],
        value: json['value'],
      );

}
