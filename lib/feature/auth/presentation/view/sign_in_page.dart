import 'package:flutter/material.dart';
import 'package:flymate/core/widget/custom_elevated_button_widget.dart';
import 'package:flymate/core/widget/custom_text_field_widget.dart';
import 'package:flymate/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool get isEmailLogin => tabController.index == 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signIn = context.read<AuthViewModel>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: AnimatedBuilder(
            animation: tabController,
            builder: (context, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  /// TITLE
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 8),
                  const Text("Welcome back to the app"),

                  const SizedBox(height: 24),

                  /// TAB BAR
                  TabBar(
                    controller: tabController,
                    labelColor: AppColors.primaryColor,
                    unselectedLabelColor: AppColors.borderColor,
                    indicatorColor: AppColors.primaryColor,
                    tabs: const [
                      Tab(text: "Email"),
                      Tab(text: "Phone Number"),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// TAB CONTENT
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        /// EMAIL LOGIN
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email Address"),
                            const SizedBox(height: 6),
                            CustomTextFieldWidget(
                              controller: emailController,
                              hintText: "yourgmail@gmail.com",
                            ),
                            const SizedBox(height: 20),
                            const Text("Password"),
                            const SizedBox(height: 6),
                            CustomTextFieldWidget(
                              controller: passwordController,
                              hintText: "***********",
                            ),
                          ],
                        ),

                        /// PHONE LOGIN
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Text("Phone Number"),
                            const SizedBox(height: 46),
                            CustomTextFieldWidget(
                              hintText: "Enter your mobile number",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// PRIMARY BUTTON (CHANGES)
                  CustomElevatedButton(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    text: signIn.isLoadingEmail ? "Login" : "Send OTP",
                    onPressed: () {
                      signIn.isLoadingEmail
                          ? null
                          : signIn.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );

                      if (!mounted) return;

                      if (signIn.error == null) {
                        context.go("/home");
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(signIn.error!)));
                      }
                    },
                  ),

                  /// ONLY FOR EMAIL LOGIN
                  if (isEmailLogin) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          const Expanded(child: Divider(thickness: 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "or sign in with",
                              style: TextStyle(
                                color: AppColors.borderColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider(thickness: 1)),
                        ],
                      ),
                    ),

                    CustomElevatedButton(
                      isLoading: signIn.isLoadingGoogle,
                      text: signIn.isLoading?
                          'Please wait'
                          : "Continue with google",
                      leading: const Icon(
                        Icons.g_mobiledata,
                        color: Colors.white,
                      ),
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      onPressed: () async {
                        if (signIn.isLoading) return;

                        await signIn.signInWithGoogleJwt();

                        if (!mounted) return;

                         if (signIn.error == null) {
                          context.go('/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(signIn.error!)),
                          );
                        }
                      },
                    ),
                  ],

                  const SizedBox(height: 30),

                  /// CREATE ACCOUNT
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Create an Account",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
