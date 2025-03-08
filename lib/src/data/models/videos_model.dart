class VideosModel {

  final int views ;
  final String time ;
  final String duration ;
  final String image ;
  final String thumbnail ;
  final String title ;
  final String name ;

  VideosModel({required this.thumbnail ,
    required this.views, required this.time, required this.duration, required this.image, required this.title, required this.name
  });
}



List<VideosModel> videosList = [

  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 40,
      time: "2 hours ago",
      duration: '2:10:30',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "Chill Tasking at the Shed! - !giveaway",
      name: "ShaZaM * Fortnite"
  ),
  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 40,
      time: "Yesterday",
      duration: '0:50:10',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "How to take enjoy",
      name: "ShaZaM * Fortnite"
  ),
  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 50,
      time: "3 hours ago",
      duration: '1:45:20',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "Exploring the Wilderness",
      name: "Adventure Explorer"
  ),
  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 60,
      time: "4 hours ago",
      duration: '1:30:45',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "Cooking with Chef Lisa",
      name: "Chef Lisa"
  ),
  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 70,
      time: "5 hours ago",
      duration: '2:00:15',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "Fitness Tips for Beginners",
      name: "FitLife"
  ),
  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 80,
      time: "6 hours ago",
      duration: '1:20:30',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "Gardening Hacks",
      name: "GreenThumb"
  ),
  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 90,
      time: "7 hours ago",
      duration: '1:15:50',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "DIY Home Decor Ideas",
      name: "Crafty Corner"
  ),
  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 100,
      time: "8 hours ago",
      duration: '2:30:40',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "Learn to Paint like a Pro",
      name: "Artistic Expressions"
  ),
  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 110,
      time: "9 hours ago",
      duration: '1:10:25',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "Reading Classics: Pride and Prejudice",
      name: "Bookworm's Paradise"
  ),
  VideosModel(
      thumbnail: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlf-lXUkRADSmU9Xz-S54DFTqDIXUITTTSEQ&usqp=CAU",
      views: 120,
      time: "10 hours ago",
      duration: '1:55:10',
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&usqp=CAU",
      title: "Stargazing in the Night Sky",
      name: "StarSeeker"
  ),

] ;
