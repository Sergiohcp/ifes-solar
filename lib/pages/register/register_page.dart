import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/controllers/auth_controller.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';
import 'package:ifes_solar/validators/valid_string.dart';
import 'package:ifes_solar/widgets/custom_form_field_widget.dart';
import 'package:ifes_solar/widgets/rounded_button_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool shouldShowPassword = false;

  void register(String username, String email, String password) async {
    await authController.register(username, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SolarColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: SolarColors.primary),
          onPressed: () => Get.back(),
        ),
      ),
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Digite aqui seu nome:',
                                style: SolarTextStyles.registerLabel,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomFormField(
                            controller: usernameController,
                            hintText: "Solar",
                            validator: (String? value) =>
                                validString(value, "Digite um nome"),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Text(
                                'Agora nos diga seu email:',
                                style: SolarTextStyles.registerLabel,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomFormField(
                            controller: emailController,
                            hintText: "solar@gmail.com",
                            validator: (String? value) =>
                                validString(value, "Digite uma email"),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Text(
                                'Digite uma senha:',
                                style: SolarTextStyles.registerLabel,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomFormField(
                            controller: passwordController,
                            hintText: "********",
                            validator: (String? value) =>
                                validString(value, "Digite uma senha válida"),
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
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => RoundedButton(
                        text: "Criar conta",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            register(usernameController.text,
                                emailController.text, passwordController.text);
                          }
                        },
                        width: MediaQuery.of(context).size.width,
                        isLoading: authController.isAuthLoading,
                      ),
                    ),
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
