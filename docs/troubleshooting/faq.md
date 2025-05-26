# Frequently Asked Questions

Answers to common questions about SF Data Export Automation setup, usage, and troubleshooting.

## :material-cog: Setup and Configuration

### Q: Do I need to install anything on my computer?

!!! question "Local Installation Requirements"
    **A: No local installation required!** The automation runs entirely in Google Colab, which is browser-based. However, you do need:
    
    - A web browser (Chrome recommended)
    - Google account with Colab access
    - Salesforce account with export permissions
    
    **Optional:** You can install SFDX CLI locally to generate Auth URLs more easily, but it's not required as you can use Salesforce's browser-based CLI.

### Q: How do I get my SFDX Auth URL?

!!! question "SFDX Auth URL Generation"
    **A: Two methods available:**
    
    **Method 1 - Local SFDX CLI:**
    ```bash
    # Install SFDX CLI
    npm install -g @salesforce/cli
    
    # Login to your org
    sf org login web --target-org your-org
    
    # Get Auth URL
    sf org display --verbose --target-org your-org
    ```
    
    **Method 2 - Browser CLI:**
    1. Go to [developer.salesforce.com/tools/sfdxcli](https://developer.salesforce.com/tools/sfdxcli)
    2. Run the same commands in browser
    3. Copy the "Sfdx Auth Url" value

### Q: Can I use this with multiple Salesforce orgs?

!!! question "Multiple Org Support"
    **A: Yes!** You can configure multiple orgs by:
    
    1. **Create separate secrets** for each org:
        - `SFDX_AUTH_URL_PROD` (production)
        - `SFDX_AUTH_URL_SANDBOX` (sandbox)  
        - `SFDX_AUTH_URL_DEV` (developer org)
    
    2. **Modify the notebook** to use different secrets:
        ```python
        # Change this line in authentication cell:
        sfdx_auth_url = userdata.get('SFDX_AUTH_URL_PROD')  # for production
        ```
    
    3. **Use separate notebooks** for each org (recommended)

### Q: How often do I need to update my Auth URL?

!!! question "Auth URL Refresh Schedule"
    **A: Recommended refresh schedule:**
    
    - **Every 30-90 days** for regular maintenance
    - **Immediately after** password changes
    - **When authentication fails** in the notebook
    - **After MFA changes** in Salesforce
    
    **Signs you need to refresh:**
    - "Invalid grant" errors
    - "Authentication failed" messages
    - Unable to access Salesforce API

## :material-play: Usage and Operation

### Q: How long does the automation take to run?

!!! question "Runtime Expectations"
    **A: Depends on your export sizes:**
    
    | Org Size | Export Size | Typical Runtime |
    |----------|-------------|-----------------|
    | Small | 10-100 MB | 2-5 minutes |
    | Medium | 100 MB - 1 GB | 5-15 minutes |
    | Large | 1-5 GB | 15-45 minutes |
    | Enterprise | 5+ GB | 45+ minutes |
    
    **Factors affecting speed:**
    - Internet connection speed
    - Salesforce server load
    - Google Drive API performance
    - Number of export files

### Q: What happens if the download is interrupted?

!!! question "Download Interruption Handling"
    **A: The automation handles interruptions gracefully:**
    
    1. **Partial files are detected** and deleted
    2. **Downloads can be restarted** by re-running the notebook
    3. **Completed files are skipped** to avoid duplicates
    4. **Progress is maintained** across restarts
    
    **To recover from interruption:**
    - Restart the Colab runtime
    - Re-run all cells from authentication onward
    - Automation will resume where it left off

### Q: Can I schedule the automation to run automatically?

!!! question "Automated Scheduling"
    **A: Limited scheduling options with free Colab:**
    
    **Current limitations:**
    - Free Colab doesn't support true scheduling
    - Manual execution required
    
    **Workarounds:**
    - **Calendar reminders** - set weekly reminders
    - **Colab Pro** - longer runtime limits for complex workflows
    - **External triggers** - GitHub Actions or cloud functions (advanced)
    
    **Future enhancement:** Scheduling features may be added in future versions.

### Q: How do I know if my exports are current?

!!! question "Export Freshness Verification"
    **A: Check export dates:**
    
    1. **In Salesforce:**
        - Setup → Data → Data Export
        - Check "Created" dates on available exports
    
    2. **In the automation output:**
        - Export IDs correspond to generation timestamps
        - Folder names include download dates
    
    3. **File modification dates:**
        - Check file properties in Google Drive
        - Compare with your expected export schedule

## :material-shield-check: Security and Privacy

### Q: Is my Salesforce data secure?

!!! question "Data Security"
    **A: Yes, your data is protected through multiple layers:**
    
    **Authentication Security:**
    - Official Salesforce SFDX authentication
    - No passwords stored or transmitted
    - Token-based access with automatic refresh
    
    **Data Transmission:**
    - HTTPS encryption for all transfers
    - Direct streaming to your Google Drive
    - No intermediate storage on shared servers
    
    **Access Control:**
    - Files stored in your personal Google Drive
    - You control all sharing and permissions
    - Colab secrets are encrypted and private

### Q: Who can access my exported data?

!!! question "Data Access Control"
    **A: Only you have access by default:**
    
    **Your Control:**
    - Files stored in your personal Google Drive
    - You control all sharing permissions
    - No automatic sharing or access granted
    
    **Google's Access:**
    - Standard Google Drive privacy policies apply
    - Google doesn't access your file contents
    - Same privacy as any Google Drive file
    
    **Recommendations:**
    - Don't share export folders publicly
    - Use specific email permissions for team sharing
    - Consider Google Workspace for enhanced controls

### Q: What permissions does the automation need?

!!! question "Required Permissions"
    **A: Minimal necessary permissions:**
    
    **Salesforce Permissions:**
    - API Enabled (for programmatic access)
    - Data Export (to access export functionality)
    - View Setup and Configuration (for export page access)
    
    **Google Permissions:**
    - Google Drive access (read/write for file storage)
    - Google Colab execution (standard notebook permissions)
    
    **No permissions requested for:**
    - Email or contacts access
    - Other Google services
    - External sharing or access

## :material-troubleshoot: Troubleshooting

### Q: Why am I getting "No export IDs found"?

!!! question "Export Discovery Issues"
    **A: Several possible causes:**
    
    **Check these items:**
    1. **Weekly exports configured** in Salesforce?
        - Setup → Data → Data Export → Schedule Export
    2. **Exports available and not expired?**
        - Exports expire after 48 hours
    3. **User has export permissions?**
        - Contact your Salesforce administrator
    4. **Exports finished generating?**
        - Large orgs may take hours to complete
    
    **Quick test:** Access the Data Export page manually in Salesforce to verify exports exist.

### Q: The authentication works but downloads fail. Why?

!!! question "Download Failure After Auth Success"
    **A: Common causes and solutions:**
    
    **Session Issues:**
    - Authentication may have expired during download
    - Re-run the authentication cell
    
    **Network Problems:**
    - Check internet connection stability
    - Try downloading during off-peak hours
    
    **Export Availability:**
    - Exports may have expired (48-hour limit)
    - Re-run export ID fetch to get current exports
    
    **File Size Issues:**
    - Very large exports may timeout
    - Check Google Drive available space

### Q: How do I fix "Drive mount failed" errors?

!!! question "Google Drive Mount Issues"
    **A: Step-by-step resolution:**
    
    1. **Clear browser data:**
        - Clear cache and cookies for Google sites
        - Sign out and back into Google account
    
    2. **Force remount:**
        ```python
        from google.colab import drive
        drive.mount('/content/drive', force_remount=True)
        ```
    
    3. **Try incognito mode:**
        - Open Colab in private/incognito window
        - This isolates browser extension issues
    
    4. **Check Google account:**
        - Ensure Drive is accessible at drive.google.com
        - Verify account has sufficient storage

### Q: What if I get SSL certificate errors?

!!! question "SSL Certificate Problems"
    **A: Usually system or network related:**
    
    **Check system time:**
    - Ensure date/time is accurate
    - SSL certificates are time-sensitive
    
    **Network issues:**
    - Try different network connection
    - Corporate networks may interfere
    - Disable VPN temporarily
    
    **Browser problems:**
    - Clear browser cache completely
    - Try different browser (Chrome recommended)
    - Update browser to latest version

## :material-database: Data and Files

### Q: What format are the exported files?

!!! question "Export File Format"
    **A: Salesforce provides ZIP archives containing:**
    
    **File Structure:**
    ```
    WE_YourOrg_1.ZIP
    ├── Account.csv
    ├── Contact.csv  
    ├── Opportunity.csv
    ├── CustomObject__c.csv
    └── manifest.xml
    ```
    
    **CSV Format:**
    - Standard comma-separated values
    - Headers in first row
    - UTF-8 encoding
    - Readable by Excel, Python, R, etc.

### Q: How long should I keep the exported files?

!!! question "File Retention Strategy"
    **A: Depends on your compliance and business needs:**
    
    **Typical Retention:**
    - **Current month:** Keep all exports
    - **Previous 3 months:** Keep weekly snapshots
    - **Previous year:** Keep monthly snapshots
    - **Beyond 1 year:** Archive or delete per policy
    
    **Considerations:**
    - Regulatory compliance requirements
    - Business continuity needs
    - Storage costs and limits
    - Data privacy regulations (GDPR, CCPA)

### Q: Can I extract and analyze the data directly in Colab?

!!! question "Data Analysis in Colab"
    **A: Yes! You can process exports directly:**
    
    ```python
    import zipfile
    import pandas as pd
    
    # Read CSV from ZIP file
    with zipfile.ZipFile('WE_YourOrg_1.ZIP') as z:
        with z.open('Account.csv') as f:
            accounts = pd.read_csv(f)
    
    # Analyze the data
    print(f"Total accounts: {len(accounts)}")
    print(accounts.head())
    ```
    
    **Benefits:**
    - No need to download and extract locally
    - Full pandas/numpy analysis capabilities
    - Can create visualizations and reports
    - Results can be saved back to Drive

## :material-trending-up: Performance and Optimization

### Q: How can I make the automation run faster?

!!! question "Performance Optimization"
    **A: Several optimization strategies:**
    
    **Network Optimization:**
    - Use wired internet connection when possible
    - Run during off-peak hours (early morning/late evening)
    - Ensure stable connection throughout
    
    **Browser Optimization:**
    - Use Chrome for best Colab performance
    - Close unnecessary browser tabs
    - Clear cache before running
    
    **Timing Optimization:**
    - Run when Salesforce servers are less busy
    - Avoid peak business hours in your region
    - Consider weekend execution for large exports

### Q: Why do some exports download faster than others?

!!! question "Variable Download Speeds"
    **A: Multiple factors affect speed:**
    
    **File Size:**
    - Larger files naturally take longer
    - Compression ratio varies by data type
    
    **Data Complexity:**
    - More objects = more files to process
    - Complex relationships increase export time
    
    **Server Load:**
    - Salesforce server performance varies
    - Peak usage times are slower
    
    **Network Conditions:**
    - Internet connection quality
    - Route to Salesforce servers
    - Time of day effects

## :material-help-circle: Getting Additional Help

### Q: Where can I get more help if these FAQs don't answer my question?

!!! question "Additional Support Resources"
    **A: Several support options available:**
    
    **Documentation:**
    - Review the complete troubleshooting guide
    - Check error code reference for specific messages
    - Read setup and configuration guides
    
    **Community Resources:**
    - Salesforce Trailblazer Community
    - Google Colab community forums
    - Stack Overflow for technical questions
    
    **Official Support:**
    - Salesforce support for org-specific issues
    - Google support for Colab/Drive problems
    - Your IT department for network/firewall issues

### Q: Can I customize the automation for my specific needs?

!!! question "Customization Options"
    **A: Yes, the notebook can be modified:**
    
    **Common Customizations:**
    - Change file naming conventions
    - Modify folder organization structure
    - Add custom processing after download
    - Integrate with other tools/systems
    
    **Technical Requirements:**
    - Basic Python knowledge helpful
    - Understanding of Jupyter notebooks
    - Familiarity with APIs (for advanced integration)
    
    **Caution:** Test modifications thoroughly before using in production.

## :material-lightbulb: Best Practices

### Q: What are the best practices for using this automation?

!!! question "Recommended Best Practices"
    **A: Follow these guidelines for optimal results:**
    
    **Security:**
    - Refresh Auth URLs every 30-90 days
    - Don't share notebooks with secrets enabled
    - Monitor Salesforce login history regularly
    
    **Reliability:**
    - Test authentication before important runs
    - Ensure adequate Google Drive storage
    - Use stable internet connections
    
    **Organization:**
    - Maintain consistent naming conventions
    - Document any customizations made
    - Keep backup of working configuration
    
    **Monitoring:**
    - Check export completion status
    - Verify file sizes match expectations
    - Review error logs for patterns

## :material-arrow-right: Still Have Questions?

If your question isn't answered here:

[Check Common Issues :material-arrow-right:](common-issues.md){ .md-button .md-button--primary }
[Review Error Codes :material-arrow-right:](error-codes.md){ .md-button }
[Back to Troubleshooting :material-arrow-right:](index.md){ .md-button }
