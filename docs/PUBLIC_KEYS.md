# Updating the website's public keys

The Contact page reads key text directly from `assets/gpg_key.asc` and
`assets/id_ed25519.pub`. Hugo publishes these files at `assets/keys/gpg.asc` and
`assets/keys/ssh.pub`, so copying, viewing and downloading use the same keys.
`data/public_keys.yml` stores the asset paths and display metadata.

To replace the GPG key, export your chosen public key to an ASCII armored `.asc`
file, then run from the repository root:

```sh
ruby tools/update-public-key.rb gpg /path/to/public-key.asc
```

To replace the SSH key:

```sh
ruby tools/update-public-key.rb ssh /path/to/key.pub
```

The command copies the replacement key into its configured asset file and
updates the algorithm and fingerprint in `data/public_keys.yml`. To refresh
metadata after editing the asset files directly, run:

```sh
ruby tools/update-public-key.rb gpg assets/gpg_key.asc
ruby tools/update-public-key.rb ssh assets/id_ed25519.pub
```

RSA, Ed25519, ECDSA and other algorithms recognized by your installed GnuPG or
OpenSSH work with the same cards. GPG labels describe the primary key. Updating
an RSA key to an ECC key requires exporting the actual replacement ECC public
key. Changing only the display label does not change the key's algorithm.

These commands update website assets and metadata only. They do not generate
keys or change your GPG keyring or SSH configuration. GPG updates require `gpg`; SSH updates
require `ssh-keygen`. These optional helpers also require Ruby; the site build
does not.

You can edit titles and display labels directly in `data/public_keys.yml`.
Keep the algorithm, fingerprint and public key text consistent. The update
command handles the asset text and these two metadata values together and
preserves the other fields.

After updating, preview the Contact page and rebuild the site as usual.

The GPG parser follows the [GnuPG colon listing format](https://github.com/gpg/gnupg/blob/master/doc/DETAILS).
