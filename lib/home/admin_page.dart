import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  List<String> list = List() ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    list.add("Rabiul Islam Sujon");
    list.add("Syed Ahmedul Kavi");
    list.add("Syed Yusuf Ahmed");
    list.add("Dip Saha");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Panel",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.report),
            onPressed: (){
              // Please add report.dart file, which was deleted from sujon package.
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            return listTile(index, list[index]) ;
          },
        ),
      ),
    );
  }

  Widget listTile(int index, String name){
    return InkWell(
      onTap: (){
        Get.to(PageView(name: name,index: index)) ;
      },
      child: index==2? absent(index,name)
          : Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: [
                Text((index+1).toString()),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text("Absent Rate: " + ((index+1)*10).toString() + "%" ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget absent(int index, String name){
    return  Card(
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.orange ,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text((index+1).toString()),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("Absent"),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}

class PageView extends StatefulWidget {
  final String name ;
  final int index ;

  const PageView({Key key, this.name, this.index}) : super(key: key);

  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<PageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Center(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width*0.15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.nature_people_sharp, size: MediaQuery.of(context).size.width*0.15, color: Colors.green,) ,
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text("Watch Video", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 20.0,),
                    InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text("View Map ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ),

                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text("Absent Rate: " + ((widget.index+1)*10).toString() + "%") ,
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



