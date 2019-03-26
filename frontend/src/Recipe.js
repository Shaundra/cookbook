class Recipe {
  constructor(recipeInfo) {
    this.id = recipeInfo.id
    this.title = recipeInfo.title
    this.ingredient_blob = recipeInfo.ingredient_blob
    this.directions = recipeInfo.directions
    this.cooking_time = recipeInfo.cooking_time
    this.image_url = recipeInfo.image_url
    this.source_url = recipeInfo.source_url
    this.comments = recipeInfo.comments
  }

  createElmt(elmt, parent, callback= ()=> {}) {
    let e = document.createElement(elmt);
    callback(e);
    parent.appendChild(e);
    return e;
  }

  static addRecipe(recipeData) {
    let newRecipe = new Recipe(recipeData);

    let ul = document.getElementById('list')
    let li = newRecipe.createElmt('li', ul, (li) => {
      li.innerText = newRecipe.title
    })

    li.addEventListener('click', () => {
      newRecipe.displayRecipe();
    })
  }

  displayRecipe() {
    let showP = document.getElementById('show-panel')
    let showKids = Array.from(showP.children)
    showKids.forEach(function(kid) {kid.remove()})

    let h3 = this.createElmt('h3', showP)
    this.createElmt('a', h3, (a) => {
      a.innerText = this.title
      a.href = this.source_url
    })

    this.createElmt('img', showP, (img) => {img.src = this.image_url})
    this.createElmt('p', showP, (p) => {p.innerText = this.cooking_time})
    this.createElmt('p', showP, (p) => {p.innerText = this.ingredient_blob})
    this.createElmt('p', showP, (p) => {p.innerText = this.directions})

    let commentUl = this.createElmt('ul', showP)
    this.comments.forEach((comment) => {
      this.createElmt('li', commentUl, (li) => {
        li.innerText = `${comment.created_at}  ${(comment.rating > -1) ? "-- " + comment.rating : "" } \n ${comment.content}`
      })
    })
  }

  static renderRecipes(url) {
    const ul = document.getElementById('list')
    fetch(url)
    .then(res => res.json())
    .then(json => json.forEach(function(recipe) {
      Recipe.addRecipe(recipe)
    }))
  }

}
