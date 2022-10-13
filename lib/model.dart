// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
    Model({
         this.count,
        this.entries,
    });

    int ?count;
    List<Entry>? entries;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        count: json["count"],
        entries: List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "entries": List<dynamic>.from(entries!.map((x) => x.toJson())),
    };
}

class Entry {
    Entry({
        this.api,
        this.description,
        this.auth,
        this.https,
        this.cors,
        this.link,
        this.category,
    });

    String ?api;
    String ?description;
    String ?auth;
    bool ?https;
    String ?cors;
    String ?link;
    String ?category;

    factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        api: json["API"],
        description: json["Description"],
        auth:  json["Auth"],
        https: json["HTTPS"],
        cors:  json["Cors"],
        link: json["Link"],
        category: json["Category"],
    );

    Map<String, dynamic> toJson() => {
        "API": api,
        "Description": description,
        "Auth": auth,
        "HTTPS": https,
        "Cors": cors,
        "Link": link,
        "Category": category,
    };
}

