class ResponseData<T>{
  T? data;
  int? statusCode;
  String? message;

  ResponseData({this.data, this.statusCode, this.message});
}