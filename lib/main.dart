import 'package:bun_wa_hal/model/cart.dart';
import 'package:bun_wa_hal/model/item.dart';
import 'package:bun_wa_hal/screens/mac.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

double currentSliderValue = 2.5;
bool containHeal1 = false;
bool containHeal2 = false;
bool containHeal3 = false;
bool containHeal4 = false;
bool containHeal5 = false;
bool containHeal6 = false;
bool containHeal7 = false;
String itemId = "";

class _MyAppState extends State<MyApp> {
  List<FireBaseItem> getDataFromFireBase() {
    final List<FireBaseItem> fireBaseItem = [];
    return fireBaseItem;
  }

  @override
  Widget build(BuildContext context) {
    final List<UserItem> items = [
      UserItem(
        title: 'قهوة 1',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mac()));
          },
          child: Image.network(
            "https://www.mozzaik.shop/media/image/da/51/c2/DSC_0688.jpg",
          ),
        ),
        price: 2.0,
      ),
      UserItem(
        title: 'قهوة 2',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mac()));
          },
          child: Image.network(
            "https://feedo.shop/image/cache/catalog/Products%20Images/Soft-Drinks-Tea-Coffee/Tea-Coffee-Hot-Drinks/Coffee/Haseeb-Without-Cardamom-Coffee-200g-550x550.jpg",
          ),
        ),
        price: 1500,
      ),
      UserItem(
        title: 'قهوة 3',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mac()));
          },
          child: Image.network(
            "https://a.nooncdn.com/t_desktop-pdp-v1/v1532409190/N14456792A_1.jpg",
            scale: 6.5,
          ),
        ),
        price: 5.5,
      ),
      UserItem(
        title: 'قهوة 4',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mac()));
          },
          child: Image.network(
            "https://zamrad.shop/image/cache/catalog/product/coffee/4529685241-550x550.jpg",
          ),
        ),
        price: 310,
      ),
      UserItem(
        title: 'قهوة 5',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mac()));
          },
          child: Image.network(
              "https://a.nooncdn.com/t_desktop-pdp-v1/v1561355210/N14456789A_1.jpg",
              scale: 6.5),
        ),
        price: 7,
      ),
      UserItem(
        title: 'قهوة 6',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mac()));
          },
          child: Image.network(
            "https://www.kat.ae/wp-content/uploads/2020/09/%D8%A8%D9%86-%D8%A7%D9%84%D8%AD%D9%85%D9%88%D8%AF%D9%89-%D9%87%D8%A7%D9%84-%D8%A7%D9%83%D8%B3%D8%AA%D8%B1%D8%A7.jpg",
          ),
        ),
        dep: CheckboxListTile(
          title: Text("مع هيل"),
          value: containHeal6,
          onChanged: (newValue) {
            setState(() {
              containHeal6 = newValue;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        price: 90,
      ),
      UserItem(
        title: 'قهوة 7',
        image: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mac()));
          },
          child: Image.network(
            "https://a.nooncdn.com/t_desktop-pdp-v1/v1561355210/N14456789A_1.jpg",
            scale: 6.5,
          ),
        ),
        dep: CheckboxListTile(
          title: Text("مع هيل"),
          value: containHeal7,
          onChanged: (newValue) {
            setState(() {
              containHeal7 = newValue;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        price: 40,
      )
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
                elevation: 5,
                backgroundColor: Colors.teal,
                title: Text("قهوة بن وهال"),
                centerTitle: true,
                actions: <Widget>[
                  Stack(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => check_out()));
                          })
                    ],
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 250,
                      child: Carousel(
                        dotColor: Colors.black,
                        dotSpacing: 20,
                        dotSize: 5,
                        images: [
                          Image.network(
                              "https://a.nooncdn.com/t_desktop-pdp-v1/v1561355210/N14456789A_1.jpg"),
                          Image.network(
                              "https://www.kat.ae/wp-content/uploads/2020/09/%D8%A8%D9%86-%D8%A7%D9%84%D8%AD%D9%85%D9%88%D8%AF%D9%89-%D9%87%D8%A7%D9%84-%D8%A7%D9%83%D8%B3%D8%AA%D8%B1%D8%A7.jpg"),
                          Image.network(
                              "https://a.nooncdn.com/t_desktop-pdp-v1/v1532409190/N14456792A_1.jpg"),
                        ],
                        autoplay: true,
                      ),
                    ),
                    Container(
                      height: 400,
                      child: GridView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GridTile(
                              child: InkWell(
                                onTap: () {
                                  print("test");
                                  //(cart.bascket[index].onPressed);
                                },
                                child: (items[index].image),
                              ),
                              footer: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GridTileBar(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.5),
                                  title: Text(items[index].title.toString()),
                                  trailing: Text(
                                    items[index].price.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                      ),
                    ),
                  ],
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
                  child: Text("adam")),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("The Emergency meeting is dated secsfuly ☠☠"),
              ),
            ],
          )),
        );
      });
}
