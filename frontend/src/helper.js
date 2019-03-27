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
  }


}
