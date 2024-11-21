import 'package:flutter/material.dart';

class ListviewBuilderProvider {
  List<Widget> getListValues(BuildContext context) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    "assets/images/atracciones.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    "assets/images/atracciones.png", 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    "assets/images/mapa.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
        ],
      ),
      const ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.add_business_outlined, color: Colors.black,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tienda'),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
      const Divider(color: Colors.grey, height: 0.1, thickness: 0.5),
      const ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.location_on_outlined, color: Colors.black,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Cómo llegar'),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
      const Divider(color: Colors.grey, height: 0.1, thickness: 0.5),
      const ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.schedule_outlined, color: Colors.black,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Horario de apertura'),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
      const Divider(color: Colors.grey, height: 0.1, thickness: 0.5),
      const ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.bookmark_add_outlined, color: Colors.black,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Otros servicios'),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
      const Divider(color: Colors.grey, height: 0.1, thickness: 0.5),
      const ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.balance_outlined, color: Colors.black,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Normas de funcionamiento'),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
      const Divider(color: Colors.grey, height: 0.1, thickness: 0.5),
    ];
  }
}
