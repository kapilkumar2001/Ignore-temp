import 'dart:convert';

class GSTModel {
  String? GSTIN;
  String? name;
  String? status;
  String? address;
  String? tax_payer_type;
  String? business_type;
  String? date_of_registration;
  String? id;
  GSTModel({
    this.GSTIN,
    this.name,
    this.status,
    this.address,
    this.tax_payer_type,
    this.business_type,
    this.date_of_registration,
    this.id,
  });

  GSTModel copyWith({
    String? GSTIN,
    String? name,
    String? status,
    String? address,
    String? tax_payer_type,
    String? business_type,
    String? date_of_registration,
    String? id,
  }) {
    return GSTModel(
      GSTIN: GSTIN ?? this.GSTIN,
      name: name ?? this.name,
      status: status ?? this.status,
      address: address ?? this.address,
      tax_payer_type: tax_payer_type ?? this.tax_payer_type,
      business_type: business_type ?? this.business_type,
      date_of_registration: date_of_registration ?? this.date_of_registration,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'GSTIN': GSTIN,
      'name': name,
      'status': status,
      'address': address,
      'tax_payer_type': tax_payer_type,
      'business_type': business_type,
      'date_of_registration': date_of_registration,
      'id': id,
    };
  }

  factory GSTModel.fromMap(Map<String, dynamic> map) {
    return GSTModel(
      GSTIN: map['GSTIN'],
      name: map['name'],
      status: map['status'],
      address: map['address'],
      tax_payer_type: map['tax_payer_type'],
      business_type: map['business_type'],
      date_of_registration: map['date_of_registration'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GSTModel.fromJson(String source) =>
      GSTModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GSTModel(GSTIN: $GSTIN, name: $name, status: $status, address: $address, tax_payer_type: $tax_payer_type, business_type: $business_type, date_of_registration: $date_of_registration, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GSTModel &&
        other.GSTIN == GSTIN &&
        other.name == name &&
        other.status == status &&
        other.address == address &&
        other.tax_payer_type == tax_payer_type &&
        other.business_type == business_type &&
        other.date_of_registration == date_of_registration &&
        other.id == id;
  }

  @override
  int get hashCode {
    return GSTIN.hashCode ^
        name.hashCode ^
        status.hashCode ^
        address.hashCode ^
        tax_payer_type.hashCode ^
        business_type.hashCode ^
        date_of_registration.hashCode ^
        id.hashCode;
  }
}
