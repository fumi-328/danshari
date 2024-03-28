document.addEventListener('DOMContentLoaded', function(){
  console.log("DOM fully loaded and parsed");
  
  const postForm = document.getElementById('new_post');
  console.log("postForm: ", postForm);
  
  const previewList = document.getElementById('previews');
  console.log("previewList: ", previewList);
  
  if (!postForm) return null;

  const fileField = document.querySelector('input[type="file"][name="post[post_image]"]');
  console.log("fileField: ", fileField);
  
  if (!fileField){
    console.log("fileField is not found.");
    return;
  }

  fileField.addEventListener('change', function(e){
    console.log("File input changed");
    
    const alreadyPreview = document.querySelector('.preview');
    console.log("alreadyPreview: ", alreadyPreview);
    
    if (alreadyPreview) {
      alreadyPreview.remove();
      console.log("Removed existing preview");
    };
    
    const file = e.target.files[0];
    console.log("Selected file: ", file);
    
    const blob = window.URL.createObjectURL(file);
    console.log("Blob URL: ", blob);
    
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