FirstAndLearn.TagsController = function () {
  this.addTagsListeners();
};

FirstAndLearn.TagsController.prototype = {
  addTagsListeners: function () {
    $('.create-tags-button').on('click', this.showAndHideTagCreationInput.bind(this));
    $('#add-tags').on('click', this.getTagsFromInputAndCreate.bind(this));
  },

  addTagsToPathTagList: function (tagsToAdd) {
    this.hideAndClearTagForm();
    var tagsToAddArray = tagsToAdd.tags;
    var tagsShowing = this.getTagsFromPage();
    var newTagsLength = tagsToAddArray.length;

    for (var i = 0; i < newTagsLength; i++) {
      if (tagsShowing.indexOf(tagsToAddArray[i]) === -1)
        tagsShowing.push(tagsToAddArray[i]);
    }

    var allTagsHTML = this.sortAndCreateHTML(tagsShowing);

    $('#path-tags').empty().html(allTagsHTML);
  },

  getTagsFromInputAndCreate: function (e) {
    e.preventDefault();
    var addingTagsToThisClass = window.location.href.split('/').slice(-2, -1)[0].slice(0, -1);
    var addingTagsToThisObjectNum = window.location.href.split('/').slice(-1)[0];

    if (addingTagsToThisClass === 'path')
      tagsToCreate = { tag: { name: $('[name="tag[name]"]').val() }, path_id: parseInt(addingTagsToThisObjectNum, 10) };
    else if (addingTagsToThisClass === 'asset')
      tagsToCreate = { tag: { name: $('[name="tag[name]"]').val() }, asset_id: parseInt(addingTagsToThisObjectNum, 10) };

    $.ajax({
      type: 'POST',
      url: '/tags',
      data: tagsToCreate
    })
    .done(this.addTagsToPathTagList.bind(this));
  },

  getTagsFromPage: function () {
    var pageTags = [];
    $('#path-tags').children().each( function () {
      pageTags.push($(this).context.innerHTML);
    });
    return pageTags;
  },

  hideAndClearTagForm: function () {
    $('#tags-partial').fadeOut(function () {
      $('[name="tag[name]"]').val('');
      $('#tags-partial').toggleClass('shown');
    });
  },

  showAndHideTagCreationInput: function (e) {
    e.preventDefault();
    var tagsPartial = $('#tags-partial');
    if (tagsPartial.hasClass('shown'))
      tagsPartial.fadeOut();
    else
      tagsPartial.fadeIn();
    tagsPartial.toggleClass('shown');
  },

  sortAndCreateHTML: function (tags) {
    tags.sort();
    var tagsHTML = '';
    var tagsLength = tags.length;

    for (var j = 0; j < tagsLength; j++)
      tagsHTML += '<span class="tag">' + tags[j] + '</span>';

    return tagsHTML;
  }
};
