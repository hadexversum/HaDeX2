# Aggregate test result

Function aggregates peptide-level information into residue level.
Significance method indicates if the difference is significant or not -
if the number of significant peptides over this residue is bigger than
the number of insignificant.

## Usage

``` r
calculate_aggregated_test_results(
  p_diff_uptake_conf_dat,
  method = c("significance", "weiss"),
  time_t = 1,
  skip_amino = 1
)
```

## Arguments

- p_diff_uptake_conf_dat:

  uptake data with confidence, as produced by
  [`create_p_diff_uptake_dataset_with_confidence`](https://hadexversum.github.io/HaDeX2/reference/create_p_diff_uptake_dataset_with_confidence.md)
  function

- method:

  method of aggregation: significance or weiss method

- time_t:

  chosen time point

- skip_amino:

  `integer`, indicator how many amino acids from the N-terminus should
  be omitted in visualization

## Value

a [`data.frame`](https://rdrr.io/r/base/data.frame.html) object

## Details

Only peptides without modification are aggregated.

## See also

[`read_hdx`](https://hadexversum.github.io/HaDeX2/reference/read_hdx.md)

## Examples

``` r
p_diff_uptake_dat <- create_p_diff_uptake_dataset(alpha_dat)
p_diff_uptake_conf_dat <- create_p_diff_uptake_dataset_with_confidence(p_diff_uptake_dat)
calculate_aggregated_test_results(p_diff_uptake_conf_dat, method = "significance")
#>     Residues 60s
#> 1          1   0
#> 2          2   1
#> 3          3   1
#> 4          4   1
#> 5          5   1
#> 6          6   1
#> 7          7   1
#> 8          8   1
#> 9          9   1
#> 10        10   1
#> 11        11   1
#> 12        12   1
#> 13        13   1
#> 14        14   1
#> 15        15   0
#> 16        16   0
#> 17        17   0
#> 18        18   1
#> 19        19   1
#> 20        20   1
#> 21        21   1
#> 22        22   1
#> 23        23   0
#> 24        24   0
#> 25        25   0
#> 26        26   0
#> 27        27   0
#> 28        28   0
#> 29        29   0
#> 30        30   0
#> 31        31   0
#> 32        32   0
#> 33        33   0
#> 34        34   0
#> 35        35   1
#> 36        36   1
#> 37        37   1
#> 38        38   0
#> 39        39   0
#> 40        40   0
#> 41        41   0
#> 42        42   0
#> 43        43   0
#> 44        44   0
#> 45        45   0
#> 46        46   0
#> 47        47   0
#> 48        48   0
#> 49        49   0
#> 50        50   0
#> 51        51   0
#> 52        52   1
#> 53        53   1
#> 54        54   1
#> 55        55   1
#> 56        56   1
#> 57        57   1
#> 58        58   0
#> 59        59   0
#> 60        60   0
#> 61        61   0
#> 62        62   0
#> 63        63   0
#> 64        64   0
#> 65        65   0
#> 66        66   0
#> 67        67   0
#> 68        68   0
#> 69        69   0
#> 70        70   0
#> 71        71   0
#> 72        72   0
#> 73        73   0
#> 74        74   0
#> 75        75   0
#> 76        76   0
#> 77        77   0
#> 78        78   0
#> 79        79   0
#> 80        80   0
#> 81        81   0
#> 82        82   0
#> 83        83   0
#> 84        84   0
#> 85        85   1
#> 86        86   1
#> 87        87   1
#> 88        88   1
#> 89        89   1
#> 90        90   1
#> 91        91   1
#> 92        92   1
#> 93        93   1
#> 94        94   1
#> 95        95   1
#> 96        96   1
#> 97        97   1
#> 98        98   1
#> 99        99   1
#> 100      100   1
#> 101      101   1
#> 102      102   1
#> 103      103   0
#> 104      104   0
#> 105      105   0
#> 106      106   0
#> 107      107   0
#> 108      108   0
#> 109      109   0
#> 110      110   0
#> 111      111   0
#> 112      112   0
#> 113      113   0
#> 114      114   0
#> 115      115   0
#> 116      116   0
#> 117      117   0
#> 118      118   0
#> 119      119   0
#> 120      120   0
#> 121      121   0
#> 122      122   0
#> 123      123   0
#> 124      124   0
#> 125      125   0
#> 126      126   0
#> 127      127   0
#> 128      128   0
#> 129      129   0
#> 130      130   0
#> 131      131   0
#> 132      132   0
#> 133      133   0
#> 134      134   0
#> 135      135   0
#> 136      136   0
#> 137      137   1
#> 138      138   1
#> 139      139   1
#> 140      140   1
#> 141      141   1
#> 142      142   1
#> 143      143   1
#> 144      144   1
#> 145      145   1
#> 146      146   1
#> 147      147   1
#> 148      148   1
#> 149      149   1
#> 150      150   1
#> 151      151   1
#> 152      152   1
#> 153      153   1
#> 154      154   1
#> 155      155   1
#> 156      156   1
#> 157      157   1
#> 158      158   1
#> 159      159   1
#> 160      160   0
#> 161      161   1
#> 162      162   1
#> 163      163   1
#> 164      164   1
#> 165      165   1
#> 166      166   1
#> 167      167   0
#> 168      168   0
#> 169      169   0
#> 170      170   0
#> 171      171   0
#> 172      172   0
#> 173      173   0
#> 174      174   0
#> 175      175   0
#> 176      176   0
#> 177      177   1
#> 178      178   1
#> 179      179   1
#> 180      180   1
#> 181      181   1
#> 182      182   1
#> 183      183   1
#> 184      184   1
#> 185      185   1
#> 186      186   1
#> 187      187   1
#> 188      188   1
#> 189      189   1
#> 190      190   1
#> 191      191   0
#> 192      192   1
#> 193      193   1
#> 194      194   1
#> 195      195   1
#> 196      196   1
#> 197      197   1
#> 198      198   1
#> 199      199   1
#> 200      200   1
#> 201      201   1
#> 202      202   1
#> 203      203   0
#> 204      204   0
#> 205      205   0
#> 206      206   0
#> 207      207   0
#> 208      208   0
#> 209      209   0
#> 210      210   0
#> 211      211   0
#> 212      212   1
#> 213      213   1
#> 214      214   1
#> 215      215   1
#> 216      216   1
#> 217      217   0
#> 218      218   0
#> 219      219   1
#> 220      220   1
#> 221      221   1
calculate_aggregated_test_results(p_diff_uptake_conf_dat, method = "weiss")
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 9 rows but longest item has 10; recycled with remainder.
#> Warning: Item 1 has 8 rows but longest item has 9; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 4 rows but longest item has 5; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 16 rows but longest item has 17; recycled with remainder.
#> Warning: Item 1 has 14 rows but longest item has 15; recycled with remainder.
#> Warning: Item 1 has 12 rows but longest item has 13; recycled with remainder.
#> Warning: Item 1 has 4 rows but longest item has 5; recycled with remainder.
#> Warning: Item 1 has 11 rows but longest item has 12; recycled with remainder.
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 8 rows but longest item has 9; recycled with remainder.
#> Warning: Item 1 has 9 rows but longest item has 10; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 4 rows but longest item has 5; recycled with remainder.
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 11 rows but longest item has 12; recycled with remainder.
#> Warning: Item 1 has 13 rows but longest item has 14; recycled with remainder.
#> Warning: Item 1 has 14 rows but longest item has 15; recycled with remainder.
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 12 rows but longest item has 13; recycled with remainder.
#> Warning: Item 1 has 13 rows but longest item has 14; recycled with remainder.
#> Warning: Item 1 has 9 rows but longest item has 10; recycled with remainder.
#> Warning: Item 1 has 8 rows but longest item has 9; recycled with remainder.
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 15 rows but longest item has 16; recycled with remainder.
#> Warning: Item 1 has 20 rows but longest item has 21; recycled with remainder.
#> Warning: Item 1 has 14 rows but longest item has 15; recycled with remainder.
#> Warning: Item 1 has 18 rows but longest item has 19; recycled with remainder.
#> Warning: Item 1 has 20 rows but longest item has 21; recycled with remainder.
#> Warning: Item 1 has 16 rows but longest item has 17; recycled with remainder.
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 19 rows but longest item has 20; recycled with remainder.
#> Warning: Item 1 has 17 rows but longest item has 18; recycled with remainder.
#> Warning: Item 1 has 16 rows but longest item has 17; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 4 rows but longest item has 5; recycled with remainder.
#> Warning: Item 1 has 16 rows but longest item has 17; recycled with remainder.
#> Warning: Item 1 has 17 rows but longest item has 18; recycled with remainder.
#> Warning: Item 1 has 19 rows but longest item has 20; recycled with remainder.
#> Warning: Item 1 has 17 rows but longest item has 18; recycled with remainder.
#> Warning: Item 1 has 16 rows but longest item has 17; recycled with remainder.
#> Warning: Item 1 has 12 rows but longest item has 13; recycled with remainder.
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 7 rows but longest item has 8; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 7 rows but longest item has 8; recycled with remainder.
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 4 rows but longest item has 5; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 8 rows but longest item has 9; recycled with remainder.
#> Warning: Item 1 has 9 rows but longest item has 10; recycled with remainder.
#> Warning: Item 1 has 16 rows but longest item has 17; recycled with remainder.
#> Warning: Item 1 has 8 rows but longest item has 9; recycled with remainder.
#> Warning: Item 1 has 15 rows but longest item has 16; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 13 rows but longest item has 14; recycled with remainder.
#> Warning: Item 1 has 27 rows but longest item has 28; recycled with remainder.
#> Warning: Item 1 has 19 rows but longest item has 20; recycled with remainder.
#> Warning: Item 1 has 7 rows but longest item has 8; recycled with remainder.
#> Warning: Item 1 has 9 rows but longest item has 10; recycled with remainder.
#> Warning: Item 1 has 14 rows but longest item has 15; recycled with remainder.
#> Warning: Item 1 has 15 rows but longest item has 16; recycled with remainder.
#> Warning: Item 1 has 12 rows but longest item has 13; recycled with remainder.
#> Warning: Item 1 has 15 rows but longest item has 16; recycled with remainder.
#> Warning: Item 1 has 13 rows but longest item has 14; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 11 rows but longest item has 12; recycled with remainder.
#> Warning: Item 1 has 12 rows but longest item has 13; recycled with remainder.
#> Warning: Item 1 has 10 rows but longest item has 11; recycled with remainder.
#> Warning: Item 1 has 11 rows but longest item has 12; recycled with remainder.
#> Warning: Item 1 has 12 rows but longest item has 13; recycled with remainder.
#> Warning: Item 1 has 7 rows but longest item has 8; recycled with remainder.
#> Warning: Item 1 has 8 rows but longest item has 9; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 7 rows but longest item has 8; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 7 rows but longest item has 8; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 7 rows but longest item has 8; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 4 rows but longest item has 5; recycled with remainder.
#> Warning: Item 1 has 7 rows but longest item has 8; recycled with remainder.
#> Warning: Item 1 has 6 rows but longest item has 7; recycled with remainder.
#> Warning: Item 1 has 7 rows but longest item has 8; recycled with remainder.
#> Warning: Item 1 has 8 rows but longest item has 9; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 5 rows but longest item has 6; recycled with remainder.
#> Warning: Item 1 has 4 rows but longest item has 5; recycled with remainder.
#>     pos aa         value
#> 1     1  x  0.0000000000
#> 2     2  L  0.4316442009
#> 3     3  L  0.4199013993
#> 4     4  L  0.4310889351
#> 5     5  D  0.4310889351
#> 6     6  G  0.3291762528
#> 7     7  K  0.3291762528
#> 8     8  S  0.3291762528
#> 9     9  P  0.0000000000
#> 10   10  L  0.3347822690
#> 11   11  G  0.3455539050
#> 12   12  L  0.3559280000
#> 13   13  Y  0.1879596608
#> 14   14  V  0.1879596608
#> 15   15  L  0.1224110407
#> 16   16  K  0.1642385870
#> 17   17  D  0.1503144429
#> 18   18  D  0.2153659671
#> 19   19  L  0.2153659671
#> 20   20  D  0.2158720512
#> 21   21  D  0.2036101606
#> 22   22  D  0.2044567921
#> 23   23  D  0.1136382355
#> 24   24  D  0.0779845594
#> 25   25  D  0.1565441248
#> 26   26  E  0.1565441248
#> 27   27  G  0.2177590216
#> 28   28  D  0.2096322196
#> 29   29  V  0.2096322196
#> 30   30  P  0.0000000000
#> 31   31  S  0.1829384783
#> 32   32  Q  0.1829384783
#> 33   33  A  0.1831194033
#> 34   34  x  0.0000000000
#> 35   35  E  0.1005256667
#> 36   36  A  0.1005256667
#> 37   37  V  0.1005256667
#> 38   38  A  0.1264453776
#> 39   39  A  0.1796679791
#> 40   40  L  0.1433885064
#> 41   41  H  0.1148066372
#> 42   42  S  0.1148066372
#> 43   43  S  0.1148066372
#> 44   44  P  0.0000000000
#> 45   45  P  0.0000000000
#> 46   46  P  0.0000000000
#> 47   47  A  0.1148066372
#> 48   48  D  0.1191522761
#> 49   49  L  0.2566086031
#> 50   50  C  0.2566086031
#> 51   51  H  0.2345691032
#> 52   52  H  0.3437770475
#> 53   53  H  0.2927548466
#> 54   54  R  0.2927548466
#> 55   55  W  0.2927548466
#> 56   56  Y  0.2927548466
#> 57   57  N  0.2927548466
#> 58   58  x  0.0000000000
#> 59   59  Y  0.0366650683
#> 60   60  K  0.0366650683
#> 61   61  S  0.0366650683
#> 62   62  Y  0.0366650683
#> 63   63  E  0.0366650683
#> 64   64  K  0.0366650683
#> 65   65  D  0.0547479767
#> 66   66  K  0.0547479767
#> 67   67  D -0.0010409829
#> 68   68  S -0.0010409829
#> 69   69  L -0.0010409829
#> 70   70  P  0.0000000000
#> 71   71  G -0.0010409829
#> 72   72  V -0.0010409829
#> 73   73  K -0.0010409829
#> 74   74  K  0.0059218492
#> 75   75  E  0.0276484936
#> 76   76  L  0.0276484936
#> 77   77  G  0.0276484936
#> 78   78  K  0.0276484936
#> 79   79  Y -0.0461468827
#> 80   80  G -0.0461468827
#> 81   81  P  0.0000000000
#> 82   82  A -0.0461468827
#> 83   83  D  0.0442749793
#> 84   84  L  0.1149040510
#> 85   85  E  0.5083777374
#> 86   86  L  0.4987988542
#> 87   87  L  0.5000781879
#> 88   88  T  0.5000781879
#> 89   89  G  0.5000781879
#> 90   90  S  0.5000781879
#> 91   91  G  0.5000781879
#> 92   92  A  0.5000781879
#> 93   93  T  0.5000781879
#> 94   94  D  0.5000781879
#> 95   95  S  0.5000781879
#> 96   96  K  0.5000781879
#> 97   97  D  0.5000781879
#> 98   98  L  0.3314122330
#> 99   99  D  0.3314122330
#> 100 100  D  0.3314122330
#> 101 101  I  0.3314122330
#> 102 102  D  0.3314122330
#> 103 103  D  0.0604610000
#> 104 104  L  0.0679578654
#> 105 105  G  0.0679578654
#> 106 106  S  0.0679578654
#> 107 107  D  0.0679578654
#> 108 108  Q  0.0504065869
#> 109 109  Q  0.0292293552
#> 110 110  E  0.0292293552
#> 111 111  E  0.0292293552
#> 112 112  S  0.0292293552
#> 113 113  E  0.0292293552
#> 114 114  E  0.0292293552
#> 115 115  A  0.0292293552
#> 116 116  K  0.0292293552
#> 117 117  R  0.0292293552
#> 118 118  L  0.0292293552
#> 119 119  R  0.0292293552
#> 120 120  E -0.0174883187
#> 121 121  E -0.0508827181
#> 122 122  R -0.0508827181
#> 123 123  L -0.0903104838
#> 124 124  L  0.0007091861
#> 125 125  Q  0.0818387834
#> 126 126  L  0.2155169795
#> 127 127  E  0.2155169795
#> 128 128  S  0.2155169795
#> 129 129  K  0.2155169795
#> 130 130  K  0.2155169795
#> 131 131  A  0.2155169795
#> 132 132  K  0.2155169795
#> 133 133  K  0.2155169795
#> 134 134  P  0.0000000000
#> 135 135  A  0.2155169795
#> 136 136  x  0.0000000000
#> 137 137  L  0.4735283250
#> 138 138  L  0.4670917775
#> 139 139  K  0.4670917775
#> 140 140  S  0.4670917775
#> 141 141  S  0.4670917775
#> 142 142  I  0.4670917775
#> 143 143  L  0.3833820892
#> 144 144  D  0.4092657922
#> 145 145  M  0.4129133651
#> 146 146  V  0.4129133651
#> 147 147  K  0.4129133651
#> 148 148  P  0.0000000000
#> 149 149  W  0.4129133651
#> 150 150  D  0.4129133651
#> 151 151  D  0.5018173249
#> 152 152  E  0.5018173249
#> 153 153  T  0.5018173249
#> 154 154  D  0.4247679772
#> 155 155  E  0.1792668001
#> 156 156  E  0.1631846049
#> 157 157  K  0.1631846049
#> 158 158  L  0.1631846049
#> 159 159  E  0.1631846049
#> 160 160  x  0.0000000000
#> 161 161  L  0.1813836001
#> 162 162  L  0.1933751101
#> 163 163  R  0.1933751101
#> 164 164  C  0.1719705839
#> 165 165  I  0.1719705839
#> 166 166  Q  0.1719705839
#> 167 167  K  0.2159688536
#> 168 168  G  0.2270474048
#> 169 169  G  0.2183010315
#> 170 170  Y  0.3012723921
#> 171 171  V  0.3012723921
#> 172 172  W  0.3012723921
#> 173 173  G  0.3012723921
#> 174 174  S  0.3012723921
#> 175 175  S  0.3737867830
#> 176 176  C  0.3799416305
#> 177 177  L  0.4290563690
#> 178 178  C  0.4398801331
#> 179 179  P  0.0000000000
#> 180 180  V  0.4398801331
#> 181 181  G  0.4398801331
#> 182 182  Y  0.4678445289
#> 183 183  G  0.5090831445
#> 184 184  I  0.5090831445
#> 185 185  K  0.5090831445
#> 186 186  C  0.1900291606
#> 187 187  L  0.1900291606
#> 188 188  Q  0.1900291606
#> 189 189  I  0.1900291606
#> 190 190  Q  0.1900291606
#> 191 191  L  0.4486248171
#> 192 192  E  0.4087878736
#> 193 193  V  0.4087878736
#> 194 194  E  0.4087878736
#> 195 195  L  0.3795342325
#> 196 196  L  0.3227256852
#> 197 197  K  0.3227256852
#> 198 198  L  0.2779365367
#> 199 199  G  0.2779365367
#> 200 200  T  0.2779365367
#> 201 201  D  0.2779365367
#> 202 202  M  0.2711696088
#> 203 203  F  0.1800200963
#> 204 204  F  0.1552000741
#> 205 205  F  0.1172879255
#> 206 206  F  0.1241242654
#> 207 207  I  0.1241242654
#> 208 208  T  0.1136813339
#> 209 209  A  0.1147571683
#> 210 210  M  0.2514835693
#> 211 211  V  0.2596182404
#> 212 212  M  0.2234148214
#> 213 213  D  0.2459592984
#> 214 214  V  0.2459592984
#> 215 215  Q  0.2459592984
#> 216 216  S  0.2459592984
#> 217 217  M  0.3185355258
#> 218 218  F  0.2202156667
#> 219 219  V  0.1729096667
#> 220 220  A  0.1729096667
#> 221 221  A  0.1729096667
```
