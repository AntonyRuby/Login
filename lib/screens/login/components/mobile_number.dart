import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../../business_logic/models/login.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({
    Key key,
    @required this.phoneController,
    @required this.login,
  }) : super(key: key);

  final TextEditingController phoneController;
  final Login login;

  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  double pad = 0.0;

  @override
  Widget build(BuildContext context) {
    return
        //  InternationalPhoneNumberInput(
        //   onInputChanged: (value) {
        //     login.prefix = value.dialCode;
        //     login.mobile = value.phoneNumber;
        //   },
        //   selectorConfig: SelectorConfig(
        //       showFlags: false, selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
        //   inputBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Colors.grey[400],
        //     ),
        //   ),

        //   initialValue: PhoneNumber(dialCode: "971"),
        Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: pad),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: CountryCodePicker(
                  onChanged: (value) {
                    widget.login.prefix = value.code;
                  },
                  initialSelection: "AE",
                  showFlagMain: false,
                  textStyle: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: widget.phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400])),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0))),
                labelText: "Mobile number",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: (value) {
                int val = int.parse(value);
                if ((val > 100000000) && (val < 9999999999)) {
                  setState(() {
                    pad = 0.0;
                  });
                  return null;
                } else {
                  setState(() {
                    pad = 22.0;
                  });
                  return "Invalid mobile number";
                }
              },
              onChanged: (value) {
                widget.login.mobile = value;
              },
              key: Key("_mobile_number"),
            ),
          ),
        ],
      ),
    );
  }
}
