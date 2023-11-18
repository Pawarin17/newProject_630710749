import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_project/models/order_item.dart';
import '../repostories/rental_repostories.dart';
import 'album_list.dart';

class AddScreen extends StatefulWidget {
  static const routeName = 'add_order';

  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _albumidController = TextEditingController();
  final _albumnameController = TextEditingController();
  final _albumphoneController = TextEditingController();
  final _albumdateController = TextEditingController();
  final _albumpriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a rental'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: AlbumRepository.album.length,
              itemBuilder: (ctx, i) {
                Album album = AlbumRepository.album[i];
                return AlbumList(
                  albums: album,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _albumidController,
                  decoration: InputDecoration(
                    hintText: 'รหัสหนังสือ',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _albumnameController,
                        decoration: InputDecoration(
                          hintText: 'ชื่อผู้เช่า',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.greenAccent,
                            ), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _albumphoneController,
                        decoration: InputDecoration(
                          hintText: 'เบอร์โทร',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.greenAccent,
                            ), //<-- SEE HERE
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _albumdateController,
                        decoration: InputDecoration(
                          hintText: 'วันที่เช่า - วันที่คืน',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.greenAccent,
                            ), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _albumpriceController,
                        decoration: InputDecoration(
                          hintText: 'ราคา',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.greenAccent,
                            ), //<-- SEE HERE
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        var albumid = _albumidController.text;
                        var albumname = _albumnameController.text;
                        var albumphone = _albumphoneController.text;
                        var albumdate = _albumdateController.text;
                        var albumprice = _albumpriceController.text;
                        var albums = Album(
                          ib: albumid,
                          name: albumname,
                          phone: albumphone,
                          date: albumdate,
                          price: int.parse(albumprice),
                        );

                        setState(() {
                          AlbumRepository.album.add(albums);
                        });

                        _albumidController.clear();
                        _albumnameController.clear();
                        _albumphoneController.clear();
                        _albumdateController.clear();
                        _albumpriceController.clear();
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
