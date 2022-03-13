import 'package:employee_dir/models/employees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Details extends StatelessWidget {
  final Employees data;
  Details({
    Key key,
    @required this.data,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(data!=null)...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  data.profileImage!=null?Image.network(data.profileImage,height: 50,):SvgPicture.asset("assets/images/404.svg",height: 50,)
                ],
              ),
               Text("Name: ${data.name}" ,style:Theme.of(context).textTheme.bodyText1),
               Text("Username: ${data.username}" ,style:Theme.of(context).textTheme.bodyText1 ),
               Text("Email: ${data.email}"  ,style:Theme.of(context).textTheme.bodyText1),
               Text("Phone: ${data.phone!=null?data.phone:'---'}" ,style:Theme.of(context).textTheme.bodyText1 ),
               Text("Address: ${data.address.street+","+data.address.suite+data.address.city}"  ,style:Theme.of(context).textTheme.bodyText1),
               Text("Website: ${data.website!=null?data.website:'---'}"  ,style:Theme.of(context).textTheme.bodyText1 ),
               if(data.company!=null)...[
                Text("Company: ${data.company.cname+","+data.company.catchPhrase+data.company.bs}"  ,style:Theme.of(context).textTheme.bodyText1),
               ]

            ]
            else...[
              CircularProgressIndicator(),
            ]
           
          ],
        ),
      ),
    );
  }
}