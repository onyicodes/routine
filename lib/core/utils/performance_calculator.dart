String completionPerformancePercent(
    {required int numberOfTaskCompleted, required int numberOfTaskMissed}) {
  if (numberOfTaskCompleted + numberOfTaskMissed == 0) {
    return ( 0 /
          (10) *
          100)
      .toStringAsFixed(0);
  }
  return (numberOfTaskCompleted /
          (numberOfTaskCompleted + numberOfTaskMissed) *
          100)
      .toStringAsFixed(0);
}
