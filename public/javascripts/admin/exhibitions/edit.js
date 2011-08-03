var docuImgUploader;
var docuPdfUploader;

$(document).ready(function(e){
  
  docuImgUploader = new plupload.Uploader({
      runtimes: 'flash, html5, gears',
      url: '/pictures.json',
      max_file_size: '10mb',
      unique_names: true,
      browse_button: 'docuImgSelectBtn',


      //Specify what files to browse for
      filters : [
        {title: "Image files(jpg)", extensions: "jpg"},
        {title: "Image Files(png)", extensions: 'png'},
        {title: "Image Files(gif)", extensions: 'gif'}
      ],


      // Flash settings
      flash_swf_url: '/javascripts/plupload/plupload.flash.swf',
      container: 'docuImgUploadContainer',
      multipart_params: {
          'authenticity_token': $("#editDescriptionForm input[name='authenticity_token']").val(),
          'post_id': post_id,
      }
  });

  docuImgUploader.refresh();


  docuImgUploader.init();

  docuImgUploader.bind('FilesAdded',
  function(up, files) {
      $("#uploader_image tbody input[type='checkbox']:checked").attr('checked', false);
      $.each(files,
      function(i, file) {
          var regexp = /[ㄱ-ㅎ|가-힣]/;

          if (!file.name.match(regexp))
          {

            var filename = file.name;
            var fileSize = plupload.formatSize(file.size);

            var tr = $("<tr/>");

            var chkboxTd = $("<td/>", {
                'class': 'select'
            }).append($("<input/>", {
                type: 'checkbox',
                name: file.name,
                value: file.id,
                'checked': true
            }));

            var nameTd = $("<td/>", {
                'class': 'title'
            }).append(filename);
            var statusTd = $("<td/>", {
                'class': 'status'
            }).append('준비');
            var sizeTd = $("<td/>", {
                'class': 'size'
            }).append(fileSize);
            var statusIconTd = $("<td/>", {
                'class': 'statusIcon'
            });

            tr.append(chkboxTd).
            append(nameTd).
            append(statusTd).
            append(sizeTd).
            append(statusIconTd).
            appendTo("#uploader0 tbody");
          }
          else
          {
            $.errorMessage("파일이름이 한글일 경우 에러가 발생할 수 있습니다.");
          }


      });

      up.refresh();
      // Reposition Flash/Silverlight

      var hangul = false;
      for (var i = 0; i < files.length; i++)
      { var regexp = /[ㄱ-ㅎ|가-힣]/;

        if (!files[i].name.match(regexp))
        {
          hangul = true;
          break;
        }
      }


      $("#uploader0 tbody input[type='checkbox']:checked").hide().parent().append($('<img src="/images/docuImgUploader_ajaxloader.gif"/>'));
      docuImgUploader.start();


  });

  docuImgUploader.bind('UploadProgress',
  function(up, file) {

      $("#docuImgUploadContainer .statusBar .percent").html(file.percent + '%');
      $("#docuImgUploadContainer .statusBar .graphWrap .graph").css('width', file.percent + '%');

  });

  docuImgUploader.bind('FileUploaded',
  function(up, file, info) {
      var response = $.parseJSON(info.response);

      if (response.success)
      {
          $.noticeMessage(response.message);
          $("input[value=" + file.id + "]").parent().find('img').remove();
          $("input[value=" + file.id + "]").show().attr('id', 'picture-' + response.picture.id).attr("rel", response.picture.url).attr('value', 'picture-' + response.picture.id);
          $("input[value=" + file.id + "]").parent().parent().find('td.status').html('<img src="/images/validate_ok.gif"/>');
      }
      else
      {
          $.errorMessage(response.message);
          $("input[value=" + file.id + "]").parent().find('img').remove();
          $("input[value=" + file.id + "]").show();
      }
  });


  docuImgUploader.bind('ChunkUploaded',
  function(up, file, info) {

      });


  //docuImgUploader.refresh();
  $('#descUploaderChkToggle').change(function(e) {

      if ($(this).attr('checked'))
      {
          $("#uploader0 tbody input[type='checkbox']").attr('checked', true);
      }
      else
      {
          $("#uploader0 tbody input[type='checkbox']").attr('checked', false);
      }
  });


  $("#docuImgDeleteBtn").click(function(e) {
      e.preventDefault();

      var picDelete = {
          ids: {
              picture_ids: []
          },
          trs: [],
          addIds: function(index, item) {
              if ($(item).val().match("picture-"))
              {
                  this.ids.picture_ids.push($(item).val().split('-')[1]);
                  this.trs.push($(item).parent().parent());
              }
              else
              {
                  docuImgUploader.removeFile(docuImgUploader.getFile($(item).val()));
                  $(item).parent().parent().remove();
              }

              $(item).replaceWith('<img src="/images/docuImgUploader_ajaxloader.gif"/>');
          },
          success: function(data) {
              if (data.success)
              {
                  $.noticeMessage("성공적으로 이미지를 삭제하였습니다.");
                  for (var i = 0; i < this.trs.length; i++)
                  {
                      $(this.trs[i]).remove();
                  }

              }
          }

      };

      $("#uploader0 tbody input[type='checkbox']:checked").each($.proxy(picDelete.addIds, picDelete));
      $.ajax({
          type: 'DELETE',
          url: '/posts/' + post_id + '/delete_files.json',
          data: $.param(picDelete.ids),
          success: $.proxy(picDelete.success, picDelete)
      });




  });

	
	
	
	// PDF Uploader
	
	
  docuPdfUploader = new plupload.Uploader({
      runtimes: 'flash, html5, gears',
      url: '/pictures.json',
      max_file_size: '10mb',
      unique_names: true,
      browse_button: 'docuPdfSelectBtn',


      //Specify what files to browse for
      filters : [
        {title: "Image files(jpg)", extensions: "jpg"},
        {title: "Image Files(png)", extensions: 'png'},
        {title: "Image Files(gif)", extensions: 'gif'}
      ],


      // Flash settings
      flash_swf_url: '/javascripts/plupload/plupload.flash.swf',
      container: 'docuPdfUploadContainer',
      multipart_params: {
          'authenticity_token': $("#editDescriptionForm input[name='authenticity_token']").val(),
          'post_id': post_id,
      }
  });

  docuPdfUploader.refresh();


  docuPdfUploader.init();

  docuPdfUploader.bind('FilesAdded',
  function(up, files) {
      $("#uploader0 tbody input[type='checkbox']:checked").attr('checked', false);
      $.each(files,
      function(i, file) {
          var regexp = /[ㄱ-ㅎ|가-힣]/;

          if (!file.name.match(regexp))
          {

            var filename = file.name;
            var fileSize = plupload.formatSize(file.size);

            var tr = $("<tr/>");

            var chkboxTd = $("<td/>", {
                'class': 'select'
            }).append($("<input/>", {
                type: 'checkbox',
                name: file.name,
                value: file.id,
                'checked': true
            }));

            var nameTd = $("<td/>", {
                'class': 'title'
            }).append(filename);
            var statusTd = $("<td/>", {
                'class': 'status'
            }).append('준비');
            var sizeTd = $("<td/>", {
                'class': 'size'
            }).append(fileSize);
            var statusIconTd = $("<td/>", {
                'class': 'statusIcon'
            });

            tr.append(chkboxTd).
            append(nameTd).
            append(statusTd).
            append(sizeTd).
            append(statusIconTd).
            appendTo("#uploader0 tbody");
          }
          else
          {
            $.errorMessage("파일이름이 한글일 경우 에러가 발생할 수 있습니다.");
          }


      });

      up.refresh();
      // Reposition Flash/Silverlight

      var hangul = false;
      for (var i = 0; i < files.length; i++)
      { var regexp = /[ㄱ-ㅎ|가-힣]/;

        if (!files[i].name.match(regexp))
        {
          hangul = true;
          break;
        }
      }


      $("#uploader0 tbody input[type='checkbox']:checked").hide().parent().append($('<img src="/images/docuPdfUploader_ajaxloader.gif"/>'));
      docuPdfUploader.start();


  });

  docuPdfUploader.bind('UploadProgress',
  function(up, file) {

      $("#docuPdfUploadContainer .statusBar .percent").html(file.percent + '%');
      $("#docuPdfUploadContainer .statusBar .graphWrap .graph").css('width', file.percent + '%');

  });

  docuPdfUploader.bind('FileUploaded',
  function(up, file, info) {
      var response = $.parseJSON(info.response);

      if (response.success)
      {
          $.noticeMessage(response.message);
          $("input[value=" + file.id + "]").parent().find('img').remove();
          $("input[value=" + file.id + "]").show().attr('id', 'picture-' + response.picture.id).attr("rel", response.picture.url).attr('value', 'picture-' + response.picture.id);
          $("input[value=" + file.id + "]").parent().parent().find('td.status').html('<img src="/images/validate_ok.gif"/>');
      }
      else
      {
          $.errorMessage(response.message);
          $("input[value=" + file.id + "]").parent().find('img').remove();
          $("input[value=" + file.id + "]").show();
      }
  });


  docuPdfUploader.bind('ChunkUploaded',
  function(up, file, info) {

      });


  //docuPdfUploader.refresh();
  $('#descUploaderChkToggle').change(function(e) {

      if ($(this).attr('checked'))
      {
          $("#uploader0 tbody input[type='checkbox']").attr('checked', true);
      }
      else
      {
          $("#uploader0 tbody input[type='checkbox']").attr('checked', false);
      }
  });


  $("#docuPdfDeleteBtn").click(function(e) {
      e.preventDefault();

      var picDelete = {
          ids: {
              picture_ids: []
          },
          trs: [],
          addIds: function(index, item) {
              if ($(item).val().match("picture-"))
              {
                  this.ids.picture_ids.push($(item).val().split('-')[1]);
                  this.trs.push($(item).parent().parent());
              }
              else
              {
                  docuPdfUploader.removeFile(docuPdfUploader.getFile($(item).val()));
                  $(item).parent().parent().remove();
              }

              $(item).replaceWith('<img src="/images/docuPdfUploader_ajaxloader.gif"/>');
          },
          success: function(data) {
              if (data.success)
              {
                  $.noticeMessage("성공적으로 이미지를 삭제하였습니다.");
                  for (var i = 0; i < this.trs.length; i++)
                  {
                      $(this.trs[i]).remove();
                  }

              }
          }

      };

      $("#uploader0 tbody input[type='checkbox']:checked").each($.proxy(picDelete.addIds, picDelete));
      $.ajax({
          type: 'DELETE',
          url: '/posts/' + post_id + '/delete_files.json',
          data: $.param(picDelete.ids),
          success: $.proxy(picDelete.success, picDelete)
      });




  });

  $("#docuPdfInsertBtn").click(function(e) {
      e.preventDefault();

      $("#uploader0 tbody input[type='checkbox']:checked").each(function(index, item) {
          editor[0].execCommand('InsertImage', $(item).attr('rel'));
          editor[0].focus();
          editor[0].updateTextArea();
      });
  });
 
 
});