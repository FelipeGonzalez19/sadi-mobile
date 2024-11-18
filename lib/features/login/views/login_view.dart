import 'package:flutter/material.dart';
import 'package:sadi_mobile/core/constants/app_colors.dart';
import 'package:sadi_mobile/core/constants/app_labels.dart';
import 'package:sadi_mobile/routes/app_routes.dart';
import '../widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor, // Azul
              AppColors.secondaryColor, // Azul oscuro
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
          crossAxisAlignment: CrossAxisAlignment.center, // Centrado horizontal
          children: [
            Image.asset(
              'assets/images/LogoKL.png',
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width * 1,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  AppLabels.appBar, // Título centrado
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(height: 40),
            LoginForm(
              emailController: emailController,
              passwordController: passwordController,
              onSubmit: () {
                Navigator.pushNamed(context, AppRoutes.qrScanner);
              },
            ),
          ],
        ),
      ),
    );
  }
}
