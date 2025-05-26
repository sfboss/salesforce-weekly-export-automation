# Running the Notebook

Learn how to execute SF Data Export Automation and monitor its progress through each phase.

## :material-play: Execution Overview

The notebook consists of five main cells that should be executed in sequence. Each cell performs a specific function and provides visual feedback on its progress.

!!! info "Execution Order"
    1. **🪐 Header Display** - Visual branding (optional)
    2. **🔐 Authentication** - SFDX setup and validation  
    3. **📥 Fetch Export IDs** - Discover available exports
    4. **☁️ Google Drive Setup** - Mount and prepare folders
    5. **📦 Download Exports** - Download and organize files

## :material-numeric-1-circle: Cell 1: Header Display

### Purpose
Displays an animated header with project branding and status information.

!!! example "What You'll See"
    - Animated gradient background with data visualization elements
    - "SF Data Export Automation" title with glowing effects
    - Floating data nodes and neural network animations
    - Processing status and uptime metrics

### Execution
```python
# @title 🪐
# Simply click the play button - no configuration needed
```

!!! tip "Optional Step"
    This cell is purely cosmetic and can be skipped if you prefer to jump straight to the automation.

## :material-numeric-2-circle: Cell 2: Authentication

### Purpose
Authenticates with Salesforce using your SFDX Auth URL and validates permissions.

!!! key "What Happens"
    1. **Checks for secrets** - looks for `SFDX_AUTH_URL` in Colab secrets
    2. **Installs SFDX CLI** - downloads and configures Salesforce CLI
    3. **Authenticates org** - validates your credentials
    4. **Tests connectivity** - verifies API access
    5. **Displays org info** - shows username, org ID, and instance URL

### Expected Output
```
🔍 Checking authentication options...
✅ Found SFDX_AUTH_URL in secrets
📦 Installing SFDX CLI...
✅ SFDX CLI installed successfully
🔄 Attempting SFDX authentication...
✅ Successfully authenticated via SFDX
   Username: your-username@yourorg.com
   Org ID: 00D8Z000001rMLAUA2
   Instance: https://yourorg.my.salesforce.com

============================================================
🎉 AUTHENTICATION SUCCESSFUL
============================================================
```

!!! warning "Common Issues"
    - **"No SFDX_AUTH_URL found"** - Check Colab secrets configuration
    - **"Authentication failed"** - Verify Auth URL is current and valid
    - **"Permission denied"** - Ensure user has Data Export permissions

## :material-numeric-3-circle: Cell 3: Fetch Export IDs

### Purpose
Connects to Salesforce Data Export page and discovers available weekly exports.

!!! search "Discovery Process"
    1. **Navigates to export page** - uses authenticated session
    2. **Parses HTML content** - extracts export download links
    3. **Identifies export IDs** - finds available weekly exports
    4. **Saves IDs to file** - stores for download processing
    5. **Reports findings** - displays count and IDs

### Expected Output
```
🔍 Fetching weekly export IDs...
✅ Found 3 export IDs
💾 Saved export IDs to /content/export_ids.txt

📋 Export IDs ready for download:
   1. 092KY000000blXV
   2. 092KY000000blXW  
   3. 092KY000000blXX
```

!!! info "Export ID Format"
    - Export IDs start with `092` (Salesforce object prefix)
    - Each ID represents one available weekly export file
    - IDs are unique and change with each export generation

!!! warning "No Exports Found?"
    If no exports are found:
    - **Check export setup** - verify weekly exports are configured
    - **Verify timing** - exports may not be ready yet
    - **Check permissions** - ensure access to Data Export page
    - **Review org status** - confirm org is active and accessible

## :material-numeric-4-circle: Cell 4: Google Drive Setup

### Purpose
Mounts Google Drive and creates organized folder structure for file storage.

!!! cloud "Drive Integration"
    1. **Mounts Google Drive** - connects to your Drive account
    2. **Creates backup folder** - dated folder for organization
    3. **Verifies permissions** - ensures write access
    4. **Reports location** - displays folder path

### Authorization Process

!!! key "First-Time Authorization"
    You'll see an authorization flow:
    
    1. **Click authorization link** - opens Google OAuth
    2. **Select Google account** - choose your account
    3. **Grant permissions** - allow Colab to access Drive
    4. **Copy authorization code** - paste back into Colab
    5. **Drive mounts successfully** - ready for file operations

### Expected Output
```
☁️ Setting up Google Drive backup...
Mounted at /content/drive
✅ Google Drive mounted successfully
✅ Created backup folder: SF_WeeklyExport_20250526

📁 Backup location: /content/drive/MyDrive/SF_WeeklyExport_20250526
✅ Ready for file downloads
```

!!! tip "Subsequent Runs"
    After first authorization, Drive typically mounts automatically without requiring re-authorization.

## :material-numeric-5-circle: Cell 5: Download Exports

### Purpose
Downloads all available export files with progress tracking and error handling.

!!! download "Download Process"
    1. **Checks for existing files** - prevents duplicate downloads
    2. **Downloads each export** - with progress bars and status
    3. **Verifies file integrity** - checks sizes and formats
    4. **Organizes in Drive** - saves to dated folder
    5. **Generates summary** - provides detailed report

### Progress Monitoring

!!! success "Visual Feedback"
    During downloads you'll see:
    
    - **File-by-file progress** - individual download status
    - **Progress bars** - showing download percentage
    - **File size information** - estimated and actual sizes
    - **Error handling** - clear messages if issues occur

### Expected Output
```
📥 Starting downloads...

🔄 Downloading export 1/3: 092KY000000blXV

📥 Downloading: WE_00D8Z000001rMLAUA2_1.ZIP
   Export ID: 092KY000000blXV
   File size: 1.25 GB
   Progress: [████████████████████████████████] 100%
✅ Successfully downloaded: WE_00D8Z000001rMLAUA2_1.ZIP

🔄 Downloading export 2/3: 092KY000000blXW
⏭️ File already exists: WE_00D8Z000001rMLAUA2_2.ZIP

🔄 Downloading export 3/3: 092KY000000blXX
[... similar process ...]

📥 All downloads completed
```

### Final Summary

!!! abstract "Completion Report"
    ```
    ============================================================
    📊 EXPORT DOWNLOAD SUMMARY
    ============================================================
    ✅ Successfully downloaded 3 export files:
       1. WE_00D8Z000001rMLAUA2_1.ZIP (1.25 GB)
       2. WE_00D8Z000001rMLAUA2_2.ZIP (987 MB)
       3. WE_00D8Z000001rMLAUA2_3.ZIP (1.1 GB)

    📁 Total backup size: 3.34 GB
    📂 Backup folder: /content/drive/MyDrive/SF_WeeklyExport_20250526
    ```

## :material-monitor-dashboard: Monitoring Execution

### Real-Time Status

!!! info "Status Indicators"
    **Success:** ✅ Green checkmarks and positive messages
    **Progress:** 🔄 Spinning icons and progress bars
    **Warnings:** ⚠️ Yellow alerts for non-critical issues
    **Errors:** ❌ Red X marks with error descriptions

### Execution Time

!!! clock "Typical Durations"
    - **Authentication:** 30-60 seconds
    - **Fetch Export IDs:** 5-15 seconds  
    - **Drive Setup:** 10-30 seconds (first time: +authorization)
    - **Downloads:** Variable (depends on file sizes)
    - **Total Runtime:** 2-30 minutes (typically 5-10 minutes)

### Performance Tips

!!! tip "Optimize Performance"
    - **Stable internet** - ensure good connection speed
    - **Close other tabs** - reduce browser memory usage
    - **Don't interrupt** - let downloads complete
    - **Monitor progress** - watch for error messages

## :material-refresh: Re-running the Notebook

### When to Re-run

!!! abstract "Re-run Scenarios"
    - **Daily/Weekly** - for new exports
    - **After errors** - to retry failed operations
    - **Runtime disconnect** - if Colab session expires
    - **New org setup** - when changing Salesforce orgs

### Efficient Re-execution

!!! tip "Quick Restart"
    **Full restart:**
    1. **Runtime** → **Restart runtime**
    2. **Runtime** → **Run all** (if no changes needed)
    
    **Selective restart:**
    - Skip Cell 1 (header) if desired
    - Always run Cell 2 (authentication) after restart
    - Run remaining cells in sequence

### State Management

!!! warning "Runtime State"
    - **Variables reset** after runtime restart
    - **Files persist** in Google Drive between runs
    - **Secrets persist** across sessions
    - **Authentication required** after each restart

## :material-troubleshoot: Handling Errors

### Error Types

!!! failure "Common Error Categories"
    **Authentication Errors:**
    - Invalid or expired Auth URL
    - Missing Colab secrets
    - Insufficient Salesforce permissions
    
    **Network Errors:**
    - Internet connectivity issues
    - Salesforce server problems
    - Google Drive access issues
    
    **File Errors:**
    - Insufficient Drive storage
    - File corruption during download
    - Permission issues

### Error Recovery

!!! check "Recovery Steps"
    1. **Read error message** - often provides specific guidance
    2. **Check prerequisites** - verify auth, permissions, storage
    3. **Restart if needed** - clear any stuck processes
    4. **Re-run affected cells** - starting from where error occurred
    5. **Seek help** - consult troubleshooting guide if needed

### Prevention

!!! tip "Avoid Common Issues"
    - **Keep Auth URLs current** - refresh every 30-90 days
    - **Monitor Drive storage** - ensure adequate space
    - **Test connectivity** - verify Salesforce access before running
    - **Run during off-peak** - avoid high-traffic times

## :material-arrow-right: Next Steps

Now that you know how to run the notebook:

[Understand the Download Process :material-arrow-right:](download-process.md){ .md-button .md-button--primary }
[Learn File Management :material-arrow-right:](file-management.md){ .md-button }
