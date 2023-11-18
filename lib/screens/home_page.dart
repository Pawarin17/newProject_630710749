import 'package:flutter/material.dart';
import 'package:order_project/screens/add_order.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List data = [];

  Future<String> getData() async {
    var url = Uri.https(
        'my-order-api--pla070261.repl.co', 'products', {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse);
      this.setState(() {
        data = jsonResponse;
      });
    }
    return 'success';
  }

  @override
  void initState() {
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Text(
          'Book Look',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        leading: Icon(
          Icons.home_filled,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                leading: Icon(
                  Icons.menu_book_outlined,
                  color: Colors.grey,
                ),
                title: Text(data[index]['id']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('หนังสือ: ${data[index]['name']}'),
                    Text('ราคา: ${data[index]['price']}.-'),
                    Text('ราคาเช่า/วัน: ${data[index]['rent']}.-'),
                  ],
                ),
              ));
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen())),
        },
        child: Text(
          'Rent',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
