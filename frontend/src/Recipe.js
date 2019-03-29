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

  static addRecipe(recipeData, column) {
    let newRecipe = new Recipe(recipeData);

    let imgCont = Helper.createElmt('div', column, (div) => div.className = 'img-container')
    let imgLabel = Helper.createElmt('label', imgCont, (label) => {
      label.innerText = newRecipe.title;
      label.className = 'img-label'
      label.setAttribute('for', newRecipe.id);
    })

    let img = Helper.createElmt('img', imgCont, (img) => {
        img.src = newRecipe.image_url;
        img.id = newRecipe.id
      })

    img.addEventListener('click', () => {
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
      ul.id = 'new-tag-ul'
    })
    // debugger;
    this.tags.forEach((tag) => {
      let newTag = new Tag(tag);
      newTag.displayTagOnRecipe(tagUl)
    })

    Tag.addTagBtnToRecipe(tagUl, this.tags)

    Helper.createElmt('img', showP, (img) => {img.src = this.image_url})
    Helper.createElmt('p', showP, (p) => {p.innerText = this.cooking_time})
    Helper.createElmt('p', showP, (p) => {p.innerText = this.ingredient_blob})
    Helper.createElmt('p', showP, (p) => {p.innerText = this.directions})

    // Comment.createComment(showP)
    let commentUl = Helper.createElmt('ul', showP)
    this.comments.forEach((comment) => {
      Comment.displayComment(comment, commentUl)
    })
    Comment.renderCommentForm(commentUl)

  }

  static renderRecipes(url) {
    let showP = document.getElementById('show-panel')
    Helper.clearDisplay(showP)

    let isColA = true;

    let newCols = Helper.createImgCols(showP)
    fetch(url)
    .then(res => res.json())
    .then(json => json.forEach(function(recipe) {
      if (isColA) {
        Recipe.addRecipe(recipe, newCols[0])
      } else {
        Recipe.addRecipe(recipe, newCols[1])
      }
      isColA = !isColA;
    }))
  }

  static displayRecipeForm() {
    let showP = document.getElementById('show-panel')
    Helper.clearDisplay(showP)

    let formDiv = Helper.createElmt('div', showP, (div) => div.className = 'form-container')
    Helper.createElmt('h1', formDiv, (h1) => h1.innerText = 'Add a Recipe to your Cookbook')
    Helper.createElmt('hr', formDiv)

    let newForm = Helper.createElmt('form', formDiv,
      (form) => {form.id = 'recipe-form'});

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'text', id: 'title', placeholder: 'Enter Recipe Title'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Title: '
        label.setAttribute('id', attrs.id)
      })
    })

    Helper.createElmt('textarea', newForm, (input) => {
      let attrs = {id: 'ingredient_blob', placeholder: 'Enter Recipe Ingredients'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Ingredients: '
        label.setAttribute('id', attrs.id)
      })
    })

    Helper.createElmt('textarea', newForm, (input) => {
      let attrs = {id: 'directions', placeholder: 'Enter Recipe Directions'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Directions: '
        label.setAttribute('id', attrs.id)
      })
    })

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'text', id: 'cooking_time', placeholder: 'Enter Recipe Time'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Time: '
        label.setAttribute('id', attrs.id)
      })
    })

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'url', id: 'source_url', placeholder: 'Enter Recipe Source URL'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Source:'
        label.setAttribute('id', attrs.id)
      })
    })

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'url', id: 'image_url', placeholder: 'Enter Recipe Image URL'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', newForm, (label) => {
        label.innerText = 'Recipe Image:'
        label.setAttribute('id', attrs.id)
      })
    })

    Helper.createElmt('input', newForm, (input) => {
      let attrs = {type: 'submit', value: 'Create Recipe'};
      Helper.setAttrs(input, attrs);
      input.className = 'create-btn';
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
      let newRecipe = new Recipe(json);
      newRecipe.displayRecipe();
    })
  }

  static renderSearchForm(parent) {
    let searchForm = Helper.createElmt('form', parent, (form) => {
      form.id = 'search-form'
    })

    Helper.createElmt('label', searchForm, (label) => {
      label.innerText = 'Search Recipes: '
      label.setAttribute('for', 'search-term')
    })

    Helper.createElmt('input', searchForm, (input) => {
      let attrs = {type: 'text', id: 'search-term', placeholder: 'Enter Search Term'};
      Helper.setAttrs(input, attrs);
    })

    Helper.createElmt('input', searchForm, (input) => {
      let attrs = {type: 'submit', value: 'Search Recipes'};
      Helper.setAttrs(input, attrs);
      input.className = 'create-btn';
    })
  }

  static searchRecipes() {
    let search_term = document.getElementById('search-term').value

    fetch(RECIPES_URL + `/search`, {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({search_term})
    })
      .then(res => res.json())
      .then(json => {
        let showP = document.getElementById('show-panel')

        let newCols = Helper.createImgCols(showP)

        json.forEach((recipe, index) => {
          Recipe.addRecipe(recipe, newCols[index % 2])
        })
      })

  }
// search Recipe.where('ingredient_blob ilike ?', "%#{ search }%")

}
