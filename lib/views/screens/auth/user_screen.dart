// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison, unrelated_type_equality_checks

// import 'package:flutter/material.dart';
// import 'package:flutterprovider/view_models/user_view_model.dart';
// import 'package:flutterprovider/views/widgets/global/colors.dart';
// import 'package:provider/provider.dart';

// class UserScreen extends StatefulWidget {
//   const UserScreen({super.key});

//   @override
//   State<UserScreen> createState() => _UserScreenState();
// }

// class _UserScreenState extends State<UserScreen> {
//   get itemCount => null;

//   @override
//   Widget build(BuildContext context) {
//     UserViewModel userViewModel = context.watch<UserViewModel>();
//     return Scaffold(
//       appBar: AppBar(),
//       body: _ui(userViewModel),
//     );
//   }

//   _ui(UserViewModel userViewModel) {
//     if (userViewModel.loading) {
//       return Container(
//         child: Center(
//             child: CircularProgressIndicator(
//           backgroundColor: CO_WHITE,
//         )),
//       );
//     }
//     if (userViewModel.userError != null) {
//       return Center(
//         child: Text(
//           "is error",
//           style: TextStyle(fontSize: 40, color: Colors.amber),
//         ),
//       );
//     }
//     return Expanded(
//       child: FutureBuilder<UserViewModel>(
//         // future: userViewModel,
//         builder: (context, snapshot) {
//           if (snapshot.hasData == ConnectionState.active) {
//             return Center(
//               child: Text("OK"),
//             );
//           }
//           return ListTile();
//         },
//       ),
//     );
//   }
// }
