#let blocking-notice() = {
  import "../../constants.typ": lang-de
  set text(lang: lang-de)

  heading(numbering: none, outlined: false, bookmarked: true, "Sperrvermerk")

  // Must be in German, regardless of language of thesis
  // Taken from https://www.fbi.h-da.de/fileadmin/user_upload/fachbereich-informatik/Main_Menu/Studieren/Studium/Organisatorisches/Abschlussphase/Bachelor/2023-10_Anmeldung_04_Thesis-2.pdf
  // Changed: added "Autorin" as alternative to "Autor"; for "Referentin/Referent" that already existed
  [
    Diese Abschlussarbeit darf nur von der Referentin/dem Referenten, der Korreferentin/dem Korreferenten sowie den vom Prüfungsausschuss dazu beauftragten Hochschulangehörigen eingesehen werden. Sie darf ohne ausdrückliche Zustimmung der Autorin/des Autors weder vollständig noch auszugsweise vervielfältigt, veröffentlicht oder Dritten zugänglich gemacht werden. Die Durchführung des Kolloquiums bleibt von der Geheimhaltung unberührt. Die Geheimhaltungsverpflichtung erlischt fünf Jahre nach Einreichung automatisch.
  ]
}
