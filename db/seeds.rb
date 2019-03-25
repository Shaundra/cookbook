# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
# binding.pry
user_one = User.create(username: "User1")

recipe_one = Recipe.create({
  user: user_one,
  title: "Roasted Shrimp & Asparagus Scampi",
  source_url: "https://food52.com/recipes/80478-roasted-shrimp-asparagus-scampi",
  image_url: "https://images.food52.com/LBwo6tim9hgCfWA0tVrUBr8Asdk=/753x502/e814502e-8a1c-4ef4-b635-55c28e323d1b--2019-0206_sponsored_sofia_shrimp-scampi_3x2_rocky-luten_021.jpg",
  cooking_time: "25 minutes",
  ingredient_blob: "1 1/2 pounds shrimp
    1 pound asparagus, tough ends discarded, cut into 1-inch pieces
    3 tablespoons extra-virgin olive oil
    4 garlic cloves, minced
    1/2 teaspoon red pepper flakes (optional)
    1 teaspoon kosher salt
    1/4 cup dry white wine or rosé (or water)
    2 tablespoons unsalted butter, melted
    The juice and zest of 1 lemon, plus extra lemon wedges for serving
    1 large handful Italian parsley leaves, finely chopped
    1 pound spaghetti, cooked until al dente",
  directions: "
    Preheat your broiler to high and position your oven rack so that it’s about 6 inches from the broiler.
    Place the shrimp and asparagus on a sheet pan and drizzle with the olive oil. Sprinkle with the minced garlic, red pepper flakes (if using), and salt and use your hands to mix everything together. Spread the shrimp and asparagus in an even layer and pour the wine over them.
    Broil the mixture, stirring once while it cooks, until the shrimp are pink and firm to the touch and the asparagus is tender, about 5 minutes all together.
    Drizzle the butter and the lemon juice over the shrimp and asparagus, and sprinkle with the lemon zest and parsley. Use two spoons to toss everything together.
    Transfer the scampi and all of the sauce to a large serving bowl along with the spaghetti. Stir well to coat the spaghetti with the sauce. Serve immediately while warm along with lemon wedges for squeezing over."
    })

Comment.create(recipe: recipe_one, content: "So easy to make. But takes a long time.", rating: 3)
Comment.create(recipe: recipe_one, content: "I actually hate this.", rating: 0)

recipe_two = Recipe.create({
  user: user_one,
  title: "Creamy, Cheesy Artichoke & Chicken Pasta Bake",
  source_url: "https://food52.com/recipes/80682-creamy-cheesy-artichoke-chicken-pasta-bake",
  image_url: "https://images.food52.com/m4hNhS9RDJPlk-Dwz8ZlUqUKVaA=/753x502/5bfde799-47b3-4dbd-ab2c-d5152082695d--2019-0305_creamy-cheesy-artichoke-pasta-bake_3x2_rocky-luten_019.jpg",
  ingredient_blob: " 1 pound penne rigate
    4 thick slices ciabatta or focaccia, torn into 1/2-inch cubes
    5 tablespoons unsalted butter, divided (plus more for greasing the baking dish)
    1/2 pound grilled chicken breast, torn into large chunks
    3 tablespoons flour
    3 cups whole milk
    2 cups cream
    3 1/2 cups shredded, low-moisture mozzarella, divided
    2 tablespoons cream cheese
    1 1/2 teaspoons garlic powder
    1 1/2 teaspoons onion powder
    1 teaspoon red pepper flakes
    Kosher salt and freshly ground black pepper, to taste
    1 cup loosely packed fresh basil, torn and divided
    2 (6 1/2-ounce) jars marinated and quarter-cut artichoke hearts, drained (for more tang, reserve some of the liquid)
    2 cups loosely packed fresh baby spinach",
  directions: "
    Preheat the oven to 375°F.
    Bring a pot of water to a boil and salt generously. Cook the pasta al dente, according to the package instructions. Drain the pasta and set aside, reserving 1 cup of the pasta water.
    Melt 2 tablespoons butter in a saucepan or microwave (for the microwave, use 30-second intervals). In a bowl, toss the ciabatta or focaccia chunks with the melted butter and set aside.
    In a large, heavy-bottomed pot, heat 3 tablespoons butter over medium heat. Once the butter is melted and bubbling, add the flour and whisk together to form a thick, smooth roux (if too thick, add more butter; if too thin, add more flour). Keep whisking over low heat until the roux takes on a light brown color and gives off a slightly nutty smell (you shouldn’t be able to smell the raw flour), about 2 to 5 minutes.
    Then whisk in the milk and cream until it’s fully incorporated with the roux. Bring to a simmer over medium heat, whisking occasionally, until the mixture bubbles and thickens. Turn down the heat to low and whisk in 2 1/2 cups mozzarella and the cream cheese until fully melted and incorporated. Whisk in the garlic powder, onion powder, red pepper flakes, plus salt and pepper, to taste.
    Stir in 2/3 cup basil, artichokes (for a tangier sauce, add some of the artichoke liquid), grilled chicken, and cooked pasta. If the sauce is too thick, add the reserved pasta water as needed to loosen it up. Add salt and pepper, to taste. Turn off the heat on the stovetop. Stir in the spinach.
    Butter a large casserole dish (I used a 10 x 10-inch, but you could use a slightly larger one and be just fine) and add the pasta mixture to the dish. Top with the buttered bread chunks. Sprinkle 1 cup mozzarella and 1/3 cup basil over top. Bake the dish until the cheese is browned and bubbling, about 30 minutes.
    Serve hot out of the oven and don’t forget to snap a pic of that cheese pull."
    })

Comment.create(recipe: recipe_two, content: "Make this for Pierre.")
tag_one = Tag.create(name: "Cheesy")
RecipeTag.create(tag:tag_one, recipe:recipe_two)

recipe_three = Recipe.create({
  user: user_one,
  title: "Epic Cobb Salad for One",
  source_url: "https://food52.com/recipes/80707-epic-cobb-salad-for-one",
  image_url: "https://images.food52.com/03GkFdTlRWsXwh3uOi31Uwfzclg=/filters:format(webp)/f573df36-ce12-4b3b-b4e9-5831d0541bd9--2019-0301_cobb-salad-for-one_3x2_ty-mecham_001.jpeg",
  cooking_time: "40 minutes",
  ingredient_blob: "3 to 4	slices bacon, cut in half
    1	bone-in, skin-on chicken thigh
    Kosher salt and freshly ground black pepper, to taste
    1/2	head radicchio, cut into quarters so you're left with triangles (or however the heck you want to do it)
    1	tablespoon malt vinegar
    2	tablespoons extra-virgin olive oil
    1	ounce blue cheese, chunked, at room temperature
    1	handful cherry or Campari tomatoes, cut in half
    1/2	avocado, thinly sliced
    1	large organic egg, boiled for 7 to 8 minutes, peeled, then quartered
    1	tablespoon chives, finely chopped",
  directions: "Preheat oven to 400°F. Starting from a cold, oven-safe pan over medium heat, cook the bacon, 8 to 10 minutes, or until crispy on both sides. Remove and set aside. Season the chicken thigh with salt and pepper on both sides, then sear, skin-side down, in the bacon fat, 2 to 3 minutes. Turn chicken over, transfer pan to the oven, and roast for 15 minutes, or until cooked through. Set aside to cool slightly, then carve into bite-size pieces. Lay the radicchio in one even layer on the largest plate you’ve got. Sprinkle over the malt vinegar, olive oil, and salt and pepper. (Sometimes I do a pinch of sugar to offset the bitterness.) Assemble the salad: In six color-blocked compartments over the radicchio, arrange the bacon, chicken, blue cheese, tomatoes, avocado, and egg so the plate is bulging with FOOD. Season the tomatoes, avocado, and egg with salt and pepper, then garnish the entire plate with chives."
  })

  Comment.create(recipe: recipe_three, content: "Great lunch salad")
  tag_two = Tag.create(name: "Salads")
  RecipeTag.create(tag:tag_two, recipe:recipe_three)
