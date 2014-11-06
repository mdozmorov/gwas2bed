`Mikhail_TP - concurrence summary.xlsx` - The matrices are at the bottom of the list. Some of these, since they are geometric distributions will tend to have very high or very low values.

The direct str - relationships in MEDLINE (a function of how much literature on it exists, unfortunately)

Obs/Exp - an enrichment measure of overlap in shared relationships. To be meaningful, it would have to be normalized (highest value is self-self)

Min MIM - same here, except as I mentioned, it will be geometric distribution

Shared rels - importantly, this matrix is asymmetric. for example, breast cancer has the most relationships of all cancer types. If you go to the breast cancer (BC) *row*, you will see lower values than if you go to the breast cancer *column*. What this means is that, of all the relationships BC has, other cancers tend to overlap with this list less (BC row values). Conversely, if you take the total relationships for any cancer, a large fraction overlap with the BC literature (BC column values). So, for example, of all the relationships carcinoid tumors have in the literature, 80% overlap with BC. But, of all the relationships BC has (which is a lot), only 3.46% overlap with carcinoid.

`iridescent.txt` - tumorportal terms lit. similarity data 

`tumorportal.txt` - tumorportal names mapping to text labels, and Jonathan's labels

`gf_descriptions.hg19.txt` - desctiption of regulatory datasets

`tumorportal_ICD9-3.txt` - Tab-delimited mapping of abbreviations to names and 3-digits ICD9 codes 

`tumorportal_ICD9-5.txt` - Tab-delimited mapping of abbreviations to names and 5-digits ICD9 codes. Some ICD9 codes are missing due to ambiguity or lack of mapping

`AllNet3/t.txt` - Co-morbidities relationship among terms that could be mapped to ICD9 codes