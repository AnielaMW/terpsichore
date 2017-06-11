class NewDanceDirection {
  constructor(ddir) {
    this.id = ddir.id;
    this.sequence = ddir.seqs;
    this.mark = ddir.mars;
    this.measure = ddir.meas;
    this.movement = ddir.dirs;
    this.position = ddir.poss;
    this.dance_id = ddir.d_id;
  }

  newId(json) {
    this.id = json.id;
  }
}


let submitDDAdd = (dd, newDan) => {
  let ddirection = {
    seqs: $('.dd-new td.seq input')[dd].value,
    mars: $('.dd-new td.mar input')[dd].value,
    meas: $('.dd-new td.mea input')[dd].value,
    dirs: $('.dd-new td.dir input')[dd].value,
    poss: $('.dd-new td.pos input')[dd].value,
    d_id: newDan.id
  };

  newDD = new NewDanceDirection(ddirection);

  let saveDirections = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_directions',
      data: {dd: newDD}
    }).done((response) => { createDirection(response); });
  };

  let createDirection = (response) => {
    newDD.newId(response);
  };

  saveDirections();
  return newDD;
};
