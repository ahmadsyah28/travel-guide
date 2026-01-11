class TravelPlace {
  final String id;
  final String name;
  final String nameJapanese;
  final String location;
  final String description;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final List<String> tags;

  TravelPlace({
    required this.id,
    required this.name,
    this.nameJapanese = '',
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    this.tags = const [],
  });
}

// Sample data for travel places
final List<TravelPlace> travelPlaces = [
  TravelPlace(
    id: '1',
    name: 'Mount Daisen',
    nameJapanese: 'いせ',
    location: 'Tottori, Japan',
    description:
        'Absolutely breathtaking views! The hike was challenging but rewarding. Highly recommend visiting during the autumn for the vibrant foliage...',
    imageUrl:
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800',
    rating: 4.8,
    reviewCount: 1200,
    tags: ['Mountain', 'Hiking', 'Nature'],
  ),
  TravelPlace(
    id: '2',
    name: 'Mount Fuji',
    nameJapanese: '富士山',
    location: 'Shizuoka, Japan',
    description:
        'The iconic symbol of Japan. A must-visit destination for any traveler. The sunrise from the summit is absolutely magical...',
    imageUrl:
        'https://images.unsplash.com/photo-1490806843957-31f4c9a91c65?w=800',
    rating: 4.9,
    reviewCount: 5400,
    tags: ['Mountain', 'Iconic', 'Sunrise'],
  ),
  TravelPlace(
    id: '3',
    name: 'Kyoto Temple',
    nameJapanese: '京都',
    location: 'Kyoto, Japan',
    description:
        'Beautiful traditional temples with stunning gardens. Perfect for experiencing Japanese culture and history...',
    imageUrl:
        'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800',
    rating: 4.7,
    reviewCount: 3200,
    tags: ['Temple', 'Culture', 'History'],
  ),
  TravelPlace(
    id: '4',
    name: 'Tokyo Tower',
    nameJapanese: '東京タワー',
    location: 'Tokyo, Japan',
    description:
        'Amazing city views from the observation deck. A perfect spot to see Tokyo\'s skyline at night...',
    imageUrl:
        'https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?w=800',
    rating: 4.5,
    reviewCount: 4100,
    tags: ['City', 'Tower', 'Night View'],
  ),
  TravelPlace(
    id: '5',
    name: 'Osaka Castle',
    nameJapanese: '大阪城',
    location: 'Osaka, Japan',
    description:
        'Historic castle with beautiful surroundings. The cherry blossom season makes this place truly magical...',
    imageUrl:
        'https://images.unsplash.com/photo-1590253230532-a67f6bc61c9e?w=800',
    rating: 4.6,
    reviewCount: 2800,
    tags: ['Castle', 'History', 'Cherry Blossom'],
  ),
];

class TravelStyle {
  final String name;
  final String emoji;
  final bool isSelected;

  TravelStyle({
    required this.name,
    required this.emoji,
    this.isSelected = false,
  });

  TravelStyle copyWith({bool? isSelected}) {
    return TravelStyle(
      name: name,
      emoji: emoji,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

final List<TravelStyle> travelStyles = [
  TravelStyle(name: 'Adventure', emoji: '🏕️', isSelected: true),
  TravelStyle(name: 'Solo Travel', emoji: '🎒'),
  TravelStyle(name: 'Road Trip', emoji: '🚗'),
  TravelStyle(name: 'Family Tour', emoji: '👨‍👩‍👧‍👦'),
];
