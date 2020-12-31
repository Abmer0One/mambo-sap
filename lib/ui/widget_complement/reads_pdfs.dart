import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class TestePdf extends StatefulWidget {
  @override
  _TestePdfState createState() => _TestePdfState();
}

class _TestePdfState extends State<TestePdf> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
    changePDF(1);
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/pdf/bd.pdf');
    setState(() => _isLoading = false);
  }

  changePDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/pdf/bd.pdf');
    }
    /*else if (value == 2) {
      document = await PDFDocument.fromURL(
          "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf");
    } else {
      document = await PDFDocument.fromAsset('assets/pdf/bd.pdf');
    }
    */
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
          document: document,
          zoomSteps: 1,
          //uncomment below line to preload all pages
          // lazyLoad: false,
          // uncomment below line to scroll vertically
          // scrollDirection: Axis.vertical,

          //uncomment below code to replace bottom navigation with your own
          /* navigationBuilder:
                      (context, page, totalPages, jumpToPage, animateToPage) {
                    return ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.first_page),
                          onPressed: () {
                            jumpToPage()(page: 0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            animateToPage(page: page - 2);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            animateToPage(page: page);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.last_page),
                          onPressed: () {
                            jumpToPage(page: totalPages - 1);
                          },
                        ),
                      ],
                    );
                  }, */
        ),
      ),
    );
  }
}