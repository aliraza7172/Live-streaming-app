import 'package:flutter/material.dart';

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
          Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
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
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 40,
            width: 340,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TabBar(
              controller: _subTabController,
              indicator: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'Weekly'),
                Tab(text: '1 to 15'),
                Tab(text: '16 to 30'),
                Tab(text: 'Monthly'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _mainTabController,
              children: [
                TabBarView(
                  controller: _subTabController,
                  children: [
                    // Modified content for Receiver - Weekly tab
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
                TabBarView(
                  controller: _subTabController,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text('Gifters - Weekly tab content',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Gifters - 1 to 15 tab content',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Gifters - 16 to 30 tab content',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Gifters - Monthly tab content',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                TabBarView(
                  controller: _subTabController,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text('Family - Weekly tab content',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Family - 1 to 15 tab content',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Family - 16 to 30 tab content',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('Family - Monthly tab content',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              height: 410, // Set a fixed height or use Expanded to fit available space
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                  _buildLeaderboardRow(4, 'Emon Khan', 'assets/profile_img.png', '29238'),
                  SizedBox(height: 10),
                  _buildLeaderboardRow(5, 'Emon Khan', 'assets/profile_img.png', '45321'),
                  SizedBox(height: 10),
                  _buildLeaderboardRow(6, 'Emon khan', 'assets/profile_img.png', '13223'),
                  SizedBox(height: 10),
                  _buildLeaderboardRow(5, 'Emon Khan', 'assets/profile_img.png', '45321'),
                  SizedBox(height: 10),
                  _buildLeaderboardRow(6, 'Emon khan', 'assets/profile_img.png', '13223'),
                  SizedBox(height: 10),
                  _buildLeaderboardRow(5, 'Emon Khan', 'assets/profile_img.png', '45321'),
                  SizedBox(height: 10),
                  _buildLeaderboardRow(6, 'Emon khan', 'assets/profile_img.png', '13223'),
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
                    'assets/profile_img.png', // Replace with your image
                    fit: BoxFit.cover, // Adjust image fit as needed
                  ),
                ),
              ),
            ),

            Positioned(
              top: -6, // Adjust positioning as needed
              child: Image.asset(
                'assets/ring.png', // Replace 'your_image.png' with your image path
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
          'assets/diamond.png', // Replace 'your_image.png' with your image path
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
        imagePath = 'assets/profile_img.png'; // Path to Ali's image
        number = '298292';
        break;
      case 2:
        name = 'Raza';
        imagePath = 'assets/profile_img.png'; // Path to Raza's image
        number = '1721927';
        ringHeight = 150.0; // Increase ring height for Raza
        avatarRadius = 60.0; // Increase radius for Raza

        break;
      case 3:
        name = 'Hamza';
        imagePath = 'assets/profile_img.png'; // Path to Hamza's image
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
                'assets/ring.png', // Replace 'your_image.png' with your image path
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
              'assets/diamond.png', // Replace 'your_image.png' with your image path
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


}