import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gst_app/src/models/gst_model.dart';
import 'package:gst_app/src/resources/firebase.dart';
import 'package:gst_app/widgets/custom_container.dart';
import 'package:gst_app/widgets/header.dart';

class GSTInfoScreen extends StatefulWidget {
  final String gstNumber;

  GSTInfoScreen(this.gstNumber);

  @override
  _GSTInfoScreenState createState() => _GSTInfoScreenState();
}

class _GSTInfoScreenState extends State<GSTInfoScreen> {
  // late Future<GSTModel> gstInfo;

  // @override
  // void initState() {
  //   super.initState();
  //   String uid = widget.gstNumber;
  //   gstInfo = getProfile(uid);
  //   print(gstInfo.toString());
  //   print("gstprofile initilized");
  // }

  late Future<GSTModel> profile;

  List<GSTModel> allprofiles = [];

  Future<GSTModel> getPlayer(String id) async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('GSTProfile');

    QuerySnapshot allDataQuerySnapshot = await _collectionRef.get();

    allprofiles = allDataQuerySnapshot.docs
        .map((doc) => doc.data())
        .toList()
        .reversed
        .map((e) => GSTModel.fromMap(e as Map<String, dynamic>))
        .toList();
    return allprofiles.firstWhere((temp) {
      return temp.id == id;
    });
  }

  @override
  void initState() {
    String uid = widget.gstNumber;
    profile = getPlayer(uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GSTModel>(
      future: profile,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data!.date_of_registration);
          return Scaffold(
            backgroundColor: Colors.white70,
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: HeaderContainer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 44,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios_outlined),
                                color: Colors.white,
                                iconSize: 16,
                              ),
                              Text(
                                'GST Profile',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'GSTIN of the tax payer',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 12, color: Colors.white24),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8),
                            child: Text(
                              snapshot.data!.GSTIN!,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8),
                            child: Text(
                              snapshot.data!.name!,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff2DA05E),
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'ACTIVE',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                                width: 90,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .90,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.room,
                                    color: Color(0xff2DA05E),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Principle area of business',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  snapshot.data!.address!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.account_balance,
                                    color: Color(0xff2DA05E),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Additional place of business',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(
                                  'Floor',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomContainer(
                                title: 'State Jurisdiction',
                                subtitle: 'Ward 74',
                              ),
                              const CustomContainer(
                                title: 'Centre Jurisdiction',
                                subtitle: 'Range - 139',
                              ),
                              CustomContainer(
                                title: 'Taxpayer Type',
                                subtitle: snapshot.data!.tax_payer_type!,
                                // subtitle: snapshot.data!.tax_payer_type!,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomContainer(
                          title: 'Condition of business',
                          subtitle: snapshot.data!.business_type!,
                          width: .90,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * .9,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Date of Registration',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(),
                                    Text(
                                      'Date of Consolidation',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data!.date_of_registration!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(),
                                    const Text(
                                      '--',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                            child: const Text("Get return filing status"),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.9, 48),
                              primary: const Color(0xff2DA05E),
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Scaffold(
              body: Center(
                  child: Text("Sorry we couldn't find this GST number")));
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
