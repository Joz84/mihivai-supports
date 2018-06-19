const uploadImages = () => {
  const images = document.querySelectorAll(".upload_image");
  const imagesContainer = document.getElementById("upload-images");

  const upload_file = (image) => {
    const input = image.querySelector("input");
    input.addEventListener("change", (event) => {
      image.classList.remove("small-btn");
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

      event.currentTarget.style.display = "none";

      const newImage = document.createElement("label");
      newImage.classList.add("small-btn");
      newImage.classList.add("upload_image");
      newImage.insertAdjacentHTML("beforeend", 'Ajouter une image<input multiple="multiple" data-direct-upload-url="/rails/active_storage/direct_uploads" type="file" name="landing_page[images][]" id="landing_page_images">');
      imagesContainer.append(newImage);
      upload_file(newImage);
    });
  }

  images.forEach(upload_file);
}

export { uploadImages };
