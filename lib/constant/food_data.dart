abstract class FoodData {
  static List<String> selectedItems = [];

  static List<String> foodItems = [
    'Eggs',
    'Milk',
    'Mustard',
    'Peanuts',
    'Crustaceans and molluscs',
    'Fish',
    'Sesame seeds',
    'Soy',
    'Sulphites',
    'Tree Nuts',
    'Wheat and triticale',
  ];

  static List<Map<String, dynamic>> foodList = [
    {
      "id": 2,
      "title": "Anchovies With Breadcrumbs & Scallions",
      "image": "https://spoonacular.com/recipeImages/anchovies_with_breadcrumbs_scallions-2.jpg",
      "imageType": "jpg",
      "calories": 38,
      "protein": "4g",
      "fat": "2g",
      "carbs": "0g"
    },
    {
      "id": 111567,
      "title": "Fish Tagine With Tomatoes, Capers, and Cinnamon",
      "image": "https://spoonacular.com/recipeImages/fish-tagine-with-tomatoes-capers-and-cinnamon-2-111567.jpg",
      "imageType": "jpg",
      "calories": 319,
      "protein": "36g",
      "fat": "17g",
      "carbs": "8g"
    },
    {
      "id": 196932,
      "title": "Seared Chicken with Avocado",
      "image": "https://spoonacular.com/recipeImages/seared-chicken-with-avocado-196932.jpg",
      "imageType": "jpg",
      "calories": 226,
      "protein": "25g",
      "fat": "11g",
      "carbs": "7g"
    },
    {
      "id": 247018,
      "title": "Lamb Shank Stew with Root Vegetables",
      "image": "https://spoonacular.com/recipeImages/Lamb-Shank-Stew-with-Root-Vegetables-247018.jpg",
      "imageType": "jpg",
      "calories": 829,
      "protein": "81g",
      "fat": "28g",
      "carbs": "51g"
    },
    {
      "id": 358838,
      "title": "Southwestern Chicken Salad",
      "image": "https://spoonacular.com/recipeImages/Southwestern-Chicken-Salad-358838.jpg",
      "imageType": "jpg",
      "calories": 204,
      "protein": "15g",
      "fat": "9g",
      "carbs": "18g"
    },
    {"id": 362913, "title": "Chili I", "image": "https://spoonacular.com/recipeImages/Chili-I-362913.gif", "imageType": "gif", "calories": 451, "protein": "39g", "fat": "16g", "carbs": "39g"},
    {
      "id": 457747,
      "title": "Cream Cake with Bing Cherry Sauce",
      "image": "https://spoonacular.com/recipeImages/Cream-Cake-with-Bing-Cherry-Sauce-457747.png",
      "imageType": "png",
      "calories": 582,
      "protein": "7g",
      "fat": "31g",
      "carbs": "71g"
    },
    {
      "id": 551315,
      "title": "More Power Gingerbread Smoothie",
      "image": "https://spoonacular.com/recipeImages/More-Power-Gingerbread-Smoothie-551315.jpg",
      "imageType": "jpg",
      "calories": 645,
      "protein": "37g",
      "fat": "14g",
      "carbs": "99g"
    },
    {
      "id": 573776,
      "title": "Slow Cooker Red Lentil Dal",
      "image": "https://spoonacular.com/recipeImages/Slow-Cooker-Red-Lentil-Dal-573776.jpg",
      "imageType": "jpg",
      "calories": 363,
      "protein": "19g",
      "fat": "2g",
      "carbs": "69g"
    },
    {
      "id": 707586,
      "title": "Browned Butter and Lemon Brussels Sprouts",
      "image": "https://spoonacular.com/recipeImages/browned-butter-and-lemon-brussels-sprouts-707586.jpg",
      "imageType": "jpg",
      "calories": 169,
      "protein": "8g",
      "fat": "8g",
      "carbs": "22g"
    }
  ];
}
