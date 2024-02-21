import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:stream_up_live/presentation/resources/color_manager.dart';


class LocBottomWidget extends StatelessWidget {
   LocBottomWidget({super.key});

  final Map<String, String> locMap = {
    'PK': 'Pakistan',
    'IN': 'India',
    'AF': 'Afghanistan',
    'UA': 'UAE',
    'BD': 'Bangladesh',
    'SA': 'Saudi Arabia',
    'TR' : 'Turkey',
    'NP' : 'Nepal',
    'PH':'Philippines',
    'DZ' : 'Algeria',
    'TN':'Tunisia',
    'CN':'China',
    'SY':'Syria',
    'MA':'Morocco',
    'LB' :'Lebanon',
    'ID' :'Indonesia'


    // Add more key-value pairs as needed
  };
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 15),
            child: Text('Countries and regions',
              style: TextStyle(
               fontSize: 20.0,
                fontWeight: FontWeight.w700
              ),),
          ),
          SizedBox(height: 20,),
          GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: locMap.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (1 / .36),
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              String countryCode = locMap.keys.elementAt(index);
              String countryName = locMap[countryCode].toString();
              CountryFlag flag = CountryFlag.fromCountryCode(countryCode);


              return _buildCountryTile(flag: flag,countryName: countryName);
            },

          )
        ],
      ),
    );
  }

  Widget _buildCountryFlag(String countryCode, String countryName, CountryFlag flag) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 70,
                child: flag,
              )
              ,
              SizedBox(width: 2.0,),
              Text(
                countryName,
                //style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }



}

class _buildCountryTile extends StatelessWidget{
  const _buildCountryTile({
    required this.flag,
    required this.countryName,
  });

  final CountryFlag flag;
  final String countryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.locGridColor,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 70,
                child: flag,
              )
              ,
              SizedBox(width: 2.0,),
              Text(
                countryName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

