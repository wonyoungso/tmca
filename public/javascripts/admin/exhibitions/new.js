$(document).ready(function(e){
  $("#exhibitionNewTextArea").cleditor({width: 870, height:500});
  
  console.log(mediumPos);
  $("img#bigPhotoMedium").imgAreaSelect({
    x1: mediumPos.x1, y1: mediumPos.y1, x2: mediumPos.x2, y2: mediumPos.y2, aspectRatio: '320:540', onSelectChange: mediumPreview 
  });  
  $("img#bigPhotoThumb").imgAreaSelect({
     x1: thumbPos.x1, y1: thumbPos.y1, x2: thumbPos.x2, y2: thumbPos.y2, aspectRatio: '1:1', onSelectChange: thumbPreview
  });

  
});


function mediumPreview(img, selection){
    $('#exhibition_x1medium').val(selection.x1);
    $('#exhibition_y1medium').val(selection.y1);
    $('#exhibition_widthmedium').val(selection.width);
    $('#exhibition_heightmedium').val(selection.height);
    
    var scaleX = 320 / (selection.width || 1); 
    var scaleY = 520 / (selection.height || 1); 
    
    $('#mediumPreview .preview div img').css({ width: Math.round(scaleX * $("img#bigPhotoMedium").width()) + 'px', height: Math.round(scaleY * $("img#bigPhotoMedium").height()) + 'px', marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px', marginTop: '-' + Math.round(scaleY * selection.y1) + 'px' });

    
}



function thumbPreview(img, selection){
    $('#exhibition_x1thumb').val(selection.x1);
    $('#exhibition_y1thumb').val(selection.y1);
    $('#exhibition_widththumb').val(selection.width);
    $('#exhibition_heightthumb').val(selection.height);
    
    var scaleX = 100 / (selection.width || 1); 
    var scaleY = 100 / (selection.height || 1);
    $('#thumbPreview .preview div img').css({ width: Math.round(scaleX * $("img#bigPhotoThumb").width()) + 'px', height: Math.round(scaleY * $("img#bigPhotoThumb").height()) + 'px', marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px', marginTop: '-' + Math.round(scaleY * selection.y1) + 'px' });


}
