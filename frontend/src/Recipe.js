class Recipe {
  constructor(recipeInfo) {
    this.id = recipeInfo.id
    this.title = recipeInfo.title
    this.ingredient_blob = recipeInfo.ingredient_blob
    this.directions = recipeInfo.directions
    this.cooking_time = recipeInfo.cooking_time
    this.image_url = recipeInfo.image_url
    this.source_url = recipeInfo.source_url
  }

  static renderRecipes(url) {
    const ul = document.getElementById('list')
    fetch(url)
    .then(res => res.json())
    .then(json => this.appendRecipes(json, ul))
  }

  static appendRecipes(source, parent) {
    source.forEach(function(recipe) {
      let newRecipe = new Recipe(recipe);
      let li = newRecipe.createElmt('li', parent, (li) => {
        li.innerText = newRecipe.title;
        li.setAttribute('id', newRecipe.id)
      })
      li.addEventListener('click', () => {newRecipe.displayRecipe()})
    })
  }

  displayRecipe() {
    let showP = document.getElementById('show-panel')
    let showKids = Array.from(showP.children)
    showKids.forEach(function(kid) {kid.remove()})

    let h3 = createElmt('h3', showP)
    createElmt('a', h3, (a) => {
      a.innerText = this.title
      a.href = this.source_url
    })

    this.createElmt('img', showP, (img) => {img.src = recipe.image_url})
    this.createElmt('p', showP, (p) => {p.innerText = recipe.cooking_time})
    this.createElmt('p', showP, (p) => {p.innerText = recipe.ingredient_blob})
    this.createElmt('p', showP, (p) => {p.innerText = recipe.directions})

    let commentUl = createElmt('ul', showP)
    this.comments.forEach(function(comment) {
      createElmt('li', commentUl, (li) => {
        li.innerText = `${comment.created_at} -- ${comment.rating} \n ${comment.content}`
      })
    })
  }

  createElmt(elmt, parent, callback) {
    let e = document.createElement(elmt);
    callback(e);
    parent.appendChild(e);
    return e;
  }

}
