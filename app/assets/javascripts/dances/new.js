class NewDance{
  constructor() {
    this.id = $('#dance-id').text();
    this.title = $('#dance_title').val();
    this.choreographer = $('#dance_choreographer').val();
    this.publication = $('#dance_publication').val();
    this.year = $('#dance_year').val();
    this.formation_id = $('#dance_formation_id').val();
    this.meter_id = $('#dance_meter_id').val();
    this.key_id = $('#dance_key_id').val();
    this.tempo_id = $('#dance_tempo_id').val();
    this.dance_level_id = $('#dance_dance_level_id').val();
    this.user_id = $('#user-id').text();
    this.directions = [];
  }

  newId(json) {
    this.id = json.id;
  }
}

dividNewDirections = (dds, newDan) => {
  dds.each((dd) => {
    newDan.directions.push(submitDDAdd(dd, newDan));
  });
};

submitDDDClick = (event) => {
  event.preventDefault();

  let dirListAdd = $('tr.dd-new');
  let newDan = new NewDance();

  saveDance = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dances',
      data: {dance: newDan}
    }).done((response) => { createDance(response); });
  };

  createDance = (response) => {
    newDan.newId(response);
    dividNewDirections(dirListAdd, newDan);
    window.location = `/dances/${newDan.id}`;
  };

  saveDance();
};

$(document).ready(() => {
  $('form#new_dance').submit(submitDDDClick);
});
