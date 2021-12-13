import 'package:better_player/better_player.dart';

import 'package:flutter/material.dart';
import 'package:sample_vid/utils/constants.dart';
import 'package:sample_vid/utils/utils.dart';

class BasicPlayerPage extends StatefulWidget {
  @override
  _BasicPlayerPageState createState() => _BasicPlayerPageState();
}

class _BasicPlayerPageState extends State<BasicPlayerPage> {
  @override
  Widget build(BuildContext context) {
    final url = "https://www.youtube.com/watch?v=H2Biojf5x0o";
    final asset = 'assets/videos/big.mp4';
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(
              Constants.forBiggerBlazesUrl,
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   child: Text(
          //     "Next player shows video from file.",
          //     style: TextStyle(fontSize: 16),
          //   ),
          // ),
          // const SizedBox(height: 8),
          // FutureBuilder<String>(
          //   future: Utils.getFileUrl(Constants.asset),
          //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //     if (snapshot.data != null) {
          //       return BetterPlayer.file(snapshot.data!);
          //     } else {
          //       return const SizedBox();
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
