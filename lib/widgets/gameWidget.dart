import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../presentation/resources/index_manager.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  final List<String> gameNames = ["Puzzle", "Bounce Ball", "Shadow 5", "Snakes"];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: ((context, index) => SizedBox(height: 15.0)),
      itemCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Game(
          context: context,
          gameName: gameNames[index],
          img1: Lists.GameImages[index],
          name1: Lists.storiesname[index],
          name2: Lists.pkname[index],
        );

      },
    );
  }
}


Widget Game({required BuildContext context, required String gameName, String? img1, String? name1, String? name2}) {
    double cw = AppSize.sizeWidth(context) / 3.3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
      child: Stack(
        children: [
          Container(
            height: 180.0, // Adjust the height of the container as needed
            width: AppSize.sizeWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: ColorManager.primarydarkdarkColor,
              image: DecorationImage(
                image: AssetImage(img1!), // Use the background image for container 1
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  gameName, // Use the game name passed as parameter
                  style: TextStyle(
                    color: ColorManager.yellow,
                    fontSize: 28.0, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0), // Add some space between the texts
                Text(
                  "Game", // Add your subtitle text here
                  style: TextStyle(
                    color: ColorManager.yellow,
                    fontSize: 22.0, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,

            bottom: 5.0,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Add your play game button logic here
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorManager.yellow, // Set the background color to yellow
                ),
                child: Text(
                  "Play Game",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
