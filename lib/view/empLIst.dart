// ignore_for_file: deprecated_member_use

import 'package:employee_dir/db/db_connect.dart';
import 'package:employee_dir/network_call/fetchEmpDetails.dart';
import 'package:employee_dir/route/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class EmpDetails extends StatefulWidget {
  // const EmpDetails({ Key? key }) : super(key: key);

  @override
  State<EmpDetails> createState() => _EmpDetailsState();
}

class _EmpDetailsState extends State<EmpDetails> {
  var details;
  bool loading=false;
   FetchEmpDetails emp = FetchEmpDetails();
  loadData() async {
   
    // details =  await emp.fetchData();
    // setState(() {
    //   loading = true;
    // });
  }
  @override
  void initState() {
    loadData();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body:loading?Center(child: CircularProgressIndicator(),):_buildEmployeeList(),
    );
  }
  _buildEmployeeList(){
   
    return FutureBuilder(
      // future: DBConnect.db.getAllEmployees(),
      future: emp.details(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            padding: EdgeInsets.all(10),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Column(
                        children: [
                          snapshot.data[index].profileImage!=null?Image.network(snapshot.data[index].profileImage,height: 50,):SvgPicture.asset("assets/images/404.svg",height: 50,)
                        ],
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text(
                              "Name: ${snapshot.data[index].name}",style:Theme.of(context).textTheme.subtitle1),
                              if(snapshot.data[index].company!=null)...[
                                   Text(
                              "Company: "+ snapshot.data[index].company.cname.toString(),style:Theme.of(context).textTheme.subtitle1),
                              ]
                              
                        ],
                      ),
                      subtitle: Text('EMAIL: ${snapshot.data[index].email}',style:Theme.of(context).textTheme.subtitle2,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RaisedButton(
                            child: Text("View",style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white),),
                            onPressed: (){
                              Navigator.of(context).pushNamed(detailsRoute, arguments: snapshot.data[index]);
                          }
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}