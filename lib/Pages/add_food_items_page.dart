import 'dart:io';
import 'dart:ui';

import 'package:ecommerce_app2/Pages/admin_home.dart';
import 'package:ecommerce_app2/services/database.dart';
import 'package:ecommerce_app2/widgets/bold_text_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddFoodItems extends StatefulWidget {
  const AddFoodItems({super.key});

  @override
  State<AddFoodItems> createState() => _AddFoodItemsState();
}

class _AddFoodItemsState extends State<AddFoodItems> {
  final List<String> items = ['Burger','Salad','Ice-cream','Pizza'];
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  String? value;
  final ImagePicker _picker = ImagePicker();
  File? selectedImage; 
   
  Future getImage()async{
    var image= await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);

    setState(() {
      
    });
  }

  uploadItem() async{
    if(selectedImage!=null && nameController.text!='' && priceController.text!='' && detailController.text!=''){
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('blogImages').child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await(await task).ref.getDownloadURL();

      Map<String, dynamic> addItem ={
        'ImageUrl' : downloadUrl,
        'Name': nameController.text,
        'Price':priceController.text,
        'Details':detailController.text, 
    };

    await DatabaseMethods().addFoodItem(addItem, value!).then((value){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Food Item has been successfully added to menu',
            style: TextStyle(
              fontSize: 18
            ),
          )));
    });
  }
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AdminHome()));
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black38,)),
      title: Text('Add Item',
      style: BoldTextClass.DarkboldTextLarge(),),
      centerTitle: true,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(left: 20,right: 20,),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Upload Item\'s Picture',
              style: BoldTextClass.DarkboldText(),),
              
              SizedBox(height: MediaQuery.of(context).size.height/35,),
              selectedImage==null? 
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: (){
                      getImage(); 
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/5.7,
                      width: MediaQuery.of(context).size.width/2.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:Colors.black,width: 1.5)
                      ),
                      child: Icon(Icons.camera_alt_rounded,
                      size: 45,),
                    ),
                  ),
                ),
              ):
               Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: MediaQuery.of(context).size.height/5.7,
                    width: MediaQuery.of(context).size.width/2.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color:Colors.black,width: 1.5)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.file(selectedImage!,
                      fit: BoxFit.cover,),
                    )
                  ),
                ),
              ),

              
              SizedBox(height:MediaQuery.of(context).size.height/35,),
              Text('Item\'s Name',
              style: BoldTextClass.DarkboldText(),),
          
              SizedBox(height:MediaQuery.of(context).size.height/70,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  controller: nameController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "This Field cannot be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: 'Enter Item\'s Name',
                   hintStyle: BoldTextClass.LightboldText()
                  ),
                ),
              ),
          
               SizedBox(height:MediaQuery.of(context).size.height/35,),
              Text('Item\'s Price',
              style: BoldTextClass.DarkboldText(),),
          
              SizedBox(height:MediaQuery.of(context).size.height/70,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  controller: priceController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "This Field cannot be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: 'Enter Item\'s Price',
                   hintStyle: BoldTextClass.LightboldText()
                  ),
                ),
              ),
              
               SizedBox(height:MediaQuery.of(context).size.height/35,),
              Text('Item\'s Detail',
              style: BoldTextClass.DarkboldText(),),
          
              SizedBox(height:MediaQuery.of(context).size.height/70,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  maxLines: 6,
                  controller: detailController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "This Field cannot be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: 'Enter Item\'s Detail',
                   hintStyle: BoldTextClass.LightboldText()
                  ),
                ),
              ),
              
               SizedBox(height:MediaQuery.of(context).size.height/35,),
              Text('Select Category',
              style: BoldTextClass.DarkboldText(),),

              SizedBox(height: MediaQuery.of(context).size.height/70,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffececf8)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: items.map((item)=>DropdownMenuItem<String>(value: item,child: Text(item,style: TextStyle(fontSize: 18,color: Colors.black),))).toList(), 
                    onChanged: (value){
                       setState(() {
                         this.value = value;
                       });
                   },
                    dropdownColor:Colors.white,
                    hint: Text('Select Category'),
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down),
                    value: value,)),
              ),
             
              GestureDetector(
                onTap: (){
                  uploadItem();
                  
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height/12),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Colors.white
                      ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}