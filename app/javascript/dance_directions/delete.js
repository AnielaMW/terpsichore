import { removeDirection } from '../dance_directions/remove';

let deleteDirection = (btn) => {
  let ddLine = btn.target.parentNode.parentNode;
  let ddirection = {
    id: ddLine.childNodes[1].childNodes[1].value
  };

  let deleteDir = () => {
    $.ajax({
      method: 'DELETE',
      url: `/api/dance_directions/$(ddirection[:id])`,
      data: {dd: ddirection}
    }).done(() => { removeDirection(btn); });
  };
  
  deleteDir();
};

export { deleteDirection };
