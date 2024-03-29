# script to create the DESCRIPTION file

# Remove default DESC and NEWS.md
unlink("DESCRIPTION")
unlink("NEWS.md")

# update renv packages if needed
renv::clean()
renv::snapshot(prompt = TRUE)


# initial files -----------------------------------------------------------

# Create a new description object
my_desc <- desc::description$new("!new")
my_news <- newsmd::newsmd()

# Set your package name
my_desc$set("Package", "shinyTimer")
# Set license
my_desc$set("License", "MIT + file LICENSE")

# Remove some author fields
my_desc$del("Maintainer")
# Set the version
my_desc$set_version("0.0.0.9000")
# The title of your package
my_desc$set(Title = "Creation of NEWS.md File")
# The description of your package
my_desc$set(Description =
  paste0("Adding updates (version or bullet points) to the NEWS.md file."))
# The urls
my_desc$set("URL", "https://github.com/Dschaykib/shinyTimer")
my_desc$set("BugReports",
            "https://github.com/Dschaykib/shinyTimer/issues")

#Set authors
my_desc$set("Authors@R",
            paste0("person('Jakob', 'Gepp',",
                   "email = 'jakob.gepp@statworx.com',",
                   "role = c('cre', 'aut'))"))

# set R version
my_desc$set_dep("R", type = desc::dep_types[2], version = ">= 4.0.5")

# set suggests
my_desc$set_dep("newsmd", type = desc::dep_types[3], version = "*")
my_desc$set_dep("origin", type = desc::dep_types[3], version = "*")

# set dependencies
my_desc$set_dep("htmlwidgets", type = desc::dep_types[1])



# initial functions -------------------------------------------------------

my_desc$bump_version("patch")
my_news$add_version(my_desc$get_version())

my_news$add_bullet(c("adding newsmd for easier creation"))


# WIP ---------------------------------------------------------------------

# bump dev version
my_desc$bump_version("dev")
my_news$add_version(my_desc$get_version())
my_news$add_bullet(c("current dev version"))


# save everything ---------------------------------------------------------

my_desc$set("Date", Sys.Date())
my_desc$write(file = "DESCRIPTION")
my_news$write(file = "NEWS.md")

# set CRAN version number in README
my_readme <- readLines("README.md")
my_readme[1] <- paste0(
  "# shinyTimer - ", my_desc$get_version())
# set dev version number
my_readme <- gsub(pattern = "badge/Version-.*-success",
                  replacement = paste0("badge/Version-",
                                       my_desc$get_version(),
                                       "-success"),
                  x = my_readme)

writeLines(my_readme, "README.md")


# set pkg names
origin::originize_pkg(ask_before_applying_changes = FALSE)

# update documentation
roxygen2::roxygenise()
# tidy DESCRIPTON
usethis::use_tidy_description()
