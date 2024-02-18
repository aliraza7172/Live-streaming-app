import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> with TickerProviderStateMixin {
  late TabController _mainTabController;
  late TabController _subTabController;

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 3, vsync: this);
    _subTabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Text(
                  'Leaderboard',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.white,size: 20,),
                    onPressed: () {
                      // Handle calendar icon press
                    },
                  ),
                  Text(
                    'Last Month',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(width: 0), // Add some space between the icons
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.language, color: Colors.white,size: 22,),
                    onPressed: () {
                      // Handle language icon press
                    },
                  ),
                  Text(
                    'EN',
                    style: TextStyle(fontSize: 10, color: Colors.white,),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20),
          _buildRoundedTabContainer(
            child: TabBar(
              controller: _mainTabController,
              indicator: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'Receiver'),
                Tab(text: 'Gifters'),
                Tab(text: 'Family'),
              ],
              indicatorSize: TabBarIndicatorSize.tab, // Set indicatorSize to TabBarIndicatorSize.tab
            ),
          ),
          SizedBox(height: 20),
          _buildRoundedTabContainer(
            child: TabBar(
              controller: _subTabController,
              indicator: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Weekly',
                    style: TextStyle(fontSize: 12), // Adjust the font size here
                  ),
                ),
                Tab(
                  child: Text(
                    '1 to 15',
                    style: TextStyle(fontSize: 12), // Adjust the font size here
                  ),
                ),
                Tab(
                  child: Text(
                    '16 to 30',
                    style: TextStyle(fontSize: 12), // Adjust the font size here
                  ),
                ),
                Tab(
                  child: Text(
                    'Monthly',
                    style: TextStyle(fontSize: 12), // Adjust the font size here
                  ),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab, // Set indicatorSize to TabBarIndicatorSize.tab
            ),
            width: 340, // Specify the desired width here

          ),

          SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _mainTabController,
              children: [
                TabBarView(
                  controller: _subTabController,
                  children: [
                    // Modified content for Gifters - Weekly tab
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildImageWithText(1, false),
                        _buildImageWithText(2, true),
                        _buildImageWithText(3, false),
                      ],
                    ),
                    // Modified content for Gifters - 1 to 15 tab
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildImageWithText(1, false),
                        _buildImageWithText(2, true),
                        _buildImageWithText(3, false),
                      ],
                    ),
                    // Modified content for Gifters - 16 to 30 tab
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildImageWithText(1, false),
                        _buildImageWithText(2, true),
                        _buildImageWithText(3, false),
                      ],
                    ),
                    // Modified content for Gifters - Monthly tab
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildImageWithText(1, false),
                        _buildImageWithText(2, true),
                        _buildImageWithText(3, false),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
          Container(
            height: 400, // Set a fixed height or use Expanded to fit available space
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                _buildLeaderboardRow(4, 'Emon Khan', ImageAssets.profileImage, '29238'),
                SizedBox(height: 10),
                _buildLeaderboardRow(5, 'Emon Khan', ImageAssets.profileImage, '45321'),
                SizedBox(height: 10),
                _buildLeaderboardRow(6, 'Emon khan', ImageAssets.profileImage, '13223'),
                SizedBox(height: 10),
                _buildLeaderboardRow(5, 'Emon Khan', ImageAssets.profileImage, '45321'),
                SizedBox(height: 10),
                _buildLeaderboardRow(6, 'Emon khan', ImageAssets.profileImage, '13223'),
                SizedBox(height: 10),
                _buildLeaderboardRow(5, 'Emon Khan', ImageAssets.profileImage, '45321'),
                SizedBox(height: 10),
                _buildLeaderboardRow(6, 'Emon khan', ImageAssets.profileImage, '13223'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardRow(int number, String name, String imagePath, String diamondNumber) {
    return Row(
      children: [
        Text(
          '$number',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(width: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 20, // Increase radius as needed
              backgroundColor: Colors.transparent, // Make background transparent
              child: ClipOval(
                child: Container(
                  width: 30, // Adjust width as needed for smaller image
                  height: 30, // Adjust height as needed for smaller image
                  child: Image.asset(
                    ImageAssets.profileImage,
                    fit: BoxFit.cover, // Adjust image fit as needed
                  ),
                ),
              ),
            ),
            Positioned(
              top: -6, // Adjust positioning as needed
              child: Image.asset(
                ImageAssets.ringImage,
                height: 52, // Adjust height as needed
              ),
            ),
          ],
        ),
        SizedBox(width: 20),
        Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(width: 50),
        Image.asset(
          ImageAssets.diamondImage,
          width: 24, // Adjust width as needed
          height: 24, // Adjust height as needed
        ),
        SizedBox(width: 5),
        Text(
          diamondNumber,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildImageWithText(int imageNumber, bool isCenter) {
    String name = '';
    String imagePath = '';
    String number = '';
    double ringHeight = 132.0; // Default height for the ring image
    double avatarRadius = 50.0; // Default radius for the circular avatar

    switch (imageNumber) {
      case 1:
        name = 'Ali';
        imagePath = ImageAssets.profileImage;
        number = '298292';
        break;
      case 2:
        name = 'Raza';
        imagePath = ImageAssets.profileImage;
        number = '1721927';
        ringHeight = 150.0; // Increase ring height for Raza
        avatarRadius = 60.0; // Increase radius for Raza
        break;
      case 3:
        name = 'Hamza';
        imagePath = ImageAssets.profileImage;
        number = '83728';
        break;
      default:
        name = '';
    }

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: avatarRadius, // Increase radius as needed
              backgroundColor: Colors.transparent, // Make background transparent
              child: ClipOval(
                child: Container(
                  width: 90, // Adjust width as needed for smaller image
                  height: 90, // Adjust height as needed for smaller image
                  child: Image.asset(
                    imagePath, // Use the provided image path
                    fit: BoxFit.cover, // Adjust image fit as needed
                  ),
                ),
              ),
            ),
            Positioned(
              top: -16, // Adjust positioning as needed
              child: Image.asset(
                ImageAssets.ringImage,
                height: ringHeight, // Use the determined ring height
              ),
            ),
          ],
        ),
        SizedBox(height: 2),
        Text(
          name,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.diamondImage,
              width: 20, // Adjust width as needed
              height: 20, // Adjust height as needed
            ),
            SizedBox(width: 3),
            Text(
              number,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRoundedTabContainer({required Widget child, double width = 300}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 40,
        width: width, // Adjust the width here
        color: Colors.white,
        child: child,
      ),
    );
  }

}
