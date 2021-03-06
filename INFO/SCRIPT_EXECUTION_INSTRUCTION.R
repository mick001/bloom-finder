#-------------------------------------------------------------------------------
#               Execution checklist for Bloom finder script V. 2.3             #
#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------
# Before executing the script for the first time

# Make sure the following packages are installed and available in your R environment:
# 
# qchlorophyll    # 2.1
# dplyr           # 0.7.4
# scales          # 0.5.0
# TTR             # 0.23-3
# lazyeval        # 0.2.1
# log4r           # 0.2
# readr           # 1.1.1
# 
# Make sure the versions of the installed packages are the same as those suggested.
#
# If the packages versions are not matching the ones specified, the results of the
# script might differ from the expected ones.
#
#-------------------------------------------------------------------------------
# Steps for script execution
#
# 1. Open the file climatology-main.R
# 
# 2. Set the global parameters of the script. The defaults values are reported below
# for reference but can be changed according to the needs of the analysis
# 
#     # Maximum number of allowed consecutive NAs in the climatology for each pixel
#     MAX_CONSECUTIVE_NA <- 2
#     
#     # Threshold percentage to calculate s index = median(chl) * (1 + THRESHOLD_PERCENTAGE)
#     THRESHOLD_PERCENTAGE <- 0.05
#     
#     # Percentile interval into which climatology data needs to be squished
#     PERCENTILE_SQUISHING_INTERVAL <- c(0.05, 0.95)
#     
#     # Average operation to be used for climatology calculation. Set to "geom" for geometric mean
#     MEAN_FUNCTION <- "mean"
#     
#     # Minimum duration in days for a suspected bloom to be considered an actual bloom
#     MINIMUM_BLOOM_DURATION_DAYS <- 16
#     
#     # Pixels with number of blooms >= N_BLOOM_MAX are flagged in TABELLA_TRE
#     N_BLOOM_MAX <- 3
#
#     # New starting time of climatology is id_date = 210
#     NEW_STARTING_POINT <- 210
#
#     # This variable is to separate spring and fall blooms. If bloom_start > 165 then bloom is in fall
#     otherwise it is in spring
#     SPRING_FALL_ID_DATE_SEPARATOR <- 165
#
#     # Starting year to analyze data (included)
#     STARTING_YEAR <- 2001
#
#     # Ending year to analyze data (included). NOTE: it must be STARTING_YEAR <= ENDING_YEAR
#     ENDING_YEAR <- 2002
#
#     # Years to be analyzed in the script (by default from starting year to ending year)
#     # replace with years to analyze if you want to analyze non-consecutive years, for example:
#     # YEARS_TO_ANALYZE <- c(2000, 2002, 2004)
#     YEARS_TO_ANALYZE <- c(STARTING_YEAR:ENDING_YEAR)
#

#     # Filter function to be used: chose from mav, kernelSm, spline, loess
#     FILTER_NAME <- "mav"
#
#     # Number of observations to be used in the moving average
#     RUNNING_AVERAGE_WINDOW <- 3
#
#     # Kernel to be used (see ?ksmooth)
#     KERNEL <- "normal"
#
#     # Kernel bandwidth (see ?ksmooth)
#     BANDWIDTH <- 50
#
#     # Equivalent number of degrees of freedom for smooth.spline (see ?smooth.spline)
#     DF <- 35
#
#     # Parameter alpha which controls the degree of smoothing (see ? loess)
#     SPAN <- 0.3
#
# 3. Set the required paths
# 
#     # Path of .nc files. This path must point to the folder containing .nc files
#     NC_FILES_PATH <- "C:\\users\\michy\\desktop\\christian_paper\\DATA_TEST"
#     
#     # Auxiliary functions path. This path must point to the folder "auxiliary_functions"
#     AUX_FUNCTIONS_PATH <- "C:\\users\\michy\\desktop\\christian_paper\\SCRIPT\\auxiliary_functions"
#     
#     # Output directory. This path can point to whathever folder you wish
#     OUTPUT_PATH <- "C:\\users\\michy\\desktop"
#     
# 4. Run the whole script
# 
# 5. The output of the script is the following set of dataframes which is saved in the selected OUTPUT_PATH
#     
#     climatology
#     climatology_high_res
#     TABELLA_DUE
# 
# 6. To quickly inspect graphically single pixels, use the following functions
# 
#     6.1 plot_calculated_indexes(1729)
# 
# 7. At the end of each execution a log file is generated. The log file name is "log_climatology_main.log".
#       
# See file SCRIPT_EXECUTION_STEPS.R for more details on the execution steps.
#