// dividUpdateDirections = (dds, newDan) => {
//   dds.each((dd) => {
//     newDan.directions.push(submitDDUpdate(dd, newDan));
//   });
// };
//
// submitDDDEditClick = (event) => {
//   event.preventDefault();
//
//   let dirListUpdate = $('tr.dd-editable');
//   let dirListAdd = $('tr.dd-new');
//   let newDan = new NewDance();
//
//   updateDance = () => {
//     $.ajax({
//       method: 'PUT',
//       url: `/api/dances/${newDan.id}`,
//       data: {dance: newDan}
//     }).done(() => { createDance(); });
//   };
//
//   createDance = () => {
//     dividNewDirections(dirListAdd, newDan);
//     dividUpdateDirections(dirListUpdate, newDan);
//     window.location = `/dances/${newDan.id}`;
//   };
//
//   updateDance();
// };
//
// $(document).ready(() => {
//   $('form.edit_dance').submit(submitDDDEditClick);
// });
