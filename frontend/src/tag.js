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

    let showDiv = document.getElementById('show-list')
    li.addEventListener('click', () => {
      Helper.clearDisplay(showDiv);
      let tagDiv = Helper.createElmt('div', showDiv, (div) => div.innerText = newTag.name)
      newTag.showTagRecipes(tagDiv);
    })
  }

  showTagRecipes(showUl) {
    Array.from(showUl.children).forEach((child) => child.remove())

    showUl.innerText = this.name

    let isColA = true;
    let newCols = Helper.createImgCols(showUl)

    this.recipes.forEach((recipe) => {
      if (isColA) {
        Recipe.addRecipe(recipe, newCols[0])
      } else {
        Recipe.addRecipe(recipe, newCols[1])
      }
      isColA = !isColA;
    })
  }

  displayTagOnRecipe(parent) {
    let li = Helper.createElmt('li', parent, (li) => {
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

}
