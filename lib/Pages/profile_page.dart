import 'dart:io';

import 'package:ecommerce_app2/Pages/login_page.dart';
import 'package:ecommerce_app2/services/auth.dart';
import 'package:ecommerce_app2/services/shared_pref.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String ? name,email,profile,password;
    final ImagePicker _picker = ImagePicker();
  File? selectedImage; 
   
  Future getImage()async{
    var image= await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);

    setState(() {
      uploadItem();
    });
  }

  uploadItem() async{
    if(selectedImage!=null){
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('blogImages').child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await(await task).ref.getDownloadURL();
      await SharedPreferenceHelper().saveUserProfile(downloadUrl);
      setState(() {
        
      });
     
    }  
  }

  getthesharedpref()async{
     profile = await SharedPreferenceHelper().getUserProfile();
     email = await SharedPreferenceHelper().getUserEmail();
     name = await SharedPreferenceHelper().getUserName();
    password = await SharedPreferenceHelper().getUserPass();
     setState(() {
       
     });
  }
  
  ontheload()async{
    await getthesharedpref();
    setState(() {
      
    });
  }
  
  @override
  void initState() {
    ontheload();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: name==null? CircularProgressIndicator():
      Container( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/4.3,
                  padding: EdgeInsets.only(left:20,right: 20,top:45),
                  decoration: BoxDecoration(
                    color : Colors.black,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(MediaQuery.of(context).size.width, 106))
                  ),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/6.5),
                      child: Material(
                         elevation: 10,
                      borderRadius: BorderRadius.circular(60),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: selectedImage==null? 
                          GestureDetector(
                            onTap: (){
                              getImage();
                            },
                            child: profile!=null ? 
                            Image.asset('assets/blank.png',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,):
                            Image.network(profile!,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,),
                          ): Image.file(selectedImage!,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,)
                        ),
                      ),
                    ),
                  ],
                ),
            
                Padding(
                  padding: const EdgeInsets.only(top:70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name!,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins'
                      ),),
                    ],
                  ),
                )
              ],
            ),
            
            SizedBox(height: MediaQuery.of(context).size.height/25,),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/10),
                height: MediaQuery.of(context).size.height/11,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:15,right: 15),
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.black,),
                SizedBox(width: MediaQuery.of(context).size.width/18,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text('Name',
                           style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54
                           ),),
                           Text(name!,
                           style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                           ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height/45,),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/10),
                height: MediaQuery.of(context).size.height/11,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:15,right: 15),
                  child: Row(
                    children: [
                      Icon(Icons.email_rounded, color: Colors.black,),
                SizedBox(width: MediaQuery.of(context).size.width/18,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text('Email',
                           style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                        
                           ),),
                           Text(email!,
                           style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                           ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

             SizedBox(height: MediaQuery.of(context).size.height/45,),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/10),
                height: MediaQuery.of(context).size.height/12,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:15,right: 15),
                  child: Row(
                    children: [
                      Icon(Icons.description, color: Colors.black,),
                SizedBox(width: MediaQuery.of(context).size.width/18,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           
                           Text('Terms and Conditions',
                           style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                           ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

             SizedBox(height: MediaQuery.of(context).size.height/45,),
            GestureDetector(
              onTap: (){
             AuthMethods().reauthenticateUser(context, email,password);
              },
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/10),
                  height: MediaQuery.of(context).size.height/12,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:15,right: 15),
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.black,),
                  SizedBox(width: MediaQuery.of(context).size.width/18,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             
                             Text('Delete Account',
                             style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87
                             ),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

             SizedBox(height: MediaQuery.of(context).size.height/45,),
            GestureDetector(
              onTap: (){
                AuthMethods().SignOut();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Logged Out Successfully')));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
              },
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/10),
                  height: MediaQuery.of(context).size.height/12,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:15,right: 15),
                    child: Row(
                      children: [
                        Icon(Icons.logout_rounded, color: Colors.black,),
                  SizedBox(width: MediaQuery.of(context).size.width/18,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             
                             Text('LogOut',
                             style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87
                             ),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}