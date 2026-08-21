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