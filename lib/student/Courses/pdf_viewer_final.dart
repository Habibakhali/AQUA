
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FinalPdfViewer extends StatefulWidget {
  static const String routeName = 'Exam';

  @override
  State<FinalPdfViewer> createState() => _FinalPdfViewerState();
}

class _FinalPdfViewerState extends State<FinalPdfViewer> {
  PdfViewerController pdfViewerController = PdfViewerController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  double zoom = 0.0;

  TextEditingController controller = TextEditingController();

  int pageNo = 0;

  jumpTo(BuildContext context) {
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Enter page No to jump'),
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (val){
                pageNo = int.parse(val);
              },
            ),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancel')),
              TextButton(onPressed: (){
                pdfViewerController.jumpToPage(pageNo);
                Navigator.pop(context);
              }, child: Text('OK'))
            ],
          );

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
        actions: [
          IconButton(
              onPressed: () {
                pdfViewerController.previousPage();
              },
              icon: Icon(Icons.arrow_back_ios)),
          IconButton(
              onPressed: () {
                pdfViewerController.nextPage();
              },
              icon: Icon(Icons.arrow_forward_ios)),
          IconButton(
              onPressed: () {
                jumpTo(context);
              },
              icon: Icon(Icons.search,)),
        ],
      ),
      body: SfPdfViewer.asset('assets/pdfs/Advanced Ai 2022.pdf',controller: pdfViewerController,),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            pdfViewerController.zoomLevel= zoom+1;
            zoom++;
          }, icon: Icon(Icons.zoom_in,size: 30,)),
          IconButton(onPressed: (){
            pdfViewerController.zoomLevel=0.0;
          }, icon: Icon(Icons.zoom_out,size: 30,))
        ],
      ),
    );
  }
}
