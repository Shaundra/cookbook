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
 },
 getFormattedDate: (date_str) => {
     const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

     let date = new Date(Date.parse(date_str));

     let year = date.getFullYear();
     let month = months[date.getMonth()];
     let day = date.getDate().toString().padStart(2, '0');
     return `${day} ${month} ${year}`;
 }
}
