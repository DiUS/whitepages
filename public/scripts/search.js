$(document).ready(function(){
    $('#query').bind('input',function(){
        searchAjax($(this).val());
    });
});

function searchAjax(keyword) {
    $.ajax({
        url: 'search',
        data: {keyword: keyword},
        success: searchAjaxSuccess
    });
}

function searchAjaxSuccess(searchResults) {
    var $contacts = $('#contacts').empty();
    $.each(searchResults, function(index, contact){
        $newContactListItem = newContactListItem(contact, index);
        $contacts.append($newContactListItem);
    });
}

function newContactListItem(contact, index) {
    $newContactListItem = $('<li></li>');
    $newContactListItem.append($('<img>').attr('src', 'images/dius' + (index % 3 + 1) + '.png'));

    $div = $('<div></div>');
    $div.append($('<span></span>').addClass('name').html(contact.name));
    $div.append($('<span></span>').addClass('number').html(contact.number));
    $newContactListItem.append($div);
    return $newContactListItem
}