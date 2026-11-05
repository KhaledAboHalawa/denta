import 'package:denta/features/main_layout/presentation/widgets/custom_nav_bar.dart';
import 'package:denta/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:flutter/material.dart';

import '../../../home_screen/presentation/screens/home_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController pageController;
  final List<Widget> tabs = [
    const HomeTab(),
    const Center(child: Text("market palce")),
    const NotificationsScreen(),
    const Center(child: Text("profile")),
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView.builder(
        controller: pageController,
        itemCount: tabs.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => tabs[index],
      ),
      bottomNavigationBar: CustomNavBar(pageController: pageController),
    );
  }
}
