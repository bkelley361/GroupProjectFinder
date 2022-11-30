import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class DashboardScreenWidget extends StatefulWidget {
  const DashboardScreenWidget({Key? key}) : super(key: key);

  @override
  _DashboardScreenWidgetState createState() => _DashboardScreenWidgetState();
}

class _DashboardScreenWidgetState extends State<DashboardScreenWidget> {
  String? dropDownValue1;
  String? dropDownValue2;
  late SwipeableCardSectionController swipeableStackController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    swipeableStackController = SwipeableCardSectionController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF4FCAFF),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.dehaze,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Dashboard',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 75, 0),
                    child: FlutterFlowDropDown<String>(
                      initialOption: dropDownValue1 ??= '5 Miles',
                      options: ['5 Miles', '10 Miles', '15 Miles', '20 Miles'],
                      onChanged: (val) => setState(() => dropDownValue1 = val),
                      width: 100,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Please select...',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  AuthUserStreamWidget(
                    child: FlutterFlowDropDown<String>(
                      initialOption: dropDownValue2 ??= valueOrDefault(
                          currentUserDocument?.enrolledClasses, ''),
                      options: ['CIS 350', 'CIS 353', 'CIS 365', 'CIS 241'],
                      onChanged: (val) => setState(() => dropDownValue2 = val),
                      width: 110,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Please select...',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Radius',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: Text(
                      'Class#',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: AuthUserStreamWidget(
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord
                            .where('EnrolledClasses', isEqualTo: dropDownValue2)
                            .whereNotIn(
                                'uid',
                                functions.combineLists(
                                    (currentUserDocument?.matches?.toList() ??
                                            [])
                                        .toList(),
                                    (currentUserDocument?.rejects?.toList() ??
                                            [])
                                        .toList())),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> swipeableStackUsersRecordList =
                            snapshot.data!
                                .where((u) => u.uid != currentUserUid)
                                .toList();
                        final swipeableStackUsersRecord =
                            swipeableStackUsersRecordList.isNotEmpty
                                ? swipeableStackUsersRecordList.first
                                : null;
                        return FlutterFlowSwipeableStack(
                          topCardHeightFraction: 0.72,
                          middleCardHeightFraction: 0.68,
                          botttomCardHeightFraction: 0.75,
                          topCardWidthFraction: 0.95,
                          middleCardWidthFraction: 0.85,
                          botttomCardWidthFraction: 0.8,
                          onSwipeFn: (index) {},
                          onLeftSwipe: (index) {},
                          onRightSwipe: (index) {},
                          onUpSwipe: (index) {},
                          onDownSwipe: (index) {},
                          itemBuilder: (context, index) {
                            return [
                              () => Visibility(
                                    visible: swipeableStackUsersRecord != null,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFF4FCAFF),
                                          width: 5,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            swipeableStackUsersRecord!
                                                .displayName!,
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                          Text(
                                            swipeableStackUsersRecord!
                                                .projectIdea!,
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                          Text(
                                            swipeableStackUsersRecord!
                                                .enrolledClasses!,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                          Text(
                                            swipeableStackUsersRecord!
                                                .description!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Text(
                                            swipeableStackUsersRecord!
                                                .previousProjects!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              () => Visibility(
                                    visible:
                                        !(swipeableStackUsersRecord != null),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: EmptyListWidget(),
                                    ),
                                  ),
                            ][index]();
                          },
                          itemCount: 2,
                          controller: swipeableStackController,
                          enableSwipeUp: false,
                          enableSwipeDown: false,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.cancel,
                      color: Color(0xFFFF0004),
                      size: 60,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Color(0xBDFFD04C),
                      size: 70,
                    ),
                    Icon(
                      Icons.favorite_rounded,
                      color: Color(0xFF00FF0D),
                      size: 60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
