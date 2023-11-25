import 'package:paymentapp/core/constes/constes.dart';
import 'package:paymentapp/modules/widgets/default_button.dart';
import 'package:paymentapp/modules/widgets/default_textformfiled.dart';

import '../../core/constes/icons.dart';
import '../../core/constes/strings.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment integration'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Image.asset(img),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DefaultTextFormFiled(
                                controller: firstNameController,
                                type: TextInputType.text,
                                hintText: firstName,
                                prefix: personIcon,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return pleaseEnterUrFirstName;
                                  }
                                  return null;
                                }),
                          ),
                          10.widthBox,
                          Expanded(
                            child: DefaultTextFormFiled(
                                controller: lastNameController,
                                type: TextInputType.text,
                                hintText: lastName,
                                prefix: personIcon,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return pleaseEnterUrLastName;
                                  }
                                  return null;
                                }),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Expanded(
                        child: DefaultTextFormFiled(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            hintText: email,
                            prefix: emailIcon,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return pleaseEnterUrEmail;
                              }
                              return null;
                            }),
                      ),
                      10.heightBox,
                      Expanded(
                        child: DefaultTextFormFiled(
                            controller: phoneController,
                            type: TextInputType.phone,
                            hintText: phoneNumber,
                            prefix: phoneNumberIcon,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return pleaseEnterUrPhoneNumber;
                              }
                              return null;
                            }),
                      ),
                      10.heightBox,
                      Expanded(
                        child: DefaultTextFormFiled(
                            controller: priceController,
                            type: TextInputType.number,
                            hintText: price,
                            prefix: priceIcon,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return pleaseEnterTheAmount;
                              }
                              return null;
                            }),
                      ),
                      10.heightBox,
                      DefaultButton(
                        backgroundColor: Colors.purple.shade300,
                        radius: 10,
                        buttonWidget: register.text
                            .letterSpacing(1.7)
                            .white
                            .size(18.0)
                            .make(),
                        function: () {
                          if (formKey.currentState!.validate()) {
                            print('done');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
