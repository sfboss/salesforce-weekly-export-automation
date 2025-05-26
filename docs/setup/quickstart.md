# Quick Start Guide

Get SF Data Export Automation running in under 5 minutes! This guide will walk you through the essential steps to start automating your Salesforce exports.

## :material-timer: 5-Minute Setup

### Step 1: Open Google Colab

!!! tip "Access the Notebook"
    1. Open [Google Colab](https://colab.research.google.com)
    2. Upload the `SF_Data_Export_Automation.ipynb` file
    3. Or use **File → Open → GitHub** to import directly

### Step 2: Get Your SFDX Auth URL

!!! warning "Authentication Required"
    You'll need to authenticate with Salesforce first to get your auth URL.

#### Option A: Local SFDX Setup (Recommended)

```bash
# Install SFDX CLI locally (if not already installed)
npm install -g @salesforce/cli

# Authenticate with your Salesforce org
sf org login web --set-default-dev-hub

# Get your auth URL
sf org display --verbose --target-org your-username@yourorg.com
```

#### Option B: Salesforce CLI in Browser

1. Use the [Salesforce CLI in your browser](https://developer.salesforce.com/tools/sfdxcli)
2. Run the same commands as above
3. Copy the `Sfdx Auth Url` value

!!! example "Example Auth URL"
    ```
    force://PlatformCLI::5Aep861TSGFxEb9wE8VOJ3PH6Kc3xb@mydomain.my.salesforce.com
    ```

### Step 3: Configure Colab Secrets

!!! key "Adding Your Auth URL to Colab"
    1. In your Colab notebook, click the 🔑 **key icon** in the left sidebar
    2. Click **Add new secret**
    3. Set **Name** to: `SFDX_AUTH_URL`
    4. Set **Value** to: Your complete auth URL from Step 2
    5. Toggle **Notebook access** to ON

### Step 4: Run the Automation

!!! play "Execute the Cells"
    1. **Cell 1**: Run the header display (optional but pretty!)
    2. **Cell 2**: Authentication - this will validate your setup
    3. **Cell 3**: Fetch export IDs from your Salesforce org
    4. **Cell 4**: Mount Google Drive (you'll need to authorize)
    5. **Cell 5**: Download exports to your Drive

### Step 5: Verify Success

!!! success "Check Your Results"
    - Look for the success message with download summary
    - Check your Google Drive for the new `SF_WeeklyExport_YYYYMMDD` folder
    - Verify your ZIP files are present and properly sized

## :material-lightning-bolt: Pro Tips

!!! tip "Make It Even Faster"
    - **Bookmark the Colab notebook** for quick access
    - **Save a copy to your Drive** so you always have it available
    - **Set up a Google Drive shortcut** to your export folders
    - **Run weekly** to keep your backups current

## :material-troubleshoot: Quick Troubleshooting

!!! failure "Common Issues"
    
    **Authentication Failed?**
    
    - Double-check your SFDX Auth URL is complete and correct
    - Make sure Colab secrets are properly configured
    - Try re-running the authentication cell
    
    **No Export IDs Found?**
    
    - Verify you have weekly exports configured in Salesforce
    - Check that your user has data export permissions
    - Ensure exports are in "Available" status
    
    **Drive Mount Failed?**
    
    - Make sure you authorize Google Drive access when prompted
    - Try clearing your browser cache and re-running
    - Check that you have sufficient Drive storage space

## :material-arrow-right: Next Steps

Once you have the basic setup working:

- [Configure advanced settings](../configuration/)
- [Learn about the download process](../usage/download-process.md)
- [Set up automated scheduling](../usage/file-management.md#automation-tips)

[Advanced Configuration :material-arrow-right:](../configuration/){ .md-button }
