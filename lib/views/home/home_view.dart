import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiles/viewmodels/ProductVM.dart';
import 'package:tiles/viewmodels/UserVM.dart';
import 'package:tiles/views/home/points_card.dart';
import 'package:tiles/views/home/product_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserVm>(context, listen: false).init();
    Provider.of<ProductVm>(context, listen: false).fetchProducts();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Arham Technosoft"),
            ),
            Consumer<UserVm>(
              builder: (context, uservm, child) => ListTile(
                title: const Text("LogOut"),
                onTap: () async {
                  await uservm.logout();
                  Navigator.popAndPushNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text("DashBoard"),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Column(
        children: [
          InkWell(child: const PointsCard(),
          onTap: (){
            Navigator.pushNamed(context, '/profile');
          },),
          Expanded(child: Consumer<ProductVm>(
            builder: (context, productvm, child) {
              return productvm.list != null
                  ? GridView.builder(
                      itemCount: productvm.list?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) =>
                          ProductCard(product: productvm.list![index]),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ))
        ],
      ),
    );
  }
}
