#!/bin/bash

module load nco

NAME=C5_3D
OUTP=029

echo "ncra ocean.nc"
ncra archive/output${OUTP}/ocean/ocean.nc archive/processed/ocean.${NAME}.out${OUTP}.ncra.nc
echo "ncra ocean_month.nc"
ncra archive/output${OUTP}/ocean/ocean_month.nc archive/processed/ocean_month.${NAME}.out${OUTP}.ncra.nc
echo "ncrcat ocean_scalar.nc"
ncrcat archive/output*/ocean/ocean_scalar.nc archive/processed/ocean_scalar.${NAME}.out000-${OUTP}.ncrcat.nc
echo "ncra -v mld_max -y max ocean_month.nc"
ncra -v mld_max -y max archive/output${OUTP}/ocean/ocean_month.nc archive/processed/ocean_month.mld_max.${NAME}.out${OUTP}.ncra.nc
echo "ncrcat -v ty_trans_rho ocean.ty_transrho.nc"
ncrcat -v ty_trans_rho,ty_trans_rho_gm archive/output0*/ocean/ocean.nc archive/processed/ocean.ty_trans_rho.C5_3D.out000-029.ncrcat.nc


# echo "ncdiff ocean.ncra.nc"
# ncdiff archive/processed/ocean.${NAME}.out${OUTP}.ncra.nc /scratch/e14/rmh561/access-om2/archive/1deg_jra55_ryf_red3DSK/processed/ocean.cont.out${OUTP}.ncra.nc archive/processed/ocean.${NAME}.out${OUTP}.ncra.diff.nc
# echo "ncdiff ocean_month.ncra.nc"
# ncdiff archive/processed/ocean_month.${NAME}.out${OUTP}.ncra.nc /scratch/e14/rmh561/access-om2/archive/1deg_jra55_ryf_red3DSK/processed/ocean_month.cont.out${OUTP}.ncra.nc archive/processed/ocean_month.${NAME}.out${OUTP}.ncra.diff.nc