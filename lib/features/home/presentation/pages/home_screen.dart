import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luminouskeytask/core/shared_preferance.dart';
import 'package:luminouskeytask/core/utils/helper/color_helper.dart';
import 'package:luminouskeytask/core/utils/utils.export.dart';
import 'package:luminouskeytask/features/home/data/data.export.dart';
import 'package:luminouskeytask/features/home/presentation/blocs/home_bloc.export.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Doctor>? doctors;
  Users? userCash;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctors = <Doctor>[];
    getDoctor();
   var loginUser= CacheHelper.getData(key: 'Login_User');
    Map<String, dynamic> userMap = json.decode(loginUser);
     userCash= Users.fromMap(userMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // background image and bottom contents
              Column(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) => [
                                  SliverAppBar(
                                    toolbarHeight: 60,
                                    automaticallyImplyLeading: false,
                                    pinned: true,
                                    leading: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.widgets_outlined,
                                        size: 28.0,
                                      ),
                                    ),
                                    actions: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.message,
                                          size: 28.0,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.notifications,
                                          size: 28.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                        body: Container()),
                  ),
                ],
              ),
              // Profile image
              Positioned(
                top: 50.0, // (background container size) - (circle height / 2)
                child: Column(children: [
                  Container(
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey.shade100),
                      child: Container(
                        height: 120,
                        width: 120,
                        child: CircleAvatar(
                          child: Stack(children: [
                            ClipOval(
                              child: Image.asset(
                                ImageHelper.userImage,
                                height: 100,
                                fit: BoxFit.fill,
                                width: 100,
                              ),
                            ),
                          ]),
                          radius: 50.0,
                        ),
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
          Expanded(
            child: Container(
              // decoration: BoxDecoration(
              //   border: Border.all(width: 10,color: Colors.grey.shade100,),
              //   borderRadius: BorderRadius.only(topRight:  Radius.circular(30),topLeft:  Radius.circular(30) ),
              // ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text(
                            "Hello ,",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontFamily: FontsHelper.cairo,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "${userCash!.name}",
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontsHelper.cairo),
                          )
                        ],
                      ),
                      const Text("Jordan ,Irbid",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontFamily: FontsHelper.cairo,
                              fontWeight: FontWeight.w400)),
                      _searchTextFormField(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      _listViewDoctors(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Text("Upcoming Apointment",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontFamily: FontsHelper.cairo,
                                        fontWeight: FontWeight.w400))),
                            TextButton(
                                onPressed: () {},
                                child: const Text("See All",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: ColorHelper.primaryColor,
                                        fontFamily: FontsHelper.cairo,
                                        fontWeight: FontWeight.w400)))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent.withOpacity(.2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: CircleAvatar(
                                      child: ClipOval(
                                        child: Image.asset(
                                          ImageHelper.abdDoctor,
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                      radius: 50.0,
                                    ),
                                    margin:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  const Text(
                                    "Dr.Zahed abd",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontFamily: FontsHelper.cairo),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        padding: const EdgeInsets.all(0.0),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.calendar_today_outlined,
                                          size: 15.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const Text(
                                        "Tuseday-june 22",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: ColorHelper.primaryColor,
                                            fontFamily: FontsHelper.cairo),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        padding: const EdgeInsets.all(0.0),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.watch_later_outlined,
                                          size: 15.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const Text(
                                        "10:00 AM",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: ColorHelper.primaryColor,
                                            fontFamily: FontsHelper.cairo),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent.withOpacity(.2),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: CircleAvatar(
                                      child: ClipOval(
                                        child: Image.asset(
                                          ImageHelper.salmaDoctor,
                                          height: 80,
                                          width: 80,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                      radius: 50.0,
                                    ),
                                    margin:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  const Text(
                                    "Dr.Zahed abd",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontFamily: FontsHelper.cairo),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        padding: const EdgeInsets.all(0.0),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.calendar_today_outlined,
                                          size: 15.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const Text(
                                        "Tuseday-june 22",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: ColorHelper.primaryColor,
                                            fontFamily: FontsHelper.cairo),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        padding: const EdgeInsets.all(0.0),
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.watch_later_outlined,
                                          size: 15.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const Text(
                                        "10:00 AM",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: ColorHelper.primaryColor,
                                            fontFamily: FontsHelper.cairo),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
            ),
          )
        ],
      ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade100),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Search Doctors , Health issues ...",
            hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: FontsHelper.cairo,
                fontWeight: FontWeight.w400),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 50,
            )),
      ),
    );
  }

  Widget _listViewDoctors() {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SuccessGetDoctorState) {
          doctors = state.doctors;
        }
      },
      builder: (context, state) {
        return Container(
          height: 250,
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: doctors!.length,
            // itemCount: Doctors.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 120,
                              width: 120,
                              child: CircleAvatar(
                                child: ClipOval(
                                    child: Image.network(
                                  doctors![index].doctorImageURL!,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topRight,
                                )
                                    // Image.asset(
                                    //   ImageHelper.issaDoctor,
                                    //   height: 100,
                                    //   width:100,
                                    //   fit: BoxFit.cover,
                                    //   alignment: Alignment.topRight,
                                    // ),
                                    ),
                                radius: 50.0,
                              ),
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 10, 10),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${doctors![index].doctorName}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: FontsHelper.cairo),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: IconButton(
                                            padding: const EdgeInsets.all(0.0),
                                            onPressed: () async {
                                              final Uri _emailLaunchUri = Uri(
                                                  scheme: 'mailto',
                                                  path:
                                                      '${doctors![index].doctorEmail}',
                                                  queryParameters: {
                                                    'subject':
                                                        'Example Subject & Symbols are allowed!'
                                                  });
                                              launch(
                                                  _emailLaunchUri.toString());
                                            },
                                            icon: const Icon(
                                              Icons.email_outlined,
                                              size: 20.0,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 6,
                                            child: Text(
                                              "${doctors![index].doctorEmail}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                  fontFamily:
                                                      FontsHelper.cairo),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: IconButton(
                                          padding: const EdgeInsets.all(0.0),
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.phone_android,
                                            size: 20.0,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 6,
                                          child: Text(
                                            "${doctors![index].phoneNumber}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontFamily: FontsHelper.cairo),
                                          )),
                                    ],
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        var uri = Uri.parse(
                                            "google.navigation:q=${doctors![index].address!.latitude},${doctors![index].address!.longitude}&mode=d");
                                        await launch(uri.toString());
                                      },
                                      child: Text(
                                        "${doctors![index].address!.country} - ${doctors![index].address!.city}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: ColorHelper.primaryColor,
                                            fontFamily: FontsHelper.cairo),
                                      )),
                                ],
                              ),
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  0, 20, 0, 0),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: 50),
                        decoration: const BoxDecoration(
                            color: ColorHelper.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      padding: const EdgeInsets.all(0.0),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.calendar_today_outlined,
                                        size: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                      flex: 6,
                                      child: Text(
                                        "Tuseday-june 22",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontFamily: FontsHelper.cairo),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      padding: const EdgeInsets.all(0.0),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.watch_later_outlined,
                                        size: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                      flex: 6,
                                      child: Text(
                                        "08:00 PM",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontFamily: FontsHelper.cairo),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        margin: const EdgeInsetsDirectional.only(top: 30),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
          ),
        );
      },
    );
  }

  void getDoctor() async {
    HomeBloc.get(context).add(GetDoctorsEvent());
  }
}
