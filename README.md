# Nix Presentation

## Executing the demo application

```bash
$(nix-store -r $(nix-instantiate default.nix))/bin/hello.sh
```
