import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_filter_screen.dart';
import 'saved_history_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          HomeFilterScreen(),
          SavedHistoryScreen(),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        activeIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
