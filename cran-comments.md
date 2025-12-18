## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

Using local win-builder there was no error, no warning and one note:

```
installed size is 11.4Mb 
sub-directories of 1Mb or more:
      HaDeX   3.8Mb
      doc     5.6Mb
```

The size is mostly caused by our extensive documentation. 

## Tested environments

* local Windows install (x86_64-w64-mingw32, R 4.3.3)

## Why it is HaDeX2, not HaDeX 2.0?

HaDeX2 is a complete rewrite and redesign of the original HaDeX package. The scope of changes is so substantial that HaDeX2 constitutes a fundamentally new package rather than a continuation of HaDeX. At the same time, HaDeX remains a published package that requires ongoing maintenance. For these reasons, we proposed releasing HaDeX2 as a separate package. This approach was discussed with Kurt Hornik, who agreed with and approved the proposal.