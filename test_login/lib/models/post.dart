
import 'imageOfPost.dart';

class Post{
  final String id;
  String? name;
  final DateTime dateCreated;
  final String authorUserName;
  final String authorName;
  String? imageUrl;
  //final List<Comment> comments;
  //final List<ImageOfPost> images;
  final String categorySlug;

  Post({required this.id,
    this.name,
    required this.dateCreated,
    required this.authorUserName,
    required this.authorName,
    this.imageUrl,
    //required this.comments,
    //required this.images,
    required this.categorySlug
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
      dateCreated: DateTime.parse(json['dateCreated']),
      authorUserName: json['authorUserName'],
      authorName: json['authorName'],
      imageUrl: json["imageUrl"],
      categorySlug:  json["categorySlug"],
      //comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
      //images: List<ImageOfPost>.from(json["images"].map((x) => ImageOfPost.fromJson(x))),
    );
  }

  static Post fromJsonModel(Map<String, dynamic> json) => Post.fromJson(json);
}