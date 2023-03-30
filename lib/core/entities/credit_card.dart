import '../constants/images.dart';

class CreditCard {
  CreditCard({
    required this.lastDigits,
    required this.holder,
    required this.brand,
    required this.billingAddress,
  });

  final String lastDigits;
  final String holder;
  final CreditCardBrand brand;
  final String billingAddress;
}

enum CreditCardBrand {
  visa,
  mastercard,
  americanExpress;

  const CreditCardBrand();

  String get name {
    switch (this) {
      case CreditCardBrand.visa:
        return 'visa';
      case CreditCardBrand.mastercard:
        return 'Master';
      case CreditCardBrand.americanExpress:
        return 'American';
    }
  }

  String get logo {
    switch (this) {
      case CreditCardBrand.visa:
        return Images.visaLogo;
      case CreditCardBrand.mastercard:
        return Images.masterCardLogo;
      case CreditCardBrand.americanExpress:
        return Images.americanExpressLogo;
    }
  }
}
