An app to stress GPU cards on Fly.io

```
fly deploy --ha=false --vm-gpu-kind a100-pcie-40gb
```

Use `fly m clone` if you need to scale becayse `fly scale count` doesn't propagate the _host dedication id_

Special thanks to Ville Timonen ([wili.cc](http://wili.cc)),
the author of [gpu-burn](http://wili.cc/blog/gpu-burn.html) tool.
