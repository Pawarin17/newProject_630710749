class Album {
  final String ib;
  final String name;
  final String phone;
  final String date;
  final int price;

  Album({
    required this.ib,
    required this.name,
    required this.phone,
    required this.date,
    required this.price,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      ib: json['ib'],
      name: json['name'],
      phone: json['phone'],
      date: json['Date'],
      price: json['Price'],
    );
  }
}