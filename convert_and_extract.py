import pandas

df = pandas.read_excel('docker-scripts/data/matrix.xlsx')

employment_projection = df[['Occupation code', 'Industry code', '2018 Employment', '2028 Employment']]
employment_projection[['2018 Employment', '2028 Employment']] = employment_projection[['2018 Employment', '2028 Employment']].multiply(1000)
employment_projection.to_csv('docker-scripts/data/employment_projection.csv', index=False, header=False)

industry = df[['Industry code', 'Industry type', 'Industry title']]
industry = industry.drop_duplicates()
industry.to_csv('docker-scripts/data/industry.csv', index=False, header=False)

occupation = df[['Occupation code', 'Occupation type', 'Occupation title']]
occupation = occupation.drop_duplicates()
occupation.to_csv('docker-scripts/data/occupation.csv', index=False, header=False)
