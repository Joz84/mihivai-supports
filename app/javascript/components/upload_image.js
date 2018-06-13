const uploadImages = () => {
  const images = document.querySelectorAll(".upload_image");
  const imagesContainer = document.getElementById("upload-images");

  const upload_file = (image) => {
    const input = image.querySelector("input");
    input.addEventListener("change", (event) => {
      Array.from(event.currentTarget.files).forEach((file) => {
        image.insertAdjacentHTML("beforeend", `<div>${file.name}</div>`);
      });
      const deleteButton = document.createElement("div");
      deleteButton.classList.add("delete-image");
      deleteButton.innerText = 'Delete image';
      image.append(deleteButton);
      deleteButton.addEventListener("click", (event) => {
        image.remove();
      });

      event.currentTarget.style.display = "none";

      const newImage = document.createElement("div");
      newImage.classList.add("upload_image");
      newImage.insertAdjacentHTML("beforeend", '<input multiple="multiple" data-direct-upload-url="/rails/active_storage/direct_uploads" type="file" name="landing_page[images][]" id="landing_page_images">');
      imagesContainer.append(newImage);
      upload_file(newImage);
    });
  }

  images.forEach(upload_file);
}

export { uploadImages };
