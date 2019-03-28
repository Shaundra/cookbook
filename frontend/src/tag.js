class Tag {
  constructor(tagInfo) {
    this.id = tagInfo.id
    this.name = tagInfo.name
    this.recipes = tagInfo.recipes
  }

  static addTagToSubmenu(tagInfo) {
    let newTag = new Tag(tagInfo);

    let ul = document.getElementById('tag-ul')
    let li = Helper.createElmt('li', ul)
    Helper.createElmt('a', li, (a) => {
      a.innerText = newTag.name
      a.href = "#"
    })

    let showP = document.getElementById('show-panel')
    li.addEventListener('click', () => {
      Helper.clearDisplay(showP);
      let tagDiv = Helper.createElmt('div', showP, (div) => div.innerText = newTag.name)
      newTag.showTagRecipes(tagDiv);
    })
  }

  showTagRecipes(showUl) {
    Array.from(showUl.children).forEach((child) => child.remove())

    showUl.innerText = this.name

    let newCols = Helper.createImgCols(showUl)

    this.recipes.forEach((recipe, index) => {
      Recipe.addRecipe(recipe, newCols[index % 2])
    })
  }

  displayTagOnRecipe(tagUl) {
    let li = Helper.createElmt('li', tagUl, (li) => {
      li.className = 'tagMenu'
      li.innerText = this.name
    })
  }

  static renderTags(url) {
    fetch(url)
    .then(res => res.json())
    .then(json => json.forEach(function(tag) {
      Tag.addTagToSubmenu(tag);
    }))
  }

  static renderTagForm() {
    let tagUl = document.getElementById('new-tag-ul')
    let tagForm = Helper.createElmt('form', tagUl, (form) => form.id = 'tag-form')
    tagForm.addEventListener('submit', (event) => {
      event.preventDefault();
      Tag.createTag(TAGS_URL);
    })

    Helper.createElmt('input', tagForm, (input) => {
      let attrs = {type: 'text', id: 'new-tag-name', placeholder: 'Enter Tag Name'};
      Helper.setAttrs(input, attrs);

      Helper.createElmt('label', tagForm, (label) => {
        label.innerText = 'Tag Name: '
        label.setAttribute = attrs.id
      })
    })

    Helper.createElmt('input', tagForm, (input) => {
      input.type = 'submit'
      input.value = 'Create Tag'
      input.className = 'create-btn'
    })

    return tagForm
  }

  static addTagBtnToRecipe(parent) {
    let addTagButton = Helper.createElmt('button', parent,
    (btn) => btn.innerText = 'Add Tag')

    addTagButton.addEventListener('click', (event) => {
      event.preventDefault();
      Tag.renderTagForm();
    })
  }

  static createTag(url) {
    const newTag = document.getElementById('new-tag-name')
    const newTagRecipeId = newTag.parentElement.parentElement.parentElement.firstElementChild.id
    const newTagName = newTag.value

    fetch(url, {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({name: newTagName, recipe_id: newTagRecipeId})
    })
      .then(res => res.json())
      .then(json => {
        let newRecipe = new Recipe(json);
        // debugger;
        newRecipe.displayRecipe();
      })
  }


}
