


import 'dart:convert';

List<DropDownModel> dropDownModelFromJson(String str) => List<DropDownModel>.from(json.decode(str).map((x) => DropDownModel.fromJson(x)));

String dropDownModelToJson(List<DropDownModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DropDownModel {
    DropDownModel({
        this.id,
        this.place,
    });
 
    int? id;
    String? place; 

    factory DropDownModel.fromJson(Map<String, dynamic> json) => DropDownModel(
        id: json["id"],
        place: json["place"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "place": place,
    };
}
