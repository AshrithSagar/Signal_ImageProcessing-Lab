"""
Generate the report from the files.
"""

import os
from pathlib import Path

EXPERIMENT = str(input("Experiment number:"))
experiment_folder = Path("../", "Experiment-" + EXPERIMENT)


def generate(heading):
    """
    Generates the file contents.
    heading: ['Example', 'Exercise']
    """
    output = "\n" + "## " + heading + "s"
    contents = sorted(os.listdir(experiment_folder))
    for content in contents:
        if ".m" in content and heading in content:
            filepath = Path(experiment_folder, content)
            print(filepath)
            output += "\n\n" + "### " + heading + " - " + content[-3] + "\n"
            with open(filepath, "r", encoding="utf-8") as file:
                code = file.read()
                output += "\n```matlab\n"
                output += code
                output += "```\n"

            output += "\n#### Output\n\n"
            output += (
                "!["
                + heading
                + "-"
                + content[-3]
                + "]("
                + str(filepath)[:-2]
                + ".jpg)\n"
            )

    return output


OUTPUT = "# Experiment - " + EXPERIMENT
OUTPUT += "\n"
OUTPUT += generate("Example")
OUTPUT += generate("Exercise")
file = "Experiment-" + EXPERIMENT + ".md"
with open(file, "w", encoding="utf-8") as file_handle:
    file_handle.write(OUTPUT)
