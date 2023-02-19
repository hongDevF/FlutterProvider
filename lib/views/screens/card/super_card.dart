// ignore_for_file: prefer_const_constructors, camel_case_types, unused_local_variable, non_constant_identifier_names, dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprovider/routes/route_name.dart';
import 'package:flutterprovider/views/widgets/custom_text_field.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:flutterprovider/views/widgets/global/gradients_color.dart';
import 'package:flutterprovider/views/widgets/card_widget/search_card.dart';

import '../../widgets/card_widget/back_card.dart';
import '../../widgets/card_widget/custom_super_card.dart';
import '../../widgets/card_widget/front_card.dart';

class SuperCard extends StatefulWidget {
  const SuperCard({super.key});

  @override
  State<SuperCard> createState() => _SuperCardState();
}

class _SuperCardState extends State<SuperCard> {
  TextEditingController searchTextController = TextEditingController();

  bool isFront = false;
  @override
  void initState() {
    super.initState();
    changeCard();
  }

  void changeCard() {
    setState(() {
      isFront = !isFront;
    });
  }

  List colors = [
    CO_DEEPPINK,
    CO_BLUE,
    CO_GOLD,
    CO_GRAY,
  ];
  List typeCard = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png',
    'https://download.logo.wine/logo/Mastercard/Mastercard-Logo.wine.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/2560px-PayPal.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/2560px-PayPal.svg.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ! AppBar
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // height: 200,
              child: Row(
                children: [
                  CustomText(
                    text: 'Super Card',
                    istitle: true,
                    Roboto_Slap: true,
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {
                      // show_model_sheet(context);
                    },
                    icon: Icon(Icons.menu),
                  ),
                  IconButton(
                    onPressed: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return searchCard(controller: searchTextController);
                          });
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            // const Divider(
            //   height: 3,
            //   color: CO_BLUEVIOLET,
            // ),
            // ! TabBar
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      // onTap: (value) => print('testr'),

                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      tabs: [
                        CustomText(
                          text: 'My Card',
                          Popin: true,
                          // istitle: true,
                          textSize: 18,
                        ),
                        CustomText(
                          text: 'All Card',
                          textSize: 18,
                          Popin: true,
                          // istitle: true,
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        Column(
                          children: [
                            AnimatedCrossFade(
                                // secondCurve: Canvas.,e
                                excludeBottomFocus: false,
                                firstChild: FrontCard(),
                                secondChild: BackCard(),
                                crossFadeState: isFront
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: Duration(seconds: 2)),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () => changeCard(),
                                  child: isFront
                                      ? CustomText(
                                          text: 'Show CVC',
                                          color: CO_BLUE,
                                        )
                                      : CustomText(
                                          text: 'Hide CVC',
                                          color: CO_DARKBLUE,
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: colors.length,
                                itemBuilder: (context, index) {
                                  return customSuperCard(
                                    color: colors[index],
                                    image: typeCard[index],
                                  );
                                },
                              ),
                              Container(
                                width: double.infinity,
                                height: 100,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: CO_DARKRED),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteNames.create_card);
                                  },
                                  child: CustomText(
                                    text: '+ Create New Card',
                                    textSize: 25,
                                    Popin: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card cardMenu(
    BuildContext context,
    String route,
    IconData icon,
    String title,
  ) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, route),
        leading: Icon(icon),
        title: CustomText(text: title),
      ),
    );
  }
}
