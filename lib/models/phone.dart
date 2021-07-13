import 'package:flutter/foundation.dart';


@immutable
class Phone {

  const Phone({
    required this.brand,
  });

  final String brand;

  factory Phone.fromJson(Map<String,dynamic> json) => Phone(
    brand: json['brand'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'brand': brand
  };

  Phone clone() => Phone(
    brand: brand
  );


  Phone copyWith({
    String? brand
  }) => Phone(
    brand: brand ?? this.brand,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Phone && brand == other.brand;

  @override
  int get hashCode => brand.hashCode;
}
