import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class imagepicker extends StatefulWidget {
  const imagepicker({Key? key}) : super(key: key);

  @override
  State<imagepicker> createState() => _imagepickerState();
}

class _imagepickerState extends State<imagepicker> {
  final ImagePicker _picker = ImagePicker();
  XFile ? file ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Imagepicker"),
        ),
        body:
            InkWell(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                      borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(80),
                           topRight:Radius.circular(80) ,
                           bottomRight:Radius.circular(80) ,
                            bottomLeft: Radius.circular(80),

                      )
                  ),
                    width: 200,
                    height: 200,
                    child: file!=null ? Image.file(File(file!.path),fit:BoxFit.fill )
                    : Icon(Icons.person,) ,
                  ),
              ),
              onTap: (){
                showModalBottomSheet(context: context, builder: (context){
                  return Column(
                    children: [
                      InkWell(
                        child: ListTile(
                          leading: Icon(Icons.camera_alt ,),
                          title: Text("put image from camara"),
                        ),
                        onTap: ()async{
                          final XFile ? photo  =  await _picker.pickImage(source: ImageSource.camera);
                          setState(() {
                            file  = photo ;
                          });
                        },
                      ) ,
                      InkWell(
                        child: ListTile(
                          leading: Icon(Icons.photo),
                          title: Text("put image from Gallary"),
                        ),
                        onTap: ()async{
                          final XFile ? gallary = await _picker.pickImage(source: ImageSource.gallery) ;
                          setState(() {
                            file = gallary ;
                          });
                        },
                      ) ,

                    ],
                  ) ;
                }) ;
              },
            ),


      ),
    );
  }
}
