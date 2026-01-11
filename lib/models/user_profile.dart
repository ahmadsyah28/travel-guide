class UserProfile {
  final String name;
  final String nameJapanese;
  final String avatarUrl;
  final double distanceFromLocation;
  final List<String> badges;
  final int countriesVisited;
  final int mountainsClimbed;
  final int citiesExplored;

  UserProfile({
    required this.name,
    this.nameJapanese = '',
    required this.avatarUrl,
    required this.distanceFromLocation,
    required this.badges,
    required this.countriesVisited,
    required this.mountainsClimbed,
    required this.citiesExplored,
  });
}

// Sample user data
final UserProfile sampleUser = UserProfile(
  name: 'J. Snow',
  nameJapanese: 'あなた',
  avatarUrl:
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
  distanceFromLocation: 17,
  badges: ['Nomad', 'Explorer'],
  countriesVisited: 30,
  mountainsClimbed: 93,
  citiesExplored: 69,
);

class ProfileMenuItem {
  final String title;
  final String subtitle;
  final String iconEmoji;

  ProfileMenuItem({
    required this.title,
    required this.subtitle,
    required this.iconEmoji,
  });
}

final List<ProfileMenuItem> travelProfileItems = [
  ProfileMenuItem(
    title: 'Travel Persona Manager',
    subtitle: 'Foodie, Nomad, Explo...',
    iconEmoji: '🧳',
  ),
  ProfileMenuItem(
    title: 'Saved Places',
    subtitle: '65 Destination Wanderlust',
    iconEmoji: '📍',
  ),
  ProfileMenuItem(
    title: 'Saved Trips',
    subtitle: '8 Upcoming Trips',
    iconEmoji: '✈️',
  ),
];

final List<ProfileMenuItem> preferenceItems = [
  ProfileMenuItem(
    title: 'Notification',
    subtitle: 'Trip P...',
    iconEmoji: '🔔',
  ),
  ProfileMenuItem(
    title: 'Language',
    subtitle: 'Engl...',
    iconEmoji: '🌐',
  ),
];
