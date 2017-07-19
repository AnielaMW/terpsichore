class NewMood {
  constructor(dm, danId) {
    this.dance_id = danId;
    this.mood_id = dm.value;
  }

  newId(json) {
    this.id = json.id;
  }
}

let submitDMAdd = (dm, newDan) => {
  let newDM = new NewMood(dm, newDan.id);

  let saveDanceMood = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_moods',
      data: {dm: newDM}
    }).done((response) => { console.log(response); });
  };

  let createDanceMood = (response) => {
    newDM.newId(response);
  };

  saveDanceMood();
  return newDM;
};

export { submitDMAdd, newDM, NewMood };
