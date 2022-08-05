import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

void main() => runApp(
      MaterialApp(
        title: 'OTP App',
        home: OTP(),
      ),
    );

class OTP extends StatelessWidget {
  OTP({Key? key}) : super(key: key);

  final String requiredOtp = '2468';
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pinput(
            controller: otpController,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            defaultPinTheme: PinTheme(
              width: 70.0,
              height: 70.0,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            errorPinTheme: PinTheme(
              width: 70,
              height: 70,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
              decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            errorTextStyle: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.redAccent),
            separatorPositions: const [2],
            separator: const Text(
              " - ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              otpController.clear();
            },
            validator: (otp) {
              if (otp == requiredOtp) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('OTP is valid'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return null;
              }

              return 'OTP is invalid, kindly try again.';
            },
          ),
        ],
      ),
    );
  }
}
