import 'package:contactapp/screens/add_contact.dart';
import 'package:contactapp/screens/update_widget.dart';
import 'package:contactapp/utils/Text.dart';
import 'package:contactapp/utils/color.dart';
import 'package:contactapp/widgets/list_widget.dart';
import 'package:contactapp/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  TextEditingController name = TextEditingController();
  TextEditingController surName = TextEditingController();
  TextEditingController phone = TextEditingController();

  editContact(context, index) {
    setState(() {
      Navigator.pop(context);
      contacts[index] = {
        "name": name.text,
        "surName": surName.text,
        "phone": phone.text,
      };
      name.clear();
      surName.clear();
      surName.clear();
      phone.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        title: Text(
          TextConstant.titleText,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorConstant.titleTextColor),
        ),
        actions: [
          Icon(
            Icons.search_outlined,
            color: ColorConstant.iconColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.more_vert_outlined,
              color: ColorConstant.iconColor,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddContact()),
          );
        },
        backgroundColor: ColorConstant.floatButtonColor,
        child: Icon(
          Icons.add,
          color: ColorConstant.appBarColor,
          size: 30,
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Card(
              color: ColorConstant.fieldColor,
              elevation: 3,
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorConstant.circleColor,
                    radius: 30,
                    child: Text(
                      "${contacts[index]['name'][0]} ${contacts[index]['surName'][0]}",
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: -3,
                          color: ColorConstant.floatButtonColor),
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                          '${contacts[index]['name']} ${contacts[index]['surName']}'),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Icons.hd_outlined,
                        size: 16,
                      )
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${contacts[index]['phone']}',
                          style: TextStyle(color: ColorConstant.callIconColor)),
                      Row(
                        children: [
                          Icon(
                            Icons.south_west_sharp,
                            color: ColorConstant.iconColor,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text('Mobile',
                              style: TextStyle(
                                  color: ColorConstant.iconColor,
                                  fontSize: 16)),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.circle_sharp,
                            size: 8,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '1 min ago',
                            style: TextStyle(
                                color: ColorConstant.iconColor, fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        'ZONG',
                        style: TextStyle(
                            color: ColorConstant.iconColor, fontSize: 16),
                      )
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Icon(
                          Icons.phone_callback,
                          color: ColorConstant.callIconColor,
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
