#!/usr/bin/env python
## path for mdules
import sys
import warnings
warnings.filterwarnings('ignore')


## imports

import numpy as np
import dask
import xarray as xr
from netCDF4 import Dataset
import matplotlib.pyplot as plt
import pandas as pd
import datetime
import glob as glob
import matplotlib.gridspec as gridspec
import time
from dask.diagnostics import ProgressBar
from datetime import date
import yaml
import io
import json
import os

def process(jsonfile,infos,prof,dsN,latN,lonN,timN,config,case,namezone):
	''' Make all the steps needed to create the final netcdf files for one profile
	'''
	list_profiles = infos.keys()
	reference =  str(list(list_profiles)[prof])
	print('Processing profile ', reference)
	lat_prof = infos[list(list_profiles)[prof]]['latitude']
	lon_prof = infos[list(list_profiles)[prof]]['longitude']
	date_prof = infos[list(list_profiles)[prof]]['date']
	file_prof = infos[list(list_profiles)[prof]]['file']
	ref_prof = infos[list(list_profiles)[prof]]['profile no']

	check=check_prof_boundaries(dsN,latN,lonN,timN,lat_prof,lon_prof,date_prof)
	if check == 0.:
		diren4="/scratch/cnt0024/hmg2840/albert7a/EN4/"
		tfileEN4=diren4+file_prof
		dsen4=xr.open_dataset(tfileEN4)
		laten4=dsen4['LATITUDE'][ref_prof]
		lonen4=dsen4['LONGITUDE'][ref_prof]
		depen4=dsen4['DEPH_CORRECTED'][ref_prof]
		refen4=dsen4['DC_REFERENCE'][ref_prof]
		dayen4=dsen4['JULD'][ref_prof]
		observation_lon=lonen4
		observation_lat=laten4
		up={str(refen4):{'reference':str(refen4.values),'file':file_prof,'latitude':float(laten4.values),'longitude':float(lonen4.values),'date':str(dayen4.values)}}
	else:
		up=0.
            
	return up
           
def open_model(config,case):
	print('Opening data')
	tfiles="/store/colombo/"+config+"/"+config+"-"+case+"-S/1d/2012/"+config+"-"+case+"_y20??m??d??.1d_gridT.nc"
	##Open NATL60 files to get boundaries of domain
	dsN = xr.open_mfdataset(tfiles,decode_times=False, chunks={'deptht':1 ,'time_counter':10})
	latN = dsN.nav_lat
	lonN = dsN.nav_lon
	timN = dsN.time_counter
	return dsN,latN,lonN,timN

def check_prof_boundaries(dsN,latN,lonN,timN,lat_prof,lon_prof,date_prof):
	''' Check if the selected profile falls within model boundaries
	'''

	lamin=np.nanmin(latN.values)
	lamax=np.nanmax(latN.values)
	lomin=np.nanmin(lonN.values)
	lomax=np.nanmax(lonN.values)

	if (lamin < lat_prof < lamax) & (lomin < lon_prof < lomax) :
		check=0.
		print("selected profile falls within model boundaries, the program is proceeding")
	else:
		check=1.
		print("selected profile does not fall within model boundaries, the program is stopping")
	distance_threshold = 0.25
	square_distance_to_observation = (lonN - lon_prof)**2 + (latN-lat_prof)**2
	is_close_to_observation = square_distance_to_observation < distance_threshold**2
	where_true=np.where(is_close_to_observation==True)
	if len(where_true[0]) < 1:
		check=1.
		print("there is no point in the model close enough to the profile, the program is stopping")
	else:
		check=0.
		print("there is a point in the model close enough to the profile, the program is proceeding")
	return check

def script_parser():
	"""Customized parser.
	"""
	from optparse import OptionParser
	usage = "usage: %prog  --jsonfile name --newjson new --dir dir --conf conf --case case --nz nz "
	parser = OptionParser(usage=usage)
	parser.add_option('--jsonfile', help="Filename", dest="jsonfile", type="string", nargs=1)
	parser.add_option('--newjson', help="Filename", dest="newjson", type="string", nargs=1)
	parser.add_option('--dir', help="Dirname", dest="dir", type="string", nargs=1)
	parser.add_option('--conf', help="Config", dest="conf", type="string", nargs=1)
	parser.add_option('--case', help="Case", dest="case", type="string", nargs=1)
	parser.add_option('--nz', help="Namezone", dest="namezone", type="string", nargs=1)
	return parser

def main():
	parser = script_parser()
	(options, args) = parser.parse_args()
	optdic=vars(options)

	jsonfile = optdic['jsonfile']
	newjson = optdic['jsonfile']
	dirn = optdic['dir']
	config = optdic['conf']
	case = optdic['case']
	namezone = optdic['namezone']

	sourcefile=open(jsonfile,'rU')
	infos=json.load(sourcefile)
	nb_profilesEN4=len(infos)

	print(time.strftime('%d/%m/%y %H:%M',time.localtime()))
	dsN,latN,lonN,timN = open_model(config,case)
	print(time.strftime('%d/%m/%y %H:%M',time.localtime()))

	for prof in np.arange(nb_profilesEN4):
		list_profiles = infos.keys()
		reference = str(list(list_profiles)[prof])
		reference_profile=reference[-16:-1]
		print("dealing with profile "+reference_profile)
		up=process(jsonfile,infos,prof,dsN,latN,lonN,timN,config,case,namezone)
		if up == 0:
			print('pas de prof')
		else:
			if 'dictyml' in locals():
				dictyml.update(up)
			else:
				dictyml=up 
	with io.open(newjson, 'w', encoding='utf8') as outfile:
		outfile.write(str(json.dumps(dictyml, sort_keys=True,indent=4, separators=(',', ': '))))
	print(time.strftime('%d/%m/%y %H:%M',time.localtime()))

if __name__ == '__main__':
	sys.exit(main() or 0)
 
