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
        <h3>
          <a href="/users/${this.user_id}">${this.user}</a> posted a <a href="/comment_types/${this.comment_type_id}">${this.comment_type}</a> for <a href="/dances/${this.dance_id}">${this.dance}</a>
        </h3>
        <p><a href="/dance_comments/${this.id}">${this.comment}</a></p>

        <footer>
          <ul>
            <li><a href="/dance_comments/${this.id}/edit">Edit</a></li>
            <li><a href="">Delete</a></li>
          </ul>
        </footer>
      </article>
    </li>`;
  }
}

submitDCClick = (event) => {
  event.preventDefault();

  let newCom = new NewComment();

  saveComment = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_comments',
      data: {dance_comment: newCom}
    }).done((response) => { createComment(response);});
  };

  createComment = (response) => {
    newCom.info(response);
    prependTarget($('#dance-comment-list'), newCom.toHTML());

    $('#dc-form')[0].reset();
    $('#dc-form #actions>input').prop('disabled',false);
  };

  saveComment();
};

$(document).ready(() => {
  $('#dance-show #dc-form').submit(submitDCClick);
});
