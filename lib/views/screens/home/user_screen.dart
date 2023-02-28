import 'package:flutter/material.dart';
import 'package:flutterprovider/view_models/user_view_model.dart';
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
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     Provider.of<UserNotify>(context, listen: false).getUser();
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserModelProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
        text: 'user Screen',
      )),
      body: Center(
        child: FutureBuilder(
          future: provider.fetchUserModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text("Data has Error");
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    provider.fetchUserModel();
                  });
                },
                child: Align(
                  alignment: Alignment.center,
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                              provider.userModel!.results[0].picture!.medium!,
                            ),
                          ),
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                              provider.userModel!.results[0].picture!.large!,
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        title:
                            Text(provider.userModel!.results[0].name!.first!),
                        subtitle: Text(
                          provider.userModel!.results[0].login!.username!,
                        ),
                      ),
                      Text(provider.userModel!.info.results.toString()),
                      Text(provider.userModel!.info.seed!),
                      Text(provider.userModel!.info.page.toString()),
                      Text(provider.userModel!.info.version.toString()),
                      //  Text(provider.userModel!.info.seed)
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
