class Responsemodel {
  final bool isSuccess;
  final int statusCode;
  final dynamic returnData;

  Responsemodel(
      {required this.isSuccess,
      required this.statusCode,
      required this.returnData});
}
