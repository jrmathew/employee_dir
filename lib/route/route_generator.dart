
import 'package:employee_dir/utils/size_config.dart';
import 'package:employee_dir/view/details.dart';
import 'package:employee_dir/view/empLIst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


const empListRoute = '/';
const detailsRoute = "/details";
class RouteGenerator {

  
  final BuildContext context;

  RouteGenerator(this.context);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case empListRoute:
       return MaterialPageRoute(
            builder: (_) => EmpDetails(), settings: RouteSettings(name: empListRoute));
      case detailsRoute:
       return MaterialPageRoute(
            builder: (_) => Details(
              data: args,
            ), settings: RouteSettings(name: detailsRoute));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(
                      top: 3.20 * SizeConfig.heightMultiplier,
                      bottom: 1.83 * SizeConfig.heightMultiplier),
                  child: Text(
                    'Oops!',
                    style: TextStyle(
                        fontSize: 4 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900]),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: 3.20 * SizeConfig.heightMultiplier,
                      bottom: 1.83 * SizeConfig.heightMultiplier),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You Don\'t Know Were You Are ?',
                          style: TextStyle(
                              fontSize: 3 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[500]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 1.20 * SizeConfig.heightMultiplier,
                              bottom: 1.83 * SizeConfig.heightMultiplier),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Neither Do We !!!',
                                style: TextStyle(
                                    fontSize: 2 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[500]),
                              ),
                              InkWell(
                                onTap: () {
// 
                                },
                                child: Text(
                                  ' Bananas Here.',
                                  style: TextStyle(
                                      fontSize: 2 * SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal[500]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 49.01 * SizeConfig.heightMultiplier,
                    child: Center(
                        child: SvgPicture.asset("assets/images/404.svg"))),
              ],
            ),
          ),
        ),
      );
    });
  }
}
