class NewDanceMood {
  constructor(dm, danId) {
    this.dance_id = danId;
    this.mood_id = dm;
  }

  newId(json) {
    this.id = json.id;
  }
}

let submitDMAdd = (dm, newDan) => {
  let newDM = new NewDanceMood(dm, newDan.id);

  let saveDanceMood = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_moods',
      data: {dance_moods: newDM}
    }).done((response) => { createDanceMood(response); });
  };

  let createDanceMood = (response) => {
    newDM.newId(response);
  };

  saveDanceMood();
  return newDM;
};

export { submitDMAdd, newDM, NewDanceMood };
