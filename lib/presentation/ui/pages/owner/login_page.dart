import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/owner_login_viewmodel.dart';
import 'dashboard_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(ownerLoginProvider);
    final loginNotifier = ref.read(ownerLoginProvider.notifier);

    ref.listen<AsyncValue<void>>(ownerLoginProvider, (prev, next) {
      next.whenOrNull(
        error: (e, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        ),
        data: (_) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardPage()),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(title: const Text("사장님 로그인")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: '이메일'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: '비밀번호'),
            ),
            const SizedBox(height: 20),
            loginState.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () {
                loginNotifier.login(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
              child: const Text("로그인"),
            ),
          ],
        ),
      ),
    );
  }
}
