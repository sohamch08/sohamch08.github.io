# Updating the website's public keys

The Contact page reads `_data/public_keys.yml`. Its key text also supplies the
download files, so a single update changes copying, viewing and downloading.

To replace the GPG key, export your chosen public key to an ASCII armored `.asc`
file, then run from the repository root:

```sh
mise exec -- ruby tools/update-public-key.rb gpg /path/to/public-key.asc
```

To replace the SSH key:

```sh
mise exec -- ruby tools/update-public-key.rb ssh /path/to/key.pub
```

The command detects the algorithm and fingerprint from the replacement key.
RSA, Ed25519, ECDSA and other algorithms recognized by your installed GnuPG or
OpenSSH work with the same cards. GPG labels describe the primary key. Updating
an RSA key to an ECC key requires exporting the actual replacement ECC public
key. Changing only the display label does not change the key's algorithm.

These commands update website data only. They do not generate keys or change
your GPG keyring or SSH configuration. GPG updates require `gpg`; SSH updates
require `ssh-keygen`.

You can edit titles and display labels directly in `_data/public_keys.yml`.
Keep the algorithm, fingerprint and public key text consistent. The update
command handles these three values together and preserves the other fields.

After updating, preview the Contact page and rebuild the site as usual.

The GPG parser follows the [GnuPG colon listing format](https://github.com/gpg/gnupg/blob/master/doc/DETAILS).
