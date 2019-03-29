class Comment {
  constructor(commentInfo) {
    this.content = commentInfo.content
    this.rating = commentInfo.rating
    this.created_at = commentInfo.created_at
  }

  static renderCommentForm(parent) {
    let commentUl = Helper.createElmt('ul', parent, (ul) => {
      ul.innerText = 'Recipe Notes'
      ul.id = 'recipe-notes-ul'
    })

    let commentForm = Helper.createElmt('form', commentUl, (form) => {
      form.id = 'comment-form'
    })

    Helper.createElmt('textarea', commentForm, (input) => {
      let attrs = {id: 'content', placeholder: 'Enter recipe notes...'};
      Helper.setAttrs(input, attrs);
    })
    Helper.createElmt('input', commentForm, (input) => {
      input.value = 'Create Note';
      input.type = 'submit'
      input.className = 'display-recipe-page-btn'
    })

    commentForm.addEventListener('submit', (event) => {
      console.log('comment form submitted')
      event.preventDefault();
      Comment.createComment();
    })
  }

  static createComment() {
    const content = document.getElementById('content')

    let recipeId = document.getElementById('show-panel').firstElementChild.id

    fetch(RECIPES_URL + `/${recipeId}`, {
      method: 'PATCH',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({content: content.value})
    })
    .then(res => res.json())
    .then(json => {
      let newOldRecipe = new Recipe(json);
      newOldRecipe.displayRecipe();
    })
  }

  static displayComment(comment, parent) {
    Helper.createElmt('li', parent, (li) => {

      // li.textContent = `${comment.created_at} \n ${(comment.rating > -1) ? "-- " + comment.rating : "" } \n ${comment.content}`

      Helper.createElmt('p', li, (p) => {
        p.innerText = comment.content
      })
      Helper.createElmt('span', li, (span) => {
        span.innerText = Helper.getFormattedDate(comment.created_at)
        span.id = 'comment-date'
      })
      Helper.createElmt('span', li, (span) => {
        if (comment.rating > -1 && comment.rating !== null) {
          span.innerText = `Rating: ${comment.rating}`
        }
        span.id = 'comment-rating'
      })
    })
  }
}
