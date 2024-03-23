//
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// import '../../../core/config/constants.dart';
// class TrailerView extends StatefulWidget {
//    TrailerView({super.key});
//    void initState()
//    {
//      final videoId = YoutubePlayer.convertUrlToId(widget.trailerid);
//      _controller= YoutubePlayerController(initialVideoId: initialVideoId)
//    }
//   @override
//   State<TrailerView> createState() => _TrailerViewState();
// }
//
// class _TrailerViewState extends State<TrailerView> {
//   @override
//   Widget build(BuildContext context) {
//     var trailerId;
//     return Padding(
//         padding: EdgeInsets.all(0),
//       child: YoutubePlayer(
//         thumbnail: Image.network(
//           "https://image.tmdb.org/t/p/original/${trailerId.video}",
//           height: 217,
//           width: Constants.mediaQuery.width,
//           fit: BoxFit.cover,
//         ),
//         controlsTimeOut: Duration(milliseconds: 1500),
//         showVideoProgressIndicator: true,
//         controller: _controller,
//         bufferIndicator: Center(
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation(Colors.grey),
//           ),
//         ),
//         progressIndicatorColor: Colors.amber,
//         bottomActions: [
//
//         ],
//       ),
//     );
//   }
// }
