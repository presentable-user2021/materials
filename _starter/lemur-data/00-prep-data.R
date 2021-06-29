library(tidyverse)
library(lubridate)

taxonomic_code <-
  tibble::tribble(
    ~taxon,                    ~latin_name,                   ~common_name,
    "CMEAD",          "Cheirogaleus medius",       "Fat-tailed dwarf lemur",
    "DMAD", "Daubentonia madagascariensis",                      "Aye-aye",
    "EALB",            "Eulemur albifrons",    "White-fronted brown lemur",
    "ECOL",             "Eulemur collaris",         "Collared brown lemur",
    "ECOR",            "Eulemur coronatus",                "Crowned lemur",
    "EFLA",           "Eulemur flavifrons",        "Blue-eyed black lemur",
    "EFUL",               "Eulemur fulvus",           "Common brown lemur",
    "EMAC",               "Eulemur macaco",                  "Black lemur",
    "EMON",               "Eulemur mongoz",               "Mongoose lemur",
    "ERUB",          "Eulemur rubriventer",            "Red-bellied lemur",
    "ERUF",                "Eulemur rufus",      "Red-fronted brown lemur",
    "ESAN",             "Eulemur sanfordi",        "Sanford's brown lemur",
    "EUL",              "Eulemur Eulemur",                       "hybrid",
    "GMOH",                "Galago moholi",               "Mohol bushbaby",
    "HGG",    "Hapalemur griseus griseus",  "Eastern lesser bamboo lemur",
    "LCAT",                  "Lemur catta",            "Ring-tailed lemur",
    "LTAR",            "Loris tardigradus",                "Slender loris",
    "MMUR",           "Mircocebus murinus",             "Gray mouse lemur",
    "MZAZ",              "Mirza coquereli",   "Northern giant mouse lemur",
    "NCOU",           "Nycticebus coucang",                   "Slow loris",
    "NPYG",          "Nycticebus pygmaeus",             "Pygmy slow loris",
    "OGG", "Otolemur garnettii garnettii",      "Northern greater galago",
    "PCOQ",        "Propithecus coquereli",            "Coquerel's sifaka",
    "PPOT",           "Perodicticus potto",                        "Potto",
    "VAR",              "Varecia Varecia",                       "hybrid",
    "VRUB",                "Varecia rubra",             "Red ruffed lemur",
    "VVV",  "Varecia variegata variegata", "Black-and-white ruffed lemur"
  )

lemurs <-
  # downloaded from https://www.kaggle.com/jessemostipak/duke-lemur-center-data
  read_csv("lemur_data_original.csv", guess_max = 1e4) %>%
  janitor::clean_names() %>%
  left_join(taxonomic_code, by = "taxon")

lemurs %>%
  select(
    common_name, name, current_resident, dob, birth_type, dod,
    age = age_max_live_or_dead_y,
    weight = weight_g,
    age_at_wt_y
  ) %>%
  mutate(
    across(ends_with("name"), str_to_title),
    birth_type = recode(
      birth_type,
      CB = "captive",
      WB = "wild",
      Unk = "unknown"
    )
  ) %>%
  group_by(common_name, name, dob, birth_type) %>%
  slice_max(age_at_wt_y) %>%
  ungroup() %>%
  write_csv("lemurs.csv") %>%
  write_rds("lemurs.rds", compress = "gz")
