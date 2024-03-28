document.addEventListener('turbolinks:load', function(){
  console.log("DOM fully loaded and parsed with Turbolinks");
  
  const postForm = document.getElementById('new_post');
  console.log("postForm: ", postForm);

  const previewList = document.getElementById('previews');
  console.log("previewList: ", previewList);

  if (!postForm) return null;
  console.log("preview.jsが読み込まれました");

  const fileField = document.querySelector('input[type="file"][name="post[post_image]"]');
  if (!fileField){
    console.log("fileField is not found.");
    return;
  }
  console.log("fileField: ", fileField);

  fileField.addEventListener('change', function(e){
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
      console.log("Removed existing preview");
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);

    console.log("Preview appended");
  });
});