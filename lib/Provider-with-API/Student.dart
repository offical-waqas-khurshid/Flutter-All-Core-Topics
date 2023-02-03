// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Student {
  int rollNo;
  String name;
  double fee;
  Student({
    required this.rollNo,
    required this.name,
    required this.fee,
  });


  Student copyWith({
    int? rollNo,
    String? name,
    double? fee,
  }) {
    return Student(
      rollNo: rollNo ?? this.rollNo,
      name: name ?? this.name,
      fee: fee ?? this.fee,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rollNo': rollNo,
      'name': name,
      'fee': fee,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      rollNo: map['rollNo'] as int,
      name: map['name'] as String,
      fee: map['fee'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Student(rollNo: $rollNo, name: $name, fee: $fee)';

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return
      other.rollNo == rollNo &&
          other.name == name &&
          other.fee == fee;
  }

  @override
  int get hashCode => rollNo.hashCode ^ name.hashCode ^ fee.hashCode;
}
