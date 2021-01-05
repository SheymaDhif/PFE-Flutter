class Product {
  final int id;
  final String title, description, image,level;

  Product({this.id, this.level, this.title, this.description, this.image});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,
    level: "difficult",
    title: "QUIZ",
    image: "assets/images/mm3.png",
    description:
    "this task is considered as a difficult task because it will stimulate your working memory exactly your long term memory",
  ),
  Product(
    id: 2,
    level: "Medium",
    title: "Memory Game",
    image: "assets/images/q4.png",
    description:
    "With this task we will stimulate your visual memory and short term memory",
  ),
  Product(
    id: 3,
    level: "Easy",
    title: "Just Talk!",
    image: "assets/images/chat5.jpg",
    description:
    "It is Chatbot with whom you can interact , this task to evaluate your language skills",
  ),
];
