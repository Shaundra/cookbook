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

  recipe_four = Recipe.create({
      user: user_one,
      title: "Chocolate Birthday Sheet Cake With Strawberry Marshmallow Frosting",
      source_url: "https://food52.com/recipes/80430-chocolate-birthday-sheet-cake-with-strawberry-marshmallow-frosting",
      image_url: "https://images.food52.com/gCuFkcyuvZNSJCcIO5NDuyfeBeI=/filters:format(webp)/fe9862f2-7a71-47cb-be30-2f4334d6e40c--3x2cake_option4.png",
      cooking_time: "1 hour 20 minutes",
      ingredient_blob: "For the cake

  2	cups cake flour, sifted
  3/4	cup Dutch Process Cocoa Powder
  1	cup packed light brown sugar
  1	cup granulated sugar
  1 3/4	teaspoons baking powder
  1	teaspoon baking soda
  1	teaspoon table salt
  1	egg, room temperature
  2	egg yolks, room temperature, save the whites for the frosting
  1	tablespoon pure vanilla extract
  1/2	cup vegetable oil
  1	cup sour cream, room temperature
  1	cup boiling water
  1	tablespoon espresso powder
  For the frosting

  1	cup sliced strawberries, plus more for decorating
  2	egg whites
  1/2	cup plus 2 tablespoons, granulated sugar
  1/4	teaspoon cream of tartar
  1/4	cup light corn syrup
  1/8	teaspoon table salt
  1 1/2	teaspoons lemon juice, or more to taste
  ",
      directions: "For the cake

  Preheat the oven to 350°F. Grease a 13-by-9-by-2-in pan with nonstick cooking spray or softened butter and line with parchment paper. Add the flour, cocoa powder, brown sugar, granulated sugar, baking powder, baking soda, and salt to the bowl of a stand mixer fitted with the paddle attachment; mix on low speed until well combined. In a small bowl, or in a large 4-cup liquid measuring cup (my preference), add the egg, egg yolks, vanilla, oil, and sour cream and whisk until combined. With the mixer on medium-low speed, slowly pour the wet ingredients into the dry ingredients. Beat until incorporated, scraping down the bowl with a rubber spatula as needed. In the same small bowl/measuring cup, no need to clean it, combine the boiling water and espresso powder and add to the batter in the mixer bowl. Mix again on medium speed for 30 seconds, until smooth, scraping the bowl with a rubber spatula as needed. The batter will be quite thin Pour the batter into the prepared pan and bake for 28 to 32 minutes, rotating at the halfway point. The cake is ready when a toothpick inserted in the middle comes out with a moist crumb or two. Let cool completely in the pan. Or let cool enough so you can comfortably handle it, and invert the cake on to a serving plate to continue cooling. If you would rather serve slices directly from the pan, let cool to room temp before frosting.
  For the frosting

  In a food processor fitted with the metal blade, or in a blender, process the berries until pureed. Place a sieve over a small bowl, pour the puree into the sieve, and using a rubber spatula, press the puree through the sieve to remove the seeds. Set aside. Add the egg whites, sugar, corn syrup, cream of tartar, and salt in the now-cleaned bowl of the stand mixer and nestle it in a saucepan of simmering water over medium-high heat. Donot allow the bottom of the bowl to touch the water. Whisk until the mixture is just warm to the touch. Remove the bowl from the heat, add the puree and transfer it to the stand mixer fitted with the whisk attachment. Mix on high speed until stiff and glossy, about 7 minutes. Add the lemon juice and whisk a final time to combine. Once the cake is cool, generously frost it and sprinkle the top with pink sanding sugar. The frosted cake is best served within a few hours with a few sliced strawberries on each plate - or, a scoop of strawberry ice cream - I mean this is a birthday cake, after all."
      })

      recipe_five = Recipe.create({
        user: user_one,
        title: "Risotto with Lemon",
        source_url: "https://food52.com/recipes/80739-anna-del-conte-s-risotto-with-lemon",
        image_url: "https://images.food52.com/rmynDiMYAcwdkjjMmDvBvK1J-cQ=/filters:format(webp)/da851285-8c55-4adb-896d-62b17b021fc2--2016-0329_how-to-make-risotto-like-a-chef_alpha-smoot_445.jpg",
        cooking_time: "30 minutes",
        ingredient_blob: "4	tablespoons unsalted butter, divided
  1	tablespoon extra-virgin olive oil
  2	shallots, finely chopped
  1	rib celery, finely chopped
  1 1/3	cups Arborio rice
  1	quart chicken or vegetable stock, heated (either over low heat in a separate pot or microwaved)
  1	lemon, zested and juiced, to taste
  1	small sprig fresh rosemary, finely chopped
  1	egg yolk
  1/4	cup freshly grated Parmesan, plus more to taste
  1/4	cup heavy cream
  Kosher salt and freshly ground black pepper, to taste",
        directions: "Melt 2 tablespoons of the butter and olive oil in a high-sided saucepan. Cook the shallots and celery, about 5 to 7 minutes. Stir in the rice and cook for another minute or so. Slowly ladle in the heated stock (one or two ladlefuls at a time), stirring until fully absorbed by the rice between each addition. Keep stirring until the rice is perfectly al dente (to the tooth), about 18 to 20 minutes. Stir in the lemon zest and rosemary. In a small bowl, whisk together the egg yolk, juice of half the lemon (plus more to taste), Parmesan, cream, and salt and pepper. Stir this mixture into the finished risotto, along with the remaining 2 tablespoons butter. Cover the pan and let sit for 2 minutes or so, until finished cooking. Vigorously stir, plate, and garnish with more Parmesan."
        })

        recipe_six = Recipe.create({
          user: user_one,
          title: "Gong Bao Ji Ding (Gong Bao Chicken)",
          source_url: "https://food52.com/recipes/9331-gong-bao-ji-ding-gong-bao-chicken",
          image_url: "https://images.food52.com/qf5r9BTB5o56H3V0De1U45OpnA8=/filters:format(webp)/e4a2c52d-43e3-4a3b-a021-a5fcb7f0eff7--2018-0508_gong-bao-ji-ding-gong-bao-chicken_3x2_james-ransom-082.jpg",
          cooking_time: "25 minutes",
          ingredient_blob: "2	chicken thighs, deboned and cut into 1/2-inch cubes (if yours are tiny, you may want to throw in 1-2 more)
  1/2	teaspoon beaten egg
  2	teaspoons cornstarch
  1	pinch salt
  1	teaspoon Chinese cooking wine
  2	teaspoons dark soy sauce
  2	teaspoons brown sugar
  1	tablespoon Chinese dark vinegar
  1	tablespoon cornstarch
  6	tablespoons water or stock
  1	handful of peanuts (generous amount)
  2	green onions, chopped into 1-inch lengths
  4	garlic cloves, skin removed, smashed and chopped
  6	slices of ginger
  8	red dried chiles, chopped
  4	teaspoons Szechuan peppercorns
  1/2	cup vegetable oil",
          directions: "Mix together the marinade with the meat; set aside while preparing the rest. *You can store this in the fridge for the day.) Mix the liquid ingredients, brown sugar and corn starch and set aside to use as the sauce for stir-frying. Heat up wok with vegetable oil until shimmering and hot, about 120° C. Dip half of the meat into the oil and move around until half-cooked, around 2 minutes; remove with slotted spoon and drain from oil. Repeat for the other half. Drain off all but 2 tbsp of oil in heated wok, throw in chiles, peppercorns, garlic, ginger and spring onion; stir-fry until fragrant, about 2 minutes; add peanuts and stir-fry for another 1-2 min. Add chicken cubes, stir-fry for about 3 minutes, or until chicken is cooked. Pour on reserved sauce and simmer until the dish thickens, about 3 minutes. Garnish with ground Sichuan peppercorn; serve with rice."
          })

      recipe_seven = Recipe.create({
        user: user_one,
        title: "Baked Cod with Miso",
        source_url: "https://food52.com/recipes/16385-baked-cod-with-miso",
        image_url: "https://images.food52.com/OLq6JaGvrcs2pVjfBV4Ly6oDZDo=/filters:format(webp)/0cfba11c-2258-4fed-a0e4-c748467939c3--2014-0318_jenny_cod-with-miso-007.jpg",
        cooking_time: "30 minutes",
        ingredient_blob: "1/2	cup miso
  1	cup mirin
  1	pound cod fillet",
        directions: "Preheat oven to 350° F. Mix miso and mirin in saucepan and heat over low flame to dissolve miso. Let marinade cool, then place in an oven-proof dish large enough to fit the fish, then place the fillets in marinade, fully covered if possible, and let it sit for 30 minutes. Bake for 10 minutes."
        })

        recipe_eight = Recipe.create({
          user: user_one,
          title: "Quinoa Salad with Hazelnuts, Apple, and Dried Cranberries",
          source_url: "https://food52.com/recipes/18012-quinoa-salad-with-hazelnuts-apple-and-dried-cranberries",
          image_url: "https://images.food52.com/sehfsasl7uY3NqRy7ArHPqfDSfM=/filters:format(webp)/d2ff0bbb-784d-4d97-b471-f9c595e524f4--2013-1015-wildcard-quinoa-salad-with-hazelnuts-apple-and-dried-cranberries-005.jpg",
          cooking_time: "1 hour 25 minutes",
          ingredient_blob: "1	cup quinoa, rinsed well
  1 1/2	cups water, for quinoa
  1	tablespoon of olive oil
  1	small onion, finely diced
  2	stalks of celery, finely diced
  1	cup hazelnuts, toasted, de-skinned and chopped
  1	bunch (about 5 to 6) green onions, chopped (green parts only)
  1/2	cup dried cranberries, chopped * see note
  1	bunch flat leaf parsley, thoroughly rinsed and chopped
  1	gala apple (really, any kind of apple will do)
  1	large lemon, juiced
  Generous drizzle of any kind of oil (I like hazelnut)
  Fine sea salt and freshly ground black pepper to taste",
          directions: "Preheat your oven to 325° F and toast your hazelnuts for about 7 to 10 minutes. Let them cool completely. You should begin to hear their skins crackle while cooling; this is a good sign! Meanwhile, cook your quinoa. Importantly, rinse it well! Boil the water with a pinch of salt, and add your rinsed quinoa. Turn your stove down to medium-low and let it cook for roughly 15 minutes, or until the water is absorbed. Fluff quinoa with a fork, and let it cool in the fridge. Going back to the cooled, toasted hazelnuts; remove the skins. Chop the hazelnuts up, leaving them in large pieces. Preheat a skillet with 1 tablespoon of oil and soften your finely chopped onion and celery. Season with a pinch of salt and pepper to taste. Try not to brown them, 5 to 7 minutes on medium—low heat should do the trick. Set aside in a large salad bowl. Rinse your parsley well and chop it finely followed by your dried cranberries and green onions. Add all this to the onion and celery mixture. Core and dice the apple, put your apple chunks in the bowl with the other ingredients. Squeeze the entire lemon over the apple to season the salad and prevent the apple from turning brown. Add your quinoa and hazelnuts to the mixture, drizzle with the oil. Add salt and pepper to taste. Season with more lemon juice if you like. Mix well and cool completely. Allow the flavors to meld for 20 minutes before serving!"
          })

          recipe_nine = Recipe.create({
            user: user_one,
            title: "One-Pot Kale and Quinoa Pilaf",
            source_url: "https://food52.com/recipes/2434-one-pot-kale-and-quinoa-pilaf",
            image_url: "http://onehungrymama.com/wp-content/uploads/2011/04/kale-quinoa-pilaf.jpg",
            cooking_time: "45 minutes",
            ingredient_blob: "2	cups salted water
  1	cup quinoa
  1	bunch lacinato kale, washed and chopped into 1\" lengths
  1	meyer lemon, zested and juiced
  2	scallions, minced
  1	tablespoon toasted walnut oil
  3	tablespoons toasted pine nuts
  1/4	cup crumbled goat cheese
  Salt and pepper",
            directions: "Bring the water to a boil in a covered pot. Add the quinoa, cover, and lower the heat until it is just enough to maintain a simmer. Let simmer for 10 minutes, then top with the kale and re-cover. Simmer another 5 minutes, then turn off the heat and allow to steam for 5 more minutes. While the quinoa is cooking, take a large serving bowl and combine half of the lemon juice (reserving the other half), all of the lemon zest, scallions, walnut oil (you can substitute olive oil if you desire), pine nuts, and goat cheese. Check the quinoa and kale when the cooking time has completed—the water should have absorbed, and the quinoa will be tender but firm, and the kale tender and bright green. If the quinoa still has a hard white center, you can steam a bit longer (adding more water if needed). When the quinoa and kale are done, fluff the pilaf, and tip it into the waiting bowl with the remaining ingredients. As the hot quinoa hits the scallions and lemon it should smell lovely. Toss to combine, seasoning with salt and pepper, and the remaining lemon juice if needed."
            })

            recipe_ten = Recipe.create({
              user: user_one,
              title: "Salt and Pepper Kugel",
              source_url: "https://food52.com/recipes/2725-salt-and-pepper-kugel",
              image_url: "https://images.food52.com/C2pS0zkdWqOGyFdXX11A7j-7eHw=/filters:format(webp)/cdf1d941-06bb-47f9-8120-9691ccf60d44--IMG_7354.jpg",
              cooking_time: "35 minutes",
              ingredient_blob: "0.5	cups schmaltz (details below on how to render your own)
  1	pound fine noodles
  a few (or more)	chicken livers (raw is preferable, though not necessary)
  1	onion
  6	eggs, separated
  Salt
  Pepper",
              directions: "Boil, drain, and cool a pound of fine noodles. Put the noodles in a 9\" x 13\" baking dish. Stir in six egg yolks and salt & pepper to taste—be generous! Stir a half-cup of schmaltz into the noodle mixture. (To make schmaltz, take a pound of chicken fat, cut into small pieces, and render with an onion in a small frying pan. You're done when the fat is golden-brown and no white fat is left. Pour through a fine mesh sieve to separate the liquid from the solids. Cool before adding to the noodles.) Chop the chicken livers into quarters and sautee with a diced onion. When cool, chop into smaller pieces and mix into the noodles. Fold in six egg whites, beaten. Bake for an hour at 350 degrees. The noodles at the top should be crispy, and the edges of the kugel should be nice and brown. (Don't worry about over baking -- in my family we prefer the edges to be burnt.)"
              })

              recipe_eleven = Recipe.create({
                user: user_one,
                title: "Maple Braised Rabbit And Carrots",
                source_url: "https://food52.com/recipes/16750-maple-braised-rabbit-and-carrots",
                image_url: "https://images.food52.com/op7VDFHwdJh671aRBFSUV1oiF_M=/filters:format(webp)/61e02c5e-c24f-4a9a-9590-2e7298297f3a--2014-1014_maple-braised-rabbit-and-carrots-010.jpg",
                cooking_time: "1 hour 30 minutes",
                ingredient_blob: "1	whole rabbit cut into 8 pieces
  1	tablespoon whole white peppercorns
  1	tablespoon whole black peppercorns
  1	cinnamon stick
  3	cups water plus 3 cups ice
  1/3	cup kosher salt, plus 2 teaspoons more for the flour
  1/3	cup sugar
  3	cups ice
  1	cup flour
  1	teaspoon ground pepper
  3	tablespoons butter
  5	cloves garlic, chopped
  2	large shallots, peeled and sliced
  1	cup dry white wine
  1	cup chicken stock
  2	cups peeled carrot in 1/2-inch slices
  1/4	cup grade B maple syrup
  8	fresh sage leaves",
                directions: "Is your rabbit cut up for you? If not, cut off the hoppers and the front legs (I do this with kitchen shears). Then remove the spine and portion the saddle into 4 pieces. There is a side flap that you can either leave loose (I do, I am lazy) or use to create a roll that you can secure with a toothpick. Make the brine: Toast the peppercorns and cinnamon stick in a large saucepan for a few minutes until they are fragrant. Pour in the water, then add the salt and sugar. Bring it to a boil to dissolve the salt and sugar, then turn off the heat. Add the ice. Put the rabbit pieces in a large container and pour the cool brine over top. Refrigerate for several hours (this is a good morning task -- do the rest at dinner time) Heat the oven to 325° F. Get out your biggest oven-ready skillet (alternatively, you can brown in a skillet and then move the rabbit to a baking dish). Mix the flour with the 2 remaining teaspoons of salt and the ground pepper in a shallow dish. Remove the rabbit from the brine and try to get most of the peppercorns off. Pat it dry, then dredge each piece in flour. Melt the butter over medium-high heat and then place the rabbit pieces in the pan. Don't overcrowd them -- you will likely need to do this in batches. Brown each piece on both sides until golden brown, then remove from the pan. When all of the rabbit is browned, add the garlic and shallots to the pan and brown them for just a couple of minutes. Add the wine, then stock, and scrape all of the good stuff off the bottom of the pan. Allow this to simmer for 4 to 5 minutes. Now add the rabbit back in with the liquids. Toss the carrots and maple syrup together, then position them amongst the rabbit pieces. Add the sage leaves, hit it with a bit more pepper, then cover the pan with foil and bake for 30 minutes. After 30 minutes, remove the foil and bake for 30 more. Finish the rabbit by turning the oven to 375° F and cooking for 10 more minutes. Then remove it from the oven and allow it to rest while you take eleventy billion pictures. Remove the sage leaves before eating. That's all! Hippity, hoppity, dinner is ready!"
                })

                recipe_twelve = Recipe.create({
                  user: user_one,
                  title: "Salmon Moqueca",
                  source_url: "https://food52.com/recipes/4574-salmon-moqueca",
                  image_url: "https://images.food52.com/ENkEBnm7phXyYTTHIPgV7UAPhcs=/filters:format(webp)/bbcf91cf-4c7f-42aa-959e-e869859219b0--2016-0719_salmon-moqueca_james-ransom-396.jpg",
                  cooking_time: "45 minutes",
                  ingredient_blob: "Fish and Marinade

  1 1/2	pounds wild salmon fillets
  1	28-ounce can of peeled whole tomatoes, undrained
  1	onion, peeled and roughly chopped
  1	cup cilantro, chopped
  2	garlic cloves, cut in half
  1	Serrano chile pepper, stemmed and cut in half (use the seeds, too, if you want your stew to be pretty spicy)
  1/4	cup lime juice
  1	tablespoon olive oil
  1	teaspoon sea salt
  For the Stew

  2	tablespoons olive oil
  1	large sweet potato, peeled and diced
  1	zucchini, chopped
  1	green pepper, chopped
  1	red pepper, chopped
  1/2	cup water (or fish stock)
  3/4	cup organic whole coconut milk
  1/2	cup minced green onion (bottom parts only)- for garnish
  1/2	cup cilantro, chopped- for garnish",
                  directions: "Directions

  Fish and Marinade

  Place fish in a shallow non-reactive (non-metal) bowl. Combine the tomatoes, onion, cilantro, garlic, chile pepper, lime juice, oil and salt in a food processor fitted with the metal blade (or a blender). Process until smooth and pour over fish. Allow to marinate for 30 minutes to 1 hour.
  For the Stew

  Heat olive oil in a large skillet over medium heat. Add diced sweet potato and cook for 10 to 15 minutes, adding a little water if needed so it doesn’t burn, until softened. Add zucchini, green and red pepper and continue to cook until tender, about 5 to 7 minutes, again adding water to the pan, if needed. Add water or fish stock and stir in coconut milk. Bring to a boil, reduce heat, and simmer 2 to 3 minutes. Add fish and marinade and simmer for 10 to 15 minutes, or until fish flakes easily with a fork. Just before serving, stir in green onion and cilantro. Serve alone or over rice."
                  })

                  recipe_thirteen = Recipe.create({
                    user: user_one,
                    title: "Smoked Salmon on Mustard-Chive and Dill Butter Toasts",
                    source_url: "https://food52.com/recipes/12841-smoked-salmon-on-mustard-chive-and-dill-butter-toasts",
                    image_url: "https://images.food52.com/k9Z6z_8Q0-0tMNjjHfC1lVzPXpU=/filters:format(webp)/570dca7e-b098-4f94-bb40-13d88b974b3d--food52_04-24-13-5236.jpg",
                    cooking_time: "30 minutes",
                    ingredient_blob: "	10 ounces of the best quality smoked salmon in medium-thin slices (Norwegian or Wild Alaskan)
  2 sticks unsalted butter, room temperature
  1 tablespoon lemon zest
  3 1/2 tablespoons fresh lemon juice
  1/2 cup finely chopped chives or green onions
  1 tablespoon fresh dill, finely chopped
  1 1/2 tablespoons Dijon mustard
  1/2 teaspoon salt
  1/2 teaspoon freshly ground black pepper
  1 thin, long French baguette, cut into 1/4-inch slices",
                    directions: "Preheat oven to 375 degrees F. Place bread slices on baking sheet. Bake for 8 to 10 minutes, until golden and crispy. Let cool. Mix butter, lemon juice and zest, chives, mustard, dill, salt and pepper in a bowl until well blended. Cover and refrigerate. Bring to room temperature before using. Spread a thick layer of the mustard- chive butter and place a slice of smoked salmon on top of each toast. Place on a platter or serving tray and serve."
                    })

                    recipe_fourteen = Recipe.create({
                      user: user_one,
                      title: "Mom's 'Instant Party' Chile con Queso",
                      source_url: "https://food52.com/recipes/80727-mom-s-instant-party-chile-con-queso",
                      image_url: "https://images.food52.com/iX24MuyyPYGBXEdomRskrrJQdZg=/filters:format(webp)/ca26c151-ecd4-4001-bc82-7eafacfdc70e--2019-0305_chile-con-queso_3x2_rocky-luten_007.jpeg",
                      cooking_time: "15 minutes",
                      ingredient_blob: "	1	(10-ounce) can diced tomatoes and green chiles, such as Ro-Tel, undrained
  1	(16-ounce) package processed cheese, such as Velveeta, cubed
  Tortilla chips, cauliflower florets, and baby carrots, for serving",
                      directions: "In a double boiler, combine canned tomatoes and cheese, stirring frequently until melted. Serve with tortilla chips, cauliflower florets, and baby carrots."
                      })

                      recipe_fifteen = Recipe.create({
                        user: user_one,
                        title: "Breaded Eggplant Cutlets",
                        source_url: "https://food52.com/recipes/80737-breaded-eggplant-cutlets",
                        image_url: "https://images.food52.com/_hgNwFWTyStocwjWn02_WO9etQg=/filters:format(webp)/36a6db1e-1046-40bc-a060-3086585fab0e--2019-0305_breaded-eggplant-cutlets_3x2_rocky-luten_013.jpg",
                        cooking_time: "2 hours",
                        ingredient_blob: "1	large eggplant
  1/2	teaspoon kosher salt, plus more to taste
  1/3	cup all-purpose flour
  2	large eggs
  1	ounce Parmesan (ungrated)
  1	cup panko
  1	teaspoon freshly ground black pepper
  1/2	teaspoon dried oregano
  1/2	teaspoon garlic powder
  1/2	teaspoon onion powder
  1/2	teaspoon hot paprika
  1/3	cup canola oil
  1/3	cup extra-virgin olive oil",
                        directions: "Cut off the top of the eggplant. Use a peeler to remove the skin. Cut lengthwise into ½-inch thick slices. Generously sprinkle both sides of each eggplant slice with salt. Line a rimmed sheet pan with paper or kitchen towels. Add the eggplant slices in a single layer. Top with another layer of kitchen or paper towels. Set another sheet pan on top. Let the eggplant slices hang out (aka, drain their excess water) for 30 to 60 minutes; the full hour is preferable, but not necessary if you’re pressed for time. Meanwhile, prepare the dredging station: Add the flour to a shallow bowl or rimmed plate; season with a pinch of salt. Add the eggs to a shallow bowl; season with a pinch of salt and whisk with a fork until smooth. Add the Parmesan to a food processor and process until a fine meal forms. Add the panko, black pepper, dried oregano, garlic powder, onion powder, hot paprika, and ½ teaspoon salt to the food processor, then pulse until combined. Combine the oils in a large cast-iron skillet. Set on the stove over medium-high heat. While the oil is heating up, bread the eggplant slices: Dry each one with a paper or kitchen towel. Dredge both sides in flour, then egg, then seasoned panko. Set on a separate plate. To test if the oil is hot enough, add a panko crumb to the pan. It should immediately sizzle—not sink to the bottom, not burn. When it’s hot enough, add a couple breaded eggplant slices (don’t overcrowd or they won’t brown properly). Cook for 2 to 3 minutes per side, or until deeply golden brown. Transfer the just-fried eggplant to a paper towel–lined plate to sop up any extra grease, then transfer to a wire rack to stay crispy. Fry the remaining eggplant slices in the same way. These are best served hot."
                        })

                        recipe_sixteen = Recipe.create({
                          user: user_one,
                          title: "Pork Ribs in Chipotle Adobo (Costillas de Puerco al Chipotle)",
                          source_url: "https://food52.com/recipes/80543-pork-ribs-in-chipotle-adobo-costillas-de-puerco-al-chipotle",
                          image_url: "https://images.food52.com/i-1JD2Dfh1u2VjjjTWIkEcVfNio=/filters:format(webp)/c05a21f2-0206-4b68-87be-1b171a83dfff--Costillas0222.jpg",
                          cooking_time: "3 hours",
                          ingredient_blob: "3	Xilli Chipotles Adobados
  3	allspice berries
  2	cloves
  1/2	teaspoon Mexican oregano
  1	teaspoon cumin seeds
  1	teaspoon apple cider vinegar
  1	teaspoon sugar
  3	Guajillo chiles, seeds and stem removed
  3	Cascabel chiles, seeds and stem removed
  2	garlic cloves, skin on
  1	tablespoon oil
  2 1/2	pounds Pork Short Ribs, cut into pieces that fit the width of your Dutch oven",
                          directions: "Preheat oven to 350°F. Remove the stem from the Xilli Chipotles Adobados and place them in a blender with the next six ingredients. Over a clay comal or cast iron skillet, toast the dried guajillo and cascabel chiles until fragrant (roughly 1 minute, depending on the dryness of the chiles). Take care not to burn them, or the sauce will be bitter. Once toasted, soak the chiles in water for 15 minutes. Roast the garlic, skin on, until dark spots appear. Peel the cloves and add to the blender. Blend everything together until smooth, adding water if necessary. In a large Dutch oven, sear the ribs until browned over med-high heat. Strain the blended sauce through a mesh sieve (optional) and over the ribs being sure to scrape the bottom of the dutch oven with a spatula. Pour water into the dutch oven until the meat is submerged. Cook with lid on, for 2 to 4 hours, depending on how tender you want the meat. Once done, remove ribs and slice. Serve with fresh tortillas and plenty of sauce over the top."
                          })
