import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neobank_clone/modules/credit_cards/presentation/widgets/credit_card_card.dart';
import 'package:neobank_clone/modules/credit_cards/presentation/widgets/manage_credit_card_modal.dart';
import 'package:neobank_clone/modules/credit_cards/application/credit_card_list.dart';

class HomeCreditCards extends ConsumerStatefulWidget {
  const HomeCreditCards({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeCreditCards> createState() => _HomeCreditCardsState();
}

class _HomeCreditCardsState extends ConsumerState<HomeCreditCards> {
  @override
  Widget build(BuildContext context) {
    final creditCardList = ref.watch(creditCardListProvider);
    return creditCardList.when(
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
      data: (data) {
        return SizedBox(
          height: 170,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final creditCard = data[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: CreditCardCard(
                  creditCard: creditCard,
                  onTap: (creditCard) {
                    ManageCreditCardModal.show(
                      context: context,
                      creditCard: creditCard,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
