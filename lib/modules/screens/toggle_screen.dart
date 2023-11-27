import 'package:paymentapp/controller/payment_cubit_cubit.dart';
import 'package:paymentapp/controller/payment_cubit_state.dart';
import 'package:paymentapp/core/constes/constes.dart';
import 'package:paymentapp/core/network/constant.dart';
import 'package:paymentapp/modules/screens/ref_code_screen.dart';
import 'package:paymentapp/modules/screens/visa_screen.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubitCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Toggle Screen'),
            centerTitle: true,
          ),
          body: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
            listener: (context, state) {
              if(state is PaymentRefCodeSuccessState){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReferenceScreen(),));
              }
            },
            builder: (context, state) {
              var cubit = PaymentCubitCubit.get(context);
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.getRefCode();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: Image.network(AppImages.refCodeImage),
                        ),
                      ),
                    ),
                    10.heightBox,
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const VisaScreen(),),);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: Image.network(AppImages.visaImage),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
