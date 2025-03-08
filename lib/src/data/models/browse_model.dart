// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class BrowseModel {
  final String featuredImg;
  final String title;
  final String uID;

  final String viewers;

  final List<String> tags;

  BrowseModel({
    required this.featuredImg,
    required this.title,
    required this.uID,
    required this.viewers,
    required this.tags,
  });
}

List<BrowseModel> browseModel = [
  BrowseModel(
    featuredImg:
        "https://th.bing.com/th/id/R.6292c3a9e09c082e425665c91b716130?rik=x7L%2bexkDyKxKXw&pid=ImgRaw&r=0_",
    title: "FORTNITE",
    uID: "1",
    viewers: "4,167",
    tags: ["BR", "Action"],
  ),
  BrowseModel(
    featuredImg:
        "https://www.figma.com/file/4Hg5lvvwYOClD0pYJ6tMYG/image/a3553e1c6d399966b33b753e9963c55e341118ba",
    title: "VALORANT",
    uID: "1",
    viewers: "4,167",
    tags: ["BR", "Action"],
  ),
  BrowseModel(
    featuredImg:
        "https://www.figma.com/file/4Hg5lvvwYOClD0pYJ6tMYG/image/72aa6ca269a4e017112fb8ef90fddf2d3bc27749",
    title: "Call of Duty",
    uID: "1",
    viewers: "2,167",
    tags: ["BR", "Action"],
  ),
  BrowseModel(
    featuredImg:
        "https://www.figma.com/file/4Hg5lvvwYOClD0pYJ6tMYG/image/2c6ec0a4165474152848fa3bef6bb0ff15018812",
    title: "Leniage",
    uID: "1",
    viewers: "1,442",
    tags: ["BR", "Action"],
  ),
];
