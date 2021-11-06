import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   leading: Icon(Icons.ac_unit),
//       //   actions: [
//       //     Icon(Icons.search),
//       //   ],
//       // ),
//       body: Body(),
//       // bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
//       //   BottomNavigationBarItem(icon: Icon(Icons.add), label: "data"),
//       //   BottomNavigationBarItem(icon: Icon(Icons.add), label: "data")
//       // ]),
//     );
//   }
// }

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   TextEditingController txt = TextEditingController();

//   var getText = "";
//   var lst = [];

//   abc() {
//     setState(() {
//       lst.add(getText);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: txt,
//               onChanged: (value) {
//                 getText = value;
//               },
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   abc();
//                   txt.clear();
//                 },
//                 child: Text("Add")),
//             ListView.builder(
//                 itemCount: lst.length,
//                 itemBuilder: (context, index) {
//                   return Text(lst[index]);
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController ttl = TextEditingController();
  TextEditingController dtl = TextEditingController();
  TextEditingController tm = TextEditingController();

  var title = [];
  var detail = [];
  var time = [];
  var gettitle = "";
  var getdtl = "";
  var gettime = "";

  insert() {
    setState(() {
      title.add(gettitle);
      detail.add(getdtl);
      time.add(gettime);
      print(title);
    });
  }

  delete() {
    setState(() {
      title.remove(gettitle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("Todo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Title',
                          hintText: 'Enter Task Title'),
                      controller: ttl,
                      onChanged: (value1) {
                        gettitle = value1;
                      }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Details',
                          hintText: 'Enter Task Details'),
                      controller: dtl,
                      onChanged: (value2) {
                        getdtl = value2;
                      }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Time',
                          hintText: 'Enter Task Time'),
                      controller: tm,
                      onChanged: (value3) {
                        gettime = value3;
                      }),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.brown),
                      ),
                      onPressed: () {
                        insert();
                        ttl.clear();
                        dtl.clear();
                        tm.clear();
                      },
                      child: Text("Add Task")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.brown),
                      ),
                      onPressed: () {
                        delete();
                        ttl.clear();
                        dtl.clear();
                        tm.clear();
                      },
                      child: Text("Remove Task")),
                ]),
              ]),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      // leading: CircleAvatar(
                      //   backgroundColor: Colors.red,
                      // ),
                      title: Text(title[index]),
                      subtitle: Text(detail[index]),
                      trailing: Text(time[index]),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
