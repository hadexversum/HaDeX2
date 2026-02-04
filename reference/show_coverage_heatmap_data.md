# Coverage heatmap data

This function prepares the data used in coverage heatmap to be shown in
user-friendly way.

## Usage

``` r
show_coverage_heatmap_data(x_dat, value = NULL)
```

## Arguments

- x_dat:

  data created using calculate\_ or create\_ function

- value:

  value to be presented

## Value

a [`data.table`](https://rdrr.io/pkg/data.table/man/data.table.html)
object

## Examples

``` r
# auc data
auc_dat <- calculate_auc(create_uptake_dataset(alpha_dat))
show_coverage_heatmap_data(auc_dat, value = "auc")
#>       Protein                     Sequence Start End       State Modification
#> 1   db_eEF1Ba                  GFGDLKSPAGL     1  11 ALPHA_Gamma           NA
#> 2   db_eEF1Ba                   FGDLKSPAGL     2  11 ALPHA_Gamma           NA
#> 3   db_eEF1Ba                    GDLKSPAGL     3  11 ALPHA_Gamma           NA
#> 4   db_eEF1Ba                       LKSPAG     5  10 ALPHA_Gamma           NA
#> 5   db_eEF1Ba                      LKSPAGL     5  11 ALPHA_Gamma           NA
#> 6   db_eEF1Ba                       AGLQVL     9  14 ALPHA_Gamma           NA
#> 7   db_eEF1Ba                        QVLND    12  16 ALPHA_Gamma           NA
#> 8   db_eEF1Ba                       QVLNDY    12  17 ALPHA_Gamma           NA
#> 9   db_eEF1Ba                       NDYLAD    15  20 ALPHA_Gamma           NA
#> 10  db_eEF1Ba                      NDYLADK    15  21 ALPHA_Gamma           NA
#> 11  db_eEF1Ba                       YLADKS    17  22 ALPHA_Gamma           NA
#> 12  db_eEF1Ba                      YLADKSY    17  23 ALPHA_Gamma           NA
#> 13  db_eEF1Ba            YLADKSYIEGYVPSQAD    17  33 ALPHA_Gamma           NA
#> 14  db_eEF1Ba              ADKSYIEGYVPSQAD    19  33 ALPHA_Gamma           NA
#> 15  db_eEF1Ba                KSYIEGYVPSQAD    21  33 ALPHA_Gamma           NA
#> 16  db_eEF1Ba                        SYIEG    22  26 ALPHA_Gamma           NA
#> 17  db_eEF1Ba                 SYIEGYVPSQAD    22  33 ALPHA_Gamma           NA
#> 18  db_eEF1Ba                  YIEGYVPSQAD    23  33 ALPHA_Gamma           NA
#> 19  db_eEF1Ba                       IEGYVP    24  29 ALPHA_Gamma           NA
#> 20  db_eEF1Ba                    IEGYVPSQA    24  32 ALPHA_Gamma           NA
#> 21  db_eEF1Ba                   IEGYVPSQAD    24  33 ALPHA_Gamma           NA
#> 22  db_eEF1Ba                      YVPSQAD    27  33 ALPHA_Gamma           NA
#> 23  db_eEF1Ba                        VAVFE    34  38 ALPHA_Gamma           NA
#> 24  db_eEF1Ba                  FEAVSSPPPAD    37  47 ALPHA_Gamma           NA
#> 25  db_eEF1Ba                 FEAVSSPPPADL    37  48 ALPHA_Gamma           NA
#> 26  db_eEF1Ba               FEAVSSPPPADLCH    37  50 ALPHA_Gamma           NA
#> 27  db_eEF1Ba              FEAVSSPPPADLCHA    37  51 ALPHA_Gamma           NA
#> 28  db_eEF1Ba                  EAVSSPPPADL    38  48 ALPHA_Gamma           NA
#> 29  db_eEF1Ba                EAVSSPPPADLCH    38  50 ALPHA_Gamma           NA
#> 30  db_eEF1Ba               EAVSSPPPADLCHA    38  51 ALPHA_Gamma           NA
#> 31  db_eEF1Ba                   AVSSPPPADL    39  48 ALPHA_Gamma           NA
#> 32  db_eEF1Ba                    VSSPPPADL    40  48 ALPHA_Gamma           NA
#> 33  db_eEF1Ba                  VSSPPPADLCH    40  50 ALPHA_Gamma           NA
#> 34  db_eEF1Ba                      ALRWYNH    51  57 ALPHA_Gamma           NA
#> 35  db_eEF1Ba                       LRWYNH    52  57 ALPHA_Gamma           NA
#> 36  db_eEF1Ba             IKSYEKEKASLPGVKK    58  73 ALPHA_Gamma           NA
#> 37  db_eEF1Ba        IKSYEKEKASLPGVKKALGKY    58  78 ALPHA_Gamma           NA
#> 38  db_eEF1Ba              EKASLPGVKKALGKY    64  78 ALPHA_Gamma           NA
#> 39  db_eEF1Ba          EKASLPGVKKALGKYGPAD    64  82 ALPHA_Gamma           NA
#> 40  db_eEF1Ba        EKASLPGVKKALGKYGPADVE    64  84 ALPHA_Gamma           NA
#> 41  db_eEF1Ba            ASLPGVKKALGKYGPAD    66  82 ALPHA_Gamma           NA
#> 42  db_eEF1Ba                  ALGKYGPADVE    74  84 ALPHA_Gamma           NA
#> 43  db_eEF1Ba         VEDTTGSGATDSKDDDDIDL    83 102 ALPHA_Gamma           NA
#> 44  db_eEF1Ba           DTTGSGATDSKDDDDIDL    85 102 ALPHA_Gamma           NA
#> 45  db_eEF1Ba            TTGSGATDSKDDDDIDL    86 102 ALPHA_Gamma           NA
#> 46  db_eEF1Ba                       DDDIDL    97 102 ALPHA_Gamma           NA
#> 47  db_eEF1Ba                       LFGSDD   102 107 ALPHA_Gamma           NA
#> 48  db_eEF1Ba                        FGSDD   103 107 ALPHA_Gamma           NA
#> 49  db_eEF1Ba            FGSDDEEESEEAKRLRE   103 119 ALPHA_Gamma           NA
#> 50  db_eEF1Ba           FGSDDEEESEEAKRLREE   103 120 ALPHA_Gamma           NA
#> 51  db_eEF1Ba         FGSDDEEESEEAKRLREERL   103 122 ALPHA_Gamma           NA
#> 52  db_eEF1Ba           DEEESEEAKRLREERLAQ   107 124 ALPHA_Gamma           NA
#> 53  db_eEF1Ba            EEESEEAKRLREERLAQ   108 124 ALPHA_Gamma           NA
#> 54  db_eEF1Ba                AQYESKKAKKPAL   123 135 ALPHA_Gamma           NA
#> 55  db_eEF1Ba                  YESKKAKKPAL   125 135 ALPHA_Gamma           NA
#> 56  db_eEF1Ba                      VAKSSIL   136 142 ALPHA_Gamma           NA
#> 57  db_eEF1Ba                     VAKSSILL   136 143 ALPHA_Gamma           NA
#> 58  db_eEF1Ba                       AKSSIL   137 142 ALPHA_Gamma           NA
#> 59  db_eEF1Ba                     LDVKPWDD   143 150 ALPHA_Gamma           NA
#> 60  db_eEF1Ba                  LDVKPWDDETD   143 153 ALPHA_Gamma           NA
#> 61  db_eEF1Ba                  DVKPWDDETDM   144 154 ALPHA_Gamma           NA
#> 62  db_eEF1Ba                       MAKLEE   154 159 ALPHA_Gamma           NA
#> 63  db_eEF1Ba                        AKLEE   155 159 ALPHA_Gamma           NA
#> 64  db_eEF1Ba                      CVRSIQA   160 166 ALPHA_Gamma           NA
#> 65  db_eEF1Ba                    CVRSIQADG   160 168 ALPHA_Gamma           NA
#> 66  db_eEF1Ba                   CVRSIQADGL   160 169 ALPHA_Gamma           NA
#> 67  db_eEF1Ba            CVRSIQADGLVWGSSKL   160 176 ALPHA_Gamma           NA
#> 68  db_eEF1Ba                    VRSIQADGL   161 169 ALPHA_Gamma           NA
#> 69  db_eEF1Ba             VRSIQADGLVWGSSKL   161 176 ALPHA_Gamma           NA
#> 70  db_eEF1Ba                      SIQADGL   163 169 ALPHA_Gamma           NA
#> 71  db_eEF1Ba               SIQADGLVWGSSKL   163 176 ALPHA_Gamma           NA
#> 72  db_eEF1Ba SIQADGLVWGSSKLVPVGYGIKKLQIQC   163 190 ALPHA_Gamma           NA
#> 73  db_eEF1Ba         ADGLVWGSSKLVPVGYGIKK   166 185 ALPHA_Gamma           NA
#> 74  db_eEF1Ba                     DGLVWGSS   167 174 ALPHA_Gamma           NA
#> 75  db_eEF1Ba                   DGLVWGSSKL   167 176 ALPHA_Gamma           NA
#> 76  db_eEF1Ba              DGLVWGSSKLVPVGY   167 181 ALPHA_Gamma           NA
#> 77  db_eEF1Ba             DGLVWGSSKLVPVGYG   167 182 ALPHA_Gamma           NA
#> 78  db_eEF1Ba                LVWGSSKLVPVGY   169 181 ALPHA_Gamma           NA
#> 79  db_eEF1Ba             KLVPVGYGIKKLQIQC   175 190 ALPHA_Gamma           NA
#> 80  db_eEF1Ba               VPVGYGIKKLQIQC   177 190 ALPHA_Gamma           NA
#> 81  db_eEF1Ba                       KLQIQC   185 190 ALPHA_Gamma           NA
#> 82  db_eEF1Ba                 CVVEDDKVGTDM   190 201 ALPHA_Gamma           NA
#> 83  db_eEF1Ba                CVVEDDKVGTDML   190 202 ALPHA_Gamma           NA
#> 84  db_eEF1Ba                  VVEDDKVGTDM   191 201 ALPHA_Gamma           NA
#> 85  db_eEF1Ba                 VVEDDKVGTDML   191 202 ALPHA_Gamma           NA
#> 86  db_eEF1Ba                VVEDDKVGTDMLE   191 203 ALPHA_Gamma           NA
#> 87  db_eEF1Ba                     DDKVGTDM   194 201 ALPHA_Gamma           NA
#> 88  db_eEF1Ba                    DDKVGTDML   194 202 ALPHA_Gamma           NA
#> 89  db_eEF1Ba                      DKVGTDM   195 201 ALPHA_Gamma           NA
#> 90  db_eEF1Ba                     DKVGTDML   195 202 ALPHA_Gamma           NA
#> 91  db_eEF1Ba                       VGTDML   197 202 ALPHA_Gamma           NA
#> 92  db_eEF1Ba                       LEEQIT   202 207 ALPHA_Gamma           NA
#> 93  db_eEF1Ba                      LEEQITA   202 208 ALPHA_Gamma           NA
#> 94  db_eEF1Ba                     LEEQITAF   202 209 ALPHA_Gamma           NA
#> 95  db_eEF1Ba                       EEQITA   203 208 ALPHA_Gamma           NA
#> 96  db_eEF1Ba                      EEQITAF   203 209 ALPHA_Gamma           NA
#> 97  db_eEF1Ba                     EEQITAFE   203 210 ALPHA_Gamma           NA
#> 98  db_eEF1Ba                       EQITAF   204 209 ALPHA_Gamma           NA
#> 99  db_eEF1Ba                        QITAF   205 209 ALPHA_Gamma           NA
#> 100 db_eEF1Ba                     FEDYVQSM   209 216 ALPHA_Gamma           NA
#> 101 db_eEF1Ba                      EDYVQSM   210 216 ALPHA_Gamma           NA
#> 102 db_eEF1Ba                     EDYVQSMD   210 217 ALPHA_Gamma           NA
#> 103 db_eEF1Ba                    EDYVQSMDV   210 218 ALPHA_Gamma           NA
#> 104 db_eEF1Ba                       DYVQSM   211 216 ALPHA_Gamma           NA
#> 105 db_eEF1Ba                       YVQSMD   212 217 ALPHA_Gamma           NA
#> 106 db_eEF1Ba                        DVAAF   217 221 ALPHA_Gamma           NA
#>        AUC
#> 1   0.9974
#> 2   0.9993
#> 3   1.0119
#> 4   0.9991
#> 5   0.9991
#> 6   0.8588
#> 7   0.4479
#> 8   0.6117
#> 9   0.6285
#> 10  0.5833
#> 11  0.7956
#> 12  0.7956
#> 13  0.7176
#> 14  0.7478
#> 15  0.7547
#> 16  0.7239
#> 17  0.7547
#> 18  0.8058
#> 19  0.9989
#> 20  0.7791
#> 21  0.7790
#> 22  0.7238
#> 23  0.4479
#> 24  0.8618
#> 25  0.7790
#> 26  0.8155
#> 27  0.7618
#> 28  0.8618
#> 29  0.8156
#> 30  0.8141
#> 31  0.8618
#> 32  0.8159
#> 33  0.8618
#> 34  0.4479
#> 35  0.4479
#> 36  0.9987
#> 37  0.9999
#> 38  0.9999
#> 39  0.9999
#> 40  0.9999
#> 41  0.9999
#> 42  0.9999
#> 43  0.9999
#> 44  0.9999
#> 45  1.0073
#> 46  0.9999
#> 47  0.9999
#> 48  0.9999
#> 49  0.9999
#> 50  0.9999
#> 51  0.9589
#> 52  1.0041
#> 53  0.9999
#> 54  0.9999
#> 55  0.9999
#> 56  0.9964
#> 57  0.9821
#> 58  0.9964
#> 59  0.9762
#> 60  0.8769
#> 61  0.9846
#> 62  0.9756
#> 63  0.7922
#> 64  0.9821
#> 65  0.9974
#> 66  0.9877
#> 67  0.9905
#> 68  0.9974
#> 69  0.9915
#> 70  0.9846
#> 71  0.9907
#> 72  0.9599
#> 73  0.9927
#> 74  0.9842
#> 75  0.9994
#> 76  0.9905
#> 77  0.9915
#> 78  0.9966
#> 79  0.9853
#> 80  0.9895
#> 81  0.9791
#> 82  0.9894
#> 83  0.9880
#> 84  0.9974
#> 85  0.9974
#> 86  0.9891
#> 87  0.9993
#> 88  0.9873
#> 89  1.1803
#> 90  0.9972
#> 91  0.9965
#> 92  0.9756
#> 93  0.9791
#> 94  0.9828
#> 95  0.9756
#> 96  0.9791
#> 97  0.9832
#> 98  0.9756
#> 99  0.9938
#> 100 0.9817
#> 101 0.8588
#> 102 0.9816
#> 103 0.9852
#> 104 0.9761
#> 105 0.9957
#> 106 0.9947

# back-exchange
bex_dat <- calculate_back_exchange(alpha_dat)
show_coverage_heatmap_data(bex_dat, value = "back_exchange")
#>       Protein Start End            State                     Sequence
#> 1   db_eEF1Ba     1  11      ALPHA_Gamma                  GFGDLKSPAGL
#> 2   db_eEF1Ba     2  11      ALPHA_Gamma                   FGDLKSPAGL
#> 3   db_eEF1Ba     3  11      ALPHA_Gamma                    GDLKSPAGL
#> 4   db_eEF1Ba     5  10      ALPHA_Gamma                       LKSPAG
#> 5   db_eEF1Ba     5  11      ALPHA_Gamma                      LKSPAGL
#> 6   db_eEF1Ba     9  14      ALPHA_Gamma                       AGLQVL
#> 7   db_eEF1Ba    12  16      ALPHA_Gamma                        QVLND
#> 8   db_eEF1Ba    12  17      ALPHA_Gamma                       QVLNDY
#> 9   db_eEF1Ba    15  20      ALPHA_Gamma                       NDYLAD
#> 10  db_eEF1Ba    15  21      ALPHA_Gamma                      NDYLADK
#> 11  db_eEF1Ba    17  22      ALPHA_Gamma                       YLADKS
#> 12  db_eEF1Ba    17  23      ALPHA_Gamma                      YLADKSY
#> 13  db_eEF1Ba    17  33      ALPHA_Gamma            YLADKSYIEGYVPSQAD
#> 14  db_eEF1Ba    19  33      ALPHA_Gamma              ADKSYIEGYVPSQAD
#> 15  db_eEF1Ba    21  33      ALPHA_Gamma                KSYIEGYVPSQAD
#> 16  db_eEF1Ba    22  26      ALPHA_Gamma                        SYIEG
#> 17  db_eEF1Ba    22  33      ALPHA_Gamma                 SYIEGYVPSQAD
#> 18  db_eEF1Ba    23  33      ALPHA_Gamma                  YIEGYVPSQAD
#> 19  db_eEF1Ba    24  29      ALPHA_Gamma                       IEGYVP
#> 20  db_eEF1Ba    24  32      ALPHA_Gamma                    IEGYVPSQA
#> 21  db_eEF1Ba    24  33      ALPHA_Gamma                   IEGYVPSQAD
#> 22  db_eEF1Ba    27  33      ALPHA_Gamma                      YVPSQAD
#> 23  db_eEF1Ba    34  38      ALPHA_Gamma                        VAVFE
#> 24  db_eEF1Ba    37  47      ALPHA_Gamma                  FEAVSSPPPAD
#> 25  db_eEF1Ba    37  48      ALPHA_Gamma                 FEAVSSPPPADL
#> 26  db_eEF1Ba    37  50      ALPHA_Gamma               FEAVSSPPPADLCH
#> 27  db_eEF1Ba    37  51      ALPHA_Gamma              FEAVSSPPPADLCHA
#> 28  db_eEF1Ba    38  48      ALPHA_Gamma                  EAVSSPPPADL
#> 29  db_eEF1Ba    38  50      ALPHA_Gamma                EAVSSPPPADLCH
#> 30  db_eEF1Ba    38  51      ALPHA_Gamma               EAVSSPPPADLCHA
#> 31  db_eEF1Ba    39  48      ALPHA_Gamma                   AVSSPPPADL
#> 32  db_eEF1Ba    40  48      ALPHA_Gamma                    VSSPPPADL
#> 33  db_eEF1Ba    40  50      ALPHA_Gamma                  VSSPPPADLCH
#> 34  db_eEF1Ba    51  57      ALPHA_Gamma                      ALRWYNH
#> 35  db_eEF1Ba    52  57      ALPHA_Gamma                       LRWYNH
#> 36  db_eEF1Ba    58  73      ALPHA_Gamma             IKSYEKEKASLPGVKK
#> 37  db_eEF1Ba    58  78      ALPHA_Gamma        IKSYEKEKASLPGVKKALGKY
#> 38  db_eEF1Ba    64  78      ALPHA_Gamma              EKASLPGVKKALGKY
#> 39  db_eEF1Ba    64  82      ALPHA_Gamma          EKASLPGVKKALGKYGPAD
#> 40  db_eEF1Ba    64  84      ALPHA_Gamma        EKASLPGVKKALGKYGPADVE
#> 41  db_eEF1Ba    66  82      ALPHA_Gamma            ASLPGVKKALGKYGPAD
#> 42  db_eEF1Ba    74  84      ALPHA_Gamma                  ALGKYGPADVE
#> 43  db_eEF1Ba    83 102      ALPHA_Gamma         VEDTTGSGATDSKDDDDIDL
#> 44  db_eEF1Ba    85 102      ALPHA_Gamma           DTTGSGATDSKDDDDIDL
#> 45  db_eEF1Ba    86 102      ALPHA_Gamma            TTGSGATDSKDDDDIDL
#> 46  db_eEF1Ba    97 102      ALPHA_Gamma                       DDDIDL
#> 47  db_eEF1Ba   102 107      ALPHA_Gamma                       LFGSDD
#> 48  db_eEF1Ba   103 107      ALPHA_Gamma                        FGSDD
#> 49  db_eEF1Ba   103 119      ALPHA_Gamma            FGSDDEEESEEAKRLRE
#> 50  db_eEF1Ba   103 120      ALPHA_Gamma           FGSDDEEESEEAKRLREE
#> 51  db_eEF1Ba   103 122      ALPHA_Gamma         FGSDDEEESEEAKRLREERL
#> 52  db_eEF1Ba   107 124      ALPHA_Gamma           DEEESEEAKRLREERLAQ
#> 53  db_eEF1Ba   108 124      ALPHA_Gamma            EEESEEAKRLREERLAQ
#> 54  db_eEF1Ba   123 135      ALPHA_Gamma                AQYESKKAKKPAL
#> 55  db_eEF1Ba   125 135      ALPHA_Gamma                  YESKKAKKPAL
#> 56  db_eEF1Ba   136 142      ALPHA_Gamma                      VAKSSIL
#> 57  db_eEF1Ba   136 143      ALPHA_Gamma                     VAKSSILL
#> 58  db_eEF1Ba   137 142      ALPHA_Gamma                       AKSSIL
#> 59  db_eEF1Ba   143 150      ALPHA_Gamma                     LDVKPWDD
#> 60  db_eEF1Ba   143 153      ALPHA_Gamma                  LDVKPWDDETD
#> 61  db_eEF1Ba   144 154      ALPHA_Gamma                  DVKPWDDETDM
#> 62  db_eEF1Ba   154 159      ALPHA_Gamma                       MAKLEE
#> 63  db_eEF1Ba   155 159      ALPHA_Gamma                        AKLEE
#> 64  db_eEF1Ba   160 166      ALPHA_Gamma                      CVRSIQA
#> 65  db_eEF1Ba   160 168      ALPHA_Gamma                    CVRSIQADG
#> 66  db_eEF1Ba   160 169      ALPHA_Gamma                   CVRSIQADGL
#> 67  db_eEF1Ba   160 176      ALPHA_Gamma            CVRSIQADGLVWGSSKL
#> 68  db_eEF1Ba   161 169      ALPHA_Gamma                    VRSIQADGL
#> 69  db_eEF1Ba   161 176      ALPHA_Gamma             VRSIQADGLVWGSSKL
#> 70  db_eEF1Ba   163 169      ALPHA_Gamma                      SIQADGL
#> 71  db_eEF1Ba   163 176      ALPHA_Gamma               SIQADGLVWGSSKL
#> 72  db_eEF1Ba   163 190      ALPHA_Gamma SIQADGLVWGSSKLVPVGYGIKKLQIQC
#> 73  db_eEF1Ba   166 185      ALPHA_Gamma         ADGLVWGSSKLVPVGYGIKK
#> 74  db_eEF1Ba   167 174      ALPHA_Gamma                     DGLVWGSS
#> 75  db_eEF1Ba   167 176      ALPHA_Gamma                   DGLVWGSSKL
#> 76  db_eEF1Ba   167 181      ALPHA_Gamma              DGLVWGSSKLVPVGY
#> 77  db_eEF1Ba   167 182      ALPHA_Gamma             DGLVWGSSKLVPVGYG
#> 78  db_eEF1Ba   169 181      ALPHA_Gamma                LVWGSSKLVPVGY
#> 79  db_eEF1Ba   175 190      ALPHA_Gamma             KLVPVGYGIKKLQIQC
#> 80  db_eEF1Ba   177 190      ALPHA_Gamma               VPVGYGIKKLQIQC
#> 81  db_eEF1Ba   185 190      ALPHA_Gamma                       KLQIQC
#> 82  db_eEF1Ba   190 201      ALPHA_Gamma                 CVVEDDKVGTDM
#> 83  db_eEF1Ba   190 202      ALPHA_Gamma                CVVEDDKVGTDML
#> 84  db_eEF1Ba   191 201      ALPHA_Gamma                  VVEDDKVGTDM
#> 85  db_eEF1Ba   191 202      ALPHA_Gamma                 VVEDDKVGTDML
#> 86  db_eEF1Ba   191 203      ALPHA_Gamma                VVEDDKVGTDMLE
#> 87  db_eEF1Ba   194 201      ALPHA_Gamma                     DDKVGTDM
#> 88  db_eEF1Ba   194 202      ALPHA_Gamma                    DDKVGTDML
#> 89  db_eEF1Ba   195 201      ALPHA_Gamma                      DKVGTDM
#> 90  db_eEF1Ba   195 202      ALPHA_Gamma                     DKVGTDML
#> 91  db_eEF1Ba   197 202      ALPHA_Gamma                       VGTDML
#> 92  db_eEF1Ba   202 207      ALPHA_Gamma                       LEEQIT
#> 93  db_eEF1Ba   202 208      ALPHA_Gamma                      LEEQITA
#> 94  db_eEF1Ba   202 209      ALPHA_Gamma                     LEEQITAF
#> 95  db_eEF1Ba   203 208      ALPHA_Gamma                       EEQITA
#> 96  db_eEF1Ba   203 209      ALPHA_Gamma                      EEQITAF
#> 97  db_eEF1Ba   203 210      ALPHA_Gamma                     EEQITAFE
#> 98  db_eEF1Ba   204 209      ALPHA_Gamma                       EQITAF
#> 99  db_eEF1Ba   205 209      ALPHA_Gamma                        QITAF
#> 100 db_eEF1Ba   209 216      ALPHA_Gamma                     FEDYVQSM
#> 101 db_eEF1Ba   210 216      ALPHA_Gamma                      EDYVQSM
#> 102 db_eEF1Ba   210 217      ALPHA_Gamma                     EDYVQSMD
#> 103 db_eEF1Ba   210 218      ALPHA_Gamma                    EDYVQSMDV
#> 104 db_eEF1Ba   211 216      ALPHA_Gamma                       DYVQSM
#> 105 db_eEF1Ba   212 217      ALPHA_Gamma                       YVQSMD
#> 106 db_eEF1Ba   217 221      ALPHA_Gamma                        DVAAF
#> 107 db_eEF1Ba     1  11 ALPHA_beta_gamma                  GFGDLKSPAGL
#> 108 db_eEF1Ba     2  11 ALPHA_beta_gamma                   FGDLKSPAGL
#> 109 db_eEF1Ba     3  11 ALPHA_beta_gamma                    GDLKSPAGL
#> 110 db_eEF1Ba     5  10 ALPHA_beta_gamma                       LKSPAG
#> 111 db_eEF1Ba     5  11 ALPHA_beta_gamma                      LKSPAGL
#> 112 db_eEF1Ba     9  14 ALPHA_beta_gamma                       AGLQVL
#> 113 db_eEF1Ba    12  16 ALPHA_beta_gamma                        QVLND
#> 114 db_eEF1Ba    12  17 ALPHA_beta_gamma                       QVLNDY
#> 115 db_eEF1Ba    15  20 ALPHA_beta_gamma                       NDYLAD
#> 116 db_eEF1Ba    15  21 ALPHA_beta_gamma                      NDYLADK
#> 117 db_eEF1Ba    17  22 ALPHA_beta_gamma                       YLADKS
#> 118 db_eEF1Ba    17  23 ALPHA_beta_gamma                      YLADKSY
#> 119 db_eEF1Ba    17  33 ALPHA_beta_gamma            YLADKSYIEGYVPSQAD
#> 120 db_eEF1Ba    19  33 ALPHA_beta_gamma              ADKSYIEGYVPSQAD
#> 121 db_eEF1Ba    21  33 ALPHA_beta_gamma                KSYIEGYVPSQAD
#> 122 db_eEF1Ba    22  26 ALPHA_beta_gamma                        SYIEG
#> 123 db_eEF1Ba    22  33 ALPHA_beta_gamma                 SYIEGYVPSQAD
#> 124 db_eEF1Ba    23  33 ALPHA_beta_gamma                  YIEGYVPSQAD
#> 125 db_eEF1Ba    24  29 ALPHA_beta_gamma                       IEGYVP
#> 126 db_eEF1Ba    24  32 ALPHA_beta_gamma                    IEGYVPSQA
#> 127 db_eEF1Ba    24  33 ALPHA_beta_gamma                   IEGYVPSQAD
#> 128 db_eEF1Ba    27  33 ALPHA_beta_gamma                      YVPSQAD
#> 129 db_eEF1Ba    34  38 ALPHA_beta_gamma                        VAVFE
#> 130 db_eEF1Ba    37  47 ALPHA_beta_gamma                  FEAVSSPPPAD
#> 131 db_eEF1Ba    37  48 ALPHA_beta_gamma                 FEAVSSPPPADL
#> 132 db_eEF1Ba    37  50 ALPHA_beta_gamma               FEAVSSPPPADLCH
#> 133 db_eEF1Ba    37  51 ALPHA_beta_gamma              FEAVSSPPPADLCHA
#> 134 db_eEF1Ba    38  48 ALPHA_beta_gamma                  EAVSSPPPADL
#> 135 db_eEF1Ba    38  50 ALPHA_beta_gamma                EAVSSPPPADLCH
#> 136 db_eEF1Ba    38  51 ALPHA_beta_gamma               EAVSSPPPADLCHA
#> 137 db_eEF1Ba    39  48 ALPHA_beta_gamma                   AVSSPPPADL
#> 138 db_eEF1Ba    40  48 ALPHA_beta_gamma                    VSSPPPADL
#> 139 db_eEF1Ba    40  50 ALPHA_beta_gamma                  VSSPPPADLCH
#> 140 db_eEF1Ba    51  57 ALPHA_beta_gamma                      ALRWYNH
#> 141 db_eEF1Ba    52  57 ALPHA_beta_gamma                       LRWYNH
#> 142 db_eEF1Ba    58  73 ALPHA_beta_gamma             IKSYEKEKASLPGVKK
#> 143 db_eEF1Ba    58  78 ALPHA_beta_gamma        IKSYEKEKASLPGVKKALGKY
#> 144 db_eEF1Ba    64  78 ALPHA_beta_gamma              EKASLPGVKKALGKY
#> 145 db_eEF1Ba    64  82 ALPHA_beta_gamma          EKASLPGVKKALGKYGPAD
#> 146 db_eEF1Ba    64  84 ALPHA_beta_gamma        EKASLPGVKKALGKYGPADVE
#> 147 db_eEF1Ba    66  82 ALPHA_beta_gamma            ASLPGVKKALGKYGPAD
#> 148 db_eEF1Ba    74  84 ALPHA_beta_gamma                  ALGKYGPADVE
#> 149 db_eEF1Ba    83 102 ALPHA_beta_gamma         VEDTTGSGATDSKDDDDIDL
#> 150 db_eEF1Ba    85 102 ALPHA_beta_gamma           DTTGSGATDSKDDDDIDL
#> 151 db_eEF1Ba    86 102 ALPHA_beta_gamma            TTGSGATDSKDDDDIDL
#> 152 db_eEF1Ba    97 102 ALPHA_beta_gamma                       DDDIDL
#> 153 db_eEF1Ba   102 107 ALPHA_beta_gamma                       LFGSDD
#> 154 db_eEF1Ba   103 107 ALPHA_beta_gamma                        FGSDD
#> 155 db_eEF1Ba   103 119 ALPHA_beta_gamma            FGSDDEEESEEAKRLRE
#> 156 db_eEF1Ba   103 120 ALPHA_beta_gamma           FGSDDEEESEEAKRLREE
#> 157 db_eEF1Ba   103 122 ALPHA_beta_gamma         FGSDDEEESEEAKRLREERL
#> 158 db_eEF1Ba   107 124 ALPHA_beta_gamma           DEEESEEAKRLREERLAQ
#> 159 db_eEF1Ba   108 124 ALPHA_beta_gamma            EEESEEAKRLREERLAQ
#> 160 db_eEF1Ba   123 135 ALPHA_beta_gamma                AQYESKKAKKPAL
#> 161 db_eEF1Ba   125 135 ALPHA_beta_gamma                  YESKKAKKPAL
#> 162 db_eEF1Ba   136 142 ALPHA_beta_gamma                      VAKSSIL
#> 163 db_eEF1Ba   136 143 ALPHA_beta_gamma                     VAKSSILL
#> 164 db_eEF1Ba   137 142 ALPHA_beta_gamma                       AKSSIL
#> 165 db_eEF1Ba   143 150 ALPHA_beta_gamma                     LDVKPWDD
#> 166 db_eEF1Ba   143 153 ALPHA_beta_gamma                  LDVKPWDDETD
#> 167 db_eEF1Ba   144 154 ALPHA_beta_gamma                  DVKPWDDETDM
#> 168 db_eEF1Ba   154 159 ALPHA_beta_gamma                       MAKLEE
#> 169 db_eEF1Ba   155 159 ALPHA_beta_gamma                        AKLEE
#> 170 db_eEF1Ba   160 166 ALPHA_beta_gamma                      CVRSIQA
#> 171 db_eEF1Ba   160 168 ALPHA_beta_gamma                    CVRSIQADG
#> 172 db_eEF1Ba   160 169 ALPHA_beta_gamma                   CVRSIQADGL
#> 173 db_eEF1Ba   160 176 ALPHA_beta_gamma            CVRSIQADGLVWGSSKL
#> 174 db_eEF1Ba   161 169 ALPHA_beta_gamma                    VRSIQADGL
#> 175 db_eEF1Ba   161 176 ALPHA_beta_gamma             VRSIQADGLVWGSSKL
#> 176 db_eEF1Ba   163 169 ALPHA_beta_gamma                      SIQADGL
#> 177 db_eEF1Ba   163 176 ALPHA_beta_gamma               SIQADGLVWGSSKL
#> 178 db_eEF1Ba   163 190 ALPHA_beta_gamma SIQADGLVWGSSKLVPVGYGIKKLQIQC
#> 179 db_eEF1Ba   166 185 ALPHA_beta_gamma         ADGLVWGSSKLVPVGYGIKK
#> 180 db_eEF1Ba   167 174 ALPHA_beta_gamma                     DGLVWGSS
#> 181 db_eEF1Ba   167 176 ALPHA_beta_gamma                   DGLVWGSSKL
#> 182 db_eEF1Ba   167 181 ALPHA_beta_gamma              DGLVWGSSKLVPVGY
#> 183 db_eEF1Ba   167 182 ALPHA_beta_gamma             DGLVWGSSKLVPVGYG
#> 184 db_eEF1Ba   169 181 ALPHA_beta_gamma                LVWGSSKLVPVGY
#> 185 db_eEF1Ba   175 190 ALPHA_beta_gamma             KLVPVGYGIKKLQIQC
#> 186 db_eEF1Ba   177 190 ALPHA_beta_gamma               VPVGYGIKKLQIQC
#> 187 db_eEF1Ba   185 190 ALPHA_beta_gamma                       KLQIQC
#> 188 db_eEF1Ba   190 201 ALPHA_beta_gamma                 CVVEDDKVGTDM
#> 189 db_eEF1Ba   190 202 ALPHA_beta_gamma                CVVEDDKVGTDML
#> 190 db_eEF1Ba   191 201 ALPHA_beta_gamma                  VVEDDKVGTDM
#> 191 db_eEF1Ba   191 202 ALPHA_beta_gamma                 VVEDDKVGTDML
#> 192 db_eEF1Ba   191 203 ALPHA_beta_gamma                VVEDDKVGTDMLE
#> 193 db_eEF1Ba   194 201 ALPHA_beta_gamma                     DDKVGTDM
#> 194 db_eEF1Ba   194 202 ALPHA_beta_gamma                    DDKVGTDML
#> 195 db_eEF1Ba   195 201 ALPHA_beta_gamma                      DKVGTDM
#> 196 db_eEF1Ba   195 202 ALPHA_beta_gamma                     DKVGTDML
#> 197 db_eEF1Ba   197 202 ALPHA_beta_gamma                       VGTDML
#> 198 db_eEF1Ba   202 207 ALPHA_beta_gamma                       LEEQIT
#> 199 db_eEF1Ba   202 208 ALPHA_beta_gamma                      LEEQITA
#> 200 db_eEF1Ba   202 209 ALPHA_beta_gamma                     LEEQITAF
#> 201 db_eEF1Ba   203 208 ALPHA_beta_gamma                       EEQITA
#> 202 db_eEF1Ba   203 209 ALPHA_beta_gamma                      EEQITAF
#> 203 db_eEF1Ba   203 210 ALPHA_beta_gamma                     EEQITAFE
#> 204 db_eEF1Ba   204 209 ALPHA_beta_gamma                       EQITAF
#> 205 db_eEF1Ba   205 209 ALPHA_beta_gamma                        QITAF
#> 206 db_eEF1Ba   209 216 ALPHA_beta_gamma                     FEDYVQSM
#> 207 db_eEF1Ba   210 216 ALPHA_beta_gamma                      EDYVQSM
#> 208 db_eEF1Ba   210 217 ALPHA_beta_gamma                     EDYVQSMD
#> 209 db_eEF1Ba   210 218 ALPHA_beta_gamma                    EDYVQSMDV
#> 210 db_eEF1Ba   211 216 ALPHA_beta_gamma                       DYVQSM
#> 211 db_eEF1Ba   212 217 ALPHA_beta_gamma                       YVQSMD
#> 212 db_eEF1Ba   217 221 ALPHA_beta_gamma                        DVAAF
#> 213 db_eEF1Ba     1  11       Alpha_KSCN                  GFGDLKSPAGL
#> 214 db_eEF1Ba     2  11       Alpha_KSCN                   FGDLKSPAGL
#> 215 db_eEF1Ba     3  11       Alpha_KSCN                    GDLKSPAGL
#> 216 db_eEF1Ba     5  10       Alpha_KSCN                       LKSPAG
#> 217 db_eEF1Ba     5  11       Alpha_KSCN                      LKSPAGL
#> 218 db_eEF1Ba     9  14       Alpha_KSCN                       AGLQVL
#> 219 db_eEF1Ba    12  16       Alpha_KSCN                        QVLND
#> 220 db_eEF1Ba    12  17       Alpha_KSCN                       QVLNDY
#> 221 db_eEF1Ba    15  20       Alpha_KSCN                       NDYLAD
#> 222 db_eEF1Ba    15  21       Alpha_KSCN                      NDYLADK
#> 223 db_eEF1Ba    17  22       Alpha_KSCN                       YLADKS
#> 224 db_eEF1Ba    17  23       Alpha_KSCN                      YLADKSY
#> 225 db_eEF1Ba    17  33       Alpha_KSCN            YLADKSYIEGYVPSQAD
#> 226 db_eEF1Ba    19  33       Alpha_KSCN              ADKSYIEGYVPSQAD
#> 227 db_eEF1Ba    21  33       Alpha_KSCN                KSYIEGYVPSQAD
#> 228 db_eEF1Ba    22  26       Alpha_KSCN                        SYIEG
#> 229 db_eEF1Ba    22  33       Alpha_KSCN                 SYIEGYVPSQAD
#> 230 db_eEF1Ba    23  33       Alpha_KSCN                  YIEGYVPSQAD
#> 231 db_eEF1Ba    24  29       Alpha_KSCN                       IEGYVP
#> 232 db_eEF1Ba    24  32       Alpha_KSCN                    IEGYVPSQA
#> 233 db_eEF1Ba    24  33       Alpha_KSCN                   IEGYVPSQAD
#> 234 db_eEF1Ba    27  33       Alpha_KSCN                      YVPSQAD
#> 235 db_eEF1Ba    34  38       Alpha_KSCN                        VAVFE
#> 236 db_eEF1Ba    37  47       Alpha_KSCN                  FEAVSSPPPAD
#> 237 db_eEF1Ba    37  48       Alpha_KSCN                 FEAVSSPPPADL
#> 238 db_eEF1Ba    37  50       Alpha_KSCN               FEAVSSPPPADLCH
#> 239 db_eEF1Ba    37  51       Alpha_KSCN              FEAVSSPPPADLCHA
#> 240 db_eEF1Ba    38  48       Alpha_KSCN                  EAVSSPPPADL
#> 241 db_eEF1Ba    38  50       Alpha_KSCN                EAVSSPPPADLCH
#> 242 db_eEF1Ba    38  51       Alpha_KSCN               EAVSSPPPADLCHA
#> 243 db_eEF1Ba    39  48       Alpha_KSCN                   AVSSPPPADL
#> 244 db_eEF1Ba    40  48       Alpha_KSCN                    VSSPPPADL
#> 245 db_eEF1Ba    40  50       Alpha_KSCN                  VSSPPPADLCH
#> 246 db_eEF1Ba    51  57       Alpha_KSCN                      ALRWYNH
#> 247 db_eEF1Ba    52  57       Alpha_KSCN                       LRWYNH
#> 248 db_eEF1Ba    58  73       Alpha_KSCN             IKSYEKEKASLPGVKK
#> 249 db_eEF1Ba    58  78       Alpha_KSCN        IKSYEKEKASLPGVKKALGKY
#> 250 db_eEF1Ba    64  78       Alpha_KSCN              EKASLPGVKKALGKY
#> 251 db_eEF1Ba    64  82       Alpha_KSCN          EKASLPGVKKALGKYGPAD
#> 252 db_eEF1Ba    64  84       Alpha_KSCN        EKASLPGVKKALGKYGPADVE
#> 253 db_eEF1Ba    66  82       Alpha_KSCN            ASLPGVKKALGKYGPAD
#> 254 db_eEF1Ba    74  84       Alpha_KSCN                  ALGKYGPADVE
#> 255 db_eEF1Ba    83 102       Alpha_KSCN         VEDTTGSGATDSKDDDDIDL
#> 256 db_eEF1Ba    85 102       Alpha_KSCN           DTTGSGATDSKDDDDIDL
#> 257 db_eEF1Ba    86 102       Alpha_KSCN            TTGSGATDSKDDDDIDL
#> 258 db_eEF1Ba    97 102       Alpha_KSCN                       DDDIDL
#> 259 db_eEF1Ba   102 107       Alpha_KSCN                       LFGSDD
#> 260 db_eEF1Ba   103 107       Alpha_KSCN                        FGSDD
#> 261 db_eEF1Ba   103 119       Alpha_KSCN            FGSDDEEESEEAKRLRE
#> 262 db_eEF1Ba   103 120       Alpha_KSCN           FGSDDEEESEEAKRLREE
#> 263 db_eEF1Ba   103 122       Alpha_KSCN         FGSDDEEESEEAKRLREERL
#> 264 db_eEF1Ba   107 124       Alpha_KSCN           DEEESEEAKRLREERLAQ
#> 265 db_eEF1Ba   108 124       Alpha_KSCN            EEESEEAKRLREERLAQ
#> 266 db_eEF1Ba   123 135       Alpha_KSCN                AQYESKKAKKPAL
#> 267 db_eEF1Ba   125 135       Alpha_KSCN                  YESKKAKKPAL
#> 268 db_eEF1Ba   136 142       Alpha_KSCN                      VAKSSIL
#> 269 db_eEF1Ba   136 143       Alpha_KSCN                     VAKSSILL
#> 270 db_eEF1Ba   137 142       Alpha_KSCN                       AKSSIL
#> 271 db_eEF1Ba   143 150       Alpha_KSCN                     LDVKPWDD
#> 272 db_eEF1Ba   143 153       Alpha_KSCN                  LDVKPWDDETD
#> 273 db_eEF1Ba   144 154       Alpha_KSCN                  DVKPWDDETDM
#> 274 db_eEF1Ba   154 159       Alpha_KSCN                       MAKLEE
#> 275 db_eEF1Ba   155 159       Alpha_KSCN                        AKLEE
#> 276 db_eEF1Ba   160 166       Alpha_KSCN                      CVRSIQA
#> 277 db_eEF1Ba   160 168       Alpha_KSCN                    CVRSIQADG
#> 278 db_eEF1Ba   160 169       Alpha_KSCN                   CVRSIQADGL
#> 279 db_eEF1Ba   160 176       Alpha_KSCN            CVRSIQADGLVWGSSKL
#> 280 db_eEF1Ba   161 169       Alpha_KSCN                    VRSIQADGL
#> 281 db_eEF1Ba   161 176       Alpha_KSCN             VRSIQADGLVWGSSKL
#> 282 db_eEF1Ba   163 169       Alpha_KSCN                      SIQADGL
#> 283 db_eEF1Ba   163 176       Alpha_KSCN               SIQADGLVWGSSKL
#> 284 db_eEF1Ba   163 190       Alpha_KSCN SIQADGLVWGSSKLVPVGYGIKKLQIQC
#> 285 db_eEF1Ba   166 185       Alpha_KSCN         ADGLVWGSSKLVPVGYGIKK
#> 286 db_eEF1Ba   167 174       Alpha_KSCN                     DGLVWGSS
#> 287 db_eEF1Ba   167 176       Alpha_KSCN                   DGLVWGSSKL
#> 288 db_eEF1Ba   167 181       Alpha_KSCN              DGLVWGSSKLVPVGY
#> 289 db_eEF1Ba   167 182       Alpha_KSCN             DGLVWGSSKLVPVGYG
#> 290 db_eEF1Ba   169 181       Alpha_KSCN                LVWGSSKLVPVGY
#> 291 db_eEF1Ba   175 190       Alpha_KSCN             KLVPVGYGIKKLQIQC
#> 292 db_eEF1Ba   177 190       Alpha_KSCN               VPVGYGIKKLQIQC
#> 293 db_eEF1Ba   185 190       Alpha_KSCN                       KLQIQC
#> 294 db_eEF1Ba   190 201       Alpha_KSCN                 CVVEDDKVGTDM
#> 295 db_eEF1Ba   190 202       Alpha_KSCN                CVVEDDKVGTDML
#> 296 db_eEF1Ba   191 201       Alpha_KSCN                  VVEDDKVGTDM
#> 297 db_eEF1Ba   191 202       Alpha_KSCN                 VVEDDKVGTDML
#> 298 db_eEF1Ba   191 203       Alpha_KSCN                VVEDDKVGTDMLE
#> 299 db_eEF1Ba   194 201       Alpha_KSCN                     DDKVGTDM
#> 300 db_eEF1Ba   194 202       Alpha_KSCN                    DDKVGTDML
#> 301 db_eEF1Ba   195 201       Alpha_KSCN                      DKVGTDM
#> 302 db_eEF1Ba   195 202       Alpha_KSCN                     DKVGTDML
#> 303 db_eEF1Ba   197 202       Alpha_KSCN                       VGTDML
#> 304 db_eEF1Ba   202 207       Alpha_KSCN                       LEEQIT
#> 305 db_eEF1Ba   202 208       Alpha_KSCN                      LEEQITA
#> 306 db_eEF1Ba   202 209       Alpha_KSCN                     LEEQITAF
#> 307 db_eEF1Ba   203 208       Alpha_KSCN                       EEQITA
#> 308 db_eEF1Ba   203 209       Alpha_KSCN                      EEQITAF
#> 309 db_eEF1Ba   203 210       Alpha_KSCN                     EEQITAFE
#> 310 db_eEF1Ba   204 209       Alpha_KSCN                       EQITAF
#> 311 db_eEF1Ba   205 209       Alpha_KSCN                        QITAF
#> 312 db_eEF1Ba   209 216       Alpha_KSCN                     FEDYVQSM
#> 313 db_eEF1Ba   210 216       Alpha_KSCN                      EDYVQSM
#> 314 db_eEF1Ba   210 217       Alpha_KSCN                     EDYVQSMD
#> 315 db_eEF1Ba   210 218       Alpha_KSCN                    EDYVQSMDV
#> 316 db_eEF1Ba   211 216       Alpha_KSCN                       DYVQSM
#> 317 db_eEF1Ba   212 217       Alpha_KSCN                       YVQSMD
#> 318 db_eEF1Ba   217 221       Alpha_KSCN                        DVAAF
#>     Modification Back Exchange U(Back Exchange)
#> 1             NA       36.4861           0.4655
#> 2             NA       40.9922           0.3693
#> 3             NA       34.8275           0.4206
#> 4             NA       41.2116           0.1296
#> 5             NA       40.8919           0.0632
#> 6             NA       37.0624           0.9176
#> 7             NA       54.5413           0.8787
#> 8             NA       46.3509           0.8778
#> 9             NA       50.5526           1.0708
#> 10            NA       39.5726           0.7446
#> 11            NA       46.2092           0.2797
#> 12            NA       41.3753           0.2330
#> 13            NA       26.7940           0.1101
#> 14            NA       25.5058           0.3086
#> 15            NA       25.5193           0.1945
#> 16            NA       53.8849           0.6817
#> 17            NA       25.6103           0.2567
#> 18            NA       29.1670           0.2753
#> 19            NA       51.4743           0.4081
#> 20            NA       34.4888           0.4827
#> 21            NA       31.5210           0.5974
#> 22            NA       29.8030           0.4831
#> 23            NA       41.4388           0.6192
#> 24            NA       38.0642           2.9399
#> 25            NA       31.7031           0.1732
#> 26            NA       30.6610           0.3333
#> 27            NA       33.2221           0.3682
#> 28            NA       32.2251           0.2387
#> 29            NA       26.9059           0.7751
#> 30            NA       32.1377           0.7325
#> 31            NA       34.4780           1.1608
#> 32            NA       42.0861           1.3007
#> 33            NA       31.4615           0.7181
#> 34            NA       39.9992           0.4335
#> 35            NA       52.2586           0.6106
#> 36            NA       27.0786           0.1558
#> 37            NA       24.4167           0.3433
#> 38            NA       20.7986           0.4848
#> 39            NA       20.2550           0.6968
#> 40            NA       19.1513           0.2581
#> 41            NA       21.0033           0.1207
#> 42            NA       31.0251           0.2186
#> 43            NA       43.9883           0.4634
#> 44            NA       45.0344           0.5173
#> 45            NA       45.4443           0.4733
#> 46            NA       65.0974           0.5980
#> 47            NA       64.5473           0.5825
#> 48            NA       66.7343           0.9430
#> 49            NA       32.0433           0.0662
#> 50            NA       31.3581           0.0771
#> 51            NA       28.9969           0.1328
#> 52            NA       16.8651           0.9562
#> 53            NA       18.7566           0.2053
#> 54            NA       29.9975           0.1496
#> 55            NA       34.8816           0.5012
#> 56            NA       39.3367           0.5512
#> 57            NA       37.3280           0.2265
#> 58            NA       38.4567           0.8917
#> 59            NA       47.0364           0.6255
#> 60            NA       43.2291           0.5151
#> 61            NA       44.1019           0.1892
#> 62            NA       39.8730           0.6829
#> 63            NA       47.8659           0.2726
#> 64            NA       33.9471           0.4415
#> 65            NA       30.4954           0.6171
#> 66            NA       31.0462           0.6598
#> 67            NA       28.1317           0.3403
#> 68            NA       36.4332           0.4436
#> 69            NA       30.2901           0.6898
#> 70            NA       44.0390           0.3108
#> 71            NA       30.8809           0.6384
#> 72            NA       20.4229           0.2136
#> 73            NA       24.4382           1.1966
#> 74            NA       44.0198           0.4047
#> 75            NA       36.7373           0.4069
#> 76            NA       28.4743           0.6565
#> 77            NA       26.6308           0.5157
#> 78            NA       29.5424           0.2539
#> 79            NA       18.0009           0.2861
#> 80            NA       12.2096           0.3563
#> 81            NA       35.7168           0.4430
#> 82            NA       38.4239           0.2136
#> 83            NA       38.4115           0.2744
#> 84            NA       42.3270           0.0568
#> 85            NA       41.1723           0.2623
#> 86            NA       39.4477           0.5798
#> 87            NA       42.6226           0.6310
#> 88            NA       38.8885           0.2259
#> 89            NA       44.8278           0.0261
#> 90            NA       39.8822           0.0803
#> 91            NA       46.2820           0.3240
#> 92            NA       42.0999           0.3633
#> 93            NA       35.3827           0.1893
#> 94            NA       34.2668           0.2742
#> 95            NA       42.9946           0.3480
#> 96            NA       38.8040           0.4344
#> 97            NA       34.4258           0.1294
#> 98            NA       42.5975           0.1747
#> 99            NA       50.6013           0.2227
#> 100           NA       40.0627           0.0992
#> 101           NA       41.3810           0.3836
#> 102           NA       38.2956           0.1852
#> 103           NA       35.8450           0.1398
#> 104           NA       43.3577           0.2247
#> 105           NA       46.4065           1.3154
#> 106           NA       58.4776           0.1457
#> 107           NA       36.7937           0.4900
#> 108           NA       40.9922           0.3693
#> 109           NA       34.8275           0.4206
#> 110           NA       41.2116           0.1296
#> 111           NA       40.8919           0.0632
#> 112           NA       37.0624           0.9176
#> 113           NA       54.5413           0.8787
#> 114           NA       46.3509           0.8778
#> 115           NA       50.5526           1.0708
#> 116           NA       39.5726           0.7446
#> 117           NA       46.2092           0.2797
#> 118           NA       41.3753           0.2330
#> 119           NA       26.7940           0.1101
#> 120           NA       25.5058           0.3086
#> 121           NA       25.5193           0.1945
#> 122           NA       53.8849           0.6817
#> 123           NA       25.6103           0.2567
#> 124           NA       29.1670           0.2753
#> 125           NA       51.4743           0.4081
#> 126           NA       34.4888           0.4827
#> 127           NA       31.2918           0.4219
#> 128           NA       29.8030           0.4831
#> 129           NA       41.4388           0.6192
#> 130           NA       36.9275           1.8919
#> 131           NA       31.7031           0.1732
#> 132           NA       30.6610           0.3333
#> 133           NA       33.2221           0.3682
#> 134           NA       32.2251           0.2387
#> 135           NA       26.9059           0.7751
#> 136           NA       32.1377           0.7325
#> 137           NA       34.4780           1.1608
#> 138           NA       42.0861           1.3007
#> 139           NA       31.4615           0.7181
#> 140           NA       39.9992           0.4335
#> 141           NA       52.2586           0.6106
#> 142           NA       26.7927           0.1309
#> 143           NA       24.9232           0.1590
#> 144           NA       21.0400           0.5252
#> 145           NA       20.1607           0.7095
#> 146           NA       19.3112           0.1754
#> 147           NA       20.7101           0.0815
#> 148           NA       31.0591           0.2760
#> 149           NA       43.9883           0.4634
#> 150           NA       45.0878           0.4803
#> 151           NA       45.4443           0.4733
#> 152           NA       65.0974           0.5980
#> 153           NA       64.5473           0.5825
#> 154           NA       66.7343           0.9430
#> 155           NA       32.4607           0.3312
#> 156           NA       31.3671           0.0912
#> 157           NA       28.9969           0.1328
#> 158           NA       16.2927           0.1863
#> 159           NA       18.7717           0.2322
#> 160           NA       29.9975           0.1496
#> 161           NA       34.9901           0.6073
#> 162           NA       39.3367           0.5512
#> 163           NA       37.3280           0.2265
#> 164           NA       38.4567           0.8917
#> 165           NA       47.0551           0.7330
#> 166           NA       43.2421           0.5213
#> 167           NA       44.1019           0.1892
#> 168           NA       39.8730           0.6829
#> 169           NA       47.8659           0.2726
#> 170           NA       33.9317           0.4670
#> 171           NA       30.4954           0.6171
#> 172           NA       31.0462           0.6598
#> 173           NA       28.1317           0.3403
#> 174           NA       36.4332           0.4436
#> 175           NA       30.2901           0.6898
#> 176           NA       44.0390           0.3108
#> 177           NA       30.8809           0.6384
#> 178           NA       20.4275           0.2957
#> 179           NA       23.8361           0.4965
#> 180           NA       44.0198           0.4047
#> 181           NA       36.6482           0.4649
#> 182           NA       28.4743           0.6565
#> 183           NA       26.6308           0.5157
#> 184           NA       29.5424           0.2539
#> 185           NA       17.6742           0.3394
#> 186           NA       12.2096           0.3563
#> 187           NA       35.7168           0.4430
#> 188           NA       38.3979           0.2497
#> 189           NA       38.4115           0.2744
#> 190           NA       42.3270           0.0568
#> 191           NA       41.1723           0.2623
#> 192           NA       39.4477           0.5798
#> 193           NA       42.6226           0.6310
#> 194           NA       38.8885           0.2259
#> 195           NA       44.8192           0.3182
#> 196           NA       39.8822           0.0803
#> 197           NA       46.2820           0.3240
#> 198           NA       42.0999           0.3633
#> 199           NA       35.3827           0.1893
#> 200           NA       34.2668           0.2742
#> 201           NA       42.9946           0.3480
#> 202           NA       38.6098           0.4503
#> 203           NA       34.4258           0.1294
#> 204           NA       42.5975           0.1747
#> 205           NA       50.6013           0.2227
#> 206           NA       40.0627           0.0992
#> 207           NA       41.2375           0.4133
#> 208           NA       38.2956           0.1852
#> 209           NA       35.8450           0.1398
#> 210           NA       43.3577           0.2247
#> 211           NA       46.4065           1.3154
#> 212           NA       58.4776           0.1457
#> 213           NA       36.4861           0.4655
#> 214           NA       40.9922           0.3693
#> 215           NA       34.8275           0.4206
#> 216           NA       41.2116           0.1296
#> 217           NA       40.8919           0.0632
#> 218           NA       37.0624           0.9176
#> 219           NA       54.5413           0.8787
#> 220           NA       46.3509           0.8778
#> 221           NA       50.5526           1.0708
#> 222           NA       39.7247           0.7897
#> 223           NA       46.2092           0.2797
#> 224           NA       41.3753           0.2330
#> 225           NA       26.7940           0.1101
#> 226           NA       25.5727           0.3123
#> 227           NA       25.5193           0.1945
#> 228           NA       53.8849           0.6817
#> 229           NA       25.6103           0.2567
#> 230           NA       29.1670           0.2753
#> 231           NA       51.4743           0.4081
#> 232           NA       34.4888           0.4827
#> 233           NA       31.2558           0.3993
#> 234           NA       29.8030           0.4831
#> 235           NA       41.4388           0.6192
#> 236           NA       38.5624           1.7484
#> 237           NA       31.7031           0.1732
#> 238           NA       30.6610           0.3333
#> 239           NA       33.2221           0.3682
#> 240           NA       32.2251           0.2387
#> 241           NA       26.9202           0.7759
#> 242           NA       32.2061           0.7904
#> 243           NA       34.4780           1.1608
#> 244           NA       42.9554           1.1589
#> 245           NA       31.4615           0.7181
#> 246           NA       39.9992           0.4335
#> 247           NA       52.2586           0.6106
#> 248           NA       27.1259           0.1417
#> 249           NA       24.1889           0.3840
#> 250           NA       21.0866           0.4474
#> 251           NA       20.6024           1.0256
#> 252           NA       19.1533           0.2564
#> 253           NA       21.0033           0.1207
#> 254           NA       31.0591           0.2760
#> 255           NA       43.9883           0.4634
#> 256           NA       45.0878           0.4803
#> 257           NA       45.4443           0.4733
#> 258           NA       65.0974           0.5980
#> 259           NA       64.5473           0.5825
#> 260           NA       66.7343           0.9430
#> 261           NA       31.9331           0.1682
#> 262           NA       31.3844           0.1518
#> 263           NA       28.9969           0.1328
#> 264           NA       16.8651           0.9562
#> 265           NA       18.7389           0.2005
#> 266           NA       29.9975           0.1496
#> 267           NA       34.8193           0.4407
#> 268           NA       39.3367           0.5512
#> 269           NA       37.3280           0.2265
#> 270           NA       38.4567           0.8917
#> 271           NA       47.0364           0.6255
#> 272           NA       43.2834           0.3988
#> 273           NA       44.1019           0.1892
#> 274           NA       39.8730           0.6829
#> 275           NA       47.8659           0.2726
#> 276           NA       33.9471           0.4415
#> 277           NA       30.4954           0.6171
#> 278           NA       31.0462           0.6598
#> 279           NA       28.1317           0.3403
#> 280           NA       36.5020           0.3978
#> 281           NA       30.2901           0.6898
#> 282           NA       44.0390           0.3108
#> 283           NA       30.9054           0.6526
#> 284           NA       20.5056           0.1510
#> 285           NA       23.6970           0.4209
#> 286           NA       44.0198           0.4047
#> 287           NA       36.7373           0.4069
#> 288           NA       28.4743           0.6565
#> 289           NA       26.6308           0.5157
#> 290           NA       29.5424           0.2539
#> 291           NA       17.9030           0.3227
#> 292           NA       12.2096           0.3563
#> 293           NA       35.8539           0.3830
#> 294           NA       38.3979           0.2497
#> 295           NA       38.4115           0.2744
#> 296           NA       42.3270           0.0568
#> 297           NA       41.1637           0.2709
#> 298           NA       39.4477           0.5798
#> 299           NA       42.6226           0.6310
#> 300           NA       38.8885           0.2259
#> 301           NA       44.8278           0.0261
#> 302           NA       39.8822           0.0803
#> 303           NA       46.2820           0.3240
#> 304           NA       42.0999           0.3633
#> 305           NA       36.1731           1.0347
#> 306           NA       34.2668           0.2742
#> 307           NA       42.9946           0.3480
#> 308           NA       38.8040           0.4344
#> 309           NA       34.9020           0.7375
#> 310           NA       42.5975           0.1747
#> 311           NA       50.6013           0.2227
#> 312           NA       40.0627           0.0992
#> 313           NA       41.3810           0.3836
#> 314           NA       38.2956           0.1852
#> 315           NA       35.8450           0.1398
#> 316           NA       43.3577           0.2247
#> 317           NA       47.3981           0.5319
#> 318           NA       58.4776           0.1457
```
