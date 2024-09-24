import 'package:flutter/material.dart';

// class Basics extends StatelessWidget {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//    Basics({Key? key}) : super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(),
//       body: Column(
//         children:  [
//             TextButton(onPressed: (){
//               _scaffoldKey.currentState?.openDrawer();
//             }, child: Text("Click"),
//             style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.red)),
//             )
//         ],
//       ),
//       drawer:  Drawer(
//         child: ListView(children: const [
//           DrawerHeader(child: Text("Pages")),
//           ListTile(title: Text("home"),)
//         ]),
//       ),
//     );
//   }
// }
class Basics extends StatelessWidget {
  
   Basics({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(),
      body: Column(
        children:  [
            TextButton(onPressed: (){
             Scaffold.of(context).openDrawer();
            }, child: Text("Click"),
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.red)),
            )
        ],
      ),
      drawer:  Drawer(
        child: ListView(children: const [
          DrawerHeader(child: Text("Pages")),
          ListTile(title: Text("home"),)
        ]),
      ),
    );
  }
}

