import 'dart:ui';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neobank_clone/modules/home/presentation/widgets/obscured_wallet_box.dart';

class HomeSummary extends StatefulWidget {
  const HomeSummary({Key? key}) : super(key: key);

  @override
  State<HomeSummary> createState() => _HomeSummaryState();
}

class _HomeSummaryState extends State<HomeSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Container(
              color: Colors.white,
            ),
          ),
          Column(
            children: [
              _buildSpentInMonth(),
              const SizedBox(height: 30),
              _buildCashbackEarned(),
              const SizedBox(height: 30),
              _buildMilesEarned(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpentInMonth() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.chartLine,
          size: 20,
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '\$ ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ObscuredWalletBox(
                    child: Text(
                      '12.450,00',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text('Spent in January'),
            ],
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 70,
          child: Stack(
            children: [
              Positioned(
                left: 40,
                child: _buildBrandAvatar(),
              ),
              Positioned(
                left: 20,
                child: _buildBrandAvatar(),
              ),
              Positioned(
                child: _buildBrandAvatar(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCashbackEarned() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.chartPie,
          size: 20,
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '\$ ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ObscuredWalletBox(
                    child: Text(
                      '300,00',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text('Cashback earned'),
            ],
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 50,
          child: Stack(
            children: [
              Positioned(
                left: 20,
                child: _buildBrandAvatar(),
              ),
              Positioned(
                child: _buildBrandAvatar(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMilesEarned() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.planeDeparture,
          size: 20,
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ObscuredWalletBox(
                child: Text(
                  '7105',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 5),
              const Text('Miles earned'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBrandAvatar() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(),
        shape: BoxShape.circle,
      ),
    );
  }
}
