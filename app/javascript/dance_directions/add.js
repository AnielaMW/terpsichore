let appendTarget = (target, text) => {
  target.append(text);
};

addBlankDirection = () => {
  let newDDForm = `<tr class="dd-new">
  <td class="seq hidden-label">
    <label for="sequence">Sequence</label>
    <input type="text" name="sequence" required>
  </td>

  <td class="mar hidden-label">
    <label for="mark">Mark</label>
    <input type="text" name="mark">
  </td>

  <td class="mea hidden-label">
    <label for="measure">Measure</label>
    <input type="text" name="measure">
  </td>

  <td class="dir hidden-label">
    <label for="movement">Direction</label>
    <input type="text" name="movement" required>
  </td>

  <td class="pos hidden-label">
    <label for="position">Position</label>
    <input type="text" name="position">
  </td>
  </tr>`;

  let ddList = $('table#dd-form');

  appendTarget(ddList, newDDForm);
};

$(document).ready(() => {
  $('#dance-new').on('click', '#dd-add', addBlankDirection);
  $('#dance-edit').on('click', '#dd-add', addBlankDirection);
});
