# North West England Local Government Transparency Data - Cleaned and Curated

## Introduction
This repository contains curated and cleaned spending data from local councils in the North 
West of England. Spending data from one council is _messy_ when trying to compare between
councils it becomes _complicated_. The files in this repo are simplified versions of the originals
the contain the following key original data

* Payment_date - could be booked date, paid date 
* Amount - there are all converted to and extracted from a mumeric(20,2) datatype
* Company_name - this may be a Company/Charity/Other Council/Governement body etc

The data has been enriched where possible

* Company Number - where matched to Companies House Dataset
* Charity Number - a number where matched to other dataset, Charities/CQC etc
* SIC Code - from Companies House dataset
* Nwod_id_uri_code - the GIS code from the ONS for the local council

Other items are also included

* nwod_id - a line number lookup to the raw data tables
* beneficiary_name/clean_name - upper case of the original name in council dataset
* naked_name - used in matching process
* match method - a tag to indicate at what stage of matching process identified a company_name

These files are the product of a developing process of matching poorly formatted beneficiaries
to reference datasets

* Version 1 was a manual discovery of the datasets, no examples here
* Version 2 - covers the Cumbria dataset, first steps to match Co House data
* Version 2+ - covers Manchester and Merseyside datasets, includes matching to other datasets

Further information can be found on [Northwest Open Data Website](http://www.northwestopendata.org.uk/)

---

## Example Uses
<iframe src='https://flo.uri.sh/visualisation/4239576/embed' title='Interactive or visual content' frameborder='0' scrolling='no' style='width:100%;height:600px;'></iframe><div style='width:100%!;margin-top:4px!important;text-align:right!important;'><a class='flourish-credit' href='https://public.flourish.studio/visualisation/4239576/?utm_source=embed&utm_campaign=visualisation/4239576' target='_top' style='text-decoration:none!important'><img alt='Made with Flourish' src='https://public.flourish.studio/resources/made_with_flourish.svg' style='width:105px!important;height:16px!important;border:none!important;margin:0!important;'> </a></div>

See Also

* [Cumbria Infographic](https://drive.google.com/file/d/18dnQgnLOd23NmBEzRZPMAd8WCeoIjevP/view?usp=sharing)
* [Greater Manchester 2019 Spends](https://public.flourish.studio/visualisation/4239576/)

## License
* Data : [Open Government License](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)
* Other scripts : [MIT](http://opensource.org/licenses/mit-license.php) - Copyright © Northwestopendata

## Caveat Emptor
> _The principle that the buyer alone is responsible for checking the quality and suitability of goods before a purchase is made._

Whilst all care has been taken in preparing and matching company names in this file, the 
process is still under development and it is advised that you will need to check back to 
the original files for the corect company names. Indeed the original data may not provide
enough data to correctly identify companies without issuing FOI requests for clarification.
