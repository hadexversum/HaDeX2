header <- readLines("inst/header.Rmd")

chosen_files <- c("vignettes/statistics.Rmd", 
                  "vignettes/version_comparison.Rmd", 
                  "vignettes/example.Rmd", 
                  "vignettes/datafiles.Rmd",
                  "vignettes/visualization.Rmd")

supplementary_lines <- unlist(lapply(chosen_files, function(ith_file) {
  
  all_lines <- gsub("^#", "##", x = readLines(ith_file))

  setup_line <- grep("^```\\{r setup", all_lines)
  
  all_lines[setup_line] <- gsub("^```\\{r setup", paste0("```\\{r ", "setup", tools::file_path_sans_ext(basename(ith_file))), 
       all_lines[setup_line])
  
  c(paste0("# ", gsub('"', '', strsplit(all_lines[grep("^title:", all_lines)], ": ")[[1]][2])),
    all_lines[(max(which(all_lines == "---")) + 1):length(all_lines)], "\n\n")
}))

cat(c(header, supplementary_lines), sep = "\n", file = "./vignettes/supplementary.Rmd")

rmarkdown::render(input = "./vignettes/supplementary.Rmd", 
                  output_format = bookdown::pdf_document2(), 
                  output_dir = "inst",
                  output_options = list(always_allow_html = "true"))

unlink("./vignettes/supplementary.Rmd")
