#' Applies the color filter
#'
#' Loads the image from th image_path object and converts it into a bitmap and the vector_for_filter
#' required for the filter functions. Returns a final_image with your applied filter which can
#' be printed or saved. Uses both the filter function and the convert to bitmap function.
#'
#'@param image_path an object to which you have assigned the path or name (if in WD) to the image you want to filter.
#'@param filter_type choose between the different filter types: "grayscale_filter", "red_filter", "blue_filter", "green_filter", "cutoff_filter" or "custom_filter".
#'@param RGB = c(255, 0, 255) # Choose three RBG values (0-255) to customize the color if "custom_filter" chosen
#'@return a filtered image converted back to a bitmap
#'@examples
#' # example code
#'
#'# Load libraries
#' library(magick)
#' # The payth do your image, or name if in the WD
#' image_path <- "Path/to/your/image_1.jpg"
#' # Apply the filter of choice
#' filtered_image <- apply_filter(image_path, "grayscale_filter")
#' # Will generate an "filtered_image" object which can be printed and saved.
#' print(filtered_image) # View the final image
#' image_write(filtered_image, path = "my_image.jpg", format = "jpeg") # Save the final image as a JPEG.
#'

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
