"""
Generate the image names from the files .jpg's
"""

import os
from pathlib import Path

EXPERIMENT = str(input("Experiment number:"))
HEADING = "Exercise"
experiment_folder = Path("../", "Experiment-" + EXPERIMENT)


def rename(exp_folder, heading):
    contents = sorted(os.listdir(exp_folder))
    for content in contents:
        if ".jpg" in content:
            filepath = "Experiment-" + EXPERIMENT + "/" + content
            newpath = "Experiment-" + EXPERIMENT + "/" + heading + "_" + content
            print(filepath, newpath)
            os.rename(filepath, newpath)


rename(experiment_folder, HEADING)
