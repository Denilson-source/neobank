import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/entities/credit_card.dart';
import '../data/credit_card_repository.dart';
import '../data/credit_card_repository_local.dart';

typedef _V = AsyncValue<List<CreditCard>>;

final creditCardListProvider = StateNotifierProvider<CreditCardList, _V>(
  (ref) {
    return CreditCardList(
      repository: ref.read(creditCardRepositoryLocal),
    );
  },
);

class CreditCardList extends StateNotifier<_V> {
  CreditCardList({
    required this.repository,
  }) : super(const AsyncLoading()) {
    fetchFirstBatch();
  }

  final CreditCardRepository repository;

  Future<void> fetchFirstBatch() async {
    state = const AsyncLoading();

    try {
      final creditCards = await repository.getCreditCards();
      state = AsyncData(creditCards);
    } catch (e, stack) {
      state = AsyncError(e.toString(), stack);
    }
  }
}
