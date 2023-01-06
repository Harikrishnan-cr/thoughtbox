


// To parse this JSON data, do
//
//     final joblistModel = joblistModelFromJson(jsonString);

import 'dart:convert';

List<JoblistModel> joblistModelFromJson(String str) => List<JoblistModel>.from(json.decode(str).map((x) => JoblistModel.fromJson(x)));

String joblistModelToJson(List<JoblistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JoblistModel {
    JoblistModel({
        this.id,
        this.date,
        this.image,
        this.company,
        this.location,
        this.position,
        this.skillsRequired,
    });

    int? id;
    String? date;
    String? image;
    String? company;
    String? location;
    String? position;
    String? skillsRequired;

    factory JoblistModel.fromJson(Map<String, dynamic> json) => JoblistModel(
        id: json["id"],
        date: json["date"],
        image: json["image"],
        company: json["company"],
        location: json["location"],
        position: json["position"],
        skillsRequired: json["skills_required"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "image": image,
        "company": company,
        "location": location,
        "position": position,
        "skills_required": skillsRequired,
    };
}