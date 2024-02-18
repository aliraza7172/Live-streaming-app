import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';

class LiveDataScreen extends StatefulWidget {
  @override
  _LiveDataScreenState createState() => _LiveDataScreenState();
}

class _LiveDataScreenState extends State<LiveDataScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set background color here
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Text(
                    'Live Data',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50, // Increase radius as needed
                      backgroundColor: Colors.transparent, // Make background transparent
                      child: ClipOval(
                        child: Container(
                          width: 90, // Adjust width as needed for smaller image
                          height: 90, // Adjust height as needed for smaller image
                          child: Image.asset(
                            ImageAssets.profileImage,
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: -21, // Adjust positioning as needed
                      child: Image.asset(
                        ImageAssets.ringImage,
                        height: 132, // Adjust height as needed
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 20),
                Icon(
                  Icons.play_arrow,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Md Sakib Khan', // Replace with name
                      style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold ),
                    ),
                    Text(
                      'User ID: 123456',
                      style: TextStyle(color: Colors.white,fontSize: 12),
                    ), // Replace with user ID
                    Text(
                      'Joint Date  : 10 Nov, 2023',
                      style: TextStyle(color: Colors.white,fontSize: 10),
                    ), // Replace with date of birth
                    Text(
                      'Last Update Date: 14-3-2023  14:06:48',
                      style: TextStyle(color: Colors.white, fontSize: 9),
                    ), // Replace with last update date
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Totals Diamonds',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '12345',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Totals Days',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '6',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Eligible Hours',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '5: 6',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Totals Videos',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '17:67',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Totals Audios',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '56:8',
                            style: TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 170,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            ' Diamonds',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black
                            ),
                          ),
                          SizedBox(width: 45),
                          Image.asset(
                            ImageAssets.diamondImage,
                            width: 24, // Adjust width as needed
                            height: 24, // Adjust height as needed
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' Diamonds as \n host',
                             style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '743333  ',
                             style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' Diamonds as \n co-host',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '743333  ',
                             style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' Inbox gift \n diamonds',
                             style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '743333  ',
                             style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' Lucky \n Diamonds',
                             style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '743333  ',
                             style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 0),

              ],
            ),
            SizedBox(height: 20),

            Container(
              width: 330,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),

                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: SizedBox(
                      width: 400, // Adjust width as needed
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          color: Colors.green, // Change the color of the selected tab
                          borderRadius: BorderRadius.circular(10),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Colors.black, // Set tab text color to black
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(fontSize: 7), // Reduce font size of tab text
                        tabs: [
                          Tab(text: 'Weekly \n7 days'),
                          Tab(text: '  1 to 15 \n1st Half Month'),
                          Tab(text: '  16 to 30 \n2nd Half Month'),
                          Tab(text: 'Monthly'),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildTabContent(),
                        _buildTabContent(),
                        _buildTabContent(),
                        _buildTabContent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 5, // Number of rows
        itemBuilder: (context, index) {
          final int adjustedIndex = index + 1;
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 0),
                Text('$adjustedIndex',style: TextStyle(color: Colors.black),),
                SizedBox(width: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25, // Increase radius as needed
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
                      top: 0, // Adjust positioning as needed
                      child: Image.asset(
                        ImageAssets.ringImage,
                        height: 50, // Adjust height as needed
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Text('Md Sakib Khan',style: TextStyle(color: Colors.black),), // Replace with the name
                SizedBox(width: 20),
                Image.asset(
                  ImageAssets.diamondImage,
                  width: 24, // Adjust width as needed
                  height: 24, // Adjust height as needed
                ),
                SizedBox(width: 10),
                Text('777777',style: TextStyle(color: Colors.black),), // Replace with the number of diamonds
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          );
        },
      ),
    );
  }
}