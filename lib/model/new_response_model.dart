class NewResponseModel {
  int statusCode = -1;
  String statusDescription = "";
  late dynamic data;

  NewResponseModel();
  NewResponseModel.named({required this.statusCode, required this.statusDescription, required this.data});

  NewResponseModel.fromJson(Map<String, dynamic> json) {
    this.statusCode = json["statusCode"]?? -1;
    this.statusDescription = json["statusDescription"]?? "";
    this.data = json["data"] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': this.statusCode,
      'statusDescription': this.statusDescription,
      'data': this.data,
    };
  }

  @override
  String toString() {
    return 'ResponseModel{statusCode: $statusCode, statusDescription: $statusDescription, data: $data}';
  }
}
