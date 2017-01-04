$(document).on('ready', function() {
  $('.hided').hide()
  $('#user_is_teacher_0').on('click', function() {
    $('#edit-teacher-area').hide('fast')
  })
  $('#user_is_teacher_1').on('click', function() {
    $('#edit-teacher-area').show('fast')
  })
})
