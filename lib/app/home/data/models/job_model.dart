class JobModel {
  String? title;
  String? type;
  String? level;
  String? location;
  bool? isActive;

  JobModel({
    this.title,
    this.type,
    this.level,
    this.location,
    this.isActive,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    level = json['level'];
    location = json['location'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['level'] = level;
    data['location'] = location;
    data['is_active'] = isActive;
    return data;
  }
}
