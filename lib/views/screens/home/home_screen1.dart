// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:flutterprovider/views/widgets/custom_text_field.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  bool isshow = false;
  @override
  void initState() {
    super.initState();
    closeFilter();
  }

  closeFilter() {
    setState(() {
      isshow = !isshow;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      CO_BLUE,
      CO_DEEPPINK,
      CO_DARKGREY,
      CO_DARKSLATEGRAY,
      CO_BLUE,
      CO_DEEPPINK,
      CO_DARKGREY,
      CO_DARKSLATEGRAY,
    ];
    TextEditingController search = TextEditingController();

    final appSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CO_BLUEVIOLET,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: closeFilter,
              icon: isshow ? const Icon(Icons.clear) : const Icon(Icons.search),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: appSize.height,
        decoration: const BoxDecoration(color: CO_BLUEVIOLET),
        child: Column(
          children: [
            isshow
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      buildListBar(
                        text: 'home',
                        icon: Icons.home,
                      ),
                      buildListBar(
                        text: 'Favorite',
                        icon: Icons.favorite,
                      ),
                      buildListBar(
                        text: 'running',
                        icon: Icons.run_circle_rounded,
                      ),
                      buildListBar(
                        text: 'Payment',
                        icon: Icons.sd_card_sharp,
                      ),
                    ],
                  ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: isshow
                  ? Container(
                      // height: 500,
                      decoration: const BoxDecoration(
                        color: CO_WHITE,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 45,
                                        child: customTextField(
                                            hintText: 'search',
                                            controller: search),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(Icons.text_snippet_outlined),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(Icons.filter_list),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: 'Results',
                                    textSize: 20,
                                    istitle: true,
                                  ),
                                  const RotatedBox(
                                    quarterTurns: -1,
                                    child: Icon(Icons.arrow_back_ios_new),
                                  ),
                                ],
                              ),
                            ),
                            const buildCardResult(),
                            const buildCardResult(),
                            const buildCardResult(),
                          ],
                        ),
                      ),
                    )
                  : gridBuilder(colorList: colorList),
            ),
          ],
        ),
      ),
    );
  }
}

class gridBuilder extends StatelessWidget {
  const gridBuilder({
    Key? key,
    required this.colorList,
  }) : super(key: key);

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
          itemCount: colorList.length,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 6 / 9,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorList[index]),
            );
          }),
    );
  }
}

class buildCardResult extends StatelessWidget {
  const buildCardResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: ListTile(
        horizontalTitleGap: 10,
        contentPadding: const EdgeInsets.all(0),
        leading: Container(
          alignment: Alignment.topLeft,
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                'https://res.cloudinary.com/daily-now/image/upload/f_auto,q_auto/v1/posts/55333098b172c7c2d661b07b488c913e',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: CustomText(
          text: 'The moview',
          istitle: true,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomText(
            text: 'The moview',
            istitle: false,
          ),
        ),
        trailing: const Icon(
          Icons.notifications_none,
        ),
      ),
    );
  }
}

class buildListBar extends StatefulWidget {
  const buildListBar({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  State<buildListBar> createState() => _buildListBarState();
}

class _buildListBarState extends State<buildListBar> {
  var isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isClicked ? Colors.black45 : null,
        ),
        child: Column(
          children: [
            Icon(
              widget.icon,
              color: CO_WHITE,
            ),
            Text(
              widget.text,
              style: const TextStyle(
                color: CO_WHITE,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
