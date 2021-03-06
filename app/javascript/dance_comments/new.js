import { prependTarget } from '../sitewide';

class NewComment{
  constructor() {
    this.comment = $('#dance_comment_comment').val();
    this.user_id = $('#user-id').text();
    this.dance_id = $('#dance-id').text();
    this.comment_type_id = $('#dance_comment_comment_type_id').val();
  }

  info(json) {
    this.id = json[0].id;
    this.user = json[1].user;
    this.dance = json[1].dance;
    this.comment_type = json[1].comment_type;
  }

  toHTML() {
    return `<li>
      <article class="comment-box">
        <h2>
          <a href="/users/${this.user_id}">${this.user}</a> posted a <a href="/comment_types/${this.comment_type_id}">${this.comment_type}</a> for <a href="/dances/${this.dance_id}">${this.dance}</a>
        </h2>
        <p><a href="/dance_comments/${this.id}">${this.comment}</a></p>

        <footer>
          <ul>
            <li>
              <a id="edit-comment" href="/dance_comments/${this.id}/edit">
                <img alt="Edit" title="Edit" class="icon" src="/assets/icons/svg/pencil.svg">
              </a>
            </li>
            <li>
              <a data-confirm="Are you sure?" class="remove-comment" id="delete-comment" rel="nofollow" data-method="delete" href="/dance_comments/${this.id}">
                <img alt="Delete" title="Delete" class="icon" src="/assets/icons/svg/trashcan.svg">
              </a>
            </li>
          </ul>
        </footer>
      </article>
    </li>`;
  }
}

let submitDCClick = (event) => {
  event.preventDefault();

  let newCom = new NewComment();

  let saveComment = () => {
    $.ajax({
      method: 'POST',
      headers: { 'X-CSRF-Token' : $('#dc-form input[name=authenticity_token]').val() },
      url: '/api/dance_comments',
      data: {dance_comment: newCom}
    }).done((response) => { createComment(response);});
  };

  let createComment = (response) => {
    newCom.info(response);
    prependTarget($('#dance-comment-list'), newCom.toHTML());

    $('#dc-form')[0].reset();
    $('#dc-form #actions>input').prop('disabled',false);
  };

  saveComment();
};

export { submitDCClick };
