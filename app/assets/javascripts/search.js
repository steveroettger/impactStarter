$(document).on('submit', '#search-bar form', function(){
  $(this).attr('action', $(this).find('select option:selected').val());
})
