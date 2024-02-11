class UserModelDropDown {
  final String? name;
  final dynamic? value;

  UserModelDropDown({
    this.name,
    this.value,
  });

  factory UserModelDropDown.fromJson(Map<String, dynamic> json) {
    return UserModelDropDown(
      name: json["name"],
      value: json["value"],
    );
  }

  static List<UserModelDropDown> fromJsonList(List list) {
    return list.map((item) => UserModelDropDown.fromJson(item)).toList();
  }

  @override
  String toString() => name.toString();
}
