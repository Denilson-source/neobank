import 'package:neobank_clone/core/entities/credit_card.dart';

abstract class CreditCardRepository {
  Future<List<CreditCard>> getCreditCards();
}
