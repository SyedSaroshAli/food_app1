import 'package:cloud_firestore/cloud_firestore.dart';



class DatabaseMethods {
   
  Future addUserDetail(Map<String,dynamic> userInfoMap,String id)async{
    return await FirebaseFirestore.instance.collection('users').doc(id).set(userInfoMap);
  } 


  Future addFoodItem(Map <String,dynamic> userInfoMap,String name ) async{
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem (String name)async{
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addFoodToCart(Map <String,dynamic> userInfoMap,String id) async{
    return await FirebaseFirestore.instance
    .collection('users')
    .doc(id)
    .collection('Cart')
    .add(userInfoMap);
  }
  
   Future<Stream<QuerySnapshot>> getFoodCart (String id)async{
    return await FirebaseFirestore.instance.collection('users').doc(id).collection('Cart').snapshots();
  }

   Future<void> removeFoodFromCart(String userId, String cartItemId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('Cart')
          .doc(cartItemId)
          .delete();
      print('Food item removed from cart successfully');
    } catch (e) {
      print('Error removing food item from cart: $e');
    }
  }


  UpdateWallet(String id, String amount)async{
    await FirebaseFirestore.instance.collection('users').doc(id).update({'Wallet':amount});
  }
}