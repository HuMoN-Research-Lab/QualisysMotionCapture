#Motion Capture Master for Data Acquisition
#import libraries
import os
import platform
import csv

#How to change directory in python
#Locate file in googledrive (Next step)
#os.chdir("MotionCapture_Python") 

#locate data and relevant func
#system = platform.system()
#if system == "Darwin":
#    code_path = "/Users/MT/Documents/GitHub/QualisysMotionCapture"
#    data_path = "/Users/MT/Google Drive File Stream/My Drive/MotionCaptureProjects/Qualisys_MotionCapture/RevisedWalkingData"

#file path of the tsv data
input_tsv = r'2020-03-04_JSM_TPose.tsv'

#open file and read marker animation data, convert data to huge list
with open(input_tsv,"r") as tsv_file:
    file = list(csv.reader(tsv_file, delimiter='\t'))

header_end = 11
left_header_end = 2

#Create 2D array "arr" to hold all 3D coordinate info of markers
#return an array containing all marker locations at given frame
def create_data_arr(frame):
    current_row = file[frame + header_end]
    cols, rows = (3, int((len(current_row) - 2) / 3))
    arr = [[None]*cols for _ in range(rows)]
    count = 0
    count_row = 0
    for x in range(left_header_end, len(current_row)):
        arr[count_row][count] = current_row[x]
        count += 1
        if (count == 3):
            count = 0
            count_row += 1
    return arr

frame_num = 2
arr = create_data_arr(frame_num)