import 'dart:convert';
import 'package:first_flutter/api/UserApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ViewUserApi.dart';

class ContactApiPage extends StatefulWidget {
  const ContactApiPage({Key? key}) : super(key: key);

  @override
  State<ContactApiPage> createState() => _ContactApiPageState();
}

class _ContactApiPageState extends State<ContactApiPage> {
  late List<UserApi> listData;
  final String apiUrl = "https://reqres.in/api/users?per_page=20";

  Future<List<UserApi>> _fecthDataUsers() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      listData = (json.decode(response.body)['data'] as List)
          .map((i) => UserApi.fromJson(i))
          .toList();
      return listData;
    } else {
      throw Exception('Failed to Load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Contact Online'),
      ),
      body: Container(
        child: FutureBuilder<List<UserApi>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: listData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewUserApi(
                                      userApi: listData[index],
                                    )));
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(listData[index].avatar),
                      ),
                      title: Text(listData[index].first_name +
                          " " +
                          listData[index].last_name),
                      subtitle: Text(listData[index].email),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
