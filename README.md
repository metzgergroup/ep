# Employment Projections database

https://www.bls.gov/emp/data/occupational-data.htm

This repo creates a database image with employment projections for each sector.

Source files are manually downloaded, cleaned, and converted from Excel format to csv format. The image is then built, tagged, and pushed to the registry using the included Makefile.

    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_110000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_210000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_220000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_230000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_31-330.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_420000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_44-450.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_48-490.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_510000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_520000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_530000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_540000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_550000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_560000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_610000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_620000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_710000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_720000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_810000.xlsx
    wget https://www.bls.gov/emp/ind-occ-matrix/ind_xlsx/ind_900000.xlsx
