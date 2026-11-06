import 'package:flutter/material.dart';

import 'active_cases_widget.dart';
import 'home_header.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: const Column(children: [HomeHeader(), ActiveCasesWidget()]),
    );
  }
}
