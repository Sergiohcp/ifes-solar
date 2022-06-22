import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_images.dart';
import 'package:ifes_solar/validators/valid_string.dart';
import 'package:ifes_solar/widgets/custom_form_field_widget.dart';
import 'package:ifes_solar/widgets/rounded_button_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool shouldShowPassword = false;

  void login(String email, String password) async {
    await authController.login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: SolarColors.white),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          SolarImages.logo,
                          scale: 1.5,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomFormField(
                                controller: emailController,
                                hintText: "Email",
                                validator: (String? value) =>
                                    validString(value, "Email inválido"),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomFormField(
                                controller: passwordController,
                                hintText: "Senha",
                                validator: (String? value) => validString(
                                    value, "Digite uma senha válida"),
                                obscureText: !shouldShowPassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    shouldShowPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: SolarColors.grayDark,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      shouldShowPassword = !shouldShowPassword;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => RoundedButton(
                        text: "Entrar",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            login(
                                emailController.text, passwordController.text);
                          }
                        },
                        width: MediaQuery.of(context).size.width,
                        isLoading: authController.isLoginLoading,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
