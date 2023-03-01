class Manufacturer{
  final String? country;
  final String? brand;
  final int? id;
  final String? name;

  const Manufacturer({
    required this.country,
    required this.brand,
    required this.id,
    required this.name,
  });

  factory Manufacturer.fromJson(Map<String, dynamic> json){
    return Manufacturer(
      country: json['Country'],
      brand: json['Mfr_CommonName'],
      id: json['Mfr_ID'],
      name: json['Mfr_Name'],
    );
  }
}
