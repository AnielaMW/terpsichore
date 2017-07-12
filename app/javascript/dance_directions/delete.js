import { removeDirection } from '../dance_directions/remove';

let deleteDirection = (btn) => {
  let ddLine = btn.target.parentNode.parentNode;
  let ddir = {
    id: ddLine.childNodes[1].childNodes[1].value
  };

  let deleteDir = () => {
    $.ajax({
      method: 'DELETE',
      url: `/api/dance_directions/$(ddir[:id])`,
      data: {dd: ddir}
    }).done(() => { removeDirection(btn); });
  };

  deleteDir();
};

export { deleteDirection };
