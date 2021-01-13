import 'dart:convert';
import 'dart:html';

import 'package:bun_wa_hal/model/cart.dart';
import 'package:bun_wa_hal/model/item.dart';
import 'package:bun_wa_hal/screens/checkot_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

void min() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MaterialApp(
      theme: ThemeData(accentColor: Color(0xFF00897B)),
      debugShowCheckedModeBanner: false,
      home: Mac(),
    ),
  ));
}

enum cookinglevel { lafayette, jefferson }
double currentsliderval = 250;
String adma = "lg";

class Mac extends StatefulWidget {
  @override
  _MacState createState() => _MacState();
}

double price = 2;
double containHeal = 0.5;
double f = 3;
double s = 5;
double th = 9;
double fth = 13;
bool heal = false;
double maxValue = maxValue > 0 ? maxValue : 1000;
String groubVal = '';
String cookinglevels = "";

final List<FireBaseItem> fbitem = [];

class _MacState extends State<Mac> {
  @override
  Widget build(BuildContext context) {
    final List<UserItem> items = [
      UserItem(
        title: 'قهوة بن و هال تركية ',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mac()));
          },
          child: Image.network(
            "https://www.mozzaik.shop/media/image/da/51/c2/DSC_0688.jpg",
          ),
        ),
        cookingLevels: Column(
          children: [
            RadioListTile(
              title: Text("شقراء"),
              value: '1',
              groupValue: groubVal,
              onChanged: (val) {
                groubVal = val;
                setState(() {
                  cookinglevels = "شقراء";
                });
              },
            ),
            RadioListTile(
              title: Text("وسط"),
              value: '2',
              groupValue: groubVal,
              onChanged: (val) {
                groubVal = val;
                setState(() {
                  cookinglevels = "وسط";
                });
              },
            ),
            RadioListTile(
              title: Text("غامقة"),
              value: '3',
              groupValue: groubVal,
              onChanged: (val) {
                groubVal = val;
                setState(() {
                  cookinglevels = "غامقة";
                });
              },
            ),
          ],
        ),
        dep: CheckboxListTile(
          title: Text("مع هيل"),
          value: heal,
          onChanged: (newValue) {
            setState(() {
              heal = newValue;
              if (heal == true) {
                price += containHeal;
              } else {
                price -= containHeal;
              }
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        containHeal: heal,
        price: price,
      ),
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<Cart>(builder: (
          context,
          cart,
          child,
        ) {
          return Scaffold(
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

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => check_out()));
                      },
                    ),
                    ListTile(
                      title: Text(
                          "press me if you want to set an emgarnsy meeting"),
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
              appBar: AppBar(
                title: Text("tic world"),
                centerTitle: true,
                actions: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                          top: 7,
                          bottom: 20,
                          right: 20,
                          left: 28,
                          child: Text(cart.count.toString())),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => check_out()));
                                },
                                child: Icon(
                                  Icons.shopping_cart,
                                ))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              body: Container(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                        child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () {},
                          title: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Image.network(
                                    "https://www.mozzaik.shop/media/image/da/51/c2/DSC_0688.jpg",
                                  ),
                                ],
                              ),
                              Text(items[index].title),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    (items[index].dep),
                                    Slider(
                                        divisions: 4,
                                        label: currentsliderval
                                                .toInt()
                                                .toString() +
                                            "$adma",
                                        max: 1000,
                                        min: 250,
                                        value: currentsliderval,
                                        onChanged: (double slider) {
                                          setState(() {
                                            if (currentsliderval == 250) {
                                              setState(() {
                                                price += f;
                                              });
                                            } else {
                                              price -= f;
                                            }

                                            if (currentsliderval == 437) {
                                              setState(() {
                                                price += s;
                                              });
                                            } else {
                                              price -= s;
                                            }

                                            if (currentsliderval == 625) {
                                              setState(() {
                                                price += th;
                                              });
                                            } else {
                                              price -= th;
                                            }
                                            if (currentsliderval == 1000) {
                                              setState(() {
                                                adma = "kg";
                                                price += fth;
                                              });
                                            } else {
                                              price -= fth;
                                            }
                                            currentsliderval = slider;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: (items[index].cookingLevels),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: FlatButton(
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Center(
                                          child: Text(
                                        "add to cart",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      Text(items[index].price.toString()),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      cart.add(items[index]);
                                      setState(() {
                                        fbitem.add(
                                          FireBaseItem(
                                            title: (items[index].title),
                                            price: (items[index].price),
                                            cookingLevel: cookinglevels,
                                            containHeal: containHeal1,
                                            size: currentsliderval,
                                          ),
                                        );
                                      });
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
                  },
                ),
              ));
        }));
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
                      height: 590,
                      child: ListView.builder(
                          itemCount: cart.bascket.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(10.0),
                                title: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: (cart.bascket[index].image),
                                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Total : " + cart.totalprice.toString()),
                        ),
                        Container(
                          height: 50,
                          width: 258,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            child: RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                fbitem.map((e) => {
                                      Body: jsonEncode({
                                        'id': FireBaseItem().itemId,
                                        'title': FireBaseItem().title,
                                        'price': FireBaseItem().price,
                                        'cookingLevel':
                                            FireBaseItem().cookingLevel,
                                        'containHeal':
                                            FireBaseItem().containHeal,
                                        'size': FireBaseItem().size,
                                      }),
                                    });
                              },
                              child: Text("Check out"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}

void displayBotStomSheet(BuildContext context) {
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
