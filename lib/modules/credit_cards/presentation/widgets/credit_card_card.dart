import 'package:flutter/material.dart';

import '../../../../core/config/theme.dart';
import '../../../../core/entities/credit_card.dart';

class CreditCardCard extends StatelessWidget {
  const CreditCardCard({
    Key? key,
    required this.creditCard,
    this.onTap,
  }) : super(key: key);

  final CreditCard creditCard;
  final void Function(CreditCard)? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AspectRatio(
      aspectRatio: 1.6,
      child: InkWell(
        onTap: onTap != null ? () => onTap!(creditCard) : null,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                kPink,
                kOrange,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '**** **** **** ${creditCard.lastDigits}',
                      style: textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          creditCard.holder,
                          maxLines: 1,
                          style: textTheme.titleMedium?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: Image.asset(creditCard.brand.logo),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
