# SFDX Authentication Setup

Learn how to set up secure authentication with Salesforce using the SFDX CLI for automated data exports.

## :material-information: What is SFDX Authentication?

SFDX (Salesforce DX) is Salesforce's official command-line interface. It provides secure, token-based authentication that's perfect for automation scenarios.

!!! info "Why SFDX?"
    - **Official Salesforce tool** - fully supported and maintained
    - **Secure token-based auth** - no passwords stored or transmitted
    - **Long-lived sessions** - tokens work for extended periods
    - **Audit trail** - all API calls are logged in Salesforce
    - **Fine-grained permissions** - respects all Salesforce security settings

## :material-download: Installing SFDX CLI

### Option 1: Local Installation (Recommended)

!!! example "Install SFDX CLI Locally"
    
    **On macOS/Linux:**
    ```bash
    # Using npm (requires Node.js)
    npm install -g @salesforce/cli
    
    # Or using Homebrew (macOS only)
    brew install sfdx-cli
    ```
    
    **On Windows:**
    ```cmd
    # Using npm (requires Node.js)
    npm install -g @salesforce/cli
    
    # Or download installer from Salesforce
    # https://developer.salesforce.com/tools/sfdxcli
    ```

### Option 2: Browser-Based CLI

!!! tip "No Local Installation Required"
    Use Salesforce's browser-based CLI:
    
    1. Go to [developer.salesforce.com/tools/sfdxcli](https://developer.salesforce.com/tools/sfdxcli)
    2. No installation required - runs in your browser
    3. Full SFDX functionality available

## :material-login: Authenticating with Salesforce

### Step 1: Login to Your Org

!!! example "Web-Based Authentication"
    ```bash
    # Login using web browser (recommended)
    sf org login web --set-default-dev-hub
    
    # For production orgs
    sf org login web --instance-url https://login.salesforce.com
    
    # For sandbox orgs
    sf org login web --instance-url https://test.salesforce.com
    ```

This will:

1. **Open your browser** automatically
2. **Redirect to Salesforce login** page
3. **Prompt for credentials** (username/password + MFA if enabled)
4. **Return to terminal** with success confirmation

### Step 2: Verify Authentication

!!! success "Test Your Connection"
    ```bash
    # List authenticated orgs
    sf org list
    
    # Display current org info
    sf org display
    
    # Test API access
    sf data query --query "SELECT Id, Name FROM Organization LIMIT 1"
    ```

## :material-key: Getting Your Auth URL

The Auth URL is a secure token that contains your authentication information.

### Generate Auth URL

!!! example "Extract Auth URL"
    ```bash
    # Get detailed org information including Auth URL
    sf org display --verbose --target-org your-username@yourorg.com
    ```
    
    Look for the line that says:
    ```
    Sfdx Auth Url    force://PlatformCLI::5Aep861TSGFxEb9wE8VOJ3PH6Kc3xb...@mydomain.my.salesforce.com
    ```

### Auth URL Format

!!! info "Understanding the Auth URL"
    ```
    force://PlatformCLI::[ACCESS_TOKEN]::[REFRESH_TOKEN]@[INSTANCE_URL]
    ```
    
    - **force://**: Protocol identifier
    - **PlatformCLI**: Client identifier
    - **ACCESS_TOKEN**: Your access token (encrypted)
    - **REFRESH_TOKEN**: Refresh token (encrypted)
    - **INSTANCE_URL**: Your Salesforce instance

!!! warning "Keep Your Auth URL Secure"
    - **Never share** your Auth URL with others
    - **Don't commit** it to version control
    - **Store securely** in Colab Secrets only
    - **Rotate regularly** (every 90 days recommended)

## :material-account-multiple: Multiple Org Configuration

### Managing Multiple Orgs

!!! tip "Working with Multiple Salesforce Orgs"
    ```bash
    # Login to production
    sf org login web --alias production --instance-url https://login.salesforce.com
    
    # Login to sandbox
    sf org login web --alias sandbox --instance-url https://test.salesforce.com
    
    # Login to developer org
    sf org login web --alias devorg --instance-url https://login.salesforce.com
    
    # List all authenticated orgs
    sf org list
    
    # Set default org
    sf config set target-org production
    ```

### Getting Auth URLs for Multiple Orgs

!!! example "Multiple Auth URLs"
    ```bash
    # Production org
    sf org display --verbose --target-org production
    
    # Sandbox org
    sf org display --verbose --target-org sandbox
    
    # Developer org
    sf org display --verbose --target-org devorg
    ```

## :material-refresh: Token Management

### Token Expiration

!!! warning "Auth URL Lifespan"
    - **Access tokens**: Typically expire after 2 hours
    - **Refresh tokens**: Can last for months/years
    - **Session tokens**: Used by the automation, refresh automatically
    - **Best practice**: Generate new Auth URLs monthly

### Refreshing Authentication

!!! example "When to Refresh"
    You'll need to regenerate your Auth URL if:
    
    - Authentication fails in the Colab notebook
    - You get "Session expired" errors
    - It's been more than 90 days since last generation
    - You've changed your Salesforce password
    - MFA settings have been updated

    ```bash
    # Re-authenticate and get new Auth URL
    sf org login web --target-org your-username@yourorg.com
    sf org display --verbose --target-org your-username@yourorg.com
    ```

## :material-shield-check: Security Best Practices

### Authentication Security

!!! security "Security Recommendations"
    
    **For Production Orgs:**
    - Use dedicated integration user accounts
    - Enable IP restrictions for API access
    - Monitor API usage in Setup → Login History
    - Set up login anomaly detection
    
    **For Sandbox/Dev Orgs:**
    - Still use dedicated accounts when possible
    - Regular password rotation
    - Monitor unusual API activity

### Permission Management

!!! info "Required Permissions"
    Your Salesforce user needs these permissions:
    
    - **API Enabled** - allows API access
    - **Data Export** - allows access to export functionality
    - **View Setup and Configuration** - for accessing export pages
    
    Optional but recommended:
    - **System Administrator** - full access (if appropriate)
    - **Modify All Data** - if you need to update export settings

## :material-troubleshoot: Troubleshooting Authentication

### Common Issues

!!! failure "Authentication Problems"
    
    **"Command not found: sf"**
    ```bash
    # Install SFDX CLI
    npm install -g @salesforce/cli
    
    # Or check if it's installed as 'sfdx'
    sfdx --version
    ```
    
    **"This org appears to have a problem"**
    - Check your internet connection
    - Verify org is accessible via web browser
    - Try logging out and back in: `sf auth logout --target-org your-org`
    
    **"Invalid grant" error**
    - Auth URL may be expired
    - Regenerate auth URL: `sf org login web`
    - Check for typos in the Auth URL

### Validation Steps

!!! check "Verify Your Setup"
    ```bash
    # 1. Check SFDX installation
    sf --version
    
    # 2. List authenticated orgs
    sf org list
    
    # 3. Test org access
    sf org display --target-org your-org
    
    # 4. Test data access
    sf data query --query "SELECT Count() FROM User" --target-org your-org
    
    # 5. Verify export access (if you have permissions)
    sf data export --query "SELECT Id FROM Organization LIMIT 1" --target-org your-org
    ```

## :material-arrow-right: Next Steps

Once you have your SFDX Auth URL:

1. **Store it securely** in Colab Secrets
2. **Test the authentication** in the notebook
3. **Configure Google Drive** integration

[Configure Colab Secrets :material-arrow-right:](secrets.md){ .md-button .md-button--primary }
[Google Drive Setup :material-arrow-right:](drive-setup.md){ .md-button }
