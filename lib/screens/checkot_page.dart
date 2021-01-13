import 'package:bun_wa_hal/main.dart';
import 'package:bun_wa_hal/model/cart.dart';
import 'package:bun_wa_hal/screens/mac.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class check_out extends StatefulWidget {
  @override
  _check_outState createState() => _check_outState();
}

bool basjd = false;

class _check_outState extends State<check_out> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            actions: <Widget>[],
            title: Text("check out page"),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Image.asset(
                    "Images/tic_logo.png",
                    width: 52,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: Text('home'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                ),
                ListTile(
                  title: Text('cart'),
                  onTap: () {
                    // Update the state of the app.
                    // ...

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => check_out()));
                  },
                ),
                ListTile(
                  title:
                      Text("press me if you want to set an emgarnsy meeting"),
                  onTap: () {
                    showDialog(
                        context: context,
                        child: new AlertDialog(
                            backgroundColor: Colors.red,
                            title: Center(
                              child: new Text(
                                "are you sure thet you want to make an emgarnsy meeting",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            content: Row(
                              children: <Widget>[
                                FlatButton(
                                    color: Colors.red,
                                    onPressed: () {
                                      displayBottomSheet(context);
                                    },
                                    child: Text(
                                      "Yes,Iam sure",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                SizedBox(
                                  width: 45,
                                ),
                                FlatButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "No,Iam not sure",
                                      style: TextStyle(color: Colors.red),
                                    )),
                              ],
                            )));
                  },
                )
              ],
            ),
          ),
          body: cart.bascket.length == 0
              ? Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 170,
                      ),
                      Text("The cart is empty 😕"),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        child: Text("Go and buy something"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Container(
                      height: 150,
                      child: ListView.builder(
                          itemCount: cart.bascket.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(10.0),
                                title: Column(
                                  children: <Widget>[
                                    (cart.bascket[index].image),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(cart.bascket[index].title),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(cart.bascket[index].price.toString()),
                                  ],
                                ),
                                subtitle: Column(
                                  children: [
                                    (cart.bascket[index].dep),
                                    Text(currentsliderval.toInt().toString()),
                                    Text(cookinglevels),
                                  ],
                                ),
                                trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      cart.remove(cart.bascket[index]);
                                    }),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 5),
                  child: Text("no dATA")),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("The Emergency meeting is dated secsfuly ☠☠"),
              ),
            ],
          )),
        );
      });
}

void done(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 5),
                  child: Text("no dATA")),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("the order is plasd scsuffly ✔"),
              ),
            ],
          )),
        );
      });
}
