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
    this.tags = recipeInfo.tags
  }

  static addRecipe(recipeData) {
    let newRecipe = new Recipe(recipeData);

    let showUl = document.getElementById('show-list')
    let li = Helper.createElmt('li', showUl, (li) => {
      li.innerText = newRecipe.title
    })

    li.addEventListener('click', () => {
      newRecipe.displayRecipe();
    })

    return newRecipe;
  }

  displayRecipe() {
    let showP = document.getElementById('show-panel')
    Helper.clearDisplay(showP)

    let h3 = Helper.createElmt('h3', showP, (h3) => h3.setAttribute('id', this.id))
    Helper.createElmt('a', h3, (a) => {
      a.innerText = this.title
      a.href = this.source_url
    })

    let tagUl = Helper.createElmt('ul', showP, (ul) => {
      ul.className = 'tagMenu'
    })

    this.tags.forEach((tag) => {
      let newTag = new Tag(tag);
      newTag.displayTagOnRecipe(tagUl)
    })

    Helper.createElmt('img', showP, (img) => {img.src = this.image_url})
    Helper.createElmt('p', showP, (p) => {p.innerText = this.cooking_time})
    Helper.createElmt('p', showP, (p) => {p.innerText = this.ingredient_blob})
    Helper.createElmt('p', showP, (p) => {p.innerText = this.directions})

    Comment.createComment(showP)
    let commentUl = Helper.createElmt('ul', showP)
    this.comments.forEach((comment) => {
      Comment.displayComment(comment, commentUl)
    })

    let addTagButton = Helper.createElmt('button', document.querySelector('ul.tagMenu'),
      (but) => but.innerText = 'Add Tag')
  }

  static renderRecipes(url) {
    fetch(url)
    .then(res => res.json())
    .then(json => json.forEach(function(recipe) {
      Recipe.addRecipe(recipe)
    }))
  }

  static displayRecipeForm() {
    let showP = document.getElementById('show-panel')
    Helper.clearDisplay(showP)

    let newForm = Helper.createElmt('form', showP,
      (form) => {form.id = 'recipe-form'});

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'text', id: 'title', placeholder: 'Enter Recipe Title'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Title: '
        label.setAttribute = attrs.id
      })
    })

    Helper.createElmt('textarea', newForm, (input) => {
      let attrs = {id: 'ingredient_blob', placeholder: 'Enter Recipe Ingredients'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Ingredients: '
        label.setAttribute = attrs.id
      })
    })

    Helper.createElmt('textarea', newForm, (input) => {
      let attrs = {id: 'directions', placeholder: 'Enter Recipe Directions'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Directions: '
        label.setAttribute = attrs.id
      })
    })

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'text', id: 'cooking_time', placeholder: 'Enter Recipe Time'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Time: '
        label.setAttribute = attrs.id
      })
    })

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'url', id: 'source_url', placeholder: 'Enter Recipe Source URL'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Source:'
        label.setAttribute = attrs.id
      })
    })

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'url', id: 'image_url', placeholder: 'Enter Recipe Image URL'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Image:'
        label.setAttribute = attrs.id
      })
    })

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'submit'};
      Helper.setAttrs(input, attrs);
      input.innerText = 'Create Recipe'
    })
  }

  static createRecipe(url) {
    const user_id = 2
    const title = document.getElementById('title').value;
    const ingredient_blob = document.getElementById('ingredient_blob').value;
    const directions = document.getElementById('directions').value;
    const cooking_time = document.getElementById('cooking_time').value;
    const source_url = document.getElementById('source_url').value;
    const image_url = document.getElementById('image_url').value;

    fetch(url, {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({user_id, title, ingredient_blob, directions, cooking_time, source_url, image_url})
    })
    .then(res => res.json())
    .then(json => {
      let newRecipe = Recipe.addRecipe(json);
      newRecipe.displayRecipe();
    })
  }

}
