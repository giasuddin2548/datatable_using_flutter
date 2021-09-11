import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final columns=['Id', 'Name', 'Email', 'Phone', 'Address', 'Reference'];
  List<UserInfo> _userList=[
    UserInfo(id: '110', name: 'Gias ', email: 'gias@gmail.com', phone: '+8801811913041', address: 'Uttara, Dhaka', ref: 'Jainal uddin'),
    UserInfo(id: '111', name: 'Gias ', email: 'gias@gmail.com', phone: '+8801811913041', address: 'Uttara, Dhaka', ref: 'Jainal uddin'),
    UserInfo(id: '112', name: 'Gias ', email: 'gias@gmail.com', phone: '+8801811913041', address: 'Uttara, Dhaka', ref: 'Jainal uddin'),
    UserInfo(id: '113', name: 'Gias ', email: 'gias@gmail.com', phone: '+8801811913041', address: 'Uttara, Dhaka', ref: 'Jainal uddin'),
    UserInfo(id: '114', name: 'Gias ', email: 'gias@gmail.com', phone: '+8801811913041', address: 'Uttara, Dhaka', ref: 'Jainal uddin'),
    UserInfo(id: '115', name: 'Gias ', email: 'gias@gmail.com', phone: '+8801811913041', address: 'Uttara, Dhaka', ref: 'Jainal uddin'),

  ];

  List<UserInfo> _selectedUserList=[];

  List<DataColumn> _getColumn(List<String> columns) {
    return columns.map((e) {
      return DataColumn(
          label: Text(e),
          numeric: true,
          onSort: (index, element){

          }

      );
    }).toList();
  }


 List<DataRow> _getRow(List<UserInfo> userList) {

    return userList.map((e) {
      return DataRow(
         selected: _selectedUserList.contains(e),
          onSelectChanged: (isSelected){
           setState(() {
             final isAdding =  isSelected !=null && isSelected;

             isAdding?  _selectedUserList.add(e): _selectedUserList.remove(e);


           });
          },
          cells: [
            DataCell(Text(e.id)),
            DataCell(Text(e.name, overflow: TextOverflow.ellipsis,)),
            DataCell(Text(e.email)),
            DataCell(Text(e.phone)),
            DataCell(Text(e.address)),
            DataCell(Text(e.ref)),
          ],

      );
    } ).toList();
 }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(

        // decoration: BoxDecoration(
        //
        //   image: DecorationImage(
        //       image: NetworkImage('https://avatars.githubusercontent.com/u/36180689?v=4'),
        //        fit: BoxFit.cover,
        //
        //
        //
        //   )
        // ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                DataTable(
                  columns: _getColumn(columns),
                  rows: _getRow(_userList),
                  dividerThickness: 1,
                  showBottomBorder: true,




                ),
                Container(

                  height: 100,
                  child: Expanded(

                    child: ListView.builder(
                      shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedUserList.length,
                        itemBuilder: (context, index) => Chip(
                            label: InkWell(
                                child: Text(_selectedUserList[index].name),
                                onTap: (){
                                  setState(() {
                                    _selectedUserList.removeAt(index);
                                  });
                                },

                            )),


                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(5)),

                  ),

                ),

              ],
            ),
          ),
        ),

      ),
    );
  }




}

class UserInfo{
 final String id;
 final String name;
 final String email;
 final String phone;
 final String address;
 final String ref;

 UserInfo( {
   required this.id,
   required this.name,
   required this.email,
   required this.phone,
   required this.address,
   required this.ref
});

}

