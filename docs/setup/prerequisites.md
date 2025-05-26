# Prerequisites

Before setting up SF Data Export Automation, ensure you have the following prerequisites in place.

## :material-account-check: Required Accounts

### Google Account
!!! requirement "Google Services Access"
    - Active Google account
    - Access to Google Colab
    - Google Drive with sufficient storage space (typically 500MB - 5GB per export)

### Salesforce Account
!!! requirement "Salesforce Access"
    - Active Salesforce org (any edition)
    - User account with data export permissions
    - Weekly data export configured and available

## :material-shield-check: Permissions & Access

### Salesforce Permissions

!!! info "Required Salesforce Permissions"
    Your Salesforce user must have:
    
    - **Data Export** permission
    - **API Enabled** permission
    - Access to the **Weekly Export** feature
    - **System Administrator** or custom profile with export rights

!!! tip "Checking Your Permissions"
    To verify you have the right permissions:
    
    1. Log into Salesforce
    2. Go to **Setup** → **Data** → **Data Export**
    3. You should see the Data Export page with available exports
    4. If you can't access this page, contact your Salesforce administrator

### Google Drive Storage

!!! warning "Storage Requirements"
    **Typical export sizes:**
    
    - Small org (< 10,000 records): 10-100 MB
    - Medium org (10,000 - 100,000 records): 100MB - 1GB
    - Large org (> 100,000 records): 1GB - 5GB+
    
    **Recommended:** Have at least 10GB free space in Google Drive

## :material-tools: Technical Requirements

### Browser Compatibility
!!! success "Supported Browsers"
    - Chrome (recommended)
    - Firefox
    - Safari
    - Edge (Chromium-based)

### Network Requirements
!!! note "Internet Connection"
    - Stable internet connection
    - No corporate firewall blocking Google Colab or Salesforce
    - Sufficient bandwidth for large file downloads

## :material-cog: Salesforce Configuration

### Weekly Data Export Setup

!!! abstract "Configuring Weekly Exports"
    If you haven't set up weekly exports yet:
    
    1. **Setup** → **Data** → **Data Export**
    2. Click **Schedule Export**
    3. Choose **Weekly Export**
    4. Select your data options:
        - Include all data
        - Include documents and attachments (optional)
        - Include deleted records (optional)
    5. **Save** your configuration

!!! tip "Export Frequency"
    Weekly exports are generated automatically by Salesforce. You'll typically have:
    
    - 1-4 exports available at any time
    - New exports created weekly
    - Old exports automatically deleted after 48 hours

## :material-check-all: Pre-Setup Checklist

Before proceeding to the quick start guide, verify:

- [x] I have a Google account with Colab access
- [x] I have a Salesforce account with export permissions
- [x] I can access the Salesforce Data Export page
- [x] I have at least 5GB free space in Google Drive
- [x] My internet connection is stable
- [x] Weekly exports are configured in my Salesforce org

!!! success "Ready to Continue?"
    If you've checked all the boxes above, you're ready to proceed!
    
    [Continue to Quick Start :material-arrow-right:](quickstart.md){ .md-button .md-button--primary }

!!! help "Need Help with Prerequisites?"
    If you're missing any prerequisites:
    
    - **Salesforce permissions**: Contact your Salesforce administrator
    - **Google account issues**: Visit [Google Support](https://support.google.com)
    - **Weekly export setup**: Check our [Configuration Guide](../configuration/)
