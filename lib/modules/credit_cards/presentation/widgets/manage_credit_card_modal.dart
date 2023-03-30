import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/config/theme.dart';
import '../../../../core/entities/credit_card.dart';
import '../../../../core/widgets/circle_button.dart';
import 'credit_card_card.dart';

class ManageCreditCardModal extends StatefulWidget {
  const ManageCreditCardModal({
    Key? key,
    required this.creditCard,
  }) : super(key: key);

  final CreditCard creditCard;

  static Future<void> show({
    required BuildContext context,
    required CreditCard creditCard,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => ManageCreditCardModal(
        creditCard: creditCard,
      ),
    );
  }

  @override
  State<ManageCreditCardModal> createState() => _ManageCreditCardModalState();
}

class _ManageCreditCardModalState extends State<ManageCreditCardModal> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: Container(
            color: kDarkerPink.withOpacity(0.1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CircleButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CreditCardCard(
                        creditCard: widget.creditCard,
                      ),
                      const SizedBox(height: 20),
                      const Text('Billing address'),
                      const SizedBox(height: 10),
                      Text(
                        widget.creditCard.billingAddress,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            _buildButton(
                              onPressed: () {},
                              icon: const Icon(Icons.credit_card),
                              label: 'Reveal card details',
                            ),
                            const SizedBox(height: 20),
                            _buildButton(
                              onPressed: () {},
                              icon: const Icon(Icons.pin),
                              label: 'Change PIN',
                            ),
                            const SizedBox(height: 20),
                            _buildButton(
                              onPressed: () {},
                              icon: const Icon(Icons.wallet),
                              label: 'Setup limits',
                            ),
                            const SizedBox(height: 20),
                            _buildButton(
                              onPressed: () {},
                              icon: const Icon(Icons.block),
                              label: 'Block',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required Widget icon,
    required String label,
    required void Function() onPressed,
  }) {
    return Material(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 20,
              ),
              Text(label)
            ],
          ),
        ),
      ),
    );
  }
}
