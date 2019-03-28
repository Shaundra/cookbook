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
    // debugger;
    this.recipes.forEach((recipe, index) => {
      Recipe.addRecipe(recipe, newCols[index % 2])
    })
  }

  displayTagOnRecipe(tagUl) {
    // debugger;
    let li = Helper.createElmt('li', tagUl, (li) => {
      li.className = 'tagMenu'
      Helper.createElmt('a', li, (a) => {
        a.innerText = this.name
        a.href = "#"
      })
    })

    // let showP = document.getElementById('show-panel')
    // li.addEventListener('click', () => {
    //   Helper.clearDisplay(showP);
    //   let tagDiv = Helper.createElmt('div', showP, (div) => div.innerText = this.name)
    //   this.showTagRecipes(tagDiv);
    // })

  }

  static renderTags(url) {
    fetch(url)
    .then(res => res.json())
    .then(json => json.forEach(function(tag) {
      Tag.addTagToSubmenu(tag);
    }))
  }

  static renderTagFormCheckbox(recipeTags, tagForm) {
    let userTags = [];

    fetch(TAGS_URL)
      .then(res => res.json())
      .then(json => {
        json.forEach((tag) => userTags.push(tag.name))

        userTags.forEach((tag) => {
          // debugger;
          let recipeTagNames = [];
          recipeTags.forEach((tag) => recipeTagNames.push(tag.name));

          Helper.createElmt('label', tagForm, (label) => {
            label.className = 'checkbox-container';
            label.innerText = tag;

            Helper.createElmt('input', label , (input) => {
              input.setAttribute('type', 'checkbox');
              input.className = 'tag-checkboxes';
              input.setAttribute('name', tag);
              if (recipeTagNames.includes(tag)) {input.setAttribute('checked', 'checked')}
              Helper.createElmt('span', label, (span) => span.className = 'checkmark')
            })
          })
        })
      })
  }

  static renderTagForm(recipeTags) {
    let tagUl = document.getElementById('new-tag-ul')
    let tagForm = Helper.createElmt('form', tagUl, (form) => form.id = 'tag-form')

    Tag.renderTagFormCheckbox(recipeTags, tagForm);

    Helper.createElmt('input', tagForm, (input) => {
      let attrs = {type: 'text', id: 'new-tag-name', placeholder: 'Enter New Tag Name'};
      Helper.setAttrs(input, attrs);


      Helper.createElmt('label', tagForm, (label) => {
        label.innerText = 'Tag Name: '
        label.setAttribute = attrs.id
      })


      tagForm.addEventListener('submit', (event) => {
        event.preventDefault();
        Tag.createTag(TAGS_URL);
      })
    })

    Helper.createElmt('input', tagForm, (input) => {
      input.type = 'submit'
      input.value = 'Update'
      input.className = 'create-btn'
    })

    return tagForm
  }

  static addTagBtnToRecipe(parent, recipeTags) {
    let addTagButton = Helper.createElmt('button', parent,
    (btn) => btn.innerText = 'Edit Tags')

    addTagButton.addEventListener('click', (event) => {
      event.preventDefault();
      Tag.renderTagForm(recipeTags);
    })
  }

  static createTag(url) {
    const newTag = document.getElementById('new-tag-name');
    const newTagRecipeId = newTag.parentElement.parentElement.parentElement.firstElementChild.id;

    const newTagName = newTag.value;
    const tagCheckboxes = document.getElementsByClassName('tag-checkboxes');
    let allNewTags = Array.from(tagCheckboxes).filter(tag => tag.checked == true).map(tag => tag.name);
    if (newTagName) {allNewTags.push(newTagName)};
    // debugger;
    fetch(url, {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({names: allNewTags, recipe_id: newTagRecipeId})
    })
      .then(res => res.json())
      .then(json => {
        let newRecipe = new Recipe(json);
        newRecipe.displayRecipe();
      })
  }


}
