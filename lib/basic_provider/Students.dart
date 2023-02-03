class Student extends ChangeNotifier {
  int? _rollNo;
  String? _name;
  double? _fee;
  Student({int? rollNo,String?name,double? fee}):_rollNo=rollNo,_name=name,_fee=fee;
  int? get rollNo => _rollNo;
  set rollNo(int? value) {
    _rollNo = value;
    notifyListeners();
  }

  String? get name => _name;
  set name(String? value) {
    _name = value;
    notifyListeners();
  }

  double? get fee => _fee;
  set fee(double? value) {
    _fee = value;
    notifyListeners();
  }
}