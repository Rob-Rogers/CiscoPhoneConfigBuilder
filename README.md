# Cisco Phone Config Generator
This shell script is a simple interactive tool for generating XML configuration files for **Cisco IP Phones**, specifically the **8941/8945 SIP models**.
However it will support more with minimal modification to the file.

---

## What It Does

- Prompts the user for:
  - MAC address of the Cisco phone
  - SIP username and password
  - SIP server IP address (e.g., FreePBX, Asterisk)
- Automatically generates:
  - A correctly named XML file (e.g. `SEP001122334455.cnf.xml`)
  - Cisco-compatible SIP line registration block
  - Speed dial and BLF keys for common use (e.g., Reception, BLF 102)

---

## Files It Generates

- `SEP<MAC>.cnf.xml`  
  The main config file the Cisco phone downloads from your TFTP server.
  - Includes date/time zone config
  - One SIP line (your user/extension)

You can place this file into `/tftpboot/` or your TFTP server’s root directory.

---

## Requirements

- A TFTP server (e.g., `/tftpboot` on Linux)
- Cisco 8941 or 8945 running SIP firmware (`SIP894x.9-4-2SR3-1`), This can be changed in the config manualy.
- XML dial plan and optional softkey layout
- Background image and `List.xml` if using wallpapers

---
---

---

##Optional Enhancements

- Add a background image (`320x212 PNG`) in `/tftpboot/Desktops/320x212/`
- Add `List.xml` for wallpaper selection
- Include `softkeys.xml` and `dialplan.xml` if used

---

##Support

This script is intended to help automate tedious provisioning tasks for Cisco SIP phones.  
If nat traversal is needed please set  <natEnabled>true</natEnabled> and     <natReceivedProcessing>true</natReceivedProcessing>. Or this won't work behind nat properly.
You may need to modify this to get it exactly how you want for your company.
