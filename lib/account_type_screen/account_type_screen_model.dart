import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'account_type_screen_widget.dart' show AccountTypeScreenWidget;
import 'package:flutter/material.dart';

class AccountTypeScreenModel extends FlutterFlowModel<AccountTypeScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
