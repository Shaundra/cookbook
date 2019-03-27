class Tag {
  constructor(tagInfo) {
    this.id = tagInfo.id
    this.name = tagInfo.name
    this.recipes = tagInfo.recipes
  }

  static addTagToSubmenu(tagInfo) {
    let newTag = new Tag(tagInfo);

    let ul = document.getElementById('tagSubmenu')
    let li = Helper.createElmt('li', ul)
    Helper.createElmt('a', li, (a) => {
      a.innerText = newTag.name
      a.href = "#"
    })

    let showUl = document.getElementById('show-list')
    li.addEventListener('click', () => {
      newTag.showTagRecipes(showUl);
    })
  }

  showTagRecipes(showUl) {
    Array.from(showUl.children).forEach((child) => child.remove())

    showUl.innerText = this.name
    this.recipes.forEach((recipe) => {
      Recipe.addRecipe(recipe)
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
