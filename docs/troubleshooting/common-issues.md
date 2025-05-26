# Common Issues

Solutions to the most frequently encountered problems with SF Data Export Automation.

## :material-shield-alert: Authentication Issues

### SFDX Auth URL Problems

!!! failure "❌ No SFDX_AUTH_URL found in secrets"
    
    **Cause:** The automation can't find your authentication credentials.
    
    **Solutions:**
    1. **Check secret name** - must be exactly `SFDX_AUTH_URL`
    2. **Verify notebook access** - toggle must be ON (✅)
    3. **Add the secret** if missing:
        - Click 🔑 key icon in Colab sidebar
        - Add new secret with name `SFDX_AUTH_URL`
        - Paste your complete Auth URL
        - Enable notebook access
    
    **Test:** Re-run the authentication cell

!!! failure "❌ Authentication failed: Invalid grant"
    
    **Cause:** Your SFDX Auth URL has expired or is invalid.
    
    **Solutions:**
    1. **Generate new Auth URL:**
        ```bash
        sf org login web --target-org your-org
        sf org display --verbose --target-org your-org
        ```
    2. **Update Colab secret** with new Auth URL
    3. **Check for typos** in the Auth URL
    4. **Verify org access** - try logging into Salesforce manually
    
    **Prevention:** Refresh Auth URLs every 30-90 days

!!! failure "❌ This org appears to have a problem"
    
    **Cause:** Salesforce org is inaccessible or has restrictions.
    
    **Solutions:**
    1. **Test org access** - log into Salesforce web interface
    2. **Check org status** - verify not in maintenance mode
    3. **Verify user permissions** - ensure API and Data Export access
    4. **Try different user** - test with admin account
    5. **Check IP restrictions** - may need to whitelist Colab IPs
    
    **Note:** Some orgs have API access restrictions

### Permission Problems

!!! failure "❌ Insufficient privileges"
    
    **Cause:** Your Salesforce user lacks required permissions.
    
    **Required Permissions:**
    - API Enabled
    - Data Export
    - View Setup and Configuration
    
    **Solutions:**
    1. **Contact Salesforce admin** to grant permissions
    2. **Use admin account** for testing
    3. **Check profile settings** in Salesforce Setup
    4. **Verify permission sets** applied to your user

## :material-wifi-off: Connection Issues

### Network Connectivity

!!! failure "❌ Network error: Connection timeout"
    
    **Cause:** Internet connection or network restrictions.
    
    **Solutions:**
    1. **Check internet connection** - test other websites
    2. **Try different network** - mobile hotspot, different WiFi
    3. **Disable VPN** temporarily if using one
    4. **Check firewall settings** - ensure Colab/Salesforce access
    5. **Restart router/modem** if connection is unstable
    
    **Corporate Networks:** May block Google Colab or Salesforce API calls

!!! failure "❌ SSL: CERTIFICATE_VERIFY_FAILED"
    
    **Cause:** SSL certificate validation issues.
    
    **Solutions:**
    1. **Check system time** - ensure accurate date/time
    2. **Try different browser** - Chrome usually works best
    3. **Clear browser cache** and cookies
    4. **Disable security software** temporarily
    5. **Check corporate proxy** settings

### Salesforce Server Issues

!!! failure "❌ HTTP 503: Service Unavailable"
    
    **Cause:** Salesforce server is temporarily unavailable.
    
    **Solutions:**
    1. **Wait and retry** - often resolves in 5-15 minutes
    2. **Check Salesforce status** - [status.salesforce.com](https://status.salesforce.com)
    3. **Try during off-peak hours** - avoid peak usage times
    4. **Contact Salesforce support** if persistent

## :material-google-drive: Google Drive Issues

### Drive Mounting Problems

!!! failure "❌ Drive mount failed"
    
    **Cause:** Google Drive authorization or connection issues.
    
    **Solutions:**
    1. **Clear browser data:**
        - Clear cache and cookies
        - Sign out and back into Google account
    2. **Re-authorize Drive:**
        ```python
        from google.colab import drive
        drive.mount('/content/drive', force_remount=True)
        ```
    3. **Check Google account** - ensure Drive is accessible
    4. **Try incognito mode** - isolate browser extension issues
    5. **Use different Google account** if needed

!!! failure "❌ Permission denied: Insufficient storage"
    
    **Cause:** Google Drive is full or nearly full.
    
    **Solutions:**
    1. **Check Drive storage:**
        - Go to [drive.google.com/settings](https://drive.google.com/settings)
        - View storage usage breakdown
    2. **Free up space:**
        - Delete large files from Drive, Gmail, Photos
        - Empty Google Drive trash
    3. **Upgrade storage** if needed
    4. **Use different account** with available space

### File Access Issues

!!! failure "❌ File already exists but appears corrupted"
    
    **Cause:** Previous download was interrupted or corrupted.
    
    **Solutions:**
    1. **Delete the corrupted file** from Google Drive
    2. **Clear browser cache** 
    3. **Re-run download** - automation will re-download
    4. **Check file size** - compare with expected size
    5. **Test file integrity** - try opening the ZIP file

## :material-download: Download Issues

### Export Discovery Problems

!!! failure "❌ Found 0 export IDs"
    
    **Cause:** No weekly exports available or accessible.
    
    **Solutions:**
    1. **Check Salesforce Data Export page** manually:
        - Setup → Data → Data Export
        - Verify exports are available
    2. **Verify export setup:**
        - Ensure weekly exports are configured
        - Check export status (should be "Available")
    3. **Wait for export generation:**
        - Exports are created weekly by Salesforce
        - May take time after schedule
    4. **Check user permissions:**
        - Ensure access to Data Export functionality

!!! failure "❌ Export page returned HTML instead of expected content"
    
    **Cause:** Authentication expired or insufficient permissions.
    
    **Solutions:**
    1. **Refresh authentication:**
        - Re-run authentication cell
        - Generate new SFDX Auth URL if needed
    2. **Check session validity:**
        - Try accessing Salesforce manually
        - Verify no MFA challenges pending
    3. **Clear browser state:**
        - Restart Colab runtime
        - Clear cookies and cache

### Download Failures

!!! failure "❌ Download failed: HTTP 404"
    
    **Cause:** Export file no longer available (expired).
    
    **Solutions:**
    1. **Check export availability** in Salesforce
    2. **Run fetch export IDs** again - get current exports
    3. **Contact admin** - may need to regenerate exports
    
    **Note:** Salesforce exports typically expire after 48 hours

!!! failure "❌ Download interrupted: Connection reset"
    
    **Cause:** Network interruption during large file download.
    
    **Solutions:**
    1. **Ensure stable connection** before retrying
    2. **Delete partial file** from Google Drive
    3. **Retry download** - automation will restart
    4. **Use wired connection** if on WiFi
    5. **Try during off-peak hours**

## :material-cog: Runtime Issues

### Colab Environment Problems

!!! failure "❌ Runtime disconnected"
    
    **Cause:** Normal Colab timeout or resource limits reached.
    
    **Solutions:**
    1. **Reconnect runtime:**
        - Click "Reconnect" button
        - Or Runtime → Reconnect
    2. **Re-run cells:**
        - Start from authentication cell
        - Continue through download process
    3. **Upgrade to Colab Pro** for longer runtimes
    
    **Note:** Free Colab has 12-hour limit and 90-minute idle timeout

!!! failure "❌ Package installation failed"
    
    **Cause:** Network issues or package repository problems.
    
    **Solutions:**
    1. **Restart runtime:**
        - Runtime → Restart runtime
        - Re-run from beginning
    2. **Check internet connection**
    3. **Try again later** - repository may be temporarily unavailable
    4. **Clear Colab cache:**
        - Close and reopen notebook
        - Try in incognito mode

### Memory and Performance Issues

!!! failure "❌ Out of memory error"
    
    **Cause:** Large exports exceeding available RAM.
    
    **Solutions:**
    1. **Restart runtime** to clear memory
    2. **Close other browser tabs** to free resources
    3. **Process exports separately:**
        - Download one export at a time
        - Modify automation to handle smaller batches
    4. **Upgrade to Colab Pro** for more RAM

!!! failure "❌ Process taking too long / appears stuck"
    
    **Cause:** Large files, slow connection, or hung process.
    
    **Solutions:**
    1. **Check progress indicators** - look for active progress bars
    2. **Wait for large files** - multi-GB downloads take time
    3. **Check internet speed** - test connection speed
    4. **Restart if truly stuck:**
        - Interrupt execution (Runtime → Interrupt)
        - Restart runtime and retry

## :material-zip-disk: File Format Issues

### ZIP File Problems

!!! failure "❌ Cannot open downloaded ZIP file"
    
    **Cause:** File corruption during download or invalid export.
    
    **Solutions:**
    1. **Check file size:**
        - Compare actual vs expected size
        - Very small files (< 1MB) may be error pages
    2. **Re-download the file:**
        - Delete corrupted file from Drive
        - Re-run download automation
    3. **Test with different tools:**
        - Try different ZIP extraction software
        - Use command line: `unzip -t filename.zip`
    4. **Contact Salesforce** if exports are consistently corrupted

!!! failure "❌ ZIP file is empty or contains no CSV files"
    
    **Cause:** Export generation issue in Salesforce.
    
    **Solutions:**
    1. **Check export status** in Salesforce Data Export page
    2. **Verify export settings:**
        - Ensure data is selected for export
        - Check object permissions
    3. **Generate new export** in Salesforce
    4. **Contact Salesforce admin** for export configuration help

## :material-clock-alert: Timing Issues

### Schedule and Availability

!!! failure "❌ Exports not available when expected"
    
    **Cause:** Salesforce export generation timing varies.
    
    **Solutions:**
    1. **Check Salesforce export schedule:**
        - Setup → Data → Data Export
        - Review export configuration
    2. **Wait for generation:**
        - Exports may take hours to generate
        - Large orgs may have longer processing times
    3. **Verify export settings:**
        - Ensure weekly exports are enabled
        - Check for any configuration issues

### Timeout Problems

!!! failure "❌ Request timeout"
    
    **Cause:** Network latency or server response delays.
    
    **Solutions:**
    1. **Retry the operation** - often resolves on retry
    2. **Check network stability**
    3. **Try during off-peak hours:**
        - Early morning or late evening
        - Weekends often have better performance
    4. **Break into smaller operations** if possible

## :material-wrench: Quick Fixes Checklist

!!! check "Try These First"
    **Before deep troubleshooting:**
    
    - [ ] **Restart runtime** - Runtime → Restart runtime
    - [ ] **Check internet connection** - test other websites
    - [ ] **Verify Salesforce access** - log in manually
    - [ ] **Check Google Drive space** - ensure adequate storage
    - [ ] **Clear browser cache** - refresh browser state
    - [ ] **Try incognito mode** - isolate extension issues
    - [ ] **Re-run authentication** - refresh credentials
    - [ ] **Check for typos** - verify all configuration values

## :material-arrow-right: Still Having Issues?

If these common solutions don't resolve your problem:

[Check Error Codes :material-arrow-right:](error-codes.md){ .md-button .md-button--primary }
[Browse FAQ :material-arrow-right:](faq.md){ .md-button }
