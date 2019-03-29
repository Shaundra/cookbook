const RECIPES_URL = 'http://localhost:3000/api/v1/recipes';
const TAGS_URL = 'http://localhost:3000/api/v1/tags'


let showList = document.getElementById('show-list')
let showP = document.getElementById('show-panel')

Tag.renderTags(TAGS_URL)

let showRecipe = document.getElementById('show-recipes')
showRecipe.addEventListener('click', () => {
  Helper.clearDisplay(showList);
  Recipe.renderRecipes(RECIPES_URL);
})

let createRecipe = document.getElementById('add-recipe')
createRecipe.addEventListener('click', () => {
  Recipe.displayRecipeForm()

  let recipeForm = document.getElementById('recipe-form')
  recipeForm.addEventListener('submit', (event) => {
    event.preventDefault();
    Recipe.createRecipe(RECIPES_URL);
  })
})

let searchRecipeBtn = document.getElementById('search-recipes');
searchRecipeBtn.addEventListener('click', () => {
  Helper.clearDisplay(showP);
  Recipe.renderSearchForm(showP);

  let searchForm = document.getElementById('search-form')
  searchForm.addEventListener('submit', (event) => {
    event.preventDefault();
    console.log('Searching')
    Recipe.searchRecipes();
  })
})


/* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
  document.body.style.backgroundColor = "white";
}

// Tag Dropdown SideNav
let dropdown = document.getElementById("show-tags");
let tagUl = document.getElementById('tag-ul')
dropdown.addEventListener('click', () => {
  dropdown.classList.toggle('active');
  if (tagUl.style.display === 'block') {
    tagUl.style.display = "none";
  } else {
    tagUl.style.display = "block"
  }
})
