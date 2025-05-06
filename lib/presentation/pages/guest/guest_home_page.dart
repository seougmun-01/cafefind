import 'package:flutter/material.dart';

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('카페 목록'),
      ),
      body: const Center(
        child: Text('여기에 카페 리스트 표시 예정'),
      ),
    );
  }
}
