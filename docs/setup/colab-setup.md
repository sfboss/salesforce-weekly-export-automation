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
