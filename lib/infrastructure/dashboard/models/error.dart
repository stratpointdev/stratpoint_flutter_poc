class Err{

  String code;
  String message;
  String parameter;
  Err({this.code, this.message, this.parameter});

  factory Err.fromJson(Map<String, dynamic> json) {

    print("json : "+json['code'].toString());

    return Err(
      code: json['code'],
      message: json['message'],
      parameter: json['parameter']
    );
  }

}