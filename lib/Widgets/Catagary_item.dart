import 'package:flutter/material.dart';
import '../Screens/Catagary_Item_Screen.dart';

class CatagaryItem extends StatelessWidget {
  final String Title;
  final Color rang;
  final String Id;
  final String ImgUrl;

  const CatagaryItem(this.Title, this.rang, this.Id, this.ImgUrl);

  void OpenCatagaryScreen(ctx) {
    Navigator.of(ctx).pushNamed(CatagaryItemScreen.Routename, arguments: {
      'Id': Id,
      'Title': Title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => OpenCatagaryScreen(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  ImgUrl,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black38,
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(10),
                child: Text(
                  Title,
                  style: TextStyle(
                      fontFamily: 'Roboto', fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
