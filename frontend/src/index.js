const RECIPES_URL = 'http://localhost:3000/api/v1/recipes';
const TAGS_URL = 'http://localhost:3000/api/v1/tags'


let showUl = document.getElementById('show-list')

// let listPanel = document.getElementById('list-panel')
// let recipeButton = Helper.createElmt('button', listPanel,
//   (but) => but.innerText = 'Recipes')
let recipeButton = document.getElementById('display-recipes')
recipeButton.addEventListener('click', () => {
  if (showUl.children) {
    Array.from(showUl.children).forEach((child) => child.remove()
  )};
  Recipe.renderRecipes(RECIPES_URL)
})

// let listUl = document.getElementById('list')
// let tagButton = Helper.createElmt('button', listPanel,
//   (but) =>  but.innerText = 'Tags')
// tagButton.addEventListener('click', () => {
//   if (listUl.children) {
//     Array.from(listUl.children).forEach((child) => child.remove()
//   )};
//   Tag.renderTags(TAGS_URL)
// })

Tag.renderTags(TAGS_URL)
// let createRecipeButton = Helper.createElmt('button', listPanel,
//   (but) =>  but.innerText = 'Add Recipe')
let createRecipe = document.getElementById('add-recipe')
createRecipe.addEventListener('click', () => {
  Recipe.displayRecipeForm()

  let recipeForm = document.getElementById('recipe-form')
  recipeForm.addEventListener('submit', (event) => {
    event.preventDefault();
    Recipe.createRecipe(RECIPES_URL);
  })
})

// let showP = document.getElementById('show-panel')
// let commentForm = document.getElementById('comment-form');
// commentForm.addEventListener('submit', (event) => {
//   event.preventDefault();
//   let recipeId = commentForm.parentElement.parentElement.firstChild.id;
//   Comment.createComment(showP, RECIPES_URL + `/${recipeId}`);
// })
