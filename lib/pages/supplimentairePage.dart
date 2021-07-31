import 'package:flutter/material.dart';

class Product {
  String image;
  String name;
  int number;
  double price;
  String restaut;
  List<String> details;
  bool ischecked = false;
  Product(this.details, this.image, this.name, this.price, this.restaut,
      this.number);
}

// ignore: must_be_immutable
class SupplimentairePage extends StatefulWidget {
  late String restauName;
  SupplimentairePage({required this.restauName, Key? key}) : super(key: key);

  @override
  _SupplimentairePageState createState() =>
      _SupplimentairePageState(restauName: this.restauName);
}

class _SupplimentairePageState extends State<SupplimentairePage> {
  late String restauName;
  double total = 0;
  var listSauce = [
    ["Algerian", false],
    ["Biggy", false],
    ["Barbecue", false],
    ["Andalouse", false],
    ["Samourai", false],
  ];

  var listSupp = [
    Product(
      [""],
      "",
      "Celicatesse",
      6.00,
      "",
      2,
    ),
    Product(
      [""],
      "",
      "Sauce supplimentaire",
      1.00,
      "",
      2,
    ),
    Product(
      [""],
      "",
      "Frites",
      8.00,
      "",
      2,
    ),
  ];
  Product product = Product(
    [""],
    "assets/images/logo.png",
    "Chicken Tacos",
    25.00,
    "restaut",
    1,
  );
  _SupplimentairePageState({required this.restauName});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    setState(() {
      total = product.price;
      for (var item in listSupp) {
        if (item.ischecked == true)
          setState(() {
            total += item.price;
          });
      }
    });
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            this.restauName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 35,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(left: 15),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0XFFF1A1C2B),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cart",
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    height: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0XFFFC42625),
                    ),
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Profile",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: size.height * 0.83,
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
              vertical: 10,
            ),
            width: size.width,
            child: ListView(
              children: [
                ProductCard(product: product),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Choose your sauces",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "choose two at most",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            color: Colors.yellow.shade500,
                            child: Text(
                              "Obligatory",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      for (var item in listSauce)
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item[0].toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (item[1] == false) {
                                      int i = 0;
                                      for (var a in listSauce) {
                                        if (a[1] == true) i++;
                                      }
                                      if (i < 2) item[1] = true;
                                    } else
                                      item[1] = false;
                                  });
                                },
                                child: Container(
                                  height: 27,
                                  width: 27,
                                  decoration: BoxDecoration(
                                    color: item[1] == false
                                        ? Color(0XFFFD3EFEF)
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    item[1] == false ? Icons.add : Icons.remove,
                                    color: Color(0XFFF278330),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Would you like a supplement ?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: 5,
                  ),
                  child: Column(
                    children: [
                      for (var item in listSupp)
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    item.price.toString() + " MAD",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0XFFF41CA4E),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    item.ischecked = !item.ischecked;
                                  });
                                  if (item.ischecked == true)
                                    setState(() {
                                      total += item.price;
                                    });
                                  else
                                    setState(() {
                                      total -= item.price;
                                    });
                                },
                                child: Container(
                                  height: 27,
                                  width: 27,
                                  decoration: BoxDecoration(
                                    color: item.ischecked == false
                                        ? Color(0XFFFD3EFEF)
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    item.ischecked == false
                                        ? Icons.add
                                        : Icons.remove,
                                    color: Color(0XFFF278330),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 27,
                        width: 27,
                        decoration: BoxDecoration(
                          color: Color(0XFFFD3EFEF),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.monetization_on_outlined,
                          color: Color(0XFFF278330),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        total.toString() + " MAD",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0XFFF41CA4E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.09,
                    vertical: 20,
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0XFFF4AC556),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Add to Your Cart",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    print("l'image hh : ${product.image}");
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(product.image),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black,
            BlendMode.softLight,
          ),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            product.name,
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            product.price.toString() + " MAD",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
