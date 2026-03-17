class Task {
  final String title;
  final String courseCode;
  final DateTime dueDate;
  bool isComplete;
  String? description;

  Task({
    required this.title,
    required this.courseCode,
    required this.dueDate,
    this.isComplete = false,
    this.description,
  });

  // Method to convert Task object to a JSON-compatible Map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'courseCode': courseCode,
      'dueDate': dueDate.toIso8601String(),
      'isComplete': isComplete,
      'description': description,
    };
  }

  // Factory constructor to create a Task object from a JSON-compatible Map
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String,
      courseCode: json['courseCode'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      isComplete: json['isComplete'] as bool? ?? false,
      description: json['description'] as String?,
    );
  }

  // For debugging purposes
  @override
  String toString() {
    return 'Task(title: $title, courseCode: $courseCode, dueDate: $dueDate, isComplete: $isComplete, description: $description)';
  }
}
