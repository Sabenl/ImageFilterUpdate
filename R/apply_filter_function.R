



# Apply the filter
apply_filter <- function(image_path, filter_type, RGB) {
  # Load the image
  original_image <- image_read(image_path)
  # Convert the image to a bitmap and raw vector
  bitmap <- original_image[[1]]
  vector_for_filter <- as.integer(as.raw(bitmap))
  # Initialize a variable for the processed raw vector
  processed_raw <- NULL
  # Apply the filter
  # Apply the appropriate filter based on filter_type
  if (filter_type == "grayscale_filter") {
    processed_raw <- grayscale_filter(vector_for_filter)
  } else if (filter_type == "cutoff_filter") {
    processed_raw <- grayscale_filter_cutoff(vector_for_filter)
  } else if (filter_type == "red_filter") {
    processed_raw <- color_filter(vector_for_filter, color = "red")
  } else if (filter_type == "green_filter") {
    processed_raw <- color_filter(vector_for_filter, color = "green")
  } else if (filter_type == "blue_filter") {
    processed_raw <- color_filter(vector_for_filter, color = "blue")
  } else if (filter_type == "custom_filter") {
    processed_raw <- any_color_filter(vector_for_filter, RGB)
  } else {
    stop("Invalid filter type. Choose from 'grayscale_filter', 'cutoff_filter', 'red_filter', 'green_filter', 'blue_filter', or 'custom_filter'.")
  }
  # Convert the processed raw vector back to a bitmap
  processed_bitmap <- convert_raw_to_bitmap(processed_raw, bitmap)
  # Create the final image
  final_image <- image_read(processed_bitmap)
}
