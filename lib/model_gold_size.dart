class ModelGoldSize {
  DataGoldSize? data;

  ModelGoldSize({this.data});

  ModelGoldSize.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataGoldSize.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
        sizes!.add(new GoldSizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diameter'] = this.diameter;
    data['usa'] = this.usa;
    data['australia'] = this.australia;
    data['europe'] = this.europe;
    data['japan'] = this.japan;
    return data;
  }
}
