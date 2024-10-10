part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int? id;
  final String? name;
  final String? picturePath;
  final String? description;
  final String? ingredients;
  final double? price;
  final double? rate;
  final List<FoodType>? types;

  Food({
    this.id,
    this.name,
    this.picturePath,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        picturePath,
        description,
        ingredients,
        price,
        rate,
      ];

  static fromJson(data) {}
}

List<Food> mockFoods = [
  Food(
      id: 2,
      picturePath:
          'https://i.pinimg.com/236x/5b/f2/7e/5bf27e721ed7bc858e0a7f0d905632e8.jpg',
      name: 'Sate Sayur Sultan',
      description: 'Sate Sayur Sultan adalah menu sate vegan paling terkenal di Jakarta. Sate ini dibuat dari berbagai macam bahan berkualitas terbaik dan langsung dibuat oleh chef handal. Sate ini sangat sehat dan bergizi.',
      ingredients: 'Terong ungu, wortel, brokoli, kembang kol, jagung muda, tahu sutra, tempe, saus tiram, kecap asin, madu, merica, ketumbar bubuk, minyak wijen, tusuk sate.',
      price: 150000,
      rate: 4.2,
      types: [FoodType.new_food, FoodType.popular],),
  Food(
      id: 1,
      picturePath:
          'https://i.pinimg.com/236x/e4/c8/ac/e4c8ac48c71738d0493b6e824f0094ed.jpg',
      name: 'Nasi Goreng Kambing',
      ingredients: 'Nasi putih, daging kambing, bawang merah, bawang putih, cabai merah, kecap manis, kecap asin, saus tiram, daun bawang, minyak, garam, merica, telur, tomat, acar, dan kerupuk.',
      description: 'Nasi Goreng Kambing spesial dengan bumbu rempah rahasia yang kaya akan cita rasa. Cocok untuk Anda yang menggemari makanan gurih dan pedas.',
      price: 25000,
      rate: 4.5,
      types: [FoodType.recommended, FoodType.popular],),
  Food(
      id: 3,
      picturePath:
          'https://i.pinimg.com/236x/1a/b7/ee/1ab7ee51c29e366c9c47311773c09dde.jpg',
      name: 'Mie Ayam Jamur',
      description: 'Mie Ayam Jamur dengan topping ayam yang empuk dan jamur yang segar, disajikan dengan kuah kaldu yang lezat.',
      ingredients: 'Nasi putih, daging kambing, bawang merah, bawang putih, cabai merah, kecap manis, kecap asin, saus tiram, daun bawang, minyak, garam, merica, telur, tomat, acar, kerupuk.',
      price: 20000,
      rate: 4.7,
      types: [FoodType.new_food, FoodType.popular],),
  Food(
    id: 4,
    picturePath:
        'https://i.pinimg.com/236x/80/a9/1a/80a91a42cea42a2dcda727a48847642c.jpg',
    name: 'Bakso Beranak',
    description:
        'Bakso Beranak dengan ukuran jumbo berisi bakso kecil di dalamnya. Sangat cocok untuk pecinta makanan berkuah.',
    ingredients:
        'Daging sapi giling, tepung tapioka, bawang putih, merica, garam, es batu, telur, daging ayam cincang (untuk isian), telur puyuh, cabai rawit, bawang goreng, daun bawang, kaldu sapi, air, dan minyak goreng.',
    price: 30000,
    rate: 4.3,
      types: [FoodType.new_food, FoodType.popular, FoodType.recommended],
  ),
  Food(
    id: 5,
    picturePath:
        'https://i.pinimg.com/236x/20/80/e0/2080e0aeb6d1d9c91b990892dcbbb455.jpg',
    name: 'Ayam Bakar Taliwang',
    description:
        'Ayam Bakar khas Lombok dengan bumbu pedas dan gurih, disajikan dengan plecing kangkung dan sambal terasi.',
    ingredients:
        'Ayam kampung, cabai merah keriting, cabai rawit, bawang merah, bawang putih, terasi bakar, gula merah, garam, air asam jawa, minyak goreng, daun jeruk, dan jeruk limau.',
    price: 50000,
    rate: 4.8,
    types: [FoodType.new_food],
  ),
  Food(
    id: 6,
    picturePath:
        'https://i.pinimg.com/236x/6f/b7/f9/6fb7f9d36a80ee104e5a417ec2287b15.jpg',
    name: 'Gado-Gado Jakarta',
    description:
        'Gado-Gado dengan sayuran segar, tahu, tempe, dan lontong, disiram saus kacang kental yang gurih.',
    ingredients:
        'Tahu, tempe, lontong, kangkung, bayam, kacang panjang, tauge, mentimun, telur rebus, saus kacang, kerupuk.',
    price: 20000,
    rate: 4.6,
    types: [FoodType.recommended, FoodType.popular],
  ),
  Food(
    id: 7,
    picturePath:
        'https://i.pinimg.com/236x/6e/35/3d/6e353dfdcef71ce2f3dfe363390cb6b4.jpg',
    name: 'Es Cendol Durian',
    description:
        'Minuman es cendol dengan topping buah durian yang manis dan creamy, cocok untuk menghilangkan dahaga.',
    ingredients: 'Cendol, santan, gula merah, durian, es batu.',
    price: 25000,
    rate: 4.4,
    types: [FoodType.new_food, FoodType.recommended, FoodType.popular],
  ),
  Food(
    id: 8,
    picturePath:
        'https://i.pinimg.com/564x/3c/48/cd/3c48cd393274d31a5cdac3d9f6f00334.jpg',
    name: 'Rendang Daging Padang',
    description:
        'Rendang daging sapi khas Padang yang empuk dan berbumbu kuat, dimasak dengan santan kental.',
    ingredients:
        'Daging sapi, santan, serai, daun jeruk, lengkuas, bawang merah, bawang putih, cabai merah, kunyit, ketumbar.',
    price: 70000,
    rate: 4.9,
    types: [FoodType.new_food, FoodType.popular],
  ),
  Food(
    id: 9,
    picturePath:
        'https://i.pinimg.com/736x/f8/3d/7b/f83d7bb619e1a09958b4a97b40a186a6.jpg',
    name: 'Pempek Palembang',
    description:
        'Pempek Palembang dengan kuah cuko yang asam manis pedas, tersedia dalam berbagai varian: kapal selam, lenjer, adaan.',
    ingredients:
        'Ikan tenggiri, tepung sagu, telur, bawang putih, cuka, cabai, gula merah, asam jawa.',
    price: 35000,
    rate: 4.1,
    types: [FoodType.recommended, FoodType.popular],
  ),
  Food(
    id: 10,
    picturePath:
        'https://i.pinimg.com/564x/01/d0/f3/01d0f3c618287c68db8b77ba196af8ca.jpg',
    name: 'Martabak Manis Keju',
    description:
        'Martabak manis dengan isian keju yang melimpah dan lezat, ditambah topping susu kental manis.',
    ingredients:
        'Tepung terigu, telur, gula, susu kental manis, keju, mentega.',
    price: 45000,
    rate: 4.5,
    types: [FoodType.recommended, FoodType.popular],
  ),
  Food(
    id: 11,
    picturePath:
        'https://i.pinimg.com/564x/f3/80/ce/f380ce84bab60653bba44fc2d44cf53f.jpg',
    name: 'Soto Betawi',
    description:
        'Soto Betawi dengan kuah santan yang gurih dan potongan daging sapi serta jeroan.',
    ingredients:
        'Daging sapi, jeroan, santan, kentang, tomat, daun jeruk, bawang merah, bawang putih, jahe, cengkeh.',
    price: 40000,
    rate: 4.3,
    types: [FoodType.new_food, FoodType.popular],
  ),
  Food(
    id: 12,
    picturePath:
        'https://i.pinimg.com/564x/a2/a5/27/a2a5270274776b41d8b15e7a6e72597b.jpg',
    name: 'Bubur Ayam',
    description:
        'Bubur ayam hangat dengan topping ayam suwir, cakwe, dan kacang kedelai goreng.',
    ingredients:
        'Beras, ayam, cakwe, kacang kedelai goreng, kaldu ayam, daun bawang, bawang goreng.',
    price: 15000,
    rate: 4.6,
    types: [FoodType.recommended, FoodType.popular],
  ),
  Food(
    id: 13,
    picturePath:
        'https://i.pinimg.com/564x/4d/96/b6/4d96b69a18fd710fb312c34fd6794fcb.jpg',
    name: 'Sate Padang',
    description:
        'Sate Padang dengan bumbu kuah kental kuning khas, disajikan dengan lontong dan bawang goreng.',
    ingredients:
        'Daging sapi, lidah sapi, tepung beras, bawang merah, bawang putih, serai, kunyit, jahe, ketumbar, lengkuas.',
    price: 30000,
    rate: 4.7,
    types: [FoodType.new_food, FoodType.recommended, FoodType.popular],
  ),
  Food(
    id: 14,
    picturePath:
        'https://i.pinimg.com/564x/a4/c8/05/a4c805d9bbc043b211431d360b8fed49.jpg',
    name: 'Kwetiau Goreng Seafood',
    description:
        'Kwetiau goreng dengan isian seafood segar seperti udang, cumi, dan bakso ikan, dengan bumbu khas.',
    ingredients:
        'Kwetiau, udang, cumi, bakso ikan, bawang putih, kecap manis, kecap asin, telur, daun bawang.',
    price: 45000,
    rate: 4.4,
    types: [FoodType.recommended, FoodType.popular],
  ),
  Food(
    id: 15,
    picturePath:
        'https://i.pinimg.com/564x/9b/23/1b/9b231b26fee0173d338dfc7b446f0b6e.jpg',
    name: 'Gudeg Jogja',
    description:
        'Gudeg khas Yogyakarta dengan nangka muda, telur, ayam, dan krecek, disajikan dengan nasi putih.',
    ingredients:
        'Nangka muda, telur, ayam, krecek, santan, gula jawa, daun salam, lengkuas, bawang merah, bawang putih.',
    price: 30000,
    rate: 4.8,
    types: [FoodType.recommended, FoodType.popular],
  ),
  Food(
    id: 16,
    picturePath:
        'https://i.pinimg.com/564x/a7/5f/14/a75f14b2364b7c56aa318c7437513050.jpg',
    name: 'Sop Buntut',
    description:
        'Sop buntut sapi dengan kuah bening yang gurih dan potongan buntut yang empuk.',
    ingredients:
        'Buntut sapi, wortel, kentang, bawang putih, bawang merah, kayu manis, cengkeh, daun bawang, seledri.',
    price: 65000,
    rate: 4.7,
    types: [FoodType.new_food, FoodType.recommended, FoodType.popular],
  ),
  Food(
    id: 17,
    picturePath:
        'https://i.pinimg.com/564x/87/98/b4/8798b4fc6e6f217e12c1ed43b13239bd.jpg',
    name: 'Ayam Goreng Kremes',
    description:
        'Ayam goreng dengan bumbu kremes yang renyah dan gurih, disajikan dengan sambal dan lalapan.',
    ingredients:
        'Ayam, tepung beras, tepung tapioka, bawang putih, ketumbar, kunyit, garam, merica, sambal, lalapan.',
    price: 35000,
    rate: 4.5,
    types: [FoodType.recommended, FoodType.popular],
  ),
];
