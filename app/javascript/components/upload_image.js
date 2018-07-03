const uploadImages = () => {
  const images = document.querySelectorAll(".upload_image");
  const imagesContainer = document.getElementById("upload-images");

  const upload_file = (image) => {
    const imageLabel = document.querySelectorAll(".upload_image .image-labels");
    const input = image.querySelector("input");

    input.addEventListener("change", (event) => {
      image.classList.remove("small-btn");
      imageLabel.forEach(label=>{
        label.remove();
      })
      Array.from(event.currentTarget.files).forEach((file) => {
        image.insertAdjacentHTML("beforeend", `<div>${file.name}</div>`);
      });
      const deleteButton = document.createElement("div");
      deleteButton.classList.add("delete-image");
      deleteButton.innerHTML = '<i class="far fa-trash-alt ml-3"></i>';
      image.append(deleteButton);
      deleteButton.addEventListener("click", (event) => {
        image.remove();
      });

      const newImage = document.createElement("label");
      newImage.classList.add("small-btn");
      newImage.classList.add("upload_image");
      newImage.insertAdjacentHTML("beforeend", '<p class="m-0 image-labels">Ajouter une image</p><input multiple="multiple" data-direct-upload-url="/rails/active_storage/direct_uploads" type="file" name="landing_page[images][]" id="landing_page_images">');
      imagesContainer.append(newImage);
      upload_file(newImage);

      const btn = document.querySelectorAll("label.small-btn.upload_image");
      if(btn.length > 1){
        btn[0].remove();
      }
    });
  }

  images.forEach(upload_file);
}

export { uploadImages };
