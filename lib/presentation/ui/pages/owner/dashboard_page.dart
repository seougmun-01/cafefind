import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('사장님 대시보드')),
      body: const Center(child: Text('카페 관리 시작!')),
    );
  }
}
