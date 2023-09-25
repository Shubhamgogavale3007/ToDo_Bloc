class ToDo {
  String? id;
  String? task;
  String? description;

  ToDo({this.id, this.task, this.description});

  ToDo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task'] = this.task;
    data['description'] = this.description;
    return data;
  }
}
