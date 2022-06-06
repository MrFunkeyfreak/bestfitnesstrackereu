import 'package:bestfitnesstrackereu/pages/user_administration/widgets/edit_button_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/responsive_table.dart';
import '../../provider/auth.dart';
import '../../provider/users_table.dart';
import '../../routing/route_names.dart';


class UsersAdministrationViewMobile extends StatefulWidget {
  UsersAdministrationViewMobile({Key key}) : super(key: key);
  @override
  _UsersAdministrationViewMobileState createState() => _UsersAdministrationViewMobileState();
}

class _UsersAdministrationViewMobileState extends State<UsersAdministrationViewMobile> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;  //check if user is logged in
    String uid = ('M0glOQKUwagZJGOyzVEU1JJgQo23');
    final UsersTable testTable = Provider.of<UsersTable>(context);

    return Scaffold(
      appBar: AppBar(
          title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Text("Userverwaltung"),
                Spacer(),
                IconButton(icon: Icon(Icons.refresh_sharp),
                  onPressed: testTable.initializeData,
                ),
              ]
          )
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Userverwaltung"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.storage),
              title: Text("Adminverwaltung"),
              onTap: () {},
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                    maxHeight: 700,
                  ),
                  child: Card(
                    elevation: 1,
                    shadowColor: Colors.black,
                    clipBehavior: Clip.none,
                    child: ResponsiveDatatable(
                      title: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          //add user to the list
                          TextButton.icon(
                            onPressed: () => {
                              Navigator.of(context).pushNamed(RegristrationAdminRoute)
                              //Pop-up Fenster für die Registration machen, wenn Zeit - ansonsten registrationsfenster weiterleiten
                            },
                            icon: Icon(Icons.add, color: Colors.black,),
                            label: Text("Hinzufügen",
                                style: TextStyle(
                                    color: Colors.black
                                )
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(10)),
                            ),
                          ),

                          SizedBox(height: 10,),

                          //edit-button + functionality
                          EditButtonAdmin(),

                          SizedBox(height: 10,),

                          TextButton.icon(
                            onPressed: () async => {
                              await AuthProvider.deleteUser(uid),
                              print(uid + 'user gelöscht')
                            },
                            icon: Icon(
                              IconData(0xe1bb, fontFamily: 'MaterialIcons'),
                              color: Colors.black,
                            ),
                            label: Text("Löschen",
                                style: TextStyle(
                                    color: Colors.black
                                )
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(10)),
                            ),
                          ),

                          SizedBox(height: 10,),

                          TextButton.icon(
                            onPressed: () => {},
                            icon: Icon(
                              IconData(0xe3b1, fontFamily: 'MaterialIcons'),
                              color: Colors.black,
                            ),
                            label: Text("Sperren",
                                style: TextStyle(
                                    color: Colors.black
                                )
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(10)),
                            ),
                          ),

                          SizedBox(height: 10,),

                          TextButton.icon(
                            onPressed: () => {},
                            icon: Icon(
                              IconData(0xe3b0, fontFamily: 'MaterialIcons'),
                              color: Colors.black,
                            ),
                            label: Text("Freischalten",
                                style: TextStyle(
                                    color: Colors.black
                                )
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(10)),
                            ),
                          ),
                        ],
                      ),


                      reponseScreenSizes: [ScreenSize.xs],
                      actions: [
                        if (testTable.isSearch)
                          Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter search term based on ' +
                                        testTable.searchKey
                                            .replaceAll(new RegExp('[\\W_]+'), ' ')
                                            .toUpperCase(),
                                    prefixIcon: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          setState(() {
                                            testTable.isSearch = false;
                                          });
                                          testTable.initializeData();
                                        }),
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.search), onPressed: () {})),
                                onSubmitted: (value) {
                                  testTable.filterData(value);
                                },
                              )),
                        if (!testTable.isSearch)
                          IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                setState(() {
                                  testTable.isSearch = true;
                                });
                              })
                      ],
                      headers: testTable.headers,
                      source: testTable.usersTableSource,
                      selecteds: testTable.selecteds,
                      showSelect: testTable.showSelect,
                      autoHeight: false,
                      dropContainer: (data) {
                        if (int.tryParse(data['id'].toString()).isEven) {
                          return Text("is Even");
                        }
                        return _DropDownContainer(data: data);
                      },
                      onChangedRow: (value, header) {
                        /// print(value);
                        /// print(header);
                      },
                      onSubmittedRow: (value, header) {
                        /// print(value);
                        /// print(header);
                      },
                      onTabRow: (data) {
                        print(data);
                      },
                      onSort: testTable.onSort,
                      expanded: testTable.expanded,
                      sortAscending: testTable.sortAscending,
                      sortColumn: testTable.sortColumn,
                      isLoading: testTable.isLoading,
                      onSelect: testTable.onSelected,
                      onSelectAll: testTable.onSelectAll,
                      footers: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Rows per page:"),
                        ),
                        if (testTable.perPages.isNotEmpty)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButton<int>(
                              value: testTable.currentPerPage,
                              items: testTable.perPages
                                  .map((e) => DropdownMenuItem<int>(
                                child: Text("$e"),
                                value: e,
                              ))
                                  .toList(),
                              onChanged: testTable.onChanged,
                              isExpanded: false,
                            ),
                          ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child:
                          Text("${testTable.currentPage} - ${testTable.currentPerPage} of ${testTable.total}"),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                          ),
                          onPressed: testTable.previous,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: testTable.next,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ])),
    );
  }
}

class _DropDownContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  const _DropDownContainer({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = data.entries.map<Widget>((entry) {
      Widget w = Row(
        children: [
          Text(entry.key.toString()),
          Spacer(),
          Text(entry.value.toString()),
        ],
      );
      return w;
    }).toList();

    return Container(
      /// height: 100,
      child: Column(
        /// children: [
        ///   Expanded(
        ///       child: Container(
        ///     color: Colors.red,
        ///     height: 50,
        ///   )),

        /// ],
        children: _children,
      ),
    );
  }
}