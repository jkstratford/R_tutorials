#rm(list=ls())

#-----------------------------------------------------
# Learning how to submit HTTP requests via httr 
# package in R
#
# Author: Jeran Stratford
# Date: 07OCT2022
#
#-----------------------------------------------------

#-----------------------------------------------------
# Tutorial
# https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
#-----------------------------------------------------

#-----------------------------------------------------
# Use case
# I need to be able to map drug IDs to determine
# which drugs are in multiple databases
# DrugBank and TTD had ChEBI IDs 
# Pharos has Chembl IDs
#
# Chembl has an API that will help with this
# Documentation can be found here: 
#   https://chembl.gitbook.io/chembl-interface-documentation/web-services/chembl-data-web-services
#
# The API with synonyms is the molecule API
#   https://www.ebi.ac.uk/chembl/api/data/molecule
#
# Can search by Chembl ID
#   https://www.ebi.ac.uk/chembl/api/data/molecule.yaml?chembl_id=CHEMBL25
# Can also search by CHEBI ID
#   https://www.ebi.ac.uk/chembl/api/data/molecule.yaml?chebi_par_id=15365
# Can also search by PubChem SID
#   https://www.ebi.ac.uk/chembl/api/data/molecule.yaml?xref_name=SID:%20144203627
#-----------------------------------------------------

#-----------------------------------------------------
# Setup global argument
#-----------------------------------------------------
args <- list()
args$api <- "https://www.ebi.ac.uk/chembl/api/data/molecule"
args$chembl <- "CHEMBL25"
args$chebi <- "15365"

#-----------------------------------------------------
# Load required packages
#-----------------------------------------------------
#require(rvest)
require(httr)


#-----------------------------------------------------
# Structure a query
#-----------------------------------------------------
url <- paste0(args$api, "?", "chembl_id=", args$chembl)


#-----------------------------------------------------
# Query the API
#
# GET() is used by your browser when requesting a page, 
# POST() is (usually) used when submitting a form to a server.
#-----------------------------------------------------
r <- GET("http://httpbin.org/get")
r <- GET(url)

#-----------------------------------------------------
# Check the status of the call to the API
#-----------------------------------------------------
status_code(r)
http_status(r)
warn_for_status(r)
stop_for_status(r)
# https://restfulapi.net/http-status-codes/
# Informational responses (100–199)
# Successful responses (200–299)
# Redirection messages (300–399)
# Client error responses (400–499)
# Server error responses (500–599)

#-----------------------------------------------------
# Access the body of the request
#
# content(r, "text", encoding = "ISO-8859-1") accesses the body as a character vector
#-----------------------------------------------------


