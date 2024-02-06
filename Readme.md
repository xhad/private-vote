## Snapshot + Shutter stacks

Requires Docker Desktop on a Mac using M1/M2.

```
make build
make start
make logs
make check
make stop
```

### Snapshot UI 

Start the snapshot UI directly from the module folder with the following .env:

```
VITE_HUB_URL=http://localhost:3000
VITE_RELAYER_URL=http://localhost:3000
VITE_SCORES_URL=http://localhost:3003
VITE_ENVELOP_URL=https://core.envelop.fyi
VITE_SIDEKICK_URL=https://sh5.co
VITE_BROVIDER_URL=https://rpc.snapshot.org
VITE_STAMP_URL=https://stamp.fyi
VITE_IPFS_GATEWAY=ipfs.loreum.org
VITE_DEFAULT_NETWORK=1
VITE_PUSHER_BEAMS_INSTANCE_ID=2e080021-d495-456d-b2cf-84f9fd718442
VITE_SHUTTER_EON_PUBKEY=0x0e6493bbb4ee8b19aa9b70367685049ff01dc9382c46aed83f8bc07d2a5ba3e6030bd83b942c1fd3dff5b79bef3b40bf6b666e51e7f0be14ed62daaffad47435265f5c9403b1a801921981f7d8659a9bd91fe92fb1cf9afdb16178a532adfaf51a237103874bb03afafe9cab2118dae1be5f08a0a28bf488c1581e9db4bc23ca
VITE_ENV=develop
VITE_MIXPANEL_TOKEN=2ec6cd1b19e790f45cc9a9bb83980c8d
```