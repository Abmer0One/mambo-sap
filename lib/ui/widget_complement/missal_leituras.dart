
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PageMissalLeituras extends StatefulWidget {

  @override
  _PageMissalLeiturasState createState() => _PageMissalLeiturasState();
}

class _PageMissalLeiturasState extends State<PageMissalLeituras> with TickerProviderStateMixin{

  //------------------------ (HOLIDAYS) - FERIADOS ----------------------------/
  final Map<DateTime, List> _holidays = {
    DateTime(2019, 1, 1): ['Ano Novo'],
    DateTime(2019, 1, 6): ['Epifania'],
    DateTime(2019, 2, 14): ['Dia dos Namorados'],
    DateTime(2019, 4, 21): ['Domingo'],
    DateTime(2019, 4, 22): ['Segunda'],
  };

  //------------------------------- PDF VARIABLE ------------------------------/
  bool _isLoading = true;
  PDFDocument document;

  //--------------------------- DEFENCE VARIABLE ------------------------------/
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;



  //*********************************** INIT STATE ************************** */
  @override
  void initState(){
    super.initState();

    //----------------------- INITSTATE CALENDAR LEITURAS ---------------------/
    final _selectedDay = DateTime.now();
    _events = {
      /*
      _selectedDay.subtract(Duration(days: 27)): ['1ª Defesa'],
      _selectedDay.subtract(Duration(days: 20)): ['1ª Defesa', '2ª Defesa', '3ª Defesa', '4ª Defesa'],
      _selectedDay.subtract(Duration(days: 16)): ['1ª Defesa', '2ª Defesa'],
      _selectedDay.subtract(Duration(days: 10)): ['1ª Defesa', '2ª Defesa', '3ª Defesa'],
      _selectedDay.subtract(Duration(days: 4)): ['1ª Defesa', '2ª Defesa', '3ª Defesa'],
      _selectedDay.subtract(Duration(days: 2)): ['1ª Defesa', '2ª Defesa'],
      _selectedDay: ['1ª Defesa', '2ª Defesa', '3ª Defesa', '4ª Defesa'],*/
      _selectedDay.add(Duration(days: 5)): ['1ª Leitura', '2ª Leitura', 'Evangelho', 'Oração dos Fieis', 'Munição'],
      _selectedDay.add(Duration(days: 12)): Set.from(['1ª Leitura', '2ª Leitura', 'Evangelho', 'Oração dos Fieis', 'Munição']).toList(),
      _selectedDay.add(Duration(days: 19)): ['1ª Leitura', '2ª Leitura', 'Evangelho', 'Oração dos Fieis', 'Munição'],
      _selectedDay.add(Duration(days: 26)): ['1ª Leitura', '2ª Leitura', 'Evangelho', 'Oração dos Fieis', 'Munição'],
      _selectedDay.add(Duration(days: 33)): ['1ª Leitura', '2ª Leitura', 'Evangelho', 'Oração dos Fieis', 'Munição'],
      _selectedDay.add(Duration(days: 35)): ['1ª Leitura', '2ª Leitura', 'Evangelho', 'Oração dos Fieis', 'Munição'],
      _selectedDay.add(Duration(days: 42)): ['1ª Leitura', '2ª Leitura', 'Evangelho', 'Oração dos Fieis', 'Munição'],
    };
    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();

  }


  //********************************* DISPOSE STATE ************************* */
  @override
  void dispose(){
    //DISPOSE CALENDAR DEFENCE...
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  //************************** ON DAY SELECTED ****************************** */
  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  //************************** ON VISIBLE DAYS CHANGED ********************** */
  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  //************************** ON CALENDAR CREATE *************************** */
  void _onCalendarCreated(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  //****************************** WIDGET ROOT ****************************** */
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: _calendarioLeituras(),
    );
  }

  //******************************* CALENDAR READS ************************** */
  _calendarioLeituras(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Switch out 2 lines below to play with TableCalendar's settings
        //-----------------------
        //_buildTableCalendar(),
        _buildTableCalendarWithBuilders(),
        const SizedBox(height: 8),
        //_buildButtons(),
        const SizedBox(height: 8),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            child: _buildEventList()
          )
        ),
      ],
    );
  }

  //**************************** TABLE CALENDAR STYLES ********************** */
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  //********************** ANOTHERS TABLE CALENDAR STYLES ******************* */
  Widget _buildTableCalendarWithBuilders() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(0),
       /* image: DecorationImage(
            image: AssetImage("assets/image/tempos_liturgicos/tempo_de_pascoa.jpg"),
            fit: BoxFit.cover
        ),*/
      ),
      child: TableCalendar(
        //locale: 'pt_AO',
        calendarController: _calendarController,
        events: _events,
        holidays: _holidays,
        initialCalendarFormat: CalendarFormat.month,
        formatAnimation: FormatAnimation.slide,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        availableGestures: AvailableGestures.all,
        availableCalendarFormats: const {
          CalendarFormat.month: '',
          CalendarFormat.week: '',
        },
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
          holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
        ),
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonVisible: false,
        ),

        builders: CalendarBuilders(
          selectedDayBuilder: (context, date, _) {
            return FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                //color: Colors.deepOrange[300],
                width: 100,
                height: 100,
                child: Text(
                  '${date.day}',
                  style: TextStyle().copyWith(fontSize: 16.0),
                ),
              ),
            );
          },
          todayDayBuilder: (context, date, _) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              //color: Colors.amber[400],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            );
          },
          markersBuilder: (context, date, events, holidays) {
            final children = <Widget>[];

            if (events.isNotEmpty) {
              children.add(
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: _buildEventsMarker(date, events),
                ),
              );
            }

            if (holidays.isNotEmpty) {
              children.add(
                Positioned(
                  right: -2,
                  top: -2,
                  child: _buildHolidaysMarker(),
                ),
              );
            }

            return children;
          },
        ),
        onDaySelected: (date, events, holidays) {
          _onDaySelected(date, events, holidays);
          _animationController.forward(from: 0.0);
        },
        onVisibleDaysChanged: _onVisibleDaysChanged,
        onCalendarCreated: _onCalendarCreated,
      ),
    );
  }

  //***************************** EVENTS MARKER ***************************** */
  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date) ? Colors.brown[300] : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  //**************************** HOLIDAYS MARKER **************************** */
  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  //****************************** BUTTONS BWW ****************************** */
  /*
  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Mês'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
            ),
            RaisedButton(
              child: Text('2 Semanas'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
            ),
            RaisedButton(
              child: Text('Semana'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        /*RaisedButton(
          child: Text(' ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),*/
      ],
    );
  }
  */

  //******************************** EVENTS LIST **************************** */
  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents.map((event) => 
          Container(
            width:  MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 14,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    
                Text(
                    event.toString()
                ),
    
                InkWell(
                  onTap: () {

                      _alertConfirm(context);

                  },//print('$event tapped!'),
                  child: Icon(
                    Icons.menu_book,
                  ),
                )
              ],
            ),
            /* ListTile(
              title: Text(event.toString()),
              onTap: () => _alertConfirm(context),//print('$event tapped!'),
            ),*/
          )
      ).toList(),
    );
  }

  //----------------------------- DIALOG COFIRM --------------------------------
  _alertConfirm(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(10.0),
              ),
            ),
            child: Container(
              width:  MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [

                  //::::::::::::::::::::::::::::: IMAGE ::::::::::::::::::::::::::::::::
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/image/perfil/admin.PNG"),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),

                  //::::::::::::::::::::: SPACE WIDTH ::::::::::::::::::::::::::
                  SizedBox(width: 10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      //::::::::::::::::::::: SPACE WIDTH ::::::::::::::::::::::::::
                      SizedBox(height: 10,),

                      //...................... FIRST RADIO BUTTON TBD ................
                      Text("1ª Leitura"),

                      //...................... SPACE HEIGHT ..........................
                      SizedBox(height: 20,),

                      //......................... INFORMATION PAY ....................
                      Text("Salmo Responsorial"),

                      //...................... SPACE HEIGHT ..........................
                      SizedBox(height: 20,),

                      //......................... SECOND RADIO BUTTON PE .............
                      Text("2ª Leitura"),

                      //...................... SPACE HEIGHT ..........................
                      SizedBox(height: 20,),

                      //.................. NEXT AND CANCEL BUTTON ....................
                      Text("Oração dos Fieis"),

                      //...................... SPACE HEIGHT ..........................
                      SizedBox(height: 20,),

                      //.................. NEXT AND CANCEL BUTTON ....................
                      Text("Munição"),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
