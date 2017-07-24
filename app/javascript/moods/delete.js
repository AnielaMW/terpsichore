import { NewDanceMood } from '../moods/new';

let deleteDM = (dmj, newDan) => {

  let newDM = new NewDanceMood(dmj[0], newDan.id);
  newDM.id = dmj[1];

  let deleteDMood = () => {
    $.ajax({
      method: 'DELETE',
      url: `/api/dance_moods/$(newDM.id)`,
      data: {dance_mood: newDM}
    });
  };

  deleteDMood();
};

export { deleteDM };
