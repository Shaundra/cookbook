const Helper = {
  createElmt: (elmt, parent, callback = () => {}) => {
    let e = document.createElement(elmt);
    callback(e);
    parent.appendChild(e);
    return e;
  },
  clearDisplay: (parent) => {
    let kids = Array.from(parent.children);
    kids.forEach(function(kid) {kid.remove()})
  },
  setAttrs: (elmt, attrs) => {
    for (let key in attrs) {
      elmt.setAttribute(key, attrs[key])
    }
  },
  createImgCols: (parent) => {
    let colA = Helper.createElmt('div', parent, (div) => {
      div.className = 'column'
      div.id = 'column-a'
    })
    let colB = Helper.createElmt('div', parent, (div) => {
      div.className = 'column'
      div.id = 'column-b'
    })

   return [colA, colB]
  }
}
