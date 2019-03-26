const RECIPES_URL = 'http://localhost:3000/api/v1/recipes';

// function renderRecipes() {
//   fetch(RECIPES_URL)
//     .then(res => res.json())
//     .then(json => json.forEach(function(recipe) {
//       addRecipe(recipe)
//     }))
// }
//
//
// function createElmt(elmt, parent, callback = () => {}) {
//   let e = document.createElement(elmt);
//   callback(e);
//   parent.appendChild(e);
//   return e;
// }
//
// function addRecipe(recipeData) {
//   let ul = document.getElementById('list')
//   let li = createElmt('li', ul, (li) => {
//     li.innerText = recipeData.title
//   })
//
//   li.addEventListener('click', () => {
//     // console.log('Displaying recipe');
//     // console.log(recipeData);
//     displayRecipe(recipeData);
//   })
// }
//
// function displayRecipe(recipe) {
//   let showP = document.getElementById('show-panel')
//   let showKids = Array.from(showP.children)
//   showKids.forEach(function(kid) {kid.remove()})
//
//   let h3 = createElmt('h3', showP)
//   createElmt('a', h3, (a) => {
//     a.innerText = recipe.title
//     a.href = recipe.source_url
//   })
//
//   createElmt('img', showP, (img) => {img.src = recipe.image_url})
//   createElmt('p', showP, (p) => {p.innerText = recipe.cooking_time})
//   createElmt('p', showP, (p) => {p.innerText = recipe.ingredient_blob})
//   createElmt('p', showP, (p) => {p.innerText = recipe.directions})
//
//   let commentUl = createElmt('ul', showP)
//   recipe.comments.forEach(function(comment) {
//     createElmt('li', commentUl, (li) => {
//       li.innerText = `${comment.created_at} -- ${comment.rating} \n ${comment.content}`
//     })
//
//   })
// }

Recipe.renderRecipes(RECIPES_URL)
