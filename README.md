# Employment Projections database

https://www.bls.gov/emp/data/occupational-data.htm

This repo creates a database image with employment projections.

[BLS page for employment projections](https://www.bls.gov/emp/data/occupational-data.htm)

Install dependencies:

    pip3 install pandas xlrd

Download the National Employment Matrix and prepare for insert:

    make data

Build docker image containing database:

    make build

Optional: add job openings

    https://www.bls.gov/emp/ind-occ-matrix/occupation.xlsx
