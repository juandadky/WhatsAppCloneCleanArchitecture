import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsapp_clone_clean/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:whatsapp_clone_clean/presentation/widgets/theme/style.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phoneNumber;

  const PhoneVerificationPage({Key key, this.phoneNumber}) : super(key: key);
  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {

  String get _phoneNumber => widget.phoneNumber;

  TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),
                Text('Verify you phone number', 
                  style: TextStyle(fontSize: 18,color: greenColor, fontWeight: FontWeight.w500),),
                Icon(Icons.more_vert)
              ],
            ),
            SizedBox(height: 30,),
            Text('WhatsApp Clone will send and SMS message (carrier charges may apply) to verify your phone number. Enter your country code and phone number:',
              style: TextStyle(fontSize: 16,),),
            _pimCodeWidget(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: _submitSmsCode,
                  child: Text('Next', style: TextStyle(fontSize: 18, color: Colors.white),),
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  Widget _pimCodeWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          PinCodeTextField(
            controller:  _pinCodeController,
            length: 6,
            backgroundColor: Colors.transparent,
            obsecureText: true, 
            onChanged: (pinCode){
              print(pinCode);
            }
          ),
          Text('Enter your 6 digit code')
        ],
      ),
    );
  }

  void _submitSmsCode(){
    if(_pinCodeController.text.isNotEmpty){
      BlocProvider.of<PhoneAuthCubit>(context)
        .submitSmsCode(smsCode: _pinCodeController.text);
    }
  }

  

}