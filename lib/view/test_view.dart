// return Scaffold(
//       body: SafeArea(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
            
//             Row(
//               children: [
//                 const Text(
//                   'Company Logo   ',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 15,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                     letterSpacing: 1.50,
//                   ),
//                 ),
//                 SizedBox(
//                     width: 150,
//                     height: 39,
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         contentPadding: EdgeInsets.only(
//                             top: 20), // add padding to adjust text
//                         isDense: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(20),
//                           ),
//                         ),
//                         labelText: "Upload Here",
//                         prefixIcon: Padding(
//                           padding: EdgeInsets.only(
//                               top: 1), // add padding to adjust icon
//                           child: Icon(Icons.edit_document),
//                         ),
//                       ),
//                     )),
//                 Container(
//                   width: 25,
//                   height: 18,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 3.12, vertical: 2.25),
//                   clipBehavior: Clip.antiAlias,
//                   decoration: const BoxDecoration(),
//                   child: const Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [],
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 45,
//               width: 356,
//               child: TextFormField(
//                 controller: title,
//                 decoration: const InputDecoration(
//                   contentPadding:
//                       EdgeInsets.all(20), // add padding to adjust text
//                   isDense: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     ),
//                   ),
//                   labelText: "Enter job title",
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 45,
//               width: 356,
//               child: TextFormField(
//                 controller: company,
//                 decoration: const InputDecoration(
//                   contentPadding:
//                       EdgeInsets.all(20), // add padding to adjust text
//                   isDense: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     ),
//                   ),
//                   labelText: "Enter company name",
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 45,
//               width: 356,
//               child: TextFormField(
//                 controller: desc,
//                 decoration: const InputDecoration(
//                   contentPadding:
//                       EdgeInsets.all(20), // add padding to adjust text
//                   isDense: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     ),
//                   ),
//                   labelText: "Enter job description",
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 45,
//               width: 356,
//               child: TextFormField(
//                 controller: location,
//                 decoration: const InputDecoration(
//                   contentPadding:
//                       EdgeInsets.all(20), // add padding to adjust text
//                   isDense: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20),
//                     ),
//                   ),
//                   labelText: "Enter job location",
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 300,
//               child: ElevatedButton(
//                 onPressed: () async {},
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.green,
//                   shadowColor: Colors.red,
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(32.0),
//                   ),
//                   side: BorderSide(color: Colors.green.shade600, width: 1),
//                   textStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//                 child: const Text("Add Job"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );