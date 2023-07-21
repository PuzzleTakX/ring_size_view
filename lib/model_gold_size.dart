class ModelGoldSize {
  DataGoldSize? data;

  ModelGoldSize({this.data});

  ModelGoldSize.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataGoldSize.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataGoldSize {
  List<GoldSizes>? sizes;

  DataGoldSize({this.sizes});

  DataGoldSize.fromJson(Map<String, dynamic> json) {
    if (json['sizes'] != null) {
      sizes = <GoldSizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(GoldSizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoldSizes {
  String? diameter;
  String? usa;
  String? australia;
  String? europe;
  String? japan;

  GoldSizes({this.diameter, this.usa, this.australia, this.europe, this.japan});

  GoldSizes.fromJson(Map<String, dynamic> json) {
    diameter = json['diameter'];
    usa = json['usa'];
    australia = json['australia'];
    europe = json['europe'];
    japan = json['japan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['diameter'] = diameter;
    data['usa'] = usa;
    data['australia'] = australia;
    data['europe'] = europe;
    data['japan'] = japan;
    return data;
  }
}
