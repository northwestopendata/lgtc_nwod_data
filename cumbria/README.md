# Cumbria Expenditure Data

This contains a CSV file of the six district councils in Cumbria - 
Allerdale, Barrow in Furness, Copeland Borough Councils, Eden, 
South Lakeland District Councils and Carlisle City Council. 

It is compiled from Local Open Data Governemnt Expenditure files and 
covers the period 01/01/2019 - 31/12/2019.

The data has been 'cleaned' and enriched. Company names have been matched
to the Companies House Data Set(CHDS) where possible and SIC codes added. The
method of matching is currently under development.

Parish, Town and Council Names have been verified against an Office for National 
Statistics(ONS) list of Parishes from the Open Geography Portal

Government Bodies and NGO have been synced to a NWOD database(in progress)

Some of the issues encountered are described in more detail on the 
[Northwest Open Data Website](http://www.northwestopendata.org.uk/).
Specific posts of interest are

* [Cumbria Spends : Database Import](http://www.northwestopendata.org.uk/cumbria-spends-database-import/)
* [Cumbria Spends : Aggregation & Review](http://www.northwestopendata.org.uk/cumbria-spends-aggregation-review/)
* [Cumbria Spends : Redacted](http://www.northwestopendata.org.uk/cumbria-spends-redacted/)

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
|`charity_number`   | Available for future use |
|`sicc_int`         |  If match_method !=0, a SIC Code will be populated from the Companies House Data set. |
|`match_method`     | An internal identifier to indicate at what stage matching was successful, as a general rule the lower the match_method the more reliable the match result. eg. match_method=1 are a direct join between clean_name and companyname in the CHDS |


### Table 2 : org_short_name/Council Name
| org_short_name | Council Name                      |
|----------------|-----------------------------------|
| allerdale      | Allerdale Borough Council         |
| barrow i       | Barrow in Furness Borough Council |
| carlisle       | Carlisle City Council             |
| copeland       | Copeland Borough Council          |
| eden           | Eden District Council             |
| southlakes     | South Lakeland District Council   |

### Table 3 : Examples of 'Company Name Furniture'
| Item |
|------|
| LTD |
| LTD. |
| LIMITED |
| LLP |
| PLC |
| T/A % |

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
----------------+------------+------------+------------+-------------+-----------+-------------
 allerdale      |       5859 | 2018-12-20 | 2020-01-15 |         899 |     76.21 | 22515727.62
 copeland       |       1850 | 2019-01-04 | 2019-12-18 |         465 |     78.32 | 11095116.66
 barrow         |       3269 | 2019-01-02 | 2019-12-27 |         521 |     80.82 | 19222797.63
 eden           |       1612 | 2008-12-13 | 2019-12-30 |         429 |     84.49 | 25522077.93
 carlisle       |       8364 | 2019-01-03 | 2019-12-31 |        1027 |     76.91 | 17165852.46
 southlakes     |       6895 | 2018-12-05 | 2019-12-19 |         671 |     73.82 | 12196749.15
````
The map_entries is the number of individual companies per council, when those companies are 
correlated with the 2019 data the worst match percent is 73% and the best is 84%. The unmatched
companies account for 12% of the total expenditure.

## Caveat Emptor
> _The principle that the buyer alone is responsible for checking the quality and suitability of goods before a purchase is made._

Whilst all care has been taken in preparing and matching company names in this file, the 
process is still under development and it is advised that you will need to check back to 
the original files for the corect company names. Indeed the original data may not provide
enough data to correctly identify companies without issuing FOI requests for clarification.
