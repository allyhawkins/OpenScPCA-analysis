#!/usr/bin/env Rscript
#
# This script performs cell type annotation on an SCE using a given SingleR model
# The script exports an RDS file containing the full SingleR result DataFrame object
#  and a TSV file containing only annotations and delta.next values

suppressWarnings({
  suppressPackageStartupMessages({
    library(optparse)
    library(SingleCellExperiment)
  })
})

option_list <- list(
  make_option(
    opt_str = c("--sce_file"),
    type = "character",
    default = "",
    help = "Input SCE object to run SingleR on"
  ),
  make_option(
    opt_str = c("--singler_model_file"),
    type = "character",
    default = "",
    help = "Path to trained SingleR model"
  ),
  make_option(
    opt_str = c("--singler_output_tsv"),
    type = "character",
    default = "",
    help = "Path to output TSV file to save lightweight SingleR annotations"
  ),
  make_option(
    opt_str = c("--singler_output_rds"),
    type = "character",
    default = "",
    help = "Path to output RDS file to save SingleR result DataFrame"
  ),
  make_option(
    opt_str = c("--threads"),
    type = "integer",
    default = 4,
    help = "Number of threads for SingleR to use"
  ),
  make_option(
    opt_str = c("--seed"),
    type = "integer",
    default = 2025,
    help = "Random seed"
  )
)

# Parse options and check arguments
opts <- parse_args(OptionParser(option_list = option_list))
stopifnot(
  "sce_file does not exist" = file.exists(opts$sce_file),
  "singler_model_file does not exist" = file.exists(opts$singler_model_file)
)
set.seed(opts$seed)

if (opts$threads == 1) {
  bp_param <- BiocParallel::SerialParam()
} else {
  bp_param <- BiocParallel::MulticoreParam(opts$threads)
}

# Read trained model
singler_model <- readRDS(opts$singler_model_file)

# Read query SCE and convert ids to symbols
# note that ids that don't map will retain Ensembl ids
sce <- readRDS(opts$sce_file) |>
  # use the gene_symbols column in the sce object for mapping
  rOpenScPCA::sce_to_symbols(reference = "sce")

# Perform annotation
singler_result <- SingleR::classifySingleR(
  sce,
  singler_model,
  BPPARAM = bp_param
)

# Extract TSV to save separately
singler_df <- singler_result |>
  # keep only labels, delta.next, and pruned.labels
  purrr::discard_at("scores") |>
  as.data.frame() |>
  tibble::rownames_to_column("barcodes")

# Export RDS and TSV
readr::write_rds(singler_result, opts$singler_output_rds)
readr::write_tsv(singler_df, opts$singler_output_tsv)
