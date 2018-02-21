# M2POC Projects

## Procedure
- Fork this github repository to your own account
- Add a folder under m2poc2018/projects, name it with your last name
- Work out your project codes/documentation and stage/push it to your folder
- Once finalised, create a pull request to the main branch

## Evaluation
You will be evaluated against the quality (description & objectives) and degree of achievement of your project.
You are expected to present your work during a 15 mins presentation at the end of the class.

Your project repository folder will need to contain at least:
- a readme file with the description of your objectives, dataset used and methods applied
- at least one jupyter notebook implementing your methodology

## Dataset

This a list of possible dataset to be used in your project. With these, you can address many different scientific 
questions and demonstrate your ability to implement data mining and machine learning standard methods.

### Global Argo data
A collection of 500,000 Temp/Sal/Sig0/N2 profiles interpolated on 302 standard depth levels.

- https://storage.cloud.google.com/sonific01/ARGO/GLOB_HOMOGENEOUS_variables_3subset_1.nc (~330Mb)
- https://storage.cloud.google.com/sonific01/ARGO/GLOB_HOMOGENEOUS_variables_3subset_2.nc (~300Mb)
- https://storage.cloud.google.com/sonific01/ARGO/GLOB_HOMOGENEOUS_variables_3subset_3.nc (~1.84Gb)

### North Atlantic Argo data
A collection of 100,000 Temp/Sal/Sig0/N2 profiles interpolated on 282 standard depth levels.

- https://storage.googleapis.com/sonific01/ARGO/NATL_HOMOGENEOUS_variables_7subset_1.nc (~30MB)
- https://storage.googleapis.com/sonific01/ARGO/NATL_HOMOGENEOUS_variables_7subset_2.nc (~30MB)
- https://storage.googleapis.com/sonific01/ARGO/NATL_HOMOGENEOUS_variables_7subset_3.nc (~30MB)
- https://storage.googleapis.com/sonific01/ARGO/NATL_HOMOGENEOUS_variables_7subset_4.nc (~30MB)
- https://storage.googleapis.com/sonific01/ARGO/NATL_HOMOGENEOUS_variables_7subset_5.nc (~30MB)
- https://storage.googleapis.com/sonific01/ARGO/NATL_HOMOGENEOUS_variables_7subset_6.nc (~30MB)
- https://storage.googleapis.com/sonific01/ARGO/NATL_HOMOGENEOUS_variables_7subset_7.nc (~275MB)

### North-West Atlantic observation ensemble from OCCIPUT 
OCCIPUT is an ensemble of 0.25x0.25 global numerical simulations (50 members). The dataset contains the 50 realisations 
interpolated at the location of 460 observed profiles [https://meom-group.github.io/projects/occiput].

- https://storage.googleapis.com/pirate_data/ENS/y2014m06/ORCA025.L75-OCCITENS.y2014m06_EDWregion.nc (1.96 Gb)

### Global 0.5x0.5 monthly mean ocean analysis, ISAS15
The observed 3D ocean stated for the 2002-2015 period [http://doi.org/10.17882/52367].

- http://www.seanoe.org/data/00412/52367/data/53158.tar.gz (~25Gb)

### North Atlantic 0.5x0.5 daily mean NCEP fluxes re-analysis
Contains air-sea heat fluxes from the atmospheric re-analysis.

- https://storage.googleapis.com/sonific01/NCEP/ncep_flux_1979to2017_2017-10-01.nc (~1.15Gb)

### Global Argo data quality control flags
A training set containing labelled data from Argo quality control procedure [http://www.argo.ucsd.edu/ADMT18_MachineLearning.pdf].

- https://storage.googleapis.com/mlargoqc/argo_set002/002A_merged.csv (~430Mb)

## Suggestions

You are encouraged to seek out for your own ideas and propositions for project.
Here is a list of possible projects to be conducted during the 1.5 days. 

### Clustering

- Of ocean vertical profiles. Here you can investigate the internal ocean structure of water masses and there variability.
 One can follow the Maze et al (2017) procedure [http://dx.doi.org/10.1016/j.pocean.2016.12.008].
 
- Of model ensemble of vertical profiles. Look for non-gaussians signals in the intrinsic ocean variability.  

- Of atmospheric air-sea fluxes. Investigate how atmospheric weather regimes force the ocean. One can follow the 
Barrier et al (2012) procedure [http://dx.doi.org/10.1007/s00382-012-1578-7].


### Supervised classification

- Prediction of Argo Quality Control outcomes. Improve the quality control procedure of Argo data with machine learning.
One can follow the Maze et al (2018) procedure and improve it [http://www.argo.ucsd.edu/ADMT18_MachineLearning.pdf].

### Regression

- Salinity against Temperature. It is crucial to be able to predict salinity using only temperature data in order to 
investigate the climatic signals of the upper ocean. 