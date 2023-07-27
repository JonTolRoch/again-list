$(document).on('show.bs.modal', '#bookmarkModal', function (event) {
  const button = $(event.relatedTarget); // Button that triggered the modal
  const title = button.data('title'); // Extract info from data-* attributes
  const comment = button.data('comment'); // Extract info from data-* attributes

  const modal = $(this);
  modal.find('.modal-title').text('Bookmark Details: ' + title);
  modal.find('.bookmark-movie-title').text(title);
  modal.find('.bookmark-comment').text(comment);
});