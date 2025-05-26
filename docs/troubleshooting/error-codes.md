# Error Code Reference

Comprehensive reference for specific error messages and codes you might encounter.

## :material-shield-alert: Authentication Error Codes

### SFDX Authentication Errors

!!! error "INVALID_LOGIN: Invalid username, password, security token"
    **Error Code:** `INVALID_LOGIN`
    
    **Meaning:** Salesforce rejected the login credentials.
    
    **Causes:**
    - Expired SFDX Auth URL
    - Changed password since Auth URL generation
    - MFA token issues
    
    **Solutions:**
    1. Generate new SFDX Auth URL:
        ```bash
        sf org login web --target-org your-org
        sf org display --verbose --target-org your-org
        ```
    2. Update Colab secret with new Auth URL
    3. Verify MFA is properly configured

!!! error "INVALID_GRANT: Invalid grant"
    **Error Code:** `INVALID_GRANT`
    
    **Meaning:** OAuth token is invalid or expired.
    
    **Causes:**
    - Auth URL has expired (typically after 90+ days)
    - User password was changed
    - Org security settings changed
    
    **Solutions:**
    1. Re-authenticate with Salesforce
    2. Generate fresh Auth URL
    3. Check for recent security policy changes

### Permission Errors

!!! error "INSUFFICIENT_ACCESS_OR_READONLY: Insufficient access rights"
    **Error Code:** `INSUFFICIENT_ACCESS_OR_READONLY`
    
    **Meaning:** User lacks required permissions.
    
    **Required Permissions:**
    - API Enabled
    - Data Export
    - View Setup and Configuration
    
    **Solutions:**
    1. Contact Salesforce administrator
    2. Request permission set assignment
    3. Use System Administrator account for testing

!!! error "REQUEST_LIMIT_EXCEEDED: API request limit exceeded"
    **Error Code:** `REQUEST_LIMIT_EXCEEDED`
    
    **Meaning:** Daily API call limit reached.
    
    **Solutions:**
    1. Wait 24 hours for limit reset
    2. Contact admin to increase API limits
    3. Use different org if available
    4. Schedule automation during off-peak hours

## :material-wifi-off: Network Error Codes

### HTTP Status Codes

!!! error "HTTP 401: Unauthorized"
    **Status Code:** `401`
    
    **Meaning:** Authentication failed or expired.
    
    **Solutions:**
    1. Re-run authentication cell
    2. Check SFDX Auth URL validity
    3. Verify Colab secrets configuration
    4. Generate new Auth URL if needed

!!! error "HTTP 403: Forbidden"
    **Status Code:** `403`
    
    **Meaning:** Access denied due to permissions.
    
    **Causes:**
    - Insufficient Salesforce permissions
    - IP restrictions on org
    - Profile doesn't allow API access
    
    **Solutions:**
    1. Check user permissions in Salesforce
    2. Verify IP allowlists include Colab IPs
    3. Contact administrator for access review

!!! error "HTTP 404: Not Found"
    **Status Code:** `404`
    
    **Meaning:** Requested resource doesn't exist.
    
    **Common Causes:**
    - Export file has expired (48-hour limit)
    - Export ID is incorrect
    - Export was deleted from Salesforce
    
    **Solutions:**
    1. Re-run export ID fetch to get current exports
    2. Check Data Export page in Salesforce
    3. Generate new exports if needed

!!! error "HTTP 500: Internal Server Error"
    **Status Code:** `500`
    
    **Meaning:** Salesforce server error.
    
    **Solutions:**
    1. Wait 10-15 minutes and retry
    2. Check [status.salesforce.com](https://status.salesforce.com)
    3. Try during different hours
    4. Contact Salesforce if persistent

!!! error "HTTP 503: Service Unavailable"
    **Status Code:** `503`
    
    **Meaning:** Salesforce service temporarily unavailable.
    
    **Solutions:**
    1. Retry after short delay (5-10 minutes)
    2. Check Salesforce service status
    3. Schedule automation for off-peak hours
    4. Contact Salesforce support if ongoing

### SSL/TLS Errors

!!! error "SSL: CERTIFICATE_VERIFY_FAILED"
    **Error Type:** `SSL Certificate Error`
    
    **Meaning:** Cannot verify SSL certificate.
    
    **Causes:**
    - System clock is incorrect
    - Network proxy interfering
    - Corporate firewall issues
    
    **Solutions:**
    1. Check system date/time accuracy
    2. Try different network connection
    3. Disable VPN temporarily
    4. Contact IT department for corporate networks

!!! error "Connection timeout"
    **Error Type:** `Network Timeout`
    
    **Meaning:** Network request took too long.
    
    **Solutions:**
    1. Check internet connection speed
    2. Retry during off-peak hours
    3. Use wired connection instead of WiFi
    4. Contact ISP if persistent

## :material-google-drive: Google Drive Error Codes

### Drive API Errors

!!! error "403: The user does not have sufficient permissions"
    **Error Code:** `Drive API 403`
    
    **Meaning:** Insufficient Google Drive permissions.
    
    **Solutions:**
    1. Re-authorize Google Drive access:
        ```python
        from google.colab import drive
        drive.mount('/content/drive', force_remount=True)
        ```
    2. Check Google account permissions
    3. Clear browser cache and re-authorize

!!! error "Storage quota exceeded"
    **Error Type:** `Quota Exceeded`
    
    **Meaning:** Google Drive storage is full.
    
    **Solutions:**
    1. Check Drive storage: [drive.google.com/settings](https://drive.google.com/settings)
    2. Delete large files or empty trash
    3. Upgrade Google storage plan
    4. Use different Google account

### File System Errors

!!! error "No such file or directory: '/content/drive'"
    **Error Code:** `FileNotFound`
    
    **Meaning:** Google Drive not mounted.
    
    **Solutions:**
    1. Mount Google Drive:
        ```python
        from google.colab import drive
        drive.mount('/content/drive')
        ```
    2. Re-run Drive setup cell
    3. Check browser authorization prompts

!!! error "Permission denied: Cannot write to Drive"
    **Error Type:** `Permission Denied`
    
    **Meaning:** Write access denied to Google Drive.
    
    **Solutions:**
    1. Check Drive authorization scope
    2. Re-authorize with full permissions
    3. Verify folder permissions in Google Drive
    4. Try creating files in different location

## :material-download: Download Error Codes

### File Download Errors

!!! error "Download failed: File size mismatch"
    **Error Type:** `Size Mismatch`
    
    **Meaning:** Downloaded file size doesn't match expected size.
    
    **Causes:**
    - Network interruption during download
    - Server-side issue with export file
    - Corrupted transmission
    
    **Solutions:**
    1. Delete partial file from Google Drive
    2. Retry download with stable connection
    3. Check file integrity in Salesforce

!!! error "Download failed: Invalid content type 'text/html'"
    **Error Type:** `Content Type Error`
    
    **Meaning:** Received HTML page instead of ZIP file.
    
    **Causes:**
    - Authentication expired during download
    - Session timeout
    - Salesforce returned error page
    
    **Solutions:**
    1. Re-run authentication cell
    2. Check if logged into Salesforce manually
    3. Verify export is still available

### Compression Errors

!!! error "zipfile.BadZipFile: File is not a zip file"
    **Error Code:** `BadZipFile`
    
    **Meaning:** Downloaded file is not a valid ZIP archive.
    
    **Causes:**
    - Download was interrupted
    - Server returned error page instead of file
    - File corruption during transfer
    
    **Solutions:**
    1. Check actual file contents (may be HTML error page)
    2. Delete corrupted file and re-download
    3. Verify export generation in Salesforce
    4. Check network stability

## :material-cog: Runtime Error Codes

### Python/Colab Errors

!!! error "ModuleNotFoundError: No module named 'package'"
    **Error Code:** `ModuleNotFoundError`
    
    **Meaning:** Required Python package not installed.
    
    **Solutions:**
    1. Restart runtime to trigger fresh package installation
    2. Run authentication cell again (installs dependencies)
    3. Manually install if needed:
        ```python
        !pip install package-name
        ```

!!! error "MemoryError: Unable to allocate array"
    **Error Code:** `MemoryError`
    
    **Meaning:** Insufficient RAM for operation.
    
    **Solutions:**
    1. Restart runtime to clear memory
    2. Close other browser tabs
    3. Process smaller batches of exports
    4. Upgrade to Colab Pro for more RAM

!!! error "KeyError: 'SFDX_AUTH_URL'"
    **Error Code:** `KeyError`
    
    **Meaning:** Secret not found or accessible.
    
    **Solutions:**
    1. Check secret name is exactly `SFDX_AUTH_URL`
    2. Verify "Notebook access" is enabled (✅)
    3. Add secret if missing
    4. Restart runtime and try again

### Execution Timeout

!!! error "DeadlineExceeded: Execution timeout"
    **Error Code:** `DeadlineExceeded`
    
    **Meaning:** Operation took longer than allowed time.
    
    **Causes:**
    - Large file downloads
    - Slow network connection
    - Server processing delays
    
    **Solutions:**
    1. Retry with better network connection
    2. Run during off-peak hours
    3. Break into smaller operations
    4. Use Colab Pro for longer timeouts

## :material-database: Data Export Error Codes

### Salesforce Export Errors

!!! error "QUERY_TIMEOUT: Your query request was running for too long"
    **Error Code:** `QUERY_TIMEOUT`
    
    **Meaning:** Salesforce query execution timeout.
    
    **Solutions:**
    1. Wait for Salesforce to complete export generation
    2. Check if export is available in Data Export page
    3. Contact administrator if exports consistently fail
    4. Consider smaller export scopes

!!! error "STORAGE_LIMIT_EXCEEDED: Data storage limit exceeded"
    **Error Code:** `STORAGE_LIMIT_EXCEEDED`
    
    **Meaning:** Salesforce org storage limit reached.
    
    **Solutions:**
    1. Contact Salesforce administrator
    2. Clean up unnecessary data in org
    3. Purchase additional storage
    4. Archive old records

### Export Generation Errors

!!! error "No data exported - verify your export settings"
    **Error Type:** `Empty Export`
    
    **Meaning:** Export contains no data.
    
    **Causes:**
    - No data matches export criteria
    - Object permissions prevent data access
    - Export filter settings too restrictive
    
    **Solutions:**
    1. Check export configuration in Salesforce
    2. Verify object-level security settings
    3. Review export filters and criteria
    4. Test with simpler export scope

## :material-diagnostic: Diagnostic Commands

### Verification Commands

!!! info "Testing SFDX Connection"
    ```bash
    # Check SFDX version
    sf --version
    
    # List authenticated orgs
    sf org list
    
    # Test org connection
    sf org display --target-org your-org
    
    # Test data access
    sf data query --query "SELECT Id FROM Organization LIMIT 1" --target-org your-org
    ```

!!! info "Testing Google Drive"
    ```python
    # Check Drive mount
    import os
    print("Drive mounted:" if os.path.exists('/content/drive') else "Drive not mounted")
    
    # Check Drive contents
    !ls -la "/content/drive/MyDrive/"
    
    # Test file creation
    with open('/content/drive/MyDrive/test.txt', 'w') as f:
        f.write('test')
    print("✅ Can write to Drive")
    ```

## :material-bug-check: Error Prevention

### Proactive Monitoring

!!! tip "Prevent Issues Before They Occur"
    **Regular Checks:**
    - Monthly SFDX Auth URL refresh
    - Weekly Google Drive storage review
    - Periodic Salesforce permission verification
    - Network connectivity testing before runs
    
    **Monitoring Commands:**
    ```python
    # Check auth URL validity
    from google.colab import userdata
    auth_url = userdata.get('SFDX_AUTH_URL')
    print("Auth URL configured:" if auth_url else "❌ Auth URL missing")
    
    # Check Drive space
    import shutil
    total, used, free = shutil.disk_usage('/content/drive/MyDrive/')
    print(f"Drive space: {free//1024//1024//1024}GB free")
    ```

## :material-arrow-right: Next Steps

If you can't find your specific error code here:

[Check Common Issues :material-arrow-right:](common-issues.md){ .md-button .md-button--primary }
[Browse FAQ :material-arrow-right:](faq.md){ .md-button }
