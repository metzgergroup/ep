# Employment Projections database

https://www.bls.gov/emp/data/occupational-data.htm

This repo creates a database image with employment projections.

Download the National Employment Matrix

    wget https://www.bls.gov/emp/ind-occ-matrix/matrix.xlsx

Open in Excel. Normalize the data into 3 tables (`employment_projection`, `industry`, and `occupation`) by deleting calculated or unnecessary columns and save each new table in csv format.

Convert files to Unix format

    dos2unix employment_projection.csv
    dos2unix industry.csv
    dos2unix occupation.csv

Remove duplicates in the `industry` and `occupation` tables

    awk '!seen[$0]++' industry.csv > industry.tmp && mv -f industry.tmp industry.csv
    awk '!seen[$0]++' occupation.csv > occupation.tmp && mv -f occupation.tmp occupation.csv

Remove headers (if not already done)

    industry.csv -> Industry type,Industry code,Industry title
    occupation.csv -> Occupation type,Occupation code,Occupation title
    employment_projection.csv -> Occupation code,Industry code,2016 Employment,2026 Employment

Optional: add job openings

    https://www.bls.gov/emp/ind-occ-matrix/occupation.xlsx
