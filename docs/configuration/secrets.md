# Colab Secrets Configuration

Learn how to securely store and manage your authentication credentials using Google Colab's built-in secrets management system.

## :material-key: What are Colab Secrets?

Google Colab Secrets provide a secure way to store sensitive information like API keys, passwords, and authentication tokens without exposing them in your notebook code.

!!! security "Why Use Secrets?"
    - **Encrypted storage** - secrets are encrypted at rest
    - **No code exposure** - credentials never appear in notebook cells
    - **Runtime isolation** - secrets only available during notebook execution
    - **Easy management** - simple UI for adding/editing secrets
    - **Sharing safe** - notebooks can be shared without exposing credentials

## :material-cog-outline: Setting Up Secrets

### Accessing the Secrets Panel

!!! example "Opening Secrets Management"
    1. **Open your Colab notebook**
    2. **Look for the key icon** 🔑 in the left sidebar
    3. **Click the key icon** to open the Secrets panel
    4. You'll see the "Secrets" panel with options to add new secrets

### Adding Your SFDX Auth URL

!!! key "Create SFDX_AUTH_URL Secret"
    1. **Click "Add new secret"**
    2. **Name:** `SFDX_AUTH_URL`
    3. **Value:** Your complete SFDX Auth URL (from previous step)
    4. **Toggle "Notebook access" to ON**
    5. **Click "Save"**

!!! example "Example Configuration"
    ```
    Secret Name: SFDX_AUTH_URL
    Secret Value: force://PlatformCLI::5Aep861TSGFxEb9wE8VOJ3PH6Kc3xb...@mydomain.my.salesforce.com
    Notebook access: ✅ Enabled
    ```

### Secret Naming Conventions

!!! info "Important Naming Rules"
    - **Exact match required** - the automation looks for `SFDX_AUTH_URL` exactly
    - **Case sensitive** - `sfdx_auth_url` won't work
    - **No spaces** - use underscores instead
    - **Alphanumeric + underscore only** - no special characters

## :material-account-multiple: Multiple Org Configuration

### Managing Multiple Organizations

If you work with multiple Salesforce orgs, you can store multiple Auth URLs:

!!! tip "Multiple Secrets for Multiple Orgs"
    ```
    SFDX_AUTH_URL_PROD     - Production org
    SFDX_AUTH_URL_SANDBOX  - Sandbox org
    SFDX_AUTH_URL_DEV      - Developer org
    ```

### Switching Between Orgs

!!! example "Notebook Modification for Multiple Orgs"
    You can modify the notebook to use different secrets:
    
    ```python
    # In the authentication cell, change this line:
    sfdx_auth_url = userdata.get('SFDX_AUTH_URL')
    
    # To this (for production):
    sfdx_auth_url = userdata.get('SFDX_AUTH_URL_PROD')
    
    # Or this (for sandbox):
    sfdx_auth_url = userdata.get('SFDX_AUTH_URL_SANDBOX')
    ```

## :material-shield-check: Secret Security

### Security Best Practices

!!! security "Protecting Your Secrets"
    **Do:**
    - Use unique, descriptive names
    - Rotate secrets regularly (every 90 days)
    - Only enable notebook access when needed
    - Monitor usage through Salesforce login history
    
    **Don't:**
    - Share notebooks with secrets enabled
    - Use the same Auth URL across multiple environments
    - Store secrets in notebook code or markdown cells
    - Keep old/unused secrets

### Access Control

!!! warning "Notebook Access Toggle"
    The **"Notebook access"** toggle controls whether your running notebook can read the secret:
    
    - **ON (✅)** - Notebook can access the secret value
    - **OFF (❌)** - Secret is stored but not accessible to code
    
    **Always toggle OFF when not actively using the automation**

## :material-refresh: Secret Management

### Updating Secrets

!!! example "When to Update Your Auth URL"
    Update your `SFDX_AUTH_URL` secret when:
    
    - Authentication fails in the notebook
    - You get "Session expired" errors  
    - Your Salesforce password changes
    - MFA settings are updated
    - 90+ days have passed since last update

### Rotation Process

!!! check "Secret Rotation Steps"
    1. **Generate new Auth URL** using SFDX CLI
        ```bash
        sf org login web --target-org your-org
        sf org display --verbose --target-org your-org
        ```
    2. **Update the secret** in Colab Secrets panel
    3. **Test authentication** by running the auth cell
    4. **Verify exports work** by running a test download
    5. **Document the change** (optional but recommended)

### Backup and Recovery

!!! tip "Secret Backup Strategy"
    **Colab secrets are tied to your Google account:**
    - No export/backup feature available
    - Secrets are automatically synced across devices
    - If you lose access to your Google account, secrets are lost
    
    **Backup strategy:**
    - Keep Auth URL generation steps documented
    - Store SFDX CLI commands in a secure password manager
    - Test secret regeneration process periodically

## :material-code-tags: Using Secrets in Code

### Accessing Secrets

The automation accesses your secret using Google Colab's `userdata` module:

!!! example "Secret Access Code"
    ```python
    from google.colab import userdata
    
    # Get the secret value
    sfdx_auth_url = userdata.get('SFDX_AUTH_URL')
    
    # Check if secret exists
    if not sfdx_auth_url:
        print("❌ No SFDX_AUTH_URL found in secrets")
        return False
    
    # Use the secret (never print the full value!)
    print(f"✅ Found SFDX_AUTH_URL: {sfdx_auth_url[:15]}...")
    ```

### Error Handling

!!! warning "Common Secret Access Errors"
    
    **`KeyError: 'SFDX_AUTH_URL'`**
    - Secret name doesn't match exactly
    - Notebook access is disabled
    - Secret doesn't exist
    
    **`None` returned from `userdata.get()`**
    - Secret exists but notebook access is OFF
    - Typo in secret name
    - Runtime needs to be restarted

## :material-test-tube: Testing Your Configuration

### Validation Steps

!!! check "Verify Secret Setup"
    1. **Check secret exists:**
        ```python
        from google.colab import userdata
        auth_url = userdata.get('SFDX_AUTH_URL')
        print("Secret found!" if auth_url else "Secret missing!")
        ```
    
    2. **Verify format:**
        ```python
        if auth_url and auth_url.startswith('force://'):
            print("✅ Auth URL format looks correct")
        else:
            print("❌ Auth URL format invalid")
        ```
    
    3. **Test authentication:**
        - Run the authentication cell in the notebook
        - Look for "✅ Successfully authenticated" message

### Troubleshooting Secret Issues

!!! failure "Common Problems"
    
    **"Secret not found"**
    - Verify secret name is exactly `SFDX_AUTH_URL`
    - Check that "Notebook access" is enabled
    - Try refreshing the notebook page
    
    **"Authentication failed"**
    - Auth URL may be expired or invalid
    - Regenerate Auth URL using SFDX CLI
    - Update secret with new Auth URL
    
    **"Permission denied"**
    - Your Salesforce user may lack necessary permissions
    - Contact your Salesforce administrator
    - Verify user has "Data Export" and "API Enabled" permissions

## :material-alert-circle: Security Considerations

### What Secrets Contain

!!! info "SFDX Auth URL Components"
    Your Auth URL contains sensitive authentication tokens:
    
    - **Access tokens** - for immediate API access
    - **Refresh tokens** - for obtaining new access tokens  
    - **Instance information** - your Salesforce server details
    - **Client credentials** - SFDX CLI identification

### Protecting Your Organization

!!! security "Enterprise Security"
    For production/enterprise environments:
    
    - **Use dedicated service accounts** for automation
    - **Implement IP restrictions** on API access
    - **Monitor API usage** through Salesforce Setup
    - **Set up login anomaly detection**
    - **Regular audit of automated access**
    - **Document all automation accounts**

## :material-arrow-right: Next Steps

With secrets properly configured:

1. **Test the authentication** in your notebook
2. **Verify export access** is working
3. **Run your first automated export**

[Test Your Setup :material-arrow-right:](../usage/running.md){ .md-button .md-button--primary }
[Troubleshooting Guide :material-arrow-right:](../troubleshooting/){ .md-button }
