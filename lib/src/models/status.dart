import 'package:json_annotation/json_annotation.dart';

enum Status {
  @JsonValue("Vendu")
  vendu,
  @JsonValue("Visite Technique Validée")
  visiteTechniqueValidee,
  @JsonValue("Financement Validé")
  financementValide,
  @JsonValue("Annulée")
  annulee,
}
