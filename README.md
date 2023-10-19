An app to stress GPU cards on Fly.io

```
fly deploy --ha=false --vm-gpu-kind a100-pcie-40gb
```

Scale up and down with:
```
fly scale count N
```

If you need to scale up from zero, then do it like:
```
fly scale count N --vm-gpu-kind a100-pcie-40gb
```

Special thanks to Ville Timonen ([wili.cc](http://wili.cc)),
the author of [gpu-burn](http://wili.cc/blog/gpu-burn.html) tool.
