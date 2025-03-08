import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/components/custom_button.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class BlockedChannelsScreen extends StatefulWidget {
  const BlockedChannelsScreen({
    super.key,
  });

  @override
  State<BlockedChannelsScreen> createState() => _BlockedChannelsScreenState();
}

class _BlockedChannelsScreenState extends State<BlockedChannelsScreen> {
  TextEditingController searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlackColor,
        appBar: AppBar(
          backgroundColor: kBlackColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Block user",
            style: TextStyle(
                fontSize: 15, color: kWhiteColor, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: kWhiteColor,
              )),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding * 2.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   // <------------------------  BLOCKED USERS SECTION ------------------------>

                  const SizedBox(height: kPadding * 2),
  const Text(
                    "Is someone giving you a hard time? Block them and they won't be able to interact with you.",
                    style: TextStyle(
                        fontSize: 13,
                        color: kLightGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: kPadding * 2),

                  TextField(
                    controller: searchController,
                    style: const TextStyle(
                        color: kQuarterColor, fontSize: 17),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kTertiaryColor,
                      prefixIcon: const Icon(Icons.search,
                          color: kQuarterColor),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          color: kQuarterColor, fontSize: 17),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(kRadius),
                          borderSide: const BorderSide(
                              color: kTertiaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(kRadius),
                          borderSide: const BorderSide(
                              color: kTertiaryColor)),
                      contentPadding:
                          const EdgeInsets.all(kPadding / 2),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchText = searchController.text;
                      });
                    },
                  ),
                  const SizedBox(height: kPadding * 2),

                 
                

                  Column(
                    children: List.generate(15, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: kPadding/2),
                        child: Container(
                          
                          padding: const EdgeInsets.all(kPadding ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(kRadius),
                                child: Image.network(
                                  "https://www.figma.com/file/ZQtVBdUfQaDDRCN1QGxD1C/image/71f8a1ba4341094db9a4fdb355b7a018beaa2528",
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: kPadding * 2),
                              const Text(
                                "Apexplayer",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {},
                                  text: "Unblock",
                                  negativeColor: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
