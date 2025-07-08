import 'dart:convert';

class LocalDataSource {
  final String _greens = '''[
    {
      "uid": "app",
      "name": "Apple",
      "image": "https\://i.imgur.com/Hoo8viG.jpeg",
      "description": "An apple is a deciduous tree grown for its fruits, known as apples. Apple fruits are one of the most widely cultivated fruits in the world. They are round (pome) in shape and range in color from green to red. The domestic apple tree is believed to have originated from Western Asia and the Mediterranean, having several wild ancestors. China is the largest producer of apples worldwide. Apple farming can be profitable and rewarding for farmers with suitable land, climate, and markets.",
      "type": "fruit",
      "colors": ["red", "yellow", "green"]
    },
    {
      "uid": "ban",
      "name": "Banana",
      "image": "https\://i.imgur.com/9BjPHxG.jpeg",
      "description": "Banana, Musa paradisiaca, is a type of fruit that grows on a large herbaceous plant that is native to Southeast Asia. It is one of the world's most popular and widely grown fruit, with many varieties being cultivated for both commercial and home use. Bananas are long, curved fruits with smooth, yellow, and sometimes slightly green skin. The average length of a banana is about 7 to 9 inches, and it is about 2 to 3 inches in diameter. The skin of the banana is usually yellow when it is ripe, but it can also be green, red, or purple depending on the variety.",
      "type": "fruit",
      "colors": ["yellow", "brown"]
    },
    {
      "uid": "cher",
      "name": "Cherry",
      "image": "https\://i.imgur.com/TFPStLL.jpeg",
      "description": "The wild cherry tree, Prunus avium, is a perennial tree in the family Rosaceae grown for its fruit, the cherry. Cherry trees have alternating simple oval leaves which often have serrated margins and approximately eight pairs of veins, 5–13 cm (2–5 in) long. The flowers are white and appear in clusters of about 3–5. They appear in early spring and are about one inch long. The fruit is dark red, about half an inch to a full inch, matures in early to mid summer. The bark is gray-brown, smooth and glossy and it often peels. Cherry trees can live up to 60 years, growing to a height of over 15 m (50 ft). Cherry may also be referred to as sweet cherry, gean, mazzard or wild cherry and originates from the Caspian-Black Sea region and Asia. Sour cherry, Prunus cerasus, is closely related to Prunus avium but with fruit that is more acidic. The tree has twiggy branches with bright red to near black cherries. The tree reaches a height of 4–10 m (13.1–16.4 ft) and is believed to have originated as a natural hybrid of wild cherry (Prunus avium) and ground cherry (Prunus fruticosa) somewhere in the Caucasus Mountains, Turkey or Eastern Europe where the two species' geographic ranges overlap.",
      "type": "fruit",
      "colors": ["red", "pink"]
    },
    {
      "uid": "egg",
      "name": "Eggplant",
      "image": "https\://i.imgur.com/uVKEqrZ.jpeg",
      "description": "Eggplant, Solanum melongena, is a tropical, herbaceous, perennial plant, closely related to tomato, in the family Solanaceae which is grown for its edible fruit. The plants has a branching stem and simple, long, flat. coarsely lobed leaves which are green in color and are arranged alternately on the branches. The leaves can measure 10 to 20 cm (4–8 in) long and 5 to 10 cm (2–4 in) broad. The plant produces purple flowers which are 3–5 cm (1.2–2.0 in) in diameter. The fruit is a large, fleshy ovoid berry which can reach 40 cm (15.7 in) in length, with glossy smooth skin and numerous small seeds. The color of the fruit is variable and can be white, green, yellow, purple or black. Eggplants can reach up to 1.5 m (4.9 ft) in height and although they are perennial plants, they are most commonly grown as annuals. Eggplant may also be referred to as aubergine or guinea squash and originates from the Indian subcontinent.",
      "type": "vegetable",
      "colors": ["purple", "white", "green"]
    },
    {
      "uid": "zuc",
      "name": "Zucchini",
      "image": "https\://i.imgur.com/D5tuv3K.jpeg",
      "description": "zucchini, Cucurbita pepo, variety of summer squash in the gourd family (Cucurbitaceae), grown for its edible fruits. Zucchinis are common in home gardens and supermarkets, and the young fruits are cooked as a vegetable. The flowers are also edible and are sometimes fried.",
      "type": "vegetable",
      "colors": ["green", "yellow"]
    }
  ]''';

  Future<List<dynamic>> getGreens() {
    return Future.value(jsonDecode(_greens));
  }

  Future<dynamic> getGreen({required String id}) {
    return getGreens().then((greens) =>
        greens.firstWhere((green) => green['uid'] == id, orElse: () => null));
  }
}
