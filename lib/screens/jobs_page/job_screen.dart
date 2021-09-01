import 'package:flutter/material.dart';

import 'package:oppknocksapp/models/images.dart';
import 'package:oppknocksapp/shared/search_field.dart';
import 'package:oppknocksapp/screens/jobs_page/widgets/jobs.dart';
import 'package:oppknocksapp/shared/constants.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({Key? key}) : super(key: key);
  Widget _header(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          SearchField(),
        ],
      ),
    );
  }

  Widget _recommendedSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Just For You",
            style: TextStyle(fontWeight: FontWeight.bold, color: KColors.title),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _recommendedJob(context,
                    company: "OpportunityKnocks",
                    img: Images.ok,
                    title: "Share Post",
                    //sub: "\$45,000 Remote",
                    isActive: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendedJob(
    BuildContext context, {
    required String img,
    required String company,
    required String title,
    //required String sub,
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, JobDetailPage.getJobDetail());
        },
        child: AspectRatio(
          aspectRatio: 1.3,
          child: Container(
            decoration: BoxDecoration(
              color: isActive ? KColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : KColors.lightGrey,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Image.asset(img),
                ),
                SizedBox(height: 16),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive ? Colors.white : KColors.subtitle,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: isActive ? Colors.white : KColors.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*SizedBox(height: 6),
                Text(
                  sub,
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive ? Colors.white38 : KColors.subtitle,
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _recentPostedJob(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent posted",
            style: TextStyle(fontWeight: FontWeight.bold, color: KColors.title),
          ),
          _jobCard(
            context,
            img: Images.ok,
            title: "OpportunityKnocks",
            subtitle: "Share Post",
          ),
          //salery: "\$78,000"),
          _jobCard(
            context,
            img: Images.mountmike,
            title: "Mountain Mike",
            subtitle: "Task",
          ),
          _jobCard(
            context,
            img: Images.uscyro,
            title: "USCyrotherapy",
            subtitle: "Task",
          ),
          _jobCard(
            context,
            img: Images.casablanca,
            title: "Casablanca",
            subtitle: "Task",
          ),
        ],
      ),
    );
  }

  Widget _jobCard(
    BuildContext context, {
    required String img,
    required String title,
    required String subtitle,
    //String? salery,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, JobDetailPage.getJobDetail());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: KColors.lightGrey,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(img),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color: KColors.subtitle),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 14,
                      color: KColors.title,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.background,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(context),
                _recommendedSection(context),
                _recentPostedJob(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
