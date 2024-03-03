extension FlDateTime on DateTime {
  String tiempoRestante(DateTime fechaObjetivo) {
    final ahora = DateTime.now();
    final diferencia = fechaObjetivo.difference(ahora);

    if (diferencia.inDays > 0) {
      return "Finaliza en ${diferencia.inDays} día${diferencia.inDays > 1 ? 's' : ''}";
    } else if (diferencia.inHours > 0) {
      return "Finaliza en ${diferencia.inHours} hora${diferencia.inHours > 1 ? 's' : ''}";
    } else {
      return "Finaliza en ${diferencia.inDays.abs()} mes${diferencia.inDays.abs() > 1 ? 'es' : ''}";
    }
  }
}
