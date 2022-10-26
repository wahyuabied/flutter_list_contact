import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserApi.dart';

class ViewUserApi extends StatefulWidget {
  final UserApi userApi;

  const ViewUserApi({Key? key, required this.userApi}) : super(key: key);

  @override
  State<ViewUserApi> createState() => _ViewUserApiState();
}

class _ViewUserApiState extends State<ViewUserApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Detail Contact"),

        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Full Details",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 70,
                    backgroundImage: NetworkImage(widget.userApi.avatar),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('First Name ',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Last Name ',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Email ',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.userApi.first_name,
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(widget.userApi.last_name ?? '',
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(widget.userApi.email ?? '',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
