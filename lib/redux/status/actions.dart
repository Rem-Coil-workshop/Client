class SetLoadStatusAction{
  final bool isLoad;

  SetLoadStatusAction(this.isLoad);
}

class SetErrorStatusAction{
  final bool isError;

  SetErrorStatusAction(this.isError);
}

class SetMessageAction {
  final String message;

  SetMessageAction(this.message);
}

class DisableStatusAction{}