import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cash/presentation/screens/home/home_nontoken.dart';

import '../../controller/login_controller.dart';
import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/style_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController(), permanent: false);
    return Scaffold(
      backgroundColor: Colormanager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(AppStrings.smartcash,style: getBoldStyle(color: Colormanager.primary, fontSize: 45,),), //App Logo
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            AppStrings.email,
                            style: getBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            //Email FormField
                            controller: controller.email,

                            textInputAction: TextInputAction.next,

                            style: getBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: 14),
                            textAlign: TextAlign.start,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: AppStrings.hEmail,
                              suffixIcon: Icon(
                                Icons.email,
                                color: Colormanager.black54,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colormanager.red,
                                ),
                                borderRadius: BorderRadius.circular(
                                  14,
                                ),
                              ),
                              fillColor: Colormanager.fillcolor,
                              filled: true,
                            ),
                            validator: (value) {
                              return controller.validateEmail(value!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          AppStrings.password,
                          style: getBoldStyle(
                              color: Colormanager.darkGrey,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(() => TextFormField(
                              obscureText: controller.obscureText.value,
                              controller: controller.password,
                              textInputAction: TextInputAction.done,
                              style: getBoldStyle(
                                  color: Colormanager.darkGrey,
                                  fontSize: 14),
                              decoration: InputDecoration(
                                hintText: AppStrings.hPassword,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    controller.obscureText.value =
                                        !controller.obscureText.value;
                                  },
                                  child: controller.obscureText.value
                                      ? Icon(
                                          Icons.visibility,
                                          color: Colormanager.black54,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: Colormanager.black54,
                                        ),
                                ),
                                // icon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    14,
                                  ),
                                ),
                                fillColor: Colormanager.fillcolor,
                                filled: true,
                              ),
                              validator: (value) {
                                return controller.validatePassword(value!);
                              },
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  controller.getValidate();
                },
                child: Container(
                  width: MediaQuery.of(
                    context,
                  ).size.width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        4,
                      ),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(2, 4),
                          blurRadius: 5,
                          spreadRadius: 2),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colormanager.primary, Colormanager.darkPrimary],
                    ),
                  ),
                  child: Text(
                    AppStrings.login,
                    style: getBoldStyle(
                        color: Colormanager.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  padding: const EdgeInsets.all(
                    14,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(AppStrings.donhaveAccount,
                          style: getBoldStyle(
                            color: Colormanager.black54,
                            fontSize: 16,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        AppStrings.register,
                        style: getBoldStyle(
                          color: Colormanager.primary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(()=> HomeViewNotToken());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  padding: const EdgeInsets.all(
                    14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(AppStrings.skip,
                          style: getBoldStyle(
                            color: Colormanager.primary,
                            fontSize: 20,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.forward,size:40, color: Colormanager.primary,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
