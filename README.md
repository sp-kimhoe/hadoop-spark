Python 3.12.7

COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp

BigDataProject/
├── .devcontainer/
│   ├── devcontainer.json
│   └── docker-compose.yml
├── hadoop/
│   └── Dockerfile  # For hadoop service
├── spark/
│   └── Dockerfile  # For spark-master service
└── pyspark_test.py  # Example PySpark script

- ..:/workspace:cached
- /var/run/docker.sock:/var/run/docker.sock

pip install --upgrade pip
pip install -r /workspace/requirements.txt


Steps to Install a Linux Distribution in WSL
Install a Linux Distribution:

Open the Microsoft Store on your Windows machine.
Search for a Linux distribution, such as Ubuntu, Debian, or Alpine.
Select a distribution (e.g., Ubuntu 20.04 LTS) and click Install.
Set the WSL Version for the New Distribution:

After installation, open PowerShell or Command Prompt as Administrator.

Set the new distribution to WSL 2:

powershell
Copy code
wsl --set-version <distro-name> 2
Replace <distro-name> with the name of the newly installed distribution, which you can verify with:

powershell
Copy code
wsl -l -v
Set the Default WSL Distribution (Optional):

If you want to set this new distribution as the default for any WSL commands, run:

powershell
Copy code
wsl --set-default <distro-name>
Restart Docker Desktop (if needed):

Open Docker Desktop.
Go to Settings > Resources > WSL Integration.
Ensure that the new distribution is enabled under Enable integration with additional distros.
Verifying the Installation
Once installed and configured, you should be able to:

See the new distribution listed in wsl -l -v.
Open it using wsl -d <distro-name>.


spark-submit \
    --conf spark.executor.memory=2g \
    --conf spark.executor.cores=2 \
    --conf spark.driver.memory=2g \
    pyspark_test.py