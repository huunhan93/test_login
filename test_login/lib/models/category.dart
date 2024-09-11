class Category{
  String id;
  String name;
  int iconColor;
  int totalPost;

  Category({
  required this.id,
  required this.name,
    required this.iconColor,
    required this.totalPost});


  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name'],
        iconColor: 0,
        totalPost: json['totalPost'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'iconColor': iconColor,
        'totalPost': totalPost,
      };

  static Category fromJsonModel(Map<String, dynamic> json) => Category.fromJson(json);
}