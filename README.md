# libspinners-d

[![](https://img.shields.io/github/v/tag/thechampagne/libspinners-d?label=version)](https://github.com/thechampagne/libspinners-d/releases/latest) [![](https://img.shields.io/github/license/thechampagne/libspinners-d)](https://github.com/thechampagne/libspinners-d/blob/main/LICENSE)

D binding for libspinners an elegant terminal spinners.

### Download
[DUB](https://code.dlang.org/packages/spinners/)

```
dub add spinners
```

### Example
```d
import core.thread;
import spinner;

void main()
{
    Spinner spin = Spinner(Spinners.Dots9, "Waiting for 3 seconds");
    Thread.sleep(3.seconds);
    spin.stop();
}
```

### References
 - [libspinners](https://github.com/thechampagne/libspinners)

### License

This repo is released under the [MIT](https://github.com/thechampagne/libspinners-d/blob/main/LICENSE).