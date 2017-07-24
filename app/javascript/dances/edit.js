import { NewDance, dividNewDirections } from '../dances/new';
import { submitDDUpdate } from '../dance_directions/edit';

let dividUpdateDirections = (dds, newDan) => {
  dds.each((dd) => {
    newDan.directions.push(submitDDUpdate(dd, newDan));
  });
};

let submitDDDEditClick = (event) => {
  event.preventDefault();

  let oldDanMoods = $('#dance-mood-ids>li').map(function(_, dm) {
    return [$(dm).text().split(', ')];
  }).get();
  let newDanMoods = $('#moods-ids>input:checked').map(function(_, dm) {
    return $(dm).val();
  }).get();
  let dirListUpdate = $('tr.dd-editable');
  let dirListAdd = $('tr.dd-new');
  let newDan = new NewDance();

  sortDanMoods(oldDanMoods, newDanMoods, newDan);

  let updateDance = () => {
    $.ajax({
      method: 'PUT',
      url: `/api/dances/${newDan.id}`,
      data: {dance: newDan}
    }).done(() => { createDance(); });
  };

  let createDance = () => {
    dividNewDirections(dirListAdd, newDan);
    dividUpdateDirections(dirListUpdate, newDan);
    window.location = `/dances/${newDan.id}`;
  };

  updateDance();
};

export { submitDDDEditClick };
