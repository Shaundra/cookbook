class Comment {
  constructor(commentInfo) {
    this.content = commentInfo.content
    this.rating = commentInfo.rating
    this.created_at = commentInfo.created_at
  }

  static createComment(parent, url) {
    let commentUl = Helper.createElmt('ul', parent, (ul) => ul.innerText = 'Comments')

    let commentForm = Helper.createElmt('form', commentUl, (form) => {
      form.id = 'comment-form'
    })

    Helper.createElmt('textarea', commentForm, (input) => {
      let attrs = {id: 'content', placeholder: 'Enter comment...'};
      Helper.setAttrs(input, attrs);
    })
    Helper.createElmt('input', commentForm, (input) => {
      input.value = 'Create Comment';
      input.type = 'submit'
    })
    const content = document.getElementById('content').value

    // fetch(url, {
    //   method: 'PATCH',
    //   headers: {'Content-Type': 'application/json'},
    //   body: JSON.stringify({content})
    // })
    // .then(res => res.json())
    // .then(console.log)
  }

  static displayComment(comment, parent) {
    Helper.createElmt('li', parent, (li) => {
      li.innerText = `${comment.created_at}  ${(comment.rating > -1) ? "-- " + comment.rating : "" } \n ${comment.content}`
    })
  }
}
