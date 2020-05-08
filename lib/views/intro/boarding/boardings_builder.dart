import 'boarding.dart';

List<Boarding> buildBoardings() {
  return <Boarding> [
    Boarding(
        imagePath: 'boarding_1',
        backgroundPath: 'background_2',
        title: 'Fiche personnalisée',
        description: 'Blessures, Cleansheets, Minutes jouées, Buts marqués … Que tu sois Gardien, Défenseur, Milieu ou Attaquant, découvre ta fiche personnalisée ! Elle sera mise à jour tout le long de la saison.'),
    Boarding(
        imagePath: 'boarding_2',
        backgroundPath: 'background_3',
        title: 'Statistiques collectives',
        description: 'Tu peux également comparer tes statistiques personnelles avec les autres joueurs du club, ou tout simplement consulter les différents classements.'),
    Boarding(
        imagePath: 'boarding_3',
        backgroundPath: 'background_4',
        title: 'Compositions d’équipe',
        description: 'Chaque semaine découvre en avant première la composition du soir ! Tu peux également consulter les compositions des semaines passées.'),
    Boarding(
        imagePath: 'boarding_4',
        backgroundPath: 'background_5',
        title: 'Calendrier / Résultats',
        description: 'Et bien sûr, consulte l’ensemble de nos résultats, notre classement et les matchs à venir sur le site de la FFF !'),
  ];
}
