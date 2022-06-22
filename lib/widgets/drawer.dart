import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final image =
        "https://www.google.com/imgres?imgurl=https%3A%2F%2Fnetflixjunkie.com%2Fwp-content%2Fuploads%2F2022%2F05%2Fcaptain-america-chris-evans.jpg&imgrefurl=https%3A%2F%2Fnetflixjunkie.com%2Fnetflix-news-ive-aggressively-gone-180-from-steve-rogers-chris-evans-on-going-far-cry-from-captain-america-to-craving-anarchy-in-netflixs-the-gray-man%2F&tbnid=eb_izVYcZxereM&vet=12ahUKEwibl5GE1q34AhUN_zgGHT3SCTgQMygHegUIARDlAQ..i&docid=KjSQW1Oo6-EDJM&w=1000&h=750&q=steve%20rogers&ved=2ahUKEwibl5GE1q34AhUN_zgGHT3SCTgQMygHegUIARDlAQ";
    return Drawer(
      child:Container( 
        color: Colors.deepPurple,
      child:ListView(children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountEmail: Text("abhijitc.jit0@gmail.com"),
              accountName: Text("Abhijit"),
              currentAccountPicture:
                  CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    ),
            ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: 
              Text("Home",
              style: TextStyle(color: Colors.white),
              ),
            ),
             ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: 
              Text("Profile",
              style: TextStyle(color: Colors.white),
              ),
            ),
            
      ]),
    ));
  }
}
