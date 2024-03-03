class Todo {
  late String id;
  late String category;
  late String title;
  late String description;
  late String startDate;
  late String endDate;
  late String status;
  late String postedDateAndTime;

  Todo({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.postedDateAndTime,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
      postedDateAndTime: json['postedDateAndTime'],
    );
  }
}
