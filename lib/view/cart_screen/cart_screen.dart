import 'package:country_code_picker/country_code_picker.dart';
import 'package:emart_project/consts/consts.dart';
import 'package:emart_project/widget_common/textfield_with_contryflag/input_text_field.dart';
import 'package:emart_project/widget_common/with_apicalling/data_list.dart';
import 'package:flutter/services.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    final focusNode = FocusNode();
    // TextEditingController phoneController = TextEditingController();
    var data = '';
    String countryCode = "IN";

    return
        // Container(
        //   color: Colors.purple,
        //   child:
        SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // const CheckConnection(),

            // const MobilenumberWithContrypicker(),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: NumberWidget(
                focusNode: focusNode,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.deny(RegExp("[^a-zA-Z0-9]"))
                ],
                hintText: 'Mobilenumber',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                prefixIconConstraints:
                    BoxConstraints.loose(const Size(125, 50)),
                prefixIcon: Row(
                  children: [
                    CountryCodePicker(
                      onChanged: (element) {
                        element.toLongString();
                        // setState(() {
                        //   data = element.toString();
                        // });

                        print("data is that $data");
                      },
                      onInit: (value) => data = value.toString(),
                      initialSelection: 'India',
                      showCountryOnly: true,
                      showFlagDialog: true,
                      // showOnlyCountryWhenClosed: true,
                      favorite: const ['+19', 'India'],
                    ),
                    const VerticalDivider(
                      width: 2,
                      color: Colors.black,
                    )
                  ],
                ),
                controller: phoneController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                validator: (value) {
                  return validateMobile(
                    value,
                    mobileNumberLength: 10,
                  );
                },
              ),
            ),

            Text(data),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  _formKey.currentState!
                      .validate(); // modalbottomsheet.moremodalbottomsheet(context);
                },
                child: const Text('Check'),
              ),
            ),

            const Expanded(child: CountryListScreen()),
            ElevatedButton(
                onPressed: () {
                  // countryPickerBottomsheet(
                  //   buildContext: context,
                  //   location: false,
                  //   text: "Enter Your Country Code",
                  //   passValue: (Country country) {

                  //     phoneController.clear();
                  //     setState(() {});
                  //   },
                  // );
                  CountryCodePicker(
                    initialSelection: "IN",
                    onChanged: (CountryCode value) {
                      countryCode = value.code ?? "";
                      setState(() {});
                    },
                  );
                },
                child: Text("press")),

            Text(countryCode),
          ],
        ).box.yellow100.make(),
      ),
    );
    // );
  }

  static String? validateMobile(String? value, {int? mobileNumberLength}) {
    if (value == '' || value?.isEmpty == true) {
      return "Please Enter a Phone Number";
      //   // } else if (!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
      //   //   return "Please Enter a Valid Phone Number";
      // }
      // if (mobileNumberLength != null) {
    } else if (value!.length < (mobileNumberLength ?? 9)) {
      return "Enter 10 Digit mobile number";
    } else if (value.contains(RegExp(r'[;*+_,#/()]'))) {
      return "Invalid Phone Number";
    }
    // }

    return null;
  }
}
