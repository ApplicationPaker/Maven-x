// import 'package:flutter/material.dart';
// import 'package:mavenx/src/app/controllers/chat/chat_pro.dart';
// import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
// import 'package:provider/provider.dart';

// // ignore: must_be_immutable
// class ListViewWidget extends StatelessWidget {
//   final List<String> _data;
//   bool _isLoading;
//   ListViewWidget(this._data, this._isLoading);
//   late DataState _dataState;
//   late BuildContext _buildContext;
//   @override
//   Widget build(BuildContext context) {
//     _dataState = Provider.of<ChatPro>(context, listen: false).dataState;
//     _buildContext = context;
//     return SafeArea(child: _scrollNotificationWidget());
//   }

//   Widget _scrollNotificationWidget() {
//     return Column(
//       children: [
//         NotificationListener<ScrollNotification>(
//             onNotification: _scrollNotification,
//             child: RefreshIndicator(
//               onRefresh: () async {
//                 await _onRefresh();
//               },
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 primary: false,
//                 itemCount: _data.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Card(
//                           elevation: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(_data[index],
//                                 style: TextStyle(fontSize: 15, color: kWhiteColor)),
//                           )));
//                 },
//               ),
//             )),
//         if (_dataState == DataState.More_Fetching)
//           Center(child: CircularProgressIndicator()),
//       ],
//     );
//   }

//   bool _scrollNotification(ScrollNotification scrollInfo) {
//     if (!_isLoading &&
//         scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
//       _isLoading = true;
//       Provider.of<ChatPro>(_buildContext, listen: false).fetchData();
//     }
//     return true;
//   }

//   _onRefresh() async {
//     if (!_isLoading) {
//       _isLoading = true;
//       Provider.of<ChatPro>(_buildContext, listen: false)
//           .fetchData(isRefresh: true);
//     }
//   }
// }
