class AppError {
  AppError({
    required this.errorTitle,
    required this.errorSubtitle,
    required this.errorMessage,
  });
  
  final String errorTitle;
  final String errorSubtitle;
  final String errorMessage;
}
