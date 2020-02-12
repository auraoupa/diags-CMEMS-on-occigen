import numpy as np
import os



from multiprocessing import Pool   

def f(x):
	jsonfile='/scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_GS_y2012-2013/NATL60-CJM165_GS_y2012-2013_'+str(x)+'.json'
	print(jsonfile)
	command="python /scratch/cnt0024/hmg2840/albert7a/DEV/git/diags-CMEMS-on-occigen/Profiles-EN4/2020-01-29-AA-process-profiles-natl60.py --jsonfile "+jsonfile+" --dir '/scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_GS_y2012-2013/NATL60-CJM165/GS/' --reg 'GS' 'CASE' --nz 'NATL60-CJM165_GS_y2012-2013'"
	print(command)
	os.system(command)

 
if __name__ == '__main__': 
	with Pool(100) as p: 
		print(p.map(f, np.arange(1,100))) 
