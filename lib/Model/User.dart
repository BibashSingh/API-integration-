class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final Username name;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
  });
}

class Username{
  final String title;
  final String first;
  final String last;
  Username({
    required this.title,
    required this.first,
    required this.last,

  });
}
