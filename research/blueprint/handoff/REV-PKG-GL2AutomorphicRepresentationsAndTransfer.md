# Handoff: REV-PKG-GL2AutomorphicRepresentationsAndTransfer

Agent: Codex. Session: `codex-lYzqpw`. Issue: #7929.
Date: 2026-10-10. **Complete; accepted after reader corrections.**

The package is ready for intake. The independent report and package review.json
record the verdict. This run took exactly this one issue, after no eligible
manager-priority issue was available; the claim bot confirmed the session's
claim. The package's author was a different worker/session.

## Delivered and checked

- Read both accepted packets, their library audit and dependency interfaces,
  the whole reader and Suggested.lean, and the relevant primary sources.
  Compared every accepted target's statement and hypotheses with the reader:
  55 + 57 = 112 distinct anchors. All 19 accepted definitions/constructions
  retain their API and at least three distinguishing tests. Additional targets
  supply the inherited arithmetic, geometric and analytic obligations.
- Corrected six missing page locators; Webb's statement kinds; the converse
  Theorem3.1 page (6); the nonsolvability hypothesis; the cyclotomic
  realization owner (InductionRestriction6); and two G7 owner names. Added
  Henniart83 Proposition3.2 p.30 for rank-three recognition. Removed repeated
  prose and corrected one grammatical slip. Reader size: 199979 bytes.
- Independent `lean-check` exited 0: no errors, 153 warnings, all
  declaration-uses-sorry. Suggested.lean was not changed after this check.
  Memory was checked before elaboration; no language server, Lake build,
  update or cache command was used. The native signatures and their concrete
  examples were also read semantically; elaboration does not prove targets
  whose bodies contain sorry.
- `python3 scripts/check_blueprint.py` on each accepted part: 0 errors,
  0 warnings. Structural checks: all anchors unique, all source keys resolve,
  all 122 Source paragraphs have page locators, no process/placeholding-owner
  terms in README, no fake Prop-body conditions. metadata.toml is exactly
  the single line `topic = "math.NT"`. Scoped intake and whitespace checks
  were run for the review submission.

Pinned libraries: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only
roadmap main: `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Pinned declaration statements,
current CharacterTheory and InductionRestriction documents/suggested files,
ModularInduction and relevant ModularForms/ClassFieldTheory interfaces were
read. The nine added roadmaps and the four named completed roadmaps were
screened for duplicate targets. Existing suppliers retain their targets.

## Mathematical receipts and ownership follow-up

The independent report preserves the acceptance-critical checks. In particular:

- JPSS14.2 pp.253–254 and its p.255 monomial classification give all-place
  cubic character induction. Henniart83 Proposition3.2 p.30 identifies the
  finite local components; Henniart02 Theorem1.5 p.590 compares pair factors.
  Tensor induction and the full GL2 converse give the specified non-normal
  cubic output, with the quadratic-resolvent twist as the exact exception.
  The local lambda-square constants are retained and their global product
  proved one; monodromy is retained. Mao–Rallis supplies the separate weak
  trace route and the concrete norm-phase calculation.
- Chevalley51 Theorem1 p.36, primary proof §§1–5 pp.36–39, supports S-unit
  saturation, cyclotomic descent and the dyadic exponent enlargement. Do not
  replace this by a general derangement/local-root shortcut. Full local
  prescription uses a finite ray quotient and allows auxiliary ramification
  and order growth; it asserts no fixed-order Grunwald–Wang theorem.
- Brauer-character recognition and Fong–Swan plus a free stable DVR lattice
  supply actual residual conjugacy. Ordinary character splitting is imported
  from InductionRestriction6, not a virtual-character identity alone.
  Oddness requires p>2; the characteristic-two examples reject the opposite
  claim. Residual restriction does not use characteristic-zero Maschke.
- Classical parabolic multiplicity, coefficient descent, the arithmetic
  cohomological dual and conductor comparison remain explicit local targets.
  The Varshavsky curve calculation reorders the correspondence and keeps
  compactification boundary and duality; equal orders are excluded.

Retain the package author's downward ownership dispositions when the plans
and consumers are reconciled in their own permitted jobs:

1. R16.1 owns full-local character prescription and S-unit congruence. Higher
   character-extension/level-shrinking consumers should import this owner.
2. R17.6/classical-parabolic-realization,
   /classical-higher-weight-attachment, /classical-weight-one-attachment and
   /classical-conductor-comparison supply the classical inputs formerly
   imported from R19. The four upward packet edges still need repointing.
3. Quadratic induction is sequenced in R17.4 before the cubic construction;
   its old R17.5 anchor is retained for links.

Those packets and consumers were outside this review's file scope and were
not edited. The original packets still have 16 inherited gap entries and
67 requests; acceptance concerns the package's explicit dispositions, not
an assertion that those JSON records were closed. ET.6 owns generic local
LLC and AL.3 owns generic analytic/converse theorems. Named signature
omissions use the §13 rule and must not be regenerated from the stale
assembled suggested file's arbitrary-carrier substitutes.

No unresolved package correction or source blocker remains. The maintainer
handles upstream submission and cross-plan reconciliation. No Lean/background
process is left running. This run's scratch files are disposable; all durable
findings and provenance are recorded here and in the report.

## Source provenance

Accessed **2026-10-10**. The table records the actual public PDF versions
obtained, plus hashes of the four supplied cleared sources read in place.
No source passages or private filesystem paths are retained. Cleared-source
hashing and reading did not copy those files. Links identify public source
locations or the work's DOI; SHA-256 identifies the bytes read.

| Source key | Location | SHA-256 | Supplied cleared copy |
| --- | --- | --- | --- |
| jl70 | [source](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl_9.pdf) | `ede21b1b303d3a398eb0b9057716c4b293bafe39eba118fd9b6a871eab6f2dcf` | no |
| jl70-ubc | [source](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/jl-ps.pdf) | `4dae9de4ce65b6ed81a8ec4688e1f65131f188ba33195d5cf066cd923eabef0a` | no |
| casselman73 | [source](https://lesesvre.perso.math.cnrs.fr/newforms-references/casselman.pdf) | `7f91ebae1a8f5e695800f4afb9fc06d0e2ea0b3a476751a31a7c8c3f38ad537d` | no |
| nt26 | [source](https://arxiv.org/pdf/2212.03595v2) | `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c` | no |
| dlb17 | [source](https://arxiv.org/pdf/1509.00606v2) | `bdf8f14fb4bfb4fe43980fdbff088b33469a16a9c0260616a0630de48de8cd68` | no |
| bz76 | [source](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/B-Zel-RepsGL-Usp.pdf) | `5eb3719f59d8b8db2905d6e1015060ceb466e826d5dbb74ab4c3b9aca0c7dbb2` | yes |
| bm02 | [source](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf) | `ec42c9a450a7f7368a72670a3e9c54b75cad77802f18ac08d4dac6078bf7fa02` | no |
| cdt99 | [source](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf) | `e9dac063b9db6fd7b34e79907ce09095688b1fd8b1ea48c8527797b6090ae91c` | no |
| cg18 | [source](https://math.uchicago.edu/~fcale/papers/CG.pdf) | `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5` | no |
| cg20 | [source](https://par.nsf.gov/servlets/purl/10184292) | `900ff1b1c583366bc2a248dd09630f973a2108f5aae2204f17c7f536d9d9b1bd` | no |
| bcgp21 | [source](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af` | no |
| hkp10 | [source](https://www.math.umd.edu/~tjh/IHA.apr.09.pdf) | `f3469311d014d1b06420dd0ab5aae0b90570f5521cc9d57a1abbc21014568c1d` | yes |
| aky22 | [source](https://arxiv.org/pdf/2110.09070v4) | `32326ab828c5cfb524cfb479e337fdd9834496cd9ec39409266c281c49883a6c` | no |
| cdn20 | [source](https://www.ams.org/journals/jams/2020-33-02/S0894-0347-2019-00935-5/S0894-0347-2019-00935-5.pdf) | `db810ee0b4017eba2f30801c8cc76df6d61f3b32a6ef07cb891586e4121f0a16` | no |
| cdn23 | [source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf) | `b007a4e37b824ca5986ac6152ed9fabcf38dde97e16d8f5f7f60756fe77d3418` | no |
| pan26 | [source](https://arxiv.org/pdf/2209.06366) | `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4` | no |
| converse | [source](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf) | `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe` | no |
| langlands80 | [source](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf) | `6af3f53d0eb0e841548f43151f9cb79fd2e12ceac4ca909aefeb08d5462758ab` | no |
| ac89 | [source](https://www.claymath.org/library/cw/arthur/pdf/30.pdf) | `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737` | no |
| getz15 | [source](https://sites.math.duke.edu/~jgetz/aut_reps.pdf) | `e52f7da0685c7e330f096b3f23beaf8832972067d191f77e3c05ac3113fff0ac` | no |
| cogdell-fields | [source](https://people.math.osu.edu/cogdell.1/fields-www.pdf) | `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7` | no |
| jl70-global | [source](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf) | `bfd16d259d2816210cff67aa835b8f1fe886d3716ad909ca221d8b2686c379f3` | no |
| br10 | [source](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf) | `dc3aad1d249fda35f40f33f7b688537f226e509ed6879fe36dd5d07a15839c88` | no |
| gj78 | [source](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf) | `319347503f91fe22bec22ce7519b9ebaf09921ec4de8756c51d155864b4fc16a` | no |
| patrikis | [source](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf) | `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81` | no |
| carayol86 | [source](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` | no |
| rt97 | [source](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf) | `fe131f6cff026c25c65727d6675d1bea9233f91bd1d0d7947587b491cf22d3b9` | no |
| wiese04 | [source](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf) | `1dcd4bb30b64a19cb1335a7442b6704ff9c0a3dd0ad96d97d6b37a04d0aa3b06` | no |
| cdn20-global | [source](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) | `2cdb1de25b5201ed46f8af6c06c19b72fdc5cbe1dd2037b4e1d24dee30155776` | no |
| pan26-global | [source](https://arxiv.org/pdf/2209.06366v1) | `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4` | no |
| rt83 | [source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf) | `6a020942a4a0acfb5e2301de3bfd75f3ac9d05c21c8960c706c94a1e81d9c8b1` | no |
| ds74 | [source](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) | `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc` | no |
| tunnell81 | [source](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf) | `fc276270d09ea11b98d750deeba26193e07d5aac2d30ffe16dbf0f7f576ffc5c` | no |
| jpss79 | [source](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf) | `0cf1baf41a6279cd1f78b44b0e6d3ff0ed71f7b9b54b55de28210b9f02a293f7` | no |
| tunnell78 | [source](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf) | `9f3e94853253589ac99f0b8ba5e67e90b6f33a581857a4f6083f92d6375ce066` | no |
| ddt | [source](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) | `254f6e29957f95219eff046c29478f5ee584615bee12c8aa8357f499c8cbe8b3` | no |
| chevalley51 | [source](https://www.jstage.jst.go.jp/article/jmath1948/3/1/3_1_36/_pdf/-char/en) | `c8ca4e2dac91b20836adaf90ac5300f7dd197bb8f7145d5c422791d436358493` | no |
| cht08 | [source](https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf) | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` | no |
| isaacs74 | [source](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf) | `413add693a05e715bbe9dd480feab658ebd2ff180fce71dbd73d099fec8bdc29` | no |
| webb16 | [source](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf) | `3053d04310d379844d0ccac2ae078124492730a116e63343014d276169fb4c24` | no |
| bh06 | [source](https://doi.org/10.1007/3-540-31511-X) | `f0f1f094b188b43f8ad0492bf7525c8e4e34cc2ce0f830c896d0a6d1e33c89ee` | yes |
| clozel86 | [source](https://backend.production.deepblue-documents.lib.umich.edu/server/api/core/bitstreams/3f8e76bd-61fa-4e50-b374-9c7298d7e482/content) | `0cbe657414bd1872a47510a433bd09a90c7fc12e42fd391830e9fa1cbd7dbcf1` | no |
| mr00 | [source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5049F4E78E15635E58E158F1CF1C93FC/S0008414X00008798a.pdf/cubic_base_change_for_textgl2.pdf) | `8cfdd3cdd83c7cac795656ef407a8ee00a8ab1be75e70ec36838122b847484c0` | no |
| jy96 | [source](https://www.math.columbia.edu/~hj/S0002-9947-96-01549-8.pdf) | `3ff320ffd1d74ba8c6154ddd6192fa2f728287d3d19d9104c45953e2b4066e3f` | no |
| ag11 | [source](https://www.wisdom.weizmann.ac.il/~dimagur/SmoothTransfer.pdf) | `09b25582a43d1de54d0e264cd53d34cb1b5d2e38893899591fc5fc9fe1901a79` | no |
| deligne69 | [source](https://www.numdam.org/article/SB_1968-1969__11__139_0.pdf) | `19509c19b0cb056f4a5eba83a48a99f54bb6df0c7a96ab7f4018b0765e1ed98c` | no |
| langlands73 | [source](https://www.sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/antwerp-ps.pdf) | `fcbc7e055ef7582e80d31c092ea0d26007007aa0bf30a0ad5b526577cb8dc644` | no |
| prr23 | [source](https://doi.org/10.1017/9781139017756) | `3a53310f50322744901dd0fa36709aaf4a6eb2ed1e53ec38be44e3fcbf840fdd` | yes |
| varshavsky05 | [source](https://arxiv.org/pdf/math/0505564v2) | `8b4cb7ee9b1726cc998fc4d952a2542576e85ebe21e70b0f5c9f31c4682b8ac6` | no |
| flm11 | [source](https://annals.math.princeton.edu/wp-content/uploads/annals-v174-n1-p05-p.pdf) | `86271ace3fa54466817c3e6cc993a5a0b0dc8f287de5b69bda5832c9cb613746` | no |
| mw26 | [source](https://arxiv.org/pdf/2607.18870v2) | `a1bf7c9a7be08e4d734fe86508084af0ed9e4d8522de6e42efed2dd171076ba2` | no |
| henniart83 | [source](https://www.numdam.org/item/10.24033/msmf.295.pdf) | `968076c8b63d4a94442c080040b684fe1f71b01a3c0933d111a49745369629f7` | no |
| henniart02 | [source](https://smf.emath.fr/system/files/2017-08/smf_bull_130_587-602.pdf) | `40c0ed7c7bfb05f1415fd66642d0b1984052f0af7cb5f3061b328216e2d24306` | no |
| deligne73 | [source](https://publications.ias.edu/sites/default/files/Number20.pdf) | `b03f483c4eeca79b75e34b88f41406fe4c9e16ba621480ce859697c93e8d5844` | no |
