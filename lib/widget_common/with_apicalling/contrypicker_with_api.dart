// import 'dart:js';

// import 'package:emart_project/widget_common/textfield_with_contryflag/input_text_field.dart';
// import 'package:emart_project/widget_common/with_apicalling/country_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';

// Future<void> countryPickerBottomsheet({
//   required BuildContext buildContext,
//   required String text,
//   required bool location,
//   required Function(Country country) passValue,
// }) async {
//   List<Country> countryList = await fetchData();

//   List<Country> searchCountry = countryList;
//   // var notMatchCountryText = AppConstString.noResultFound;

//   List<Country> search(String query) {
//     return countryList
//         .where((e) =>
//             e.name!.toLowerCase().contains(query) ||
//             e.code!.toLowerCase().contains(query) ||
//             e.nationality!.toLowerCase().contains(query) ||
//             e.countryCode!.toLowerCase().contains(query))
//         .toList();
//   }

// // showBottomSheet(context: widget.buildContext, builder: builder)
//   void bottomsheet(context) {
//     showModalBottomSheet(
//       backgroundColor: const Color(0xffFCB678),
//       context: buildContext,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
//       ),
//       builder: (ctx) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Padding(
//               padding: EdgeInsets.only(
//                 top: 20,
//                 right: 20,
//                 left: 20,
//                 bottom: MediaQuery.of(ctx).viewInsets.bottom,
//               ),
//               child: SizedBox(
//                 height: 350,
//                 width: MediaQuery.of(ctx).size.width,
//                 child: Column(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           text,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                           ).copyWith(
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         TextFormFieldWidget(
//                           hintText: "search",
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 16),
//                           suffixIconConstraints: BoxConstraints.loose(
//                             const Size(50, 50),
//                           ),
//                           suffixIcon: InkWell(
//                             onTap: () {
//                               // AutoRouter.of(ctx).pop();
//                             },
//                             child: const Center(
//                               child: Icon(
//                                 Icons.search,
//                                 size: 24,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           onChanged: (value) {
//                             if (value != null) {
//                               searchCountry = search(value.toLowerCase());
//                             } else if (value!.isEmpty) {
//                               searchCountry = countryList;
//                             } else {
//                               searchCountry = countryList;
//                             }
//                             setState(() {});
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Expanded(
//                       child: searchCountry.isNotEmpty
//                           ? ListView.builder(
//                               itemCount: searchCountry.length,
//                               itemBuilder: (_, index) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Row(
//                                       children: [
//                                         CircleAvatar(
//                                           radius: 15.0,
//                                           backgroundImage: NetworkImage(
//                                               searchCountry[index]
//                                                   .image
//                                                   .toString()),
//                                         ),
//                                         const SizedBox(
//                                           width: 16,
//                                         ),
//                                         Flexible(
//                                           child: Text(
//                                             searchCountry[index]
//                                                 .name
//                                                 .toString(),
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w700,
//                                               color: Colors.white,
//                                             ).copyWith(color: Colors.black),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 6,
//                                         ),
//                                         Container(
//                                           height: 1,
//                                           width: 7,
//                                           color: Colors.black,
//                                         ),
//                                         const SizedBox(
//                                           width: 6,
//                                         ),
//                                         location
//                                             ? const SizedBox()
//                                             : Text(
//                                                 '(+${searchCountry[index].countryCode})',
//                                                 style: const TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w700,
//                                                   color: Colors.white,
//                                                 ).copyWith(color: Colors.black))
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             )
//                           : Center(
//                               child: Text(
//                               "notMatchCountryText",
//                               style: const TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.white,
//                               ).copyWith(
//                                 color: Colors.blue,
//                               ),
//                             )),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// Future<List<Country>> fetchData() async {
//   List<Country> countryList = [];
//   final Response response = await Dio().get(
//     'https://reqres.in/api/users?page=2',

//     // queryParameters: {},
//   );
//   if (response != null) {
//     for (Map<String, dynamic> i in response.data) {
//       countryList.add(Country.fromJson(i));
//     }
//     for (Map<String, dynamic> i in response.data['other_country']) {
//       countryList.add(Country.fromJson(i));
//     }
//   }
//   return countryList;
// }

// // Future<List<Country>> getCountryList(BuildContext context) async {
// //   List<Country> countryList = [];
// //   final Map<String, dynamic>? response = await NetworkDio.getDioHttpMethod(
// //     context: context,
// //     url: ApiPath.apiEndPoint + ApiPath.country,
// //   );
// //   if (response != null) {
// //     for (Map<String, dynamic> i in response['data']['values']['top_country']) {
// //       countryList.add(Country.fromJson(i));
// //     }
// //     for (Map<String, dynamic> i in response['data']['values']
// //         ['other_country']) {
// //       countryList.add(Country.fromJson(i));
// //     }
// //     GlobalSingleton.countryList = countryList;
// //   }
// //   return countryList;
// // }

// // Future<List<Country>> fetchCountries() async {
// //   List<Country> countryList = [];
// //   final Map<String, dynamic> response = await http.get(Uri.parse(
// //       'https://apisandbox.clubclass.io/server/development/UATCC2MobileAppV3/listing/country'));

// //   if (response != null) {
// //     for (Map<String, dynamic> i in response['data']['values']['top_country']) {
// //       countryList.add(Country.fromJson(i));
// //     }
// //     for (Map<String, dynamic> i in response['data']['values']
// //         ['other_country']) {
// //       countryList.add(Country.fromJson(i));
// //     }
// //   }
// //   return countryList;
// // }
