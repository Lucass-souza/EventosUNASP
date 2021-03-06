import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';
import 'package:unasp_ht/app/pages/departures/pages/departure_details/departure_detail_page.dart';

class DepartureCard extends StatelessWidget {
  final Departure departure;

  const DepartureCard({Key key, @required this.departure}) : super(key: key);

  Color getDepartureStatusColor(DepartureStatus status) {
    Color color;
    switch (status) {
      case DepartureStatus.pendente:
        color = Colors.orange;
        break;
      case DepartureStatus.encerrado:
        color = Colors.redAccent;
        break;
      case DepartureStatus.decorrendo:
        color = Colors.green;
        break;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
        CupertinoPageRoute(
          builder: (context) => DepartureDetailPage(
            departure: departure,
          ),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(minHeight: 150),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: getDepartureStatusColor(departure.status),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              constraints: BoxConstraints(minHeight: 150),
              width: 15,
              height: 150,
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              constraints: BoxConstraints(minHeight: 150),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'ida: '.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(DateFormat('dd/MM/yy')
                                .format(departure.going ?? DateTime.now()))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'volta: '.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(DateFormat('dd/MM/yy')
                                .format(departure.turning ?? DateTime.now()))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  departure.location?.toUpperCase() ?? '',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.infoCircle,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  departure.reason?.toUpperCase() ?? '',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Center(
                        child: Text(departure.status
                                .toString()
                                .substring(
                                    departure.status.toString().indexOf('.') +
                                        1)
                                .toUpperCase() ??
                            ''),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
