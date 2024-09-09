class Pagination<T> {
  int pageCount;
  int currentPage;
  int pageSize;
  int rowCount;
  List<T> results;

  Pagination(
      {required this.pageCount,
        required this.currentPage,
        required this.pageSize,
        required this.rowCount,
        required this.results});

  factory Pagination.fromJson(Map<String, dynamic> json, Function fromJsonModel) {
    final items = json['results'].cast<Map<String, dynamic>>();
    return Pagination<T>(
      pageCount: json['pageCount'],
      currentPage: json['currentPage'],
      pageSize: json['pageSize'],
      rowCount: json['rowCount'],
      results: List<T>.from(items.map((itemsJson) => fromJsonModel(itemsJson))),
    );
  }
}