import 'package:country_code_picker/country_code_picker.dart';
import 'package:emart_project/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobilenumberWithContrypicker extends StatefulWidget {
  const MobilenumberWithContrypicker({super.key});

  @override
  State<MobilenumberWithContrypicker> createState() =>
      _MobilenumberWithContrypickerState();
}

class _MobilenumberWithContrypickerState
    extends State<MobilenumberWithContrypicker> {
  RegExp regExp = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 100,
          height: 60,
          child: CountryCodePicker(
            onChanged: (element) => debugPrint(element.toLongString()),
            initialSelection: 'India',
            showCountryOnly: true,
            showFlagDialog: true,
            // showOnlyCountryWhenClosed: true,
            favorite: const ['+19', 'India'],
          ),
        ),
        const VerticalDivider(
          width: 1,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp("[0-9]"),
                ),
              ],
              validator: (val) => val!.length != 10
                  ? 'Enter a mobile number of 10 digits'
                  : null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Phone Number",
              ),
              onChanged: (value) {
                // this.phoneNo=value;

                return null;
              }),
        ),
      ],
    ).box.white.height(60).margin(const EdgeInsets.all(10)).make();
  }
}



// Widget mobileNumberInput() {
//     return Padding(
//       padding: const EdgeInsets.only(right: AppSizes.size20),
//       child: NumberWidget(
//         focusNode: focusNode,
//         inputFormatters: <TextInputFormatter>[
//           FilteringTextInputFormatter.deny(RegExp("[^a-zA-Z0-9]"))
//         ],
//         hintText: AppConstString.mobileNo,
//         hintStyle: AppTextStyle.regular16,
//         prefixIconConstraints: BoxConstraints.loose(const Size(125, 50)),
//         prefixIcon: GestureDetector(
//           onTap: () {
//             countryPickerBottomsheet(
//               buildContext: context,
//               location: false,
//               text: "Enter Your Country Code",
//               passValue: (Country country) {
//                 widget.presenter.selectCountry(country);
//                 phoneController.clear();
//                 setState(() {});
//               },
//             );
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: AppSizes.size16,
//                 child: CircleAvatar(
//                   radius: 15.0,
//                   backgroundImage: NetworkImage(
//                     _model.countryCode?.image ?? AppAssets.uaeFlag,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: AppSizes.size4,
//               ),
//               Text(
//                 "+${_model.countryCode?.countryCode ?? "971"}",
//                 style: AppTextStyle.semiBold16,
//               ),
//               const Icon(
//                 Icons.keyboard_arrow_down,
//                 color: AppColors.whiteColor,
//               ),
//               const SizedBox(
//                 width: AppSizes.size6,
//               ),
//               Container(
//                 height: AppSizes.size20,
//                 width: 1,
//                 color: AppColors.whiteColor,
//               ),
//             ],
//           ),
//         ),
//         controller: phoneController,
//         keyboardType: TextInputType.number,
//         maxLength: _model.countryCode?.mobileNumberLength ?? 9,
//         validator: (value) {
//           return Validators.validateMobile(
//             value,
//             mobileNumberLength: _model.countryCode?.mobileNumberLength ?? 9,
//           );
//         },
//       ),
//     );
//   }