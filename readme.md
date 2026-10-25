# Windows Credential Manager

Windows Credential Manager stores credentials used by Windows applications, network resources, and supported services. This project demonstrates how to list saved credential targets and select a specific target for authorized credential management and troubleshooting.

The built-in `cmdkey.exe` utility can display the credential targets registered on the local Windows system.

## Requirements

- Windows operating system.
- Command Prompt or PowerShell.
- Git installed.
- Access to the Windows user account whose credentials you intend to inspect.

## Installation

### Step 1: Clone the repository

Open Command Prompt and run:

```cmd
git clone https://github.com/sandeshsb9/Windows-Credential-Password-Viewer.git
```

### Step 2: Open the project folder

```cmd
cd Windows-Credential-Password-Viewer
```

To open the project in VS Code, run:

```cmd
code .
```

To view the files in CMD, run:

```cmd
dir
```

## Usage

### Step 1: List saved credential targets

Open **Command Prompt** and run:

```cmd
cmdkey.exe /list
```

This displays the credential targets registered for the current user.

Example output:

```text
Currently stored credentials:

    Target: LegacyGeneric:target=git:https://github.com
    Type: Generic
    User: yourusername
    Local machine persistence
```

The output may differ depending on the Windows version, account configuration, and saved credentials.

### Step 2: Identify the target

Locate the entry associated with the service or application you want to manage.

For example:

```text
LegacyGeneric:target=git:https://github.com
```

Copy the target identifier exactly as displayed.

### Step 3: Set the target variable

In your PowerShell script, assign the selected target to the `$Target` variable:

```powershell
$Target = "LegacyGeneric:target=git:https://github.com"
```

Replace the example value with the actual target identifier from your system.

**Important:** A credential target identifies a saved credential entry; it does not necessarily expose the stored password. The script also requires its `CredentialManager` PowerShell module. Review the script before running it.

## Troubleshooting

**No credentials are listed**

The current Windows user may not have saved credentials, or the relevant credentials may belong to another account or credential store.

**The target is not found**

Run `cmdkey.exe /list` again and copy the complete target identifier, including its prefix and punctuation.

**The target is listed, but the password is unavailable**

Some credential types do not expose their secrets through `cmdkey.exe`. Use the relevant application's account-management or credential-reset process when necessary.

## Disclaimer

This project is intended for educational purposes, authorized system administration, and Windows credential-management troubleshooting. Users are responsible for ensuring that their use complies with applicable laws, organizational policies, and system-access permissions.
