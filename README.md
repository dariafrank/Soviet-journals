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
Of the six journals, only two - Novy Mir and Zvezda - have accessible digitalized archives. The data for the other four journals was collected and coded manually. 

First names are standardized (e.g. Евтушенко Е., Евтушенко Евг., Евтушенко Евген. - all coded as Евтушенко Евгений), and controlled for the possibility of full homonyms. Cases of potential homonyms (i.e. Pavlenko Pavel vs. Pavlenko P.) were assigned the same ID only in cases where genre, period, and journal were coherent and/or the title of work could be reliably attributed to the author.   

Gender identification ('gender') is the function of Russian (and some Slavic) last name endings and first names conventions. Instances of gender ambiguous morphological structure of first or last names are marked as 'NA'. 

Years of birth ('DOB_year') and death ('DOD_year') were sourced from various online and print sources (e.g. literary encyclopedias) and matched with the dataset on last and first names. Cases of unknown years as well as cases where attribution could not be established with certainty are marked as 'NA'. 

The information on membership in the Communist Party came from the lists of Party Members and then matched by last and first names, as well as active years. The Party membership information is incomplete due to incompleteness of lists of party members in general and discrepancies in the naming standards within various lists. 

Information about state awards (Stalin, Lenin and State Prizes) was sourced from publicly available lists of awards' recipients and then matched with the dataset by last and first names. 

Circulation size is denoted for the issues where it is known and estimated for missing issues. 


## CODING SPECIFICATIONS 
Please refer to documenation on variables for coding specifications and values.

### Author ID ('author_id') 
Each unique author has a randomly assigned ID. Groups of authors ('author group') and editorials ('editors editors') are marked as '1' and '2' respectively. Groups of authors don't contain details of individual contributors. 

### Type ('type') 
This variable approximates the original section in which publication appeared. E.g. povest' (повесть) - novella; publicistika (публицистика) - essay; etc. 

### Type ('type') > Poetry ('poetry')
Each publication of poetry, irrespective of the actual number of published pieces and their length, is coded as a single publication (per issue). 

### NAs 
Missing data or data is not available
