# Soviet Journals Content and Authors, 1956-1990 

## Project dates
2021-2023
## Author
Daria Franklin 
## Attribution 
If you are using full dataset or its parts you must give appropriate credit, provide a link to the dataset, and indicate if changes were made. Use 'Cite this repository' option for appropritate citation. 
## Reporting Errors 
The data was collected and coded manually. Please report any errors on GitHub or via email d.franklin@columbia.edu. 

## DATA SOURCES 

Data is sourced from content pages of 2477 issues of six Soviet ‘thick’ (literary) journals spanning 35 years of the Soviet rule, 1956-1990: Novy Mir (New World), Iunost' (The Youth), Zvezda (The Star), Znamya (The Banner), Nash Sovremennik (Our Contemporary), Oktyabr' (October). 
Of the six journals, only Novy Mir and Zvezda have accessible fully digitalized archives. The contents data for the other four journals was sourced from the last (December) issues of every journal for each year and coded manually. The selection of December issues was determined by the journals' practice to publish all-year contents at the end of each year. 

First names are standardized (e.g. Евтушенко Е., Евтушенко Евг., Евтушенко Евген. - all coded as Евтушенко Евгений), and controlled for the possibility of full homonyms. In cases where potential homonyms (i.e. Pavlenko Pavel vs. Pavlenko P.) could not be reliably identified authors were assigned different IDs.    

Gender identification ('gender') is the function of Russian, Slavic, Baltic, and some Turkic last name endings and first names conventions. Instances of gender ambiguous morphological structure of first or last names are marked as 'NA'. 

Years of birth ('DOB_year') and death ('DOD_year') were sourced from various online and print sources (e.g. literary encyclopedias) and matched with the dataset on last and first names. Cases of unknown years as well as cases where attribution could not be established with certainty are marked as 'NA'. 

The information on membership in the Communist Party came from the lists of Party Members and then matched by last and first names, as well as active years. The Party membership information is incomplete due to incompleteness of lists of party members in general and discrepancies in the naming standards within various lists. 

Information about state awards (Stalin, Lenin and State Prizes) was sourced from publicly available lists of awards' recipients and then matched with the dataset by last and first names. 

Circulation size is denoted for the issues where it is known and estimated for missing issues. 


## CODING SPECIFICATIONS 
For coding specifications and detailed explanation of values please refer to the documenation on variables.

### Author ID ('author_id') 
Each unique author has a randomly assigned ID. Groups of authors ('author group') and editorials ('editors editors') are marked as '1' and '2' respectively. Groups of authors don't contain details of individual contributors. 

### Title ID ('title_id')
Each published title has a randomly assigned ID. Unique 'title_id' is assined to the following instances: 
1) one publication by one author in one issue of one journal   
  - Pavlov P., "Svet", Novy Mir, issue 3, 1958 (title_ID is 33)
2) one publication by two authors in one issue of one journal 
  - Pavlov P., "Svet", Novy Mir, issue 3, 1958 (title_ID is 33)
  - Komarov T., "Svet", Novy Mir, issue 3, 1958 (title_ID is 33)

  * _Note: publications authored by three or more authors are marked as "grouped authors"_
3) one publication by one author in two or more issues of the journal
  - Pavlov P., "Svet", Novy Mir, issue 3, 1958 (title_ID is 33)
  - Pavlov P., "Svet", Novy Mir, issue 4, 1958 (title_ID is 33)
4) one publication authored by one (or two) author(s) in different issues of different journals
  - Pavlov P., "Svet", Novy Mir, issue 3, 1958 (title_ID is 33)
  - Pavlov P., "Svet", Iunost', issue 8, 1987 (title_ID is 33)

### Type ('type') 
This variable approximates the original section in which publication appeared. E.g. povest' (повесть) - novella; publicistika (публицистика) - essay; etc. 

### Type ('type') > Poetry ('poetry')
Each publication of poetry, irrespective of the actual number of published pieces and their length, is coded as a single publication (per issue). 

### NAs 
Missing data or data is not available
