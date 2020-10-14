# Greater Manchester Combined Authority Expenditure Data

This contains CSV files of the ten councils in the GMCA - 

It is compiled from Local Open Data Governemnt Expenditure files and 
covers the period 01/01/2019 - 31/12/2019.

The data has been 'cleaned' and enriched. Company names have been matched
to the Companies House Data Set(CHDS) where possible and SIC codes added. The
method of matching is currently under development.

Parish, Town and Council Names have been verified against an Office for National 
Statistics(ONS) list of Parishes from the Open Geography Portal

Government Bodies and NGO have been synced to a NWOD database(in progress)

The difference between this dataset and the Cumbria dataset is as follows
* Slight improvements to Companies House matching
* Addition of Charities matching (Charities Commission)
* Addition of  Care Home matching (Care Quality Commission)
* Addition of Hospital and Medical matching (NHS & CQC)
* Addition of Educational matching (Ofsted data)

Some of the issues encountered are described in more detail on the 
[Northwest Open Data Website](http://www.northwestopendata.org.uk/).

## CSV File Description
### Column Names and Descriptions
| Column Name       | Column Description                                                   |
|-------------------|----------------------------------------------------------------------|
|`nwod_id_uri_code` | This is the the 'Local Authority Code', eg E07000026 for Allerdale and can provide links to postcode and geographic data. This has been added as part of processing the CSV files. |
|`nwod_id`          | This is an internal row identifier back to the original table of council data |
|`org_short_name`   | A short name for a district council, See Table 2.0 for list of org_short_name |
|`beneficiary_name` | This is the original beneficiary name as it appeared in the council CSV file |
|`payment_date`     | The payment date from the original data file |
|`amount`           | The amount paid to beneficiary, this has been reformatted from various formats to numeric(20,2) |
|`clean_name`       | This is beneficiary_name that has been UPPER() and TRIM()'d |
|`naked_name`       | naked_name id clean_name with all company name 'furniture' removed, See Table 3.0 for examples |
|`company_name`     | company_name is the final matched name after processing, where match_method is 0, matching has been unsuccesful and company_name is set to clean_name |
|`company_number`   | If match_method !=0, a company number will be populated from the Companies House Data set. |
|`charity_number`   | See Table 4 |
|`sicc_int`         |  If match_method !=0, a SIC Code will be populated from the Companies House Data set. |
|`match_method`     | An internal identifier to indicate at what stage matching was successful, as a general rule the lower the match_method the more reliable the match result. eg. match_method=1 are a direct join between clean_name and companyname in the CHDS |


### Table 2 : org_short_name/Council Name
| org_short_name | Council Name                            |
|----------------|-----------------------------------------|
| trafford       | Trafford Metropolitan Borough Council   |
| stockport      | Stockport Metropolitan Borough Council  |
| bury           | Bury  Metropolitan Borough Council      |
| manchester     | Manchester City Council                 |
| rochdale       | Rochdale Metropolitan Borough Council   |
| oldham         | Oldham Metropolitan Borough Council     |
| wigan          | Wigan Metropolitan Borough Council      |
| bolton         | Bolton Metropolitan Borough Council     |
| salford        | Salford Metropolitan Borough Council    |

### Table 3 : Examples of 'Company Name Furniture'
| Item |
|------|
| LTD |
| LTD. |
| LIMITED |
| LLP |
| PLC |
| T/A % |

### Table 4 : charity_number description
| Prefix       | Description |
|--------------|--------------|
| CHC-NNNNNNNN | Matched against Charity Commission Dataset
| CQC-N-NNNNNN | Matched against Care Quality Commission Dataset
| NHS-XXXX     | Matched against NHS Dataset
| PRN-NNNNNNNN | Matched against Ofsted Dataset
| URN-NNNNNNNN | Matched against Ofsted Dataset


## Some Important Points to Consider
1. Payments that councils make are more diverse than corporates, they include
   * Commercial Entities
   * Charitable Organisations
   * Other Councils
   * Professional Bodies
   * Government Departments
   * NGOs
2. Some companies have many divisions, where these have a high proportion of spends 
in the dataset there is some consolodation to the top level 'Holding' company
eg

````
             clean_name              |         match_company_name
-------------------------------------+-------------------------------------
 THOMAS ARMSTRONG CONSTRUCTION LTD   | THOMAS ARMSTRONG (HOLDINGS) LIMITED
 THOMAS ARMSTRONG (CONSTRUCTION) LTD | THOMAS ARMSTRONG (HOLDINGS) LIMITED
 THOMAS ARMSTRONG LTD                | THOMAS ARMSTRONG (HOLDINGS) LIMITED
 THOMAS ARMSTRONG (CONSTRUCTION) LTD | THOMAS ARMSTRONG (HOLDINGS) LIMITED
 THOMAS ARMSTRONG (CONSTRUCTION) LTD | THOMAS ARMSTRONG (HOLDINGS) LIMITED
 THOMAS ARMSTRONG CONSTRUCTION       | THOMAS ARMSTRONG (HOLDINGS) LIMITED
 THOMAS ARMSTRONG - LINDEN/KAYTOOLS  | THOMAS ARMSTRONG (HOLDINGS) LIMITED
 THOMAS ARMSTRONG - CONSTRUCTION     | THOMAS ARMSTRONG (HOLDINGS) LIMITED
````

3. The addition of SIC codes provides a proxy for Category in the absence of 
a universal category used by all councils. It provides a starting point to compare 
category spending between councils

4. Match rates can be looked at in a number of ways, but here's some figures for the dataset

````
 org_short_name | total_rows |  min_date  |  max_date  | map_entries | m_percent | total_spend
----------------+------------+------------+------------+-------------+-----------+--------------
 trafford       |    1798399 | 2019-01-02 | 2019-12-23 |        2289 |     76.51 | 659649761.03
 wigan          |      67306 | 2019-12-31 | 2019-12-31 |        2587 |     82.90 | 360843319.69
 rochdale       |     287620 | 2019-01-02 | 2019-12-30 |        2639 |     78.28 | 321704191.34
````
The map_entries is the number of individual companies per council, the m_percent is the percent
of beneficiaries that have been match to external datasets. Generally the matched amount will be 
higher than this number.

## Caveat Emptor
> _The principle that the buyer alone is responsible for checking the quality and suitability of goods before a purchase is made._

Whilst all care has been taken in preparing and matching company names in this file, the 
process is still under development and it is advised that you will need to check back to 
the original files for the corect company names. Indeed the original data may not provide
enough data to correctly identify companies without issuing FOI requests for clarification.
