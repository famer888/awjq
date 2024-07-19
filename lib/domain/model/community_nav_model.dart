class CommunityNavModel {
  final int id;
  final String title;
  final int mask;
  CommunityNavModel({
    required this.id,
    required this.title,
    required this.mask,
  });
  factory CommunityNavModel.fromJson(Map<String, dynamic> json) =>
      CommunityNavModel(
        id: json['id'],
        title: json['title'],
        mask: json['mask'],
      );
}

class Params {
  final int id;

  Params({
    required this.id,
  });
  factory Params.fromJson(Map<String, dynamic> json) => Params(id: json['id']);
}
