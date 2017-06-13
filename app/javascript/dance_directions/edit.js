import { NewDanceDirection } from '../dance_directions/new';

let submitDDUpdate = (dd, newDan) => {

  let ddirection = {
    id: $('.dd-editable td.id input')[dd].value,
    seqs: $('.dd-editable td.seq input')[dd].value,
    mars: $('.dd-editable td.mar input')[dd].value,
    meas: $('.dd-editable td.mea input')[dd].value,
    dirs: $('.dd-editable td.dir input')[dd].value,
    poss: $('.dd-editable td.pos input')[dd].value,
    d_id: newDan.id
  };

  let newDD = new NewDanceDirection(ddirection);

  let saveDirections = () => {
    $.ajax({
      method: 'PUT',
      url: `/api/dance_directions/$(dir[:id])`,
      data: {dd: newDD}
    });
  };

  saveDirections();
  return newDD;
};

export { submitDDUpdate };
