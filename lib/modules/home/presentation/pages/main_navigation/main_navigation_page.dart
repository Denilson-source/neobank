import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/theme.dart';
import '../../../../../core/widgets/unknown_page.dart';
import '../../../application/navigation_index.dart';
import '../home/home_page.dart';

class MainNavigationPage extends ConsumerStatefulWidget {
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends ConsumerState<MainNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kDarkerPink,
            Colors.black,
          ],
        ),
      ),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Builder(
            builder: (context) {
              switch (ref.watch(navigationIndexProvider)) {
                case 0:
                  return const HomePage();
                default:
                  return const UnknownPage();
              }
            },
          ),
          bottomNavigationBar: SafeArea(
            child: SizedBox(
              height: 80,
              child: TabBar(
                onTap: (value) {
                  ref.read(navigationIndexProvider.notifier).state = value;
                },
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                splashBorderRadius: BorderRadius.circular(100),
                tabs: [
                  _buildTabItem(
                    icon: const Icon(Icons.credit_card),
                    index: 0,
                  ),
                  _buildTabItem(
                    icon: const Icon(Icons.qr_code),
                    index: 1,
                  ),
                  _buildTabItem(
                    icon: const Icon(Icons.equalizer),
                    index: 2,
                  ),
                  _buildTabItem(
                    icon: const Icon(Icons.account_box_outlined),
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required Widget icon,
    required int index,
  }) {
    final isSelected = index == ref.watch(navigationIndexProvider);

    return AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? kDarkerPink.withOpacity(0.7) : null,
        borderRadius: BorderRadius.circular(isSelected ? 100 : 0),
        border: isSelected
            ? Border.all(
                color: Colors.grey,
              )
            : null,
      ),
      child: icon,
    );
  }
}
