import 'package:mavenx/src/app/presentation/utils/assets.dart';

class AccountsConnectModel {
  final String platformImg;
  final String title;

  AccountsConnectModel({
    required this.platformImg,
    required this.title,
  });
}

List<AccountsConnectModel> accountsConnectModel = [
  AccountsConnectModel(
    platformImg: Assets.images.riotGamesPNG,
    title: "Riot Games",
  ),
  AccountsConnectModel(
    platformImg: Assets.images.steamPNG,
    title: "Steam",
  ),
  AccountsConnectModel(
    platformImg: Assets.images.battleNetPNG,
    title: "Battle Net",
  ),
   AccountsConnectModel(
    platformImg: Assets.images.originPNG,
    title: "Origin",
  ),
   AccountsConnectModel(
    platformImg: Assets.images.epicGamesPNG,
    title: "Epic Games",
  ),
   AccountsConnectModel(
    platformImg: Assets.images.xBoxPNG,
    title: "Xbox",
  ),
   AccountsConnectModel(
    platformImg: Assets.images.playStationPNG,
    title: "Playstation",
  ),
];
