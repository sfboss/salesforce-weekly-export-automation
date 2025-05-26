
#!/bin/bash

# SF Data Export Automation - Documentation Site Setup
# This script creates a complete MkDocs site for the Salesforce Data Export Automation tool

set -e

echo "🚀 Setting up SF Data Export Automation Documentation Site..."

# Create project structure
PROJECT_NAME="sf-data-export-docs"
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo "📁 Creating directory structure..."
mkdir -p docs/{setup,configuration,usage,troubleshooting,assets/images}

# Create mkdocs.yml
echo "📝 Creating mkdocs.yml configuration..."
cat > mkdocs.yml << 'EOF'
site_name: SF Data Export Automation
site_description: Automated Salesforce Weekly Export Download to Google Drive
site_author: Data Export Team
site_url: https://your-domain.github.io/sf-data-export-docs/

# Repository
repo_name: sf-data-export-automation
repo_url: https://github.com/your-username/sf-data-export-automation
edit_uri: edit/main/docs/

# Copyright
copyright: Copyright &copy; 2025 SF Data Export Automation

# Configuration
theme:
  name: material
  features:
    - announce.dismiss
    - content.action.edit
    - content.action.view
    - content.code.annotate
    - content.code.copy
    - content.tabs.link
    - content.tooltips
    - header.autohide
    - navigation.expand
    - navigation.footer
    - navigation.indexes
    - navigation.instant
    - navigation.instant.prefetch
    - navigation.instant.progress
    - navigation.prune
    - navigation.sections
    - navigation.tabs
    - navigation.tabs.sticky
    - navigation.top
    - navigation.tracking
    - search.highlight
    - search.share
    - search.suggest
    - toc.follow
    - toc.integrate
  palette:
    - scheme: default
      primary: blue
      accent: cyan
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    - scheme: slate
      primary: blue
      accent: cyan
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  font:
    text: Roboto
    code: Roboto Mono
  favicon: assets/favicon.png
  icon:
    logo: material/cloud-download
    repo: fontawesome/brands/github

# Plugins
plugins:
  - search:
      separator: '[\s\-,:!=\[\]()"`/]+|\.(?!\d)|&[lg]t;|(?!)(?=[A-Z][a-z])'
  - minify:
      minify_html: true

# Customization
extra:
  annotate:
    json: [.s2]
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/your-username/sf-data-export-automation
    - icon: fontawesome/brands/twitter
      link: https://twitter.com/your-handle

# Extensions
markdown_extensions:
  - abbr
  - admonition
  - attr_list
  - def_list
  - footnotes
  - md_in_html
  - toc:
      permalink: true
  - pymdownx.arithmatex:
      generic: true
  - pymdownx.betterem:
      smart_enable: all
  - pymdownx.caret
  - pymdownx.details
  - pymdownx.emoji:
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
      emoji_index: !!python/name:material.extensions.emoji.twemoji
  - pymdownx.highlight:
      anchor_linenums: true
      line_spans: __span
      pygments_lang_class: true
  - pymdownx.inlinehilite
  - pymdownx.keys
  - pymdownx.magiclink:
      normalize_issue_symbols: true
      repo_url_shorthand: true
      user: your-username
      repo: sf-data-export-automation
  - pymdownx.mark
  - pymdownx.smartsymbols
  - pymdownx.snippets:
      auto_append:
        - includes/mkdocs.md
  - pymdownx.superfences:
      custom_fences:
        - name: mermaid
          class: mermaid
          format: !!python/name:pymdownx.superfences.fence_code_format
  - pymdownx.tabbed:
      alternate_style: true
      combine_header_slug: true
      slugify: !!python/object/apply:pymdownx.slugs.slugify
        kwds:
          case: lower
  - pymdownx.tasklist:
      custom_checkbox: true
  - pymdownx.tilde

# Page tree
nav:
  - Home: index.md
  - Setup:
    - setup/index.md
    - Quick Start: setup/quickstart.md
    - Prerequisites: setup/prerequisites.md
    - Google Colab Setup: setup/colab-setup.md
  - Configuration:
    - configuration/index.md
    - SFDX Authentication: configuration/sfdx-auth.md
    - Google Drive Integration: configuration/drive-setup.md
    - Colab Secrets: configuration/secrets.md
  - Usage:
    - usage/index.md
    - Running the Notebook: usage/running.md
    - Download Process: usage/download-process.md
    - File Management: usage/file-management.md
  - Troubleshooting:
    - troubleshooting/index.md
    - Common Issues: troubleshooting/common-issues.md
    - Error Codes: troubleshooting/error-codes.md
    - FAQ: troubleshooting/faq.md
EOF

# Create main index page
echo "📄 Creating main documentation pages..."
cat > docs/index.md << 'EOF'
# SF Data Export Automation

<div class="grid cards" markdown>

-   :material-rocket-launch:{ .lg .middle } **Quick Start**

    ---

    Get up and running in minutes with our step-by-step guide

    [:octicons-arrow-right-24: Getting Started](setup/quickstart.md)

-   :material-cog:{ .lg .middle } **Configuration**

    ---

    Learn how to configure SFDX authentication and Google Drive integration

    [:octicons-arrow-right-24: Configuration Guide](configuration/)

-   :material-play:{ .lg .middle } **Usage**

    ---

    Detailed instructions on running the automation and managing exports

    [:octicons-arrow-right-24: Usage Guide](usage/)

-   :material-help-circle:{ .lg .middle } **Troubleshooting**

    ---

    Solutions to common issues and frequently asked questions

    [:octicons-arrow-right-24: Get Help](troubleshooting/)

</div>

## :material-star: Overview

**SF Data Export Automation** is a powerful Google Colab notebook that automates the download of Salesforce Weekly Exports directly to your Google Drive. No more manual downloads - just set it up once and run it whenever you need your latest exports.

!!! success "Key Features"
    - :material-check: **Automated Authentication** - Secure SFDX integration
    - :material-check: **Google Drive Integration** - Direct backup to organized folders
    - :material-check: **Progress Tracking** - Visual progress bars and status updates
    - :material-check: **Error Handling** - Robust error detection and recovery
    - :material-check: **No Local Storage** - Everything runs in the cloud

## :material-lightbulb: How It Works

```mermaid
graph LR
    A[🔐 SFDX Auth] --> B[📥 Fetch Export IDs]
    B --> C[☁️ Mount Google Drive]
    C --> D[📦 Download Exports]
    D --> E[✅ Organized Backup]
```

The automation works in four simple steps:

1. **Authenticate** with Salesforce using your SFDX Auth URL
2. **Discover** available weekly export files automatically
3. **Download** exports with progress tracking and error handling
4. **Organize** files in dated folders in your Google Drive

## :material-rocket: Why Choose This Solution?

!!! tip "Perfect For"
    - **Data Teams** who need regular Salesforce backups
    - **Administrators** managing multiple orgs
    - **Developers** who want automated data pipelines
    - **Anyone** tired of manual export downloads

## :material-clock: Time Savings

| Task | Manual Process | Automated Process |
|------|----------------|-------------------|
| Login to Salesforce | 30 seconds | Automatic |
| Navigate to Exports | 45 seconds | Automatic |
| Download Files | 2-5 minutes | Automatic |
| Organize Files | 1-2 minutes | Automatic |
| **Total Time** | **4-8 minutes** | **30 seconds** |

## :material-security: Security & Privacy

!!! note "Your Data is Safe"
    - All authentication is handled through official Salesforce SFDX CLI
    - No credentials are stored or transmitted outside of Google's secure environment
    - Files are downloaded directly to your personal Google Drive
    - The notebook runs entirely in your Google Colab environment

## :material-trending-up: Get Started Now

Ready to automate your Salesforce exports? Follow our quick start guide to get up and running in just a few minutes.

[Get Started :material-arrow-right:](setup/quickstart.md){ .md-button .md-button--primary }
[View Configuration :material-arrow-right:](configuration/){ .md-button }
EOF

# Create setup section
cat > docs/setup/index.md << 'EOF'
# Setup Overview

Welcome to the setup section! Here you'll find everything you need to get SF Data Export Automation up and running.

## :material-list-box: Setup Checklist

!!! abstract "Before You Begin"
    Make sure you have the following prerequisites:
    
    - [x] Google account with access to Google Colab
    - [x] Salesforce org with data export permissions
    - [x] Google Drive with sufficient storage space
    - [x] Basic familiarity with running Jupyter notebooks

## :material-map: Setup Process

The setup process involves three main steps:

```mermaid
graph TD
    A[📋 Prerequisites] --> B[🚀 Quick Start]
    B --> C[🔧 Google Colab Setup]
    C --> D[✅ Ready to Use]
```

### 1. Prerequisites
Ensure you have all the necessary accounts and permissions.

[:octicons-arrow-right-24: Check Prerequisites](prerequisites.md)

### 2. Quick Start
Follow our step-by-step guide to get running immediately.

[:octicons-arrow-right-24: Quick Start Guide](quickstart.md)

### 3. Google Colab Setup
Detailed setup instructions for the Colab environment.

[:octicons-arrow-right-24: Colab Setup](colab-setup.md)

## :material-help: Need Help?

If you run into any issues during setup, check out our troubleshooting section:

[:octicons-arrow-right-24: Troubleshooting Guide](../troubleshooting/)
EOF

cat > docs/setup/quickstart.md << 'EOF'
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
EOF

cat > docs/setup/prerequisites.md << 'EOF'
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
EOF

cat > docs/setup/colab-setup.md << 'EOF'
# Google Colab Setup

This guide covers the detailed setup and configuration of Google Colab for running SF Data Export Automation.

## :material-google: Google Colab Overview

Google Colab provides a free, cloud-based Jupyter notebook environment that's perfect for running our automation without any local setup required.

!!! tip "Why Google Colab?"
    - **No installation required** - runs entirely in your browser
    - **Free tier available** - sufficient for most export automation needs
    - **GPU/TPU access** - though not needed for this automation
    - **Direct Google Drive integration** - seamless file management
    - **Automatic environment setup** - all dependencies installed automatically

## :material-upload: Getting the Notebook

### Method 1: Upload File

!!! example "Upload to Colab"
    1. Go to [colab.research.google.com](https://colab.research.google.com)
    2. Click **File** → **Upload notebook**
    3. Select your `SF_Data_Export_Automation.ipynb` file
    4. The notebook will open automatically

### Method 2: GitHub Integration

!!! example "Import from GitHub"
    1. In Colab, click **File** → **Open notebook**
    2. Select the **GitHub** tab
    3. Enter your repository URL or search for the notebook
    4. Click on the notebook to open it

### Method 3: Google Drive

!!! example "Save to Drive"
    1. Upload the notebook to your Google Drive
    2. Double-click the `.ipynb` file in Drive
    3. It will automatically open in Colab

## :material-cog-outline: Runtime Configuration

### Runtime Type

!!! info "Default Settings Work Fine"
    The default runtime settings are perfect for this automation:
    
    - **Runtime type**: Python 3
    - **Hardware accelerator**: None (we don't need GPU/TPU)
    - **Runtime shape**: Standard

!!! tip "To Check/Change Runtime"
    1. Click **Runtime** → **Change runtime type**
    2. Verify **Python 3** is selected
    3. **Hardware accelerator** can be "None"
    4. Click **Save**

### Runtime Management

!!! warning "Runtime Limitations"
    **Free Colab accounts have limitations:**
    
    - **12-hour maximum runtime** - notebook disconnects after 12 hours
    - **90-minute idle timeout** - disconnects if inactive
    - **Disk space**: ~78GB temporary storage
    - **RAM**: ~12GB available
    
    These limits are more than sufficient for export automation!

## :material-key: Secrets Management

Colab provides a secure way to store sensitive information like your SFDX Auth URL.

### Setting Up Secrets

!!! key "Adding Your SFDX Auth URL"
    1. **Click the key icon** 🔑 in the left sidebar
    2. **Add new secret**
    3. **Name**: `SFDX_AUTH_URL`
    4. **Value**: Your complete SFDX auth URL
    5. **Toggle "Notebook access" to ON**

!!! example "Example Secret Configuration"
    ```
    Name: SFDX_AUTH_URL
    Value: force://PlatformCLI::5Aep861TSGFxEb9wE8VOJ3PH6Kc3...@mydomain.my.salesforce.com
    Notebook access: ✅ ON
    ```

### Secret Security

!!! security "How Secrets Work"
    - **Encrypted storage** - secrets are encrypted at rest
    - **Runtime only** - only available when notebook is running
    - **No sharing** - secrets are private to your account
    - **Automatic cleanup** - removed when runtime stops

## :material-folder-google-drive: Drive Integration

### Mounting Google Drive

The notebook will automatically mount your Google Drive, but here's what happens:

!!! info "Drive Mount Process"
    1. **Authorization prompt** - you'll need to authorize access
    2. **Account selection** - choose your Google account
    3. **Permission grant** - allow Colab to access Drive
    4. **Mount confirmation** - Drive appears at `/content/drive/`

!!! tip "Drive Mount Tips"
    - **First time**: You'll need to complete OAuth authorization
    - **Subsequent runs**: Usually automatic (if same browser/session)
    - **Issues**: Clear browser cache and re-authorize

### File Organization

!!! success "Automatic Organization"
    The automation creates organized folders:
    
    ```
    Google Drive/
    └── SF_WeeklyExport_20250526/
        ├── WE_00D8Z000001rMLAUA2_1.ZIP
        ├── WE_00D8Z000001rMLAUA2_2.ZIP
        └── ...
    ```

## :material-play: Running the Notebook

### Cell Execution Order

!!! abstract "Recommended Execution Order"
    1. **🪐 Header Cell** - Visual display (optional)
    2. **🔐 Authentication** - SFDX setup and validation
    3. **📥 Fetch Export IDs** - Discover available exports
    4. **☁️ Google Drive Setup** - Mount and prepare folders
    5. **📥 Download Exports** - Download and organize files

### Cell Types

!!! note "Understanding Cell Types"
    - **Form cells**: Have a play button and title (marked with `@title`)
    - **Code cells**: Regular Python code
    - **Markdown cells**: Documentation and instructions

### Execution Tips

!!! tip "Best Practices"
    - **Run cells in order** - each cell depends on previous ones
    - **Wait for completion** - don't rush to the next cell
    - **Check outputs** - verify each step completed successfully
    - **Re-run if needed** - cells can be executed multiple times

## :material-monitor-dashboard: Monitoring Progress

### Progress Indicators

The notebook provides several ways to monitor progress:

!!! success "Visual Feedback"
    - **✅ Success indicators** - green checkmarks for completed steps
    - **🔄 Progress bars** - for file downloads
    - **📊 Summary tables** - final results and file sizes
    - **❌ Error messages** - clear error descriptions

### Common Status Messages

!!! info "What to Expect"
    ```
    🔍 Checking authentication options...
    ✅ Found SFDX_AUTH_URL in secrets
    📦 Installing SFDX CLI...
    ✅ SFDX CLI installed successfully
    🔄 Attempting SFDX authentication...
    ✅ Successfully authenticated via SFDX
    ```

## :material-refresh-auto: Rerunning the Automation

### Session Management

!!! warning "When to Rerun"
    You'll need to rerun the entire notebook if:
    
    - **Runtime disconnects** (after idle timeout)
    - **24+ hours pass** (auth tokens expire)
    - **Errors occur** in authentication
    - **New exports** are available

### Quick Restart

!!! tip "Fast Restart Process"
    1. **Runtime** → **Restart runtime**
    2. **Runtime** → **Run all** (if all cells configured)
    3. Or run cells 2-5 individually

## :material-help-circle: Troubleshooting Colab Issues

### Common Problems

!!! failure "Runtime Issues"
    
    **"Runtime disconnected"**
    
    - Normal after idle timeout or 12-hour limit
    - Simply reconnect and re-run cells
    
    **"Package installation failed"**
    
    - Restart runtime and try again
    - Check internet connection
    
    **"Secrets not found"**
    
    - Verify secret name is exactly `SFDX_AUTH_URL`
    - Ensure "Notebook access" is enabled
    - Try refreshing the page

### Performance Optimization

!!! tip "Better Performance"
    - **Close unused tabs** - reduces browser memory usage
    - **Clear browser cache** - if experiencing issues
    - **Use Chrome** - generally best performance with Colab
    - **Stable internet** - ensure good connection for downloads

## :material-arrow-right: Next Steps

Now that your Colab environment is set up:

[Configure Authentication :material-arrow-right:](../configuration/sfdx-auth.md){ .md-button .md-button--primary }
EOF

# Create configuration section
cat > docs/configuration/index.md << 'EOF'
# Configuration Overview

Learn how to configure SF Data Export Automation for your specific Salesforce environment and requirements.

## :material-cog: Configuration Components

The automation requires three main configuration components:

```mermaid
graph LR
    A[🔐 SFDX Authentication] --> B[☁️ Google Drive]
    B --> C[🔑 Colab Secrets]
    C --> D[✅ Ready to Run]
```

### 1. SFDX Authentication
Set up secure authentication with your Salesforce org using the official Salesforce CLI.

[:octicons-arrow-right-24: SFDX Authentication Guide](sfdx-auth.md)

### 2. Google Drive Integration
Configure Google Drive mounting and file organization for your exports.

[:octicons-arrow-right-24: Drive Setup Guide](drive-setup.md)

### 3. Colab Secrets Management
Securely store your authentication credentials in Google Colab.

[:octicons-arrow-right-24: Secrets Configuration](secrets.md)

## :material-list-status: Configuration Checklist

!!! abstract "Before Running the Automation"
    Ensure you've completed all configuration steps:
    
    - [x] Generated SFDX Auth URL
    - [x] Stored Auth URL in Colab Secrets
    - [x] Tested Salesforce connectivity
    - [x] Configured Google Drive access
    - [x] Verified export permissions

## :material-tune: Advanced Configuration

### Organization-Specific Settings

!!! tip "Customization Options"
    - **Multiple Orgs**: Configure authentication for different Salesforce orgs
    - **File Naming**: Customize export file naming conventions
    - **Storage Location**: Organize files in custom Drive folders
    - **Scheduling**: Set up automated execution schedules

### Security Considerations

!!! security "Best Practices"
    - **Rotate Auth URLs** regularly (every 90 days recommended)
    - **Use dedicated service accounts** for automation
    - **Monitor access logs** in Salesforce
    - **Limit export permissions** to necessary users only

## :material-help: Configuration Support

Need help with configuration? Check out these resources:

- [Common Issues](../troubleshooting/common-issues.md) - Solutions to frequent problems
- [FAQ](../troubleshooting/faq.md) - Frequently asked questions
- [Error Codes](../troubleshooting/error-codes.md) - Error code reference

[Start Configuration :material-arrow-right:](sfdx-auth.md){ .md-button .md-button--primary }
EOF

cat > docs/configuration/sfdx-auth.md << 'EOF'
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
EOF

cat > docs/configuration/drive-setup.md << 'EOF'
# Google Drive Integration

Configure Google Drive integration for automated backup and organization of your Salesforce exports.

## :material-google-drive: Drive Integration Overview

The automation integrates seamlessly with Google Drive to provide organized, secure backup of your Salesforce exports.

!!! success "Drive Integration Benefits"
    - **Automatic organization** - files sorted into dated folders
    - **Secure storage** - files stored in your personal Google Drive
    - **No local storage** - everything happens in the cloud
    - **Easy access** - files available on all your devices
    - **Backup protection** - Google Drive's built-in redundancy

## :material-folder-multiple: File Organization

### Automatic Folder Structure

The automation creates a logical folder structure for your exports:

!!! example "Folder Organization"
    ```
    Google Drive/
    └── SF_WeeklyExport_20250526/     # Date-based folder
        ├── WE_00D8Z000001rMLAUA2_1.ZIP    # Export file 1
        ├── WE_00D8Z000001rMLAUA2_2.ZIP    # Export file 2
        ├── WE_00D8Z000001rMLAUA2_3.ZIP    # Export file 3
        └── download_summary.txt            # Summary log
    ```

### Naming Conventions

!!! info "File Naming Format"
    **Folder names:** `SF_WeeklyExport_YYYYMMDD`
    
    - `SF_WeeklyExport` - Consistent prefix
    - `YYYY` - Four-digit year
    - `MM` - Two-digit month
    - `DD` - Two-digit day
    
    **File names:** `WE_[ORG_ID]_[NUMBER].ZIP`
    
    - `WE` - Weekly Export prefix
    - `ORG_ID` - Your Salesforce org identifier
    - `NUMBER` - Sequential export number
    - `.ZIP` - Compressed archive format

## :material-cog: Drive Configuration

### Storage Requirements

!!! warning "Plan Your Storage"
    **Typical export sizes:**
    
    | Org Size | Export Size | Monthly Storage |
    |----------|-------------|-----------------|
    | Small (< 10K records) | 10-100 MB | 400 MB - 4 GB |
    | Medium (10K-100K records) | 100 MB - 1 GB | 4 GB - 40 GB |
    | Large (> 100K records) | 1 GB - 5 GB+ | 40 GB - 200 GB+ |
    
    **Recommendation:** Have at least 3x your expected monthly usage available

### Drive Access Permissions

!!! key "Required Permissions"
    The automation requests these Google Drive permissions:
    
    - **See and download files** - to check for existing exports
    - **Create, edit, and delete files** - to save new exports
    - **See info about files** - to verify file sizes and dates
    
    These permissions are **read/write access to your entire Drive**, which is standard for Colab notebooks.

### Authorization Process

!!! example "First-Time Authorization"
    When you run the Drive setup cell:
    
    1. **Authorization prompt** appears
    2. **Click the link** to authorize
    3. **Choose your Google account**
    4. **Grant permissions** to Google Colab
    5. **Copy the authorization code** back to Colab
    6. **Drive mounts** at `/content/drive/`

## :material-sync: Sync and Backup Strategy

### Duplicate Handling

!!! tip "Smart Duplicate Detection"
    The automation prevents duplicate downloads:
    
    - **Checks existing files** before downloading
    - **Compares file sizes** to verify completeness
    - **Skips identical exports** to save time and storage
    - **Reports existing files** in the summary

### Backup Retention

!!! info "File Lifecycle Management"
    **Automatic retention:**
    - Files remain in Drive until you delete them
    - No automatic cleanup (your responsibility)
    
    **Recommended cleanup schedule:**
    - Keep current month's exports
    - Archive previous month to separate folder
    - Delete exports older than 6 months (unless required for compliance)

### Manual Organization

!!! tip "Custom Organization"
    You can customize the organization after downloads:
    
    ```
    Google Drive/
    ├── SF_Exports/
    │   ├── 2025/
    │   │   ├── January/
    │   │   ├── February/
    │   │   └── March/
    │   └── Archive/
    │       ├── 2024/
    │       └── 2023/
    └── SF_WeeklyExport_20250526/  # Latest automated download
    ```

## :material-cloud-sync: Access and Sharing

### Multi-Device Access

!!! success "Access Everywhere"
    Your exports are available on:
    
    - **Web browser** - drive.google.com
    - **Mobile apps** - Google Drive iOS/Android
    - **Desktop sync** - Google Drive for Desktop
    - **Third-party tools** - Any app with Drive integration

### Sharing Options

!!! warning "Security Considerations"
    **Sharing Salesforce exports:**
    
    - **Don't share publicly** - contains sensitive business data
    - **Use specific permissions** - share with specific email addresses only
    - **Consider organization policies** - check data export sharing policies
    - **Use expiring links** - set expiration dates for shared links

## :material-monitor-dashboard: Monitoring and Management

### Drive Usage Monitoring

!!! info "Track Your Usage"
    Monitor your Google Drive usage:
    
    1. Go to [drive.google.com](https://drive.google.com)
    2. Click **Settings** (gear icon)
    3. View **Storage usage**
    4. See breakdown by file type
    
    Or use the automation's built-in reporting:
    ```
    📊 EXPORT DOWNLOAD SUMMARY
    ✅ Successfully downloaded 3 export files
    📁 Total backup size: 2.45 GB
    ```

### Performance Optimization

!!! tip "Optimize Drive Performance"
    **For large exports:**
    - Ensure stable internet connection
    - Close unnecessary browser tabs
    - Use Chrome for best Colab performance
    - Don't interrupt downloads once started
    
    **For multiple orgs:**
    - Use separate folder structures
    - Consider different Google accounts for different orgs
    - Monitor total storage usage across all orgs

## :material-security: Security and Privacy

### Data Security

!!! security "Protecting Your Data"
    **Google Drive Security Features:**
    - **Encryption in transit** - data encrypted during upload/download
    - **Encryption at rest** - data encrypted when stored
    - **Access controls** - you control who can access files
    - **Audit logging** - Google logs access attempts
    
    **Additional Security Measures:**
    - Enable **2-factor authentication** on your Google account
    - Regularly **review shared files** and permissions
    - **Monitor account activity** in Google Account settings
    - Use **dedicated Google accounts** for sensitive org data

### Compliance Considerations

!!! warning "Regulatory Compliance"
    If your organization has specific compliance requirements:
    
    - **Check data residency** requirements (Google Drive location)
    - **Verify retention policies** align with regulations
    - **Document backup procedures** for audits
    - **Consider Google Workspace** for enhanced controls
    - **Implement additional encryption** if required

## :material-troubleshoot: Troubleshooting Drive Issues

### Common Problems

!!! failure "Drive Mount Issues"
    
    **"Drive mount failed"**
    ```python
    # Try manual remount
    from google.colab import drive
    drive.mount('/content/drive', force_remount=True)
    ```
    
    **"Permission denied"**
    - Clear browser cache and cookies
    - Re-authorize Google Drive access
    - Check Google account permissions
    
    **"Insufficient storage"**
    - Check available Drive storage: drive.google.com/settings
    - Delete old files or upgrade storage plan
    - Consider using different Google account

### Performance Issues

!!! tip "Improve Performance"
    
    **Slow downloads:**
    - Check internet connection speed
    - Try downloading during off-peak hours
    - Restart Colab runtime if it's been running long
    
    **Large file handling:**
    - Downloads are streamed (no size limits)
    - Progress bars show download status
    - Files can be resumed if interrupted

## :material-arrow-right: Next Steps

With Google Drive configured:

1. **Test the drive mounting** in the automation
2. **Verify folder creation** works correctly
3. **Run a test download** to confirm everything works

[Configure Colab Secrets :material-arrow-right:](secrets.md){ .md-button .md-button--primary }
[Start Using the Automation :material-arrow-right:](../usage/){ .md-button }
EOF

cat > docs/configuration/secrets.md << 'EOF'
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
EOF

# Create usage section
cat > docs/usage/index.md << 'EOF'
# Usage Guide

Learn how to effectively use SF Data Export Automation to streamline your Salesforce data exports.

## :material-play-circle: Usage Overview

Once configured, SF Data Export Automation provides a simple, reliable way to download your Salesforce weekly exports with just a few clicks.

!!! success "What You Can Do"
    - **Download all available exports** with one notebook run
    - **Organize files automatically** in dated Google Drive folders
    - **Track progress visually** with real-time status updates
    - **Handle errors gracefully** with detailed error reporting
    - **Manage file duplicates** intelligently

## :material-list-status: Usage Workflow

```mermaid
graph TD
    A[🚀 Open Notebook] --> B[▶️ Run Authentication]
    B --> C[📥 Fetch Export IDs]
    C --> D[☁️ Mount Google Drive]
    D --> E[📦 Download Exports]
    E --> F[📊 Review Summary]
    F --> G[✅ Files in Drive]
```

### Step-by-Step Process

1. **[Running the Notebook](running.md)** - Execute cells and monitor progress
2. **[Download Process](download-process.md)** - Understanding what happens during downloads
3. **[File Management](file-management.md)** - Organizing and managing your exports

## :material-clock-time-four: When to Run

### Recommended Schedule

!!! tip "Optimal Timing"
    **Weekly Schedule:**
    - Run **once per week** after Salesforce generates new exports
    - **Monday mornings** often work well (exports from weekend)
    - **Consistent timing** helps establish routine
    
    **On-Demand:**
    - Before important data analysis projects
    - Prior to system maintenance windows
    - When exports are specifically requested

### Export Availability

!!! info "Salesforce Export Timing"
    - **Weekly exports** are generated automatically by Salesforce
    - **Available for 48 hours** after generation
    - **1-4 exports** typically available at any time
    - **Check availability** before running automation

## :material-speedometer: Performance Expectations

### Typical Runtime

!!! abstract "Expected Duration"
    | Org Size | Export Size | Download Time |
    |----------|-------------|---------------|
    | Small | 10-100 MB | 1-3 minutes |
    | Medium | 100 MB - 1 GB | 3-10 minutes |
    | Large | 1-5 GB | 10-30 minutes |
    | Enterprise | 5+ GB | 30+ minutes |

### Factors Affecting Performance

!!! note "Performance Variables"
    - **Internet connection speed** - primary factor
    - **Salesforce server load** - varies by time of day
    - **Google Colab resources** - generally consistent
    - **File compression** - varies by data type
    - **Concurrent users** - minimal impact

## :material-check-circle: Success Indicators

### Visual Feedback

!!! success "What Success Looks Like"
    You'll see these indicators when everything works correctly:
    
    - ✅ **Green checkmarks** for completed steps
    - 📊 **Progress bars** during downloads
    - 📋 **Summary table** with file details
    - 🎉 **Completion message** with file count and sizes

### Final Results

!!! example "Expected Output"
    ```
    📊 EXPORT DOWNLOAD SUMMARY
    ============================================================
    ✅ Successfully downloaded 3 export files:
       1. WE_00D8Z000001rMLAUA2_1.ZIP (1.2 GB)
       2. WE_00D8Z000001rMLAUA2_2.ZIP (850 MB)
       3. WE_00D8Z000001rMLAUA2_3.ZIP (1.1 GB)
    
    📁 Total backup size: 3.15 GB
    📂 Backup folder: /content/drive/MyDrive/SF_WeeklyExport_20250526
    ```

## :material-alert-circle: Common Scenarios

### First-Time Usage

!!! abstract "New User Experience"
    Your first run will include:
    - **Google Drive authorization** - one-time setup
    - **SFDX CLI installation** - automatic in Colab
    - **Credential validation** - testing your setup
    - **Folder creation** - setting up organization structure

### Regular Usage

!!! tip "Routine Operations"
    Subsequent runs are faster:
    - **Skip authorization** - already configured
    - **Quick authentication** - cached credentials
    - **Duplicate detection** - skip existing files
    - **Faster startup** - dependencies already installed

### Troubleshooting Mode

!!! warning "When Things Go Wrong"
    If issues occur:
    - **Check error messages** - usually very specific
    - **Restart runtime** - clears any stuck processes
    - **Re-run cells individually** - isolate problems
    - **Review configuration** - verify secrets and permissions

## :material-chart-line: Monitoring and Reporting

### Built-in Monitoring

!!! info "Automatic Tracking"
    The automation provides detailed progress information:
    
    - **Real-time status updates** during each phase
    - **File-by-file download progress** with progress bars
    - **Error detection and reporting** with specific messages
    - **Final summary** with complete statistics

### Custom Reporting

!!! tip "Enhanced Tracking"
    You can enhance monitoring by:
    
    - **Taking screenshots** of summary reports
    - **Copying results** to a tracking spreadsheet
    - **Setting up Drive notifications** for new folders
    - **Creating calendar reminders** for regular runs

## :material-arrow-right: Next Steps

Ready to start using the automation? Follow these guides:

[Learn to Run the Notebook :material-arrow-right:](running.md){ .md-button .md-button--primary }
[Understand the Download Process :material-arrow-right:](download-process.md){ .md-button }
EOF

cat > docs/usage/running.md << 'EOF'
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
EOF

cat > docs/usage/download-process.md << 'EOF'
# Download Process

Understanding how SF Data Export Automation downloads and processes your Salesforce exports.

## :material-download: Download Overview

The download process is the core functionality of the automation, handling the secure transfer of your Salesforce weekly exports to Google Drive with intelligent error handling and progress tracking.

!!! success "Download Features"
    - **Authenticated downloads** - secure session-based access
    - **Progress tracking** - real-time download status
    - **Duplicate detection** - skip existing files automatically
    - **Error recovery** - retry logic for network issues
    - **File verification** - integrity checks after download

## :material-cog: Download Architecture

### Session Management

!!! info "Secure Download Sessions"
    ```mermaid
    graph LR
        A[SFDX Auth] --> B[Session Token]
        B --> C[Salesforce Cookie]
        C --> D[Download Request]
        D --> E[File Stream]
        E --> F[Google Drive]
    ```

The automation maintains secure sessions throughout the download process:

1. **SFDX Authentication** - establishes trust with Salesforce
2. **Session Token** - converted to browser-compatible cookie
3. **Download Request** - authenticated request to export servlet
4. **File Stream** - direct streaming to minimize memory usage
5. **Drive Storage** - immediate saving to prevent data loss

### URL Construction

!!! example "Download URL Format"
    ```
    https://yourorg.my.salesforce.com/servlet/servlet.OrgExport
    ?fileName=00D8Z000001rMLAUA2_1.ZIP
    &id=092KY000000blXV
    ```
    
    **Components:**
    - **Base URL** - your Salesforce instance
    - **Servlet path** - Salesforce's export download endpoint
    - **fileName** - constructed from org ID and sequence number
    - **id** - the specific export identifier

## :material-list-status: Download Phases

### Phase 1: Discovery and Planning

!!! abstract "Pre-Download Planning"
    ```
    🔍 Fetching weekly export IDs...
    ✅ Found 3 export IDs
    📋 Export IDs ready for download:
       1. 092KY000000blXV
       2. 092KY000000blXW
       3. 092KY000000blXX
    ```

### Phase 2: File Checking

!!! check "Duplicate Prevention"
    Before each download, the automation:
    
    - **Checks existing files** in the target Drive folder
    - **Compares file names** against expected download names
    - **Verifies file sizes** to ensure completeness
    - **Skips duplicates** to save time and bandwidth

    ```
    ⏭️ File already exists: WE_00D8Z000001rMLAUA2_2.ZIP
    ```

### Phase 3: Active Download

!!! download "Download Execution"
    For each new file:
    
    1. **Request initiation** - authenticated HTTP request
    2. **Response validation** - check content type and headers
    3. **Size estimation** - read Content-Length header
    4. **Stream processing** - download in chunks with progress tracking
    5. **File writing** - direct stream to Google Drive

### Phase 4: Verification

!!! success "Post-Download Verification"
    After each download:
    
    - **File size check** - verify complete download
    - **Format validation** - ensure ZIP file format
    - **Drive sync** - confirm file is properly saved
    - **Status reporting** - update progress indicators

## :material-progress-download: Progress Tracking

### Visual Progress Indicators

The automation provides multiple levels of progress feedback:

!!! info "Progress Display Types"
    **File-level progress:**
    ```
    📥 Downloading: WE_00D8Z000001rMLAUA2_1.ZIP
       Export ID: 092KY000000blXV
       File size: 1.25 GB
       Progress: [████████████████████████████████] 100%
    ```
    
    **Overall progress:**
    ```
    🔄 Downloading export 2/3: 092KY000000blXW
    ```

### Progress Bar Implementation

!!! example "Technical Details"
    The progress bars use Python's `tqdm` library:
    
    - **Real-time updates** - refreshes as data streams
    - **Bandwidth calculation** - shows download speed
    - **ETA estimation** - predicts completion time
    - **Memory efficient** - doesn't store full file in memory

## :material-shield-check: Security and Integrity

### Download Security

!!! security "Security Measures"
    **Authentication:**
    - Session-based authentication using SFDX tokens
    - No credentials transmitted with each request
    - Automatic session refresh when needed
    
    **Data Integrity:**
    - Direct streaming to prevent tampering
    - File size verification after download
    - ZIP format validation
    - Checksum verification (when available)

### Privacy Protection

!!! key "Privacy Safeguards"
    - **No intermediate storage** - files go directly to your Drive
    - **Encrypted transmission** - HTTPS for all downloads
    - **Private sessions** - isolated to your Colab runtime
    - **Automatic cleanup** - temporary files removed after processing

## :material-file-multiple: File Handling

### File Naming Convention

!!! info "Systematic Naming"
    **Format:** `WE_[ORG_ID]_[SEQUENCE].ZIP`
    
    ```
    WE_00D8Z000001rMLAUA2_1.ZIP
    WE_00D8Z000001rMLAUA2_2.ZIP
    WE_00D8Z000001rMLAUA2_3.ZIP
    ```
    
    **Components:**
    - `WE` - Weekly Export prefix
    - `ORG_ID` - Your Salesforce organization ID
    - `SEQUENCE` - Sequential number (1, 2, 3, etc.)
    - `.ZIP` - Compressed archive format

### File Organization

!!! success "Automatic Organization"
    Files are organized in dated folders:
    
    ```
    Google Drive/
    └── SF_WeeklyExport_20250526/
        ├── WE_00D8Z000001rMLAUA2_1.ZIP
        ├── WE_00D8Z000001rMLAUA2_2.ZIP
        ├── WE_00D8Z000001rMLAUA2_3.ZIP
        └── download_log.txt (optional)
    ```

### Storage Optimization

!!! tip "Efficient Storage"
    **Compression Benefits:**
    - Salesforce exports are pre-compressed ZIP files
    - Typical compression ratio: 70-90% size reduction
    - No additional compression needed
    
    **Deduplication:**
    - Automatic detection of existing files
    - Skip downloads of identical exports
    - Size-based verification for completeness

## :material-network: Network Handling

### Connection Management

!!! abstract "Robust Network Handling"
    **Connection Features:**
    - **Streaming downloads** - no memory limitations
    - **Timeout handling** - configurable request timeouts
    - **Retry logic** - automatic retry on network errors
    - **Bandwidth adaptation** - adjusts to available bandwidth

### Error Recovery

!!! warning "Network Error Handling"
    **Common scenarios and responses:**
    
    **Temporary network issues:**
    - Automatic retry after short delay
    - Progressive backoff for repeated failures
    - Clear error messaging with retry counts
    
    **Authentication timeouts:**
    - Automatic session refresh
    - Re-authentication if needed
    - Graceful handling of expired tokens
    
    **Large file handling:**
    - Resume capability for interrupted downloads
    - Chunk-based processing to prevent timeouts
    - Memory-efficient streaming

## :material-speedometer: Performance Optimization

### Download Speed Factors

!!! info "Performance Variables"
    **Primary factors:**
    - **Internet connection speed** - your ISP bandwidth
    - **Salesforce server load** - varies by time and region
    - **Google Drive API limits** - generally not a bottleneck
    - **File compression ratio** - affects apparent speed
    
    **Optimization techniques:**
    - Optimal chunk size for streaming (8KB)
    - Minimal memory usage during transfers
    - Efficient progress tracking
    - Parallel processing preparation (future enhancement)

### Best Practices

!!! tip "Maximize Performance"
    **Timing:**
    - Run during off-peak hours when possible
    - Avoid peak Salesforce usage times (9-11 AM, 2-4 PM local time)
    
    **Environment:**
    - Ensure stable internet connection
    - Close unnecessary browser tabs
    - Use Chrome for best Colab performance
    
    **Planning:**
    - Schedule downloads for periods with good connectivity
    - Monitor Google Drive storage before large downloads

## :material-chart-line: Monitoring and Reporting

### Real-Time Monitoring

!!! success "Live Status Updates"
    The automation provides continuous feedback:
    
    ```
    📥 Starting downloads...
    🔄 Downloading export 1/3: 092KY000000blXV
    📥 Downloading: WE_00D8Z000001rMLAUA2_1.ZIP
       Export ID: 092KY000000blXV
       File size: 1.25 GB
       Progress: [████████████] 45% | 563MB/1.25GB | 2.3MB/s | ETA: 04:23
    ```

### Final Summary Report

!!! abstract "Completion Statistics"
    ```
    ============================================================
    📊 EXPORT DOWNLOAD SUMMARY
    ============================================================
    ✅ Successfully downloaded 3 export files:
       1. WE_00D8Z000001rMLAUA2_1.ZIP (1.25 GB)
       2. WE_00D8Z000001rMLAUA2_2.ZIP (987 MB) [SKIPPED - EXISTS]
       3. WE_00D8Z000001rMLAUA2_3.ZIP (1.1 GB)

    📁 Total backup size: 3.34 GB
    📂 Backup folder: /content/drive/MyDrive/SF_WeeklyExport_20250526
    📊 Download time: 8 minutes 23 seconds
    📈 Average speed: 6.8 MB/s
    ```

## :material-troubleshoot: Troubleshooting Downloads

### Common Download Issues

!!! failure "Frequent Problems"
    
    **"Download failed: HTTP 401"**
    - Authentication has expired
    - Regenerate SFDX Auth URL
    - Update Colab secrets
    
    **"File size mismatch"**
    - Download was interrupted
    - Delete partial file and retry
    - Check internet connection stability
    
    **"Permission denied to write file"**
    - Google Drive storage full
    - Drive permissions changed
    - Re-authorize Drive access

### Diagnostic Steps

!!! check "Troubleshooting Process"
    1. **Check error message** - specific guidance usually provided
    2. **Verify authentication** - re-run auth cell if needed
    3. **Test connectivity** - try accessing Salesforce manually
    4. **Check storage** - ensure adequate Drive space
    5. **Restart runtime** - clear any stuck processes
    6. **Retry download** - many issues are temporary

## :material-arrow-right: Next Steps

Understanding the download process helps you:

[Manage Your Downloaded Files :material-arrow-right:](file-management.md){ .md-button .md-button--primary }
[Troubleshoot Issues :material-arrow-right:](../troubleshooting/){ .md-button }
EOF

cat > docs/usage/file-management.md << 'EOF'
# File Management

Learn how to effectively organize, access, and manage your downloaded Salesforce exports.

## :material-folder-multiple: File Organization System

### Automatic Organization

The automation creates a systematic folder structure that makes it easy to find and manage your exports over time.

!!! success "Default Organization"
    ```
    Google Drive/
    ├── SF_WeeklyExport_20250526/     # Today's downloads
    │   ├── WE_00D8Z000001rMLAUA2_1.ZIP
    │   ├── WE_00D8Z000001rMLAUA2_2.ZIP
    │   └── WE_00D8Z000001rMLAUA2_3.ZIP
    ├── SF_WeeklyExport_20250519/     # Last week's downloads
    │   ├── WE_00D8Z000001rMLAUA2_1.ZIP
    │   └── WE_00D8Z000001rMLAUA2_2.ZIP
    └── SF_WeeklyExport_20250512/     # Two weeks ago
        └── WE_00D8Z000001rMLAUA2_1.ZIP
    ```

### Folder Naming Convention

!!! info "Date-Based Naming"
    **Format:** `SF_WeeklyExport_YYYYMMDD`
    
    - **SF_WeeklyExport** - Consistent prefix for easy identification
    - **YYYY** - Four-digit year
    - **MM** - Two-digit month (01-12)
    - **DD** - Two-digit day (01-31)
    
    This ensures chronological sorting and easy identification of export dates.

## :material-file-document: File Details

### File Naming Pattern

!!! example "Understanding File Names"
    **Format:** `WE_[ORG_ID]_[SEQUENCE].ZIP`
    
    ```
    WE_00D8Z000001rMLAUA2_1.ZIP
    │  │                    │  │
    │  │                    │  └─ File extension (.ZIP)
    │  │                    └─── Sequence number (1, 2, 3...)
    │  └───────────────────────── Your Salesforce Org ID
    └─────────────────────────── Weekly Export prefix
    ```

### File Contents

!!! abstract "What's Inside Each ZIP"
    Each export ZIP file typically contains:
    
    - **CSV files** - one for each Salesforce object
    - **Metadata files** - field definitions and relationships
    - **Manifest file** - listing of all included data
    - **Error logs** - any issues during export generation
    
    Example contents:
    ```
    Account.csv
    Contact.csv
    Opportunity.csv
    CustomObject__c.csv
    manifest.xml
    ```

### File Sizes

!!! info "Typical Export Sizes"
    | Organization Size | Records | Typical ZIP Size |
    |-------------------|---------|------------------|
    | Small Org | < 10,000 | 10-100 MB |
    | Medium Org | 10K-100K | 100 MB - 1 GB |
    | Large Org | 100K-1M | 1-5 GB |
    | Enterprise Org | > 1M | 5+ GB |

## :material-access-point: Accessing Your Files

### Google Drive Web Interface

!!! tip "Web Access"
    1. Go to [drive.google.com](https://drive.google.com)
    2. Navigate to your export folders
    3. **Download** individual files or entire folders
    4. **Preview** ZIP contents (limited)
    5. **Share** with team members (with caution)

### Google Drive Desktop App

!!! success "Desktop Sync"
    With Google Drive for Desktop:
    
    - **Automatic sync** - files appear in local Drive folder
    - **Offline access** - cached files available without internet
    - **Native app integration** - open with preferred ZIP tools
    - **Fast search** - index local files for quick finding

### Mobile Access

!!! phone "Mobile Apps"
    Google Drive mobile apps provide:
    
    - **File browsing** - navigate folder structure
    - **Download capability** - save files to device
    - **Sharing options** - send files via email/messaging
    - **Limited preview** - basic file information

## :material-cog-outline: Custom Organization

### Enhanced Folder Structure

You can reorganize files after download for better long-term management:

!!! tip "Recommended Structure"
    ```
    Google Drive/
    └── Salesforce_Exports/
        ├── 2025/
        │   ├── Q1/
        │   │   ├── January/
        │   │   │   ├── SF_WeeklyExport_20250105/
        │   │   │   ├── SF_WeeklyExport_20250112/
        │   │   │   └── SF_WeeklyExport_20250119/
        │   │   ├── February/
        │   │   └── March/
        │   ├── Q2/
        │   └── Current/
        │       └── SF_WeeklyExport_20250526/  # Latest exports
        ├── 2024/
        │   └── Archive/                        # Older exports
        └── Templates/
            └── Processing_Scripts/             # Analysis tools
    ```

### Automation-Friendly Organization

!!! abstract "Maintain Compatibility"
    If you reorganize files:
    
    - **Keep original folders** until processing is complete
    - **Use shortcuts/aliases** rather than moving files
    - **Document your structure** for team members
    - **Test automation** after reorganization

## :material-database: Data Processing

### Extracting ZIP Files

!!! example "Working with ZIP Contents"
    **Local extraction:**
    ```bash
    # Extract all files
    unzip WE_00D8Z000001rMLAUA2_1.ZIP -d extracted_data/
    
    # List contents without extracting
    unzip -l WE_00D8Z000001rMLAUA2_1.ZIP
    
    # Extract specific files
    unzip WE_00D8Z000001rMLAUA2_1.ZIP "Account.csv" "Contact.csv"
    ```
    
    **Python processing:**
    ```python
    import zipfile
    import pandas as pd
    
    # Read CSV directly from ZIP
    with zipfile.ZipFile('WE_00D8Z000001rMLAUA2_1.ZIP') as z:
        with z.open('Account.csv') as f:
            df = pd.read_csv(f)
    ```

### Data Analysis Preparation

!!! success "Analysis-Ready Data"
    **Pandas integration:**
    ```python
    # Load multiple CSV files from export
    import zipfile
    import pandas as pd
    
    def load_salesforce_export(zip_path):
        tables = {}
        with zipfile.ZipFile(zip_path) as z:
            for filename in z.namelist():
                if filename.endswith('.csv'):
                    table_name = filename.replace('.csv', '')
                    tables[table_name] = pd.read_csv(z.open(filename))
        return tables
    
    # Usage
    data = load_salesforce_export('WE_00D8Z000001rMLAUA2_1.ZIP')
    accounts = data['Account']
    contacts = data['Contact']
    ```

## :material-clock: Retention Management

### Retention Strategy

!!! warning "Storage Management"
    **Recommended retention periods:**
    
    - **Current month** - keep all exports in original structure
    - **Previous 3 months** - keep monthly snapshots
    - **Previous year** - keep quarterly snapshots
    - **Older than 1 year** - archive or delete based on compliance needs

### Automated Cleanup

!!! tip "Cleanup Automation"
    You can create scripts to manage old exports:
    
    ```python
    # Example cleanup script (run monthly)
    import os
    from datetime import datetime, timedelta
    
    def cleanup_old_exports(drive_path, days_to_keep=90):
        cutoff_date = datetime.now() - timedelta(days=days_to_keep)
        
        for folder in os.listdir(drive_path):
            if folder.startswith('SF_WeeklyExport_'):
                folder_date = datetime.strptime(folder[-8:], '%Y%m%d')
                if folder_date < cutoff_date:
                    # Move to archive or delete
                    archive_folder(os.path.join(drive_path, folder))
    ```

### Compliance Considerations

!!! security "Legal Requirements"
    **Data retention compliance:**
    
    - **Check regulations** - GDPR, CCPA, industry-specific rules
    - **Document retention** - maintain clear retention policies
    - **Secure deletion** - ensure complete data removal when required
    - **Audit trails** - track what was deleted and when

## :material-share-variant: Sharing and Collaboration

### Team Access

!!! tip "Sharing Best Practices"
    **Safe sharing approaches:**
    
    1. **Create team folder** - dedicated shared space
    2. **Copy relevant files** - don't share entire export history
    3. **Set permissions carefully** - view-only unless edit needed
    4. **Use expiring links** - time-limited access for external users
    5. **Document access** - track who has access to what

### Security Considerations

!!! security "Sharing Safely"
    **Before sharing exports:**
    
    - **Review contents** - ensure no sensitive data exposure
    - **Check permissions** - verify recipient needs and authorization
    - **Use organization controls** - leverage Google Workspace if available
    - **Monitor access** - regularly review who has access
    - **Remove access** - clean up when no longer needed

## :material-backup-restore: Backup and Recovery

### Backup Strategy

!!! abstract "Multi-Layer Backup"
    **Google Drive provides primary backup, but consider:**
    
    1. **Local copies** - download critical exports to local storage
    2. **Secondary cloud** - copy to different cloud provider
    3. **Network storage** - enterprise NAS or SAN systems
    4. **Physical backup** - external drives for critical data

### Recovery Planning

!!! warning "Disaster Recovery"
    **Plan for various scenarios:**
    
    - **Google account compromise** - have alternative access methods
    - **Accidental deletion** - Google Drive trash and version history
    - **Corruption** - verify file integrity regularly
    - **Service outage** - alternative access to Salesforce exports

## :material-automation: Automation Tips

### Scheduled Execution

!!! tip "Regular Automation"
    **Setting up schedules:**
    
    - **Manual scheduling** - calendar reminders for regular runs
    - **Colab Pro** - longer runtime limits for complex processing
    - **External schedulers** - GitHub Actions, cloud functions for automation
    - **Monitoring** - alerts for failed or missed runs

### Integration Opportunities

!!! success "Workflow Integration"
    **Connect with other tools:**
    
    - **Data pipelines** - trigger ETL processes after downloads
    - **Analytics platforms** - auto-load into BI tools
    - **Notification systems** - Slack/email alerts on completion
    - **Version control** - track data changes over time
    - **Compliance reporting** - automated audit trail generation

### Custom Processing Scripts

!!! example "Post-Download Automation"
    ```python
    # Example: Auto-process new exports
    def process_new_exports(export_folder):
        for zip_file in get_new_zip_files(export_folder):
            # Extract and validate
            data = extract_and_validate(zip_file)
            
            # Process and analyze
            insights = analyze_data(data)
            
            # Generate reports
            create_summary_report(insights, zip_file)
            
            # Notify stakeholders
            send_completion_notification(zip_file, insights)
    ```

## :material-troubleshoot: File Management Troubleshooting

### Common Issues

!!! failure "Frequent Problems"
    
    **"Cannot open ZIP file"**
    - File may be corrupted during download
    - Try downloading again
    - Check file size matches expected
    
    **"Google Drive sync issues"**
    - Restart Google Drive desktop app
    - Check available local storage
    - Verify internet connection
    
    **"Files missing from Drive"**
    - Check Google Drive trash
    - Verify folder permissions
    - Look in shared drives if applicable

### Performance Issues

!!! warning "Large File Handling"
    **For large exports (> 2GB):**
    
    - **Extraction time** - can take 10+ minutes
    - **Memory usage** - ensure sufficient RAM for processing
    - **Network limits** - some networks block large downloads
    - **Mobile limitations** - use desktop for large files

## :material-chart-line: Usage Analytics

### Tracking Export Usage

!!! info "Monitor Your Patterns"
    **Questions to track:**
    - How often do you download exports?
    - Which files are accessed most frequently?
    - What's your average export size growth?
    - When do you typically run the automation?

### Optimization Opportunities

!!! tip "Efficiency Improvements"
    **Based on usage patterns:**
    
    - **Schedule optimization** - run during off-peak hours
    - **Storage planning** - anticipate growth trends
    - **Process improvement** - automate common post-download tasks
    - **Team coordination** - share schedules to avoid conflicts

## :material-arrow-right: Next Steps

With effective file management in place:

[Learn Troubleshooting :material-arrow-right:](../troubleshooting/){ .md-button .md-button--primary }
[Advanced Configuration :material-arrow-right:](../configuration/){ .md-button }
EOF

# Create troubleshooting section
cat > docs/troubleshooting/index.md << 'EOF'
# Troubleshooting Guide

Find solutions to common issues and get help when SF Data Export Automation doesn't work as expected.

## :material-help-circle: Getting Help

When you encounter issues with the automation, this troubleshooting section provides systematic approaches to identify and resolve problems.

!!! tip "Troubleshooting Strategy"
    1. **Identify the problem** - understand what's failing
    2. **Check common causes** - review frequent issues first  
    3. **Follow diagnostic steps** - systematic problem isolation
    4. **Apply solutions** - implement fixes step by step
    5. **Verify resolution** - confirm the issue is resolved

## :material-alert-circle: Quick Problem Diagnosis

### Error Categories

!!! abstract "Types of Issues"
    **Authentication Problems** 🔐
    - SFDX Auth URL issues
    - Expired credentials
    - Permission problems
    
    **Connection Issues** 🌐
    - Network connectivity
    - Salesforce server problems
    - Google Drive access
    
    **File Problems** 📁
    - Download failures
    - Corrupt files
    - Storage issues
    
    **Runtime Problems** ⚙️
    - Colab environment issues
    - Memory limitations
    - Timeout errors

### Immediate Steps

!!! check "First Actions to Take"
    1. **Read the error message** - often contains specific guidance
    2. **Note which cell failed** - helps identify the problem area
    3. **Check the basics** - internet connection, login status
    4. **Try the simple fix** - restart runtime, re-run cell
    5. **Document the issue** - for pattern recognition

## :material-map: Troubleshooting Sections

### Common Issues
Most frequently encountered problems and their solutions.

[:octicons-arrow-right-24: Common Issues Guide](common-issues.md)

### Error Codes
Reference guide for specific error messages and codes.

[:octicons-arrow-right-24: Error Code Reference](error-codes.md)

### FAQ
Frequently asked questions about setup, usage, and troubleshooting.

[:octicons-arrow-right-24: FAQ Section](faq.md)

## :material-bug: Systematic Debugging

### Step-by-Step Diagnosis

!!! example "Debugging Process"
    ```mermaid
    graph TD
        A[Issue Occurs] --> B{Authentication Working?}
        B -->|No| C[Fix Auth Issues]
        B -->|Yes| D{Network Connected?}
        D -->|No| E[Check Connection]
        D -->|Yes| F{Exports Available?}
        F -->|No| G[Check Salesforce Setup]
        F -->|Yes| H{Drive Accessible?}
        H -->|No| I[Fix Drive Issues]
        H -->|Yes| J[Check Download Process]
    ```

### Information Gathering

!!! info "Diagnostic Information"
    When troubleshooting, collect:
    
    - **Error messages** - exact text of any errors
    - **Cell that failed** - which step in the process
    - **Recent changes** - any configuration modifications
    - **Environment details** - browser, internet connection
    - **Timing** - when did it last work vs. when it failed

## :material-lifebuoy: Support Resources

### Self-Service Resources

!!! success "Available Help"
    - **Documentation** - comprehensive guides and examples
    - **Error references** - specific error code explanations
    - **Community examples** - similar implementations and solutions
    - **Salesforce documentation** - official API and export guides

### Getting Additional Help

!!! tip "When to Seek Help"
    Contact support or community when:
    
    - Standard troubleshooting doesn't resolve the issue
    - Error messages are unclear or undocumented
    - Consistent failures across multiple attempts
    - Configuration questions beyond the documentation

## :material-preview-outline: Prevention Tips

### Avoiding Common Problems

!!! warning "Best Practices"
    **Proactive measures:**
    
    - **Regular maintenance** - refresh Auth URLs monthly
    - **Environment consistency** - use same browser/setup
    - **Storage monitoring** - keep adequate Drive space
    - **Connection stability** - ensure reliable internet
    - **Permission verification** - confirm Salesforce access regularly

### Health Checks

!!! check "Regular Verification"
    **Monthly checks:**
    - Test SFDX authentication manually
    - Verify Salesforce export availability
    - Confirm Google Drive access and storage
    - Review any new error patterns
    - Update documentation for any changes

## :material-arrow-right: Start Troubleshooting

Choose your issue category to get started:

[View Common Issues :material-arrow-right:](common-issues.md){ .md-button .md-button--primary }
[Check Error Codes :material-arrow-right:](error-codes.md){ .md-button }
[Browse FAQ :material-arrow-right:](faq.md){ .md-button }
EOF

cat > docs/troubleshooting/common-issues.md << 'EOF'
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
EOF

# Continue with the rest of the script...
cat > docs/troubleshooting/error-codes.md << 'EOF'
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
EOF

cat > docs/troubleshooting/faq.md << 'EOF'
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
EOF

# Create requirements.txt for MkDocs
echo "📦 Creating requirements.txt..."
cat > requirements.txt << 'EOF'
mkdocs>=1.5.0
mkdocs-material>=9.0.0
pymdown-extensions>=10.0.0
mkdocs-minify-plugin>=0.7.0
EOF

# Create .gitignore
echo "📄 Creating .gitignore..."
cat > .gitignore << 'EOF'
site/
.DS_Store
__pycache__/
*.pyc
.vscode/
.idea/
EOF

# Create README.md
echo "📝 Creating README.md..."
cat > README.md << 'EOF'
# SF Data Export Automation Documentation

This is the documentation site for SF Data Export Automation - a Google Colab notebook that automates Salesforce Weekly Export downloads to Google Drive.

## Quick Start

1. Install MkDocs:
   ```bash
   pip install -r requirements.txt
   ```

2. Serve the documentation locally:
   ```bash
   mkdocs serve
   ```

3. Build for production:
   ```bash
   mkdocs build
   ```

## Documentation Structure

- `docs/setup/` - Installation and configuration guides
- `docs/configuration/` - Detailed setup instructions
- `docs/usage/` - How to run and use the automation
- `docs/troubleshooting/` - Problem solving and FAQ

## Contributing

To update the documentation:

1. Edit markdown files in the `docs/` directory
2. Test locally with `mkdocs serve`
3. Build and deploy with `mkdocs gh-deploy` (if using GitHub Pages)

## Features

- Material Design theme
- Search functionality
- Mobile responsive
- Code syntax highlighting
- Admonitions and callouts
- Dark/light mode toggle
EOF

echo ""
echo "✅ MkDocs site created successfully!"
echo ""
echo "📁 Generated structure:"
echo "   $PROJECT_NAME/"
echo "   ├── mkdocs.yml"
echo "   ├── requirements.txt"
echo "   ├── README.md"
echo "   └── docs/"
echo "       ├── index.md"
echo "       ├── setup/"
echo "       ├── configuration/"
echo "       ├── usage/"
echo "       └── troubleshooting/"
echo ""
echo "🚀 To get started:"
echo "   cd $PROJECT_NAME"
echo "   pip install -r requirements.txt"
echo "   mkdocs serve"
echo ""
echo "📖 Your documentation will be available at: http://127.0.0.1:8000"
echo ""
echo "🎨 The site uses Material theme with:"
echo "   • Search functionality"
echo "   • Mobile responsive design" 
echo "   • Dark/light mode toggle"
echo "   • Code syntax highlighting"
echo "   • Beautiful admonitions and callouts"
echo "   • GitHub integration ready"
echo ""
echo "🔧 To deploy to GitHub Pages:"
echo "   mkdocs gh-deploy"

