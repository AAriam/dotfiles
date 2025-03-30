# Git/GitHub Settings


## Commit Signature

To enable [commit signature verification on GitHub](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification),
commits and tags are locally signed using a [GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification#gpg-commit-signature-verification).

> [!NOTE]
> GPG (GNU Privacy Guard) keys are a form of asymmetric encryption used to secure communications and verify the identity of the sender. GPG uses two keys:
> 
> - **Public key**: This is shared with others and is used to verify your signature or encrypt messages sent to you.
> - **Private key**: This is kept secret and is used to sign messages (or decrypt messages) that were encrypted with your public key.
> 
> In the context of Git commits, GPG keys are used to sign commits, 
> ensuring that the commits came from you and haven't been tampered with. 
> This adds an additional layer of security and authenticity to your Git history, 
> which is especially useful in open-source projects 
> or when working in a collaborative environment.
> 
> **How GPG Keys Work for Git Signing**
> 1. Signing: When you sign a Git commit with your private key, you're creating a digital signature that proves the commit came from you.
> 2. Verification: Anyone who has your public key can verify the signature, ensuring the commit wasn't altered and that it was indeed created by you.

For this, you first need to have a GPG key on your machine
that is also added to your GitHub account (cf. [GitHub docs](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification#gpg-commit-signature-verification)).
Simply add your GPG key ID to the configurations at `home/.chezmoidata/user.yaml$git.signing_key`.

Then, the first time you push a commit or tag, you will be asked
to enter the passphrase of your GPG key.
The `GPG_TTY` environment variable is set in the shell configuration
files to ensure that the prompt appears on the correct terminal.
On macOS, the `pinentry-mac` app is installed using `Homebrew`,
and set as the `pinentry-program` for the [`gnupg`](https://www.gnupg.org/documentation/manuals/gnupg/) program
in its [configuration file](https://www.gnupg.org/documentation/manuals/gnupg/Agent-Configuration.html)
at `home/private_dot_gnupg/gpg-agent.conf.tmpl`.
After entering your passphrase for the first time,
you can select to save it in your OS keychain/keyring,
so that you don't have to enter it each time.

### Disabling

To disable GPG signing, remove the `user.signingkey`, `commit.gpgSign`,
and `tag.gpgSign` settings from the git config file at `home/dot_config/git/config.tmpl`.


### Exporting / Importing Keys

To be able to use your GPG key on a new machine,
you should export them from your old machine and import them
to the new machine.

#### Exporting

1. Export the public key to a file (e.g. `public_key.asc`):
   ```bash
   gpg --armor --export <Your Key ID> > public_key.asc
   ```
2. Export the private key to a file (e.g. `private_key.asc`):
   ```bas
   gpg --armor --export-secret-keys <Your Key ID> > private_key.asc
   ```

#### Importing

After copying the files to your new machine:
1. Import the public key:
   ```bash
   gpg --import public_key.asc
   ```
2. Import the private key:
   ```bash
   gpg --import private_key.asc
   ```
3. Verify the import:
   ```bash
   gpg --list-keys
   ```
4. Trust the key:
   ```bash
   gpg --edit-key <Your Key ID>
   ```
   At the prompt, type `trust` and select the trust level `5` 
   for ultimate trust since it's your keys.


## References

- [GNU Provacy Guard Manual](https://www.gnupg.org/documentation/manuals/gnupg/)
- [Quick-start guide to GPG](https://github.com/bfrg/gpg-guide)
