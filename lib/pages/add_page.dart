import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';





//编辑
class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink[300],),
      body:Container(
        child:Column(
          children: <Widget>[
          TextField(
          maxLines: 8
          ),
          button()
          ],
        )
        )
      );
      }
    }

class button extends StatefulWidget {
  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(200),
      child:
      RaisedButton(
        child: Text('+',
        style: TextStyle(fontSize: 40,color: Colors.black45),
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return photo();
          }));
        },
    )
    );
  }
}


//选择图片页面
class photo extends StatefulWidget {
  @override
  _photoState createState() => _photoState();
}

class _photoState extends State<photo> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink[300],),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image)
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[300],
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}