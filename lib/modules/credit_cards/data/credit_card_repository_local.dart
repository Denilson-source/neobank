import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/entities/credit_card.dart';
import 'credit_card_repository.dart';

final creditCardRepositoryLocal = Provider<CreditCardRepository>(
  (ref) => CreditCardRepositoryLocal(),
);

class CreditCardRepositoryLocal implements CreditCardRepository {
  @override
  Future<List<CreditCard>> getCreditCards() async {
    await Future.delayed(const Duration(seconds: 1));

    final faker = Faker();
    return List.generate(
      4,
      (index) {
        final address = faker.address.streetAddress();
        final buildingNumber = faker.address.buildingNumber();
        final zipCode = faker.address.zipCode();
        final city = faker.address.city();
        final state = faker.address.state();

        final brand =
            faker.randomGenerator.integer(CreditCardBrand.values.length);

        return CreditCard(
          lastDigits: faker.randomGenerator.numberOfLength(4),
          holder: faker.person.name(),
          brand: CreditCardBrand.values[brand],
          billingAddress: '$address $buildingNumber, $zipCode $city, $state',
        );
      },
    );
  }
}
