import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/Food_item.dart';
import '../Models/bfcart_item.dart';

class fooddata {
  final String dbname;

  final CollectionReference fd;

  final String? name;
  fooddata({this.name, required this.dbname})
      : fd = FirebaseFirestore.instance.collection(dbname);

  List<Food_item?> _confd(QuerySnapshot sns) {
    return sns.docs.map((doc) {
      // Explicitly cast doc.data() to Map<String, dynamic>
      Map<String, dynamic>? data =
          doc.data() as Map<String, dynamic>?; //Convert Object? to map

      // Check if data is not null before accessing its properties
      if (data != null) {
        return Food_item(
          name: data['name'],
          price: data['price'],
          qnty: data['qnty'],
        );
      }
    }).toList();
  }

  Stream<List<Food_item?>> get fdlist {
    print('hello');
    return fd.snapshots().map(_confd);
  }

  void after_pay(List<Bfcart> l1) async {
    final CollectionReference bfref =
        FirebaseFirestore.instance.collection('breakfast');
    final CollectionReference lnref =
        FirebaseFirestore.instance.collection('lunch');
    final CollectionReference snref =
        FirebaseFirestore.instance.collection('snacks');
    final CollectionReference dnref =
        FirebaseFirestore.instance.collection('dinner');
    final CollectionReference beref =
        FirebaseFirestore.instance.collection('beverages');

    for (Bfcart b in l1) {
      String? categ = b.category;
      if (categ == 'breakfast') {
        DocumentSnapshot vtemp = await bfref.doc(b.name).get();
        if (vtemp.exists) {
          int vupdate = vtemp.get('qnty');
          bfref.doc(b.name).update({"qnty": (vupdate - b.ordval!)});
        } else {
          print('Doc not found');
        }
      }
      if (categ == 'lunch') {
        DocumentSnapshot vtemp = await lnref.doc(b.name).get();
        if (vtemp.exists) {
          int vupdate = vtemp.get('qnty');
          lnref.doc(b.name).update({"qnty": (vupdate - b.ordval!)});
        } else {
          print('Doc not found');
        }
      }
      if (categ == 'snacks') {
        DocumentSnapshot vtemp = await snref.doc(b.name).get();
        if (vtemp.exists) {
          int vupdate = vtemp.get('qnty');
          snref.doc(b.name).update({"qnty": (vupdate - b.ordval!)});
        } else {
          print('Doc not found');
        }
      }
      if (categ == 'dinner') {
        DocumentSnapshot vtemp = await dnref.doc(b.name).get();
        if (vtemp.exists) {
          int vupdate = vtemp.get('qnty');
          dnref.doc(b.name).update({"qnty": (vupdate - b.ordval!)});
        } else {
          print('Doc not found');
        }
      }
      if (categ == 'beverages') {
        DocumentSnapshot vtemp = await beref.doc(b.name).get();
        if (vtemp.exists) {
          int vupdate = vtemp.get('qnty');
          beref.doc(b.name).update({"qnty": (vupdate - b.ordval!)});
        } else {
          print('Doc not found');
        }
      }
    }
  }
}

class History {
  final CollectionReference hist =
      FirebaseFirestore.instance.collection('history');

  Future update_hist(String? uid, String? pid, List<Bfcart> l1) async {
    List<Map<String, dynamic>> listOfMaps = l1.map((obj) {
      return {
        'name': obj.name,
        'price': obj.price,
        'qnty': obj.ordval,
      };
    }).toList();
    hist.doc(pid).set({
      "uid": uid,
      "pid": pid,
      "order": listOfMaps,
    });
  }
}

class qrdatabase {
  final String? pid;
  qrdatabase({this.pid});
  final CollectionReference qrdata =
      FirebaseFirestore.instance.collection('qr');

  Future update_qrdata(String? pid, List<Bfcart> l1) async {
    List<Map<String, dynamic>> listOfMaps = l1.map((obj) {
      return {
        "name": obj.name,
        "price": obj.price,
        "qnty": obj.ordval,
      };
    }).toList();
    qrdata.doc(pid).set({
      "pid": pid,
      "order": listOfMaps,
    });
  }

  Future<List<Map<String, dynamic>>> searchDocumentByName(
      String? documentName) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('qr')
          .doc(documentName)
          .get();

      if (documentSnapshot.exists) {
        // Assuming 'order' is a List<Map<String, dynamic>>
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        // Convert the data to a list of maps
        List<Map<String, dynamic>> listOfMaps = [];
        data.forEach((key, value) {
          listOfMaps.add({key: value});
        });

        return listOfMaps;
      }
      return []; // Return an empty list if the document doesn't exist
    } catch (error) {
      print('Error searching document: $error');
      // Ensure that a value is returned even in case of an error
      return [];
    }
  }
}
