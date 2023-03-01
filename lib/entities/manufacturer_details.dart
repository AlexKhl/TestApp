class ManufacturerDetails{
  final String? Address;
  final String? Address2;
  final String? City;
  final String? ContactEmail;
  final String? ContactFax;
  final String? ContactPhone;
  final String? Country;

  const ManufacturerDetails({
    required this.Address,
    required this.Address2,
    required this.City,
    required this.ContactEmail,
    required this.ContactFax,
    required this.ContactPhone,
    required this.Country,
  });

  factory ManufacturerDetails.fromJson(Map<String, dynamic> json){
    return ManufacturerDetails(
      Address: json['Address'],
      Address2: json['Address2'],
      City: json['City'],
      ContactEmail: json['ContactEmail'],
      ContactPhone: json['ContactPhone'],
      ContactFax: json['ContactFax'],
      Country: json['Country'],
    );
  }
}
