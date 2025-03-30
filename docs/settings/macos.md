# macOS Settings

## Property Lists

Preference and configuration files in macOS use property lists (plists) to specify the attributes, or properties, of an app or process. An example is the preferences plist for the Finder in the Library/Preferences/ folder of a user’s home folder. The file is named com.apple.finder.plist. The default naming convention for a plist includes the distributor’s reverse DNS name prepended to the app or process name, followed by a .plist extension.

To [edit property lists in terminal](https://support.apple.com/en-ie/guide/terminal/apda49a1bb2-577e-4721-8f25-ffc0836f6997/mac), use the [defaults](https://macos-defaults.com/) command-line tool. The defaults command is a powerful tool and, when you know the specific key and value in a property list you want to change, the defaults tool is very efficient.

The defaults tool works directly with the macOS preferences subsystem and is used by many apps in macOS to manage preferences and other settings. It can be built into shell scripts and lets you access preferences in the multiple domains that exist on a given computer.


### Configuration

Properties are written using the [`defaults write`](https://ss64.com/mac/defaults.html) command, which takes a domain, key, value type, and value.
These can be set in the `home/.chezmoidata/os.yaml` configuration file under `$.macos.defaults`. Each entry takes the following key-value pairs:

- `domain` (optional, default: NSGlobalDomain): The domain for the configuration. For example, `com.apple.finder`. If omitted, the `-g` flag is used to select the global domain (i.e. `NSGlobalDomain`).
- `key`: The setting name, e.g. `FXRemoveOldTrashItems`.
- `type` (optional, default: string): Type of the value; can be one of `string`, `data`, `int[eger]`, `float`, `bool[ean]`, `date`, `array`, `array-add`, `dict`, or `dict-add`.
- `value`: The value to set for `key`; can be any data type, including arrays and mappings.