import fnmatch
import os
import subprocess
from typing import List


class Updater:
    """Update files in the repository from the main branch."""

    def __init__(
        self,
        branch: str = "main",
        exclude_file: str = "exclude",
        save_dir: str = "docs/",
    ):
        self.branch = branch
        self.save_dir = save_dir
        self.experiments = range(1, 11)

        os.makedirs(save_dir, exist_ok=True)
        self.exclude = self.get_exclude(exclude_file)
        self.files = self.list_files()

    def get_exclude(self, file) -> List[str]:
        """Read patterns from file and return a list of patterns"""
        exclude: List[str] = []
        with open(file, "r") as file_handle:
            for line in file_handle.readlines():
                pattern = line.strip()
                if pattern and not pattern.startswith("#"):
                    exclude.append(pattern)
        return exclude

    def _exclude(self, file: str) -> bool:
        """Check if a file should be excluded"""
        for pattern in self.exclude:
            if fnmatch.fnmatch(file, pattern):
                return True
        return False

    def list_files(self) -> List[str]:
        """List all files in the repository, excluding patterns in self.exclude"""

        command = ["git", "ls-tree", "-r", self.branch, "--name-only"]
        result = subprocess.run(command, capture_output=True, text=True)

        if not result.returncode == 0:
            raise Exception("Failed to list files in the repository")

        all_files = result.stdout.splitlines()
        return [file for file in all_files if not self._exclude(file)]

    def _get_commit_hash(self) -> str:
        """Get the commit hash of the latest commit on the main branch"""
        command = f"git rev-parse {self.branch}"
        result = subprocess.run(command.split(), capture_output=True, text=True)

        if not result.returncode == 0:
            raise Exception(f"Failed to get commit hash on {self.branch} branch")

        return result.stdout.strip()

    def save_commit_hash(self):
        """Save the commit hash to a file"""
        commit_hash = self._get_commit_hash()
        with open("commit_hash", "w") as file_handle:
            file_handle.write(commit_hash)

    def fetch(self):
        """Fetch the files in the repository"""
        self.content: dict[str, str] = {}
        for file in self.files:
            command = f"git show {self.branch}:{file}"
            result = subprocess.run(command.split(), capture_output=True, text=True)

            if not result.returncode == 0:
                raise Exception(f"Failed to update {file}")

            self.content[file] = result.stdout

    def _update_home(self):
        file = os.path.join(self.save_dir, "README.md")
        with open(file, "w") as file_handle:
            file_handle.write(self.content["README.md"])

    def _create_experiments(self):
        """Create Experiment-{01..12} in self.save_dir"""
        for i in self.experiments:
            file = os.path.join(self.save_dir, f"Experiment-{i:02}.md")
            if os.path.exists(file):
                continue
            with open(file, "w") as file_handle:
                file_handle.write(f"# Experiment {i}\n\n")

    def _update_experiment(self, number: int):
        def segregate():
            experiment: dict[str, str] = {}
            for file, content in self.content.items():
                if file.startswith(f"Experiment-{number}/"):
                    file = file.replace(f"Experiment-{number}/", "")
                    experiment[file] = content

            examples: dict[str, str] = {}
            exercises: dict[str, str] = {}
            for file, content in experiment.items():
                if file.startswith(f"Example"):
                    examples[file] = content
                elif file.startswith(f"Exercise"):
                    exercises[file] = content
            return examples, exercises

        def write(contents, file_handle):
            for title, content in contents.items():
                title = title.replace(".m", "")
                title = title.replace("_", "-")
                file_handle.write(f"### {title}\n\n")
                file_handle.write("```matlab")
                file_handle.write(content)
                file_handle.write("```\n\n")

        examples, exercises = segregate()
        file = os.path.join(self.save_dir, f"Experiment-{number:02}.md")
        with open(file, "w") as file_handle:
            file_handle.write(f"# Experiment-{number}\n\n")
            file_handle.write("## Examples\n\n")
            write(examples, file_handle)
            file_handle.write("## Exercises\n\n")
            write(exercises, file_handle)

    def update(self):
        # self._update_home()
        self._create_experiments()
        for number in self.experiments:
            self._update_experiment(number)


if __name__ == "__main__":
    pages = Updater()
    pages.fetch()
    pages.update()
    pages.save_commit_hash()
