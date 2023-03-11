# k210-rtems-test
Renode robot test script for RTEMS on the Kendryte K210 SoC

To run the tests, copy the testsuite binaries to this directory and run the renode-test command below. Note that my RTEMS source is installed in ~/rtems/rtems. Adjust the copy command below to match where you built RTEMS.
It might also be worth changing the robot script to read the test files directly from the build rather than copying them.

Also note that the test script tests my RKI image, which is available here:

```
https://github.com/alanc98/rki2
```

Copy Command:

```
$ cp -r ~/rtems/rtems/build/kendrytek210/testsuites .
```

Renode Test run command:

```
$ renode-test k210_rtems.robot
```

The test should complete without errors.

More info about renode here:
https://renode.io

