import 'package:flutter/material.dart';

import 'package:oppknocksapp/models/images.dart';
import 'package:oppknocksapp/shared/constants.dart';

class JobDetailPage extends StatefulWidget {
  JobDetailPage({Key? key}) : super(key: key);

  static Route<T> getJobDetail<T>() {
    return MaterialPageRoute(
      builder: (_) => JobDetailPage(),
    );
  }

  @override
  _JobDetailPageState createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  Widget _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 26),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(Images.ok, height: 40),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OpportunityKnocks",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: KColors.title,
                    ),
                  ),
                  /*SizedBox(height: 5),
                  Text(
                    "UX Designer",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: KColors.subtitle,
                    ),
                  )*/
                ],
              )
            ],
          ),
          /*SizedBox(height: 32),
          Row(
            children: [
              _headerStatic("Salary", "\$85,000"),
              _headerStatic("Applicants", "45"),
              _headerStatic("Salary", "\$120,000"),
            ],
          ),*/
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child:
                    Image.asset(Images.doc, height: 20, color: KColors.primary),
              ),
            ],
          ),
          Divider(
            color: KColors.icon,
            height: 25,
          )
        ],
      ),
    );
  }

  Widget _headerStatic(String title, String sub) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: KColors.subtitle,
            ),
          ),
          SizedBox(height: 5),
          Text(
            sub,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: KColors.title,
            ),
          )
        ],
      ),
    );
  }

  Widget _jobDescription(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Task Description",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "Share this post on Instagram",
            style: TextStyle(fontSize: 14, color: KColors.subtitle),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            child: Text("Learn more",
                style: TextStyle(fontSize: 14, color: KColors.primary)),
          )
        ],
      ),
    );
  }

  Widget _reward(BuildContext context) {
    return Container(
      height: 92,
      padding: EdgeInsets.only(left: 16),
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Reward",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 12),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
            ),
          ),
          //Image.asset("assets/images/Davis_Cleaners_discount.png"),
          Text(
            "10% off any alteration or service at Davis Cleaners",
            style: TextStyle(fontSize: 14, color: KColors.subtitle),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            child: Text("Learn more",
                style: TextStyle(fontSize: 14, color: KColors.primary)),
          )
        ],
      ),
    );
  }

  Widget _apply(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 54),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(KColors.primary),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 16))),
              onPressed: () {},
              child: Text(
                "Apply Now",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          SizedBox(
            height: 50,
            width: 60,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: KColors.primary),
                ),
              ),
              child: Icon(
                Icons.bookmark_border,
                color: KColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.background,
        iconTheme: IconThemeData(color: KColors.primary),
        elevation: 1,
        actions: [
          IconButton(icon: Icon(Icons.cloud_upload_outlined), onPressed: () {})
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(context),
          _jobDescription(context),
          _reward(context),
          _apply(context)
        ],
      ),
    );
  }
}
