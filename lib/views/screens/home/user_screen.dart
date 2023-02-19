import 'package:flutter/material.dart';
import 'package:flutterprovider/view_models/userviewmodel.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<UserNotify>(context, listen: false).getUser();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userNitify = Provider.of<UserNotify>(context).getUser();
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
        text: 'user Screen',
      )),
      body: Consumer<UserNotify>(builder: (context, value, child) {
        final users = value.users;
        if (users.isEmpty) {
          return Center(
            child: CustomText(
              text: 'No have user!!',
              textSize: 20,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: Text(user.userName),
              );
            },
          );
        }
      }),
    );
  }
}
