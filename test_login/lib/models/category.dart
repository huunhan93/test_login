class Category{
  String id;
  String name;
  String? iconText;

  Category({
  required this.id,
  required this.name,
  this.iconText});


  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name']
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
      };

  static Category fromJsonModel(Map<String, dynamic> json) => Category.fromJson(json);
}