import 'package:flutter/material.dart';

class DataMemberScreen extends StatefulWidget {
  const DataMemberScreen({super.key});

  @override
  State<DataMemberScreen> createState() => DataMemberScreenState();
}

class DataMemberScreenState extends State<DataMemberScreen> {
  final listMember = {
    "member": [
      {
        'fotoProfil': 'assets/images/ImanAbdurrahman.jpg',
        "nama": "Iman Abdurrahman",
        "nim": "123200167",
        'kelas': 'IF-A',
      },
      {
        'fotoProfil': '',
        'nama': 'Ryzal Fadhillah',
        'nim': '123200053',
        'kelas': 'IF-A',
      },
      {
        'fotoProfil': '',
        'nama': 'Freshley Grisyuan Surya Kolim',
        'nim': '123200034',
        'kelas': 'IF-A',
      }
    ]
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        '${listMember['member']![index]['fotoProfil']}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            size: 90,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          '${listMember['member']![index]['nama']}',
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '${listMember['member']![index]['nim']}',
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '${listMember['member']![index]['kelas']}',
                          style: const TextStyle(fontSize: 20),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 12,
        ),
        itemCount: listMember['member']!.length,
      ),
    );
  }
}
