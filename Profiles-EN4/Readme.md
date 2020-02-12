# All the steps to produce a statistical comparison of EN4 profiles and model outputs

1- Selection of EN4 profiles that are in the same area and period of model output : 2019-12-12-AA-select-profiles-EN4-region-GS-period-NATL60 => production of jasonfile that lists every profile considered

2- If needed cut the jasonfile into smaller parts (100 profiles at a time) to be processed in parallel : 2020-01-28-AA-cut_jsonfile_GS-100profbyfiles.ksh

3- Launch the extraction for all profiles in one job : 2020-01-29-AA-launch-all-profiles-EU36.ksh

4- If need be, launch multiple times the previous job : 2020-01-30-AA-launch-10-times-all-profiles-regional-simus.ksh

5- Projection of results on standart vertical levels : 2020-01-31-AA-launch-proj-vert.ksh, also get rid of the profiles that does not go as deep as 500m

6- Plot the mean results for the whole region