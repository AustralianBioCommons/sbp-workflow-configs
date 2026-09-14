# sbp-workflow-configs
The centralised repository to manage all Structural Biology Platform workflow configurations 

## Offline execution of workflows in _workflow_ queue

When running workflows offline in _workflow_ queue with `nextflow/25.10.x` via Seqera, the following steps can be used to ensure that the workflow runs successfully without external network access.

1. Clone the workflow repo to a local directory on Gadi, under a folder named after the GitHub organisation (e.g. `AustralianBioCommons`). For example:

    ```bash
    cd /path/to/local/directory
    mkdir AustralianBioCommons
    cd AustralianBioCommons
    git clone https://github.com/AustralianBioCommons/sbp-proteinfold.git
    ```

2. Within the Seqera pre-run script, set the `NXF_ASSETS` environment variable to point to the parent directory of the GitHub organisation folder, while also setting `NXF_OFFLINE` to `true`. For example:

    ```bash
    module load nextflow/25.10.4
    export NXF_OFFLINE=true
    export NXF_ASSETS=/path/to/local/directory
    ```

3. Run the workflow via Seqera, using the Git repo as the "Pipeline to launch" (e.g. `https://github.com/AustralianBioCommons/sbp-proteinfold.git`)

## Using mini or prod databases with _protienfold_ and _wisps_

To use different databases across different SBP instances (e.g. mini databases on `dev` and prod databases on `staging`/`prod`), set the `PF_DB_BASE_DIR` environment variable to the appropriate database base directory before running the _protienfold_ or _wisps_ workflows. On Seqera, this can be set in the pre-run script.

To use mini databases:
```bash
export PF_DB_BASE_DIR="/g/data/if89/proteinfold_dbs/proteinfold_minidbs"
```

To use prod databases:
```bash
export PF_DB_BASE_DIR="/g/data/li87/proteinfold_dbs"
```