class Worker {
  
  final int? id;
  final String name;
  final String position;
  final int? salary;
  final int? hoursInMonth;

  Worker({
    this.id,
    required this.name,
    required this.position,
    required this.salary,
    required this.hoursInMonth,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name':name,
      'position':position,
      'salary':salary,
      'hours':hoursInMonth
    };
  }
  @override
  String toString() {
    return 'Worker{id:$id, name:$name, position:$position,salary:$salary,hoursInMonth:$hoursInMonth';
  }
}
