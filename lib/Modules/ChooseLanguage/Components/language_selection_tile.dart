// import 'package:flutter/material.dart';
//
// class LanguageSelectionTile extends StatefulWidget {
//   LanguageSelectionTile({required this.lang, super.key});
//
//   String lang;
//
//   @override
//   State<LanguageSelectionTile> createState() => _LanguageSelectionTileState();
// }
//
// bool isSelected = false;
//
// class _LanguageSelectionTileState extends State<LanguageSelectionTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
//           borderRadius: BorderRadius.circular(5)
//           //shape: BoxShape.circle,
//           ),
//       height: 90,
//       width: double.infinity,
//       child: ListTile(
//         leading: const Icon(Icons.sort_by_alpha),
//         title: Text(
//           widget.lang,
//           style: const TextStyle(color: Colors.black),
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.radio_button_unchecked),
//           onPressed: () async {
//             if (isSelected = false) {
//               setState(() {
//                 isSelected = true;
//               });
//             } else {
//               setState(() {
//                 isSelected = false;
//               });
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
