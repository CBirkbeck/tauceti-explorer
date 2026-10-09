# Independent package review: regular-algebraic GL_n Galois representations

**Verdict: accepted after three small reader corrections.** This is the completed review for issue [#7507](https://github.com/CBirkbeck/tauceti-explorer/issues/7507), job `REV-PKG-AutomorphicGaloisRepresentationsPartII`. Reviewer: Codex, session `codex-rfWobS`, 9 October 2026. This session did none of the package-creation work.

Acceptance concerns the conversion of the two accepted plans into a reader package under PROTOCOL §§13 and 20. It does not close their supplier obligations or formalize their mathematics. The accepted inputs remain unchanged, with implementation unchecked. Their missing geometric, automorphic, period and compatible-system interfaces remain necessary prerequisites. The README states the complete mathematical targets; the suggested file contains scoped prototypes and explicit omissions.

## Six required checks

| Check | Independent result |
| --- | --- |
| Upstream form and density | Passed. Compared with the complete SemisimpleAlgebras and SchurWeyl upstream roadmap models and UPSTREAM_GUIDE. The introduction explains outputs, applications, boundaries and conventions. Nine mathematical layers contain source-based targets, API, discriminating tests and explicit prerequisites. AG2.1 is described only as the aggregate of its two producers. README is 199,266 UTF-8 bytes, below even a decimal 200,000-byte cap. |
| Fidelity | Passed. All 120 targets, 108 separately recorded hypotheses, 142 API entries, 107 tests, 511 direct prerequisites and 152 source citations were checked. The per-target ledger below covers both inputs. Titles, API/test names and statements, and prerequisite references are preserved; 100 target blocks have normalized statement/hypothesis/locator fidelity, and the other 20 have the independently reviewed transformations below. |
| Own words and sources | Passed. Mathematical outputs group the reader, rather than paper sections. No source passage or section-by-section source summary was found. A normalized text comparison with the 25 acquired public PDFs found no matching run of 14 or more alphabetic words in mathematical prose; longer matches were bibliographic authors/titles. This is supporting evidence alongside reading, not a plagiarism detector. Every target retains its theorem, section or formula locator and edition-specific pages. |
| No programme process | Passed after removing the identifier-history sentence. There are no job IDs, blueprint filenames, review/checkpoint references or coverage statuses in the README. Its uses of “packet” mean archimedean or transferred automorphic packets. Its note about admitted prototypes is mathematical scope, not workflow history. |
| Suggested.lean | Passed under the explicit unavailable-condition allowance in §13. Independently ran the prescribed lean-check command: exit 0, no errors, exactly 100 declaration-uses-sorry warnings and no other warnings. The executable body from the first import is byte-identical to the accepted assembly suggestion. Declarations and omission notes retain the reader's target scope; the detailed limits below are essential. |
| metadata.toml | Passed unchanged: exactly `topic = "math.NT"` followed by a newline. Number theory is the appropriate category. |

Both accepted input packets also pass `scripts/check_blueprint.py` with zero errors and zero warnings. All 426 internal Markdown links resolve to the reader's 144 explicit anchors. The package's Suggested.lean and metadata were not modified by this review.

## Corrections and transformed target blocks

Three clear reader defects were corrected in place:

1. Replace the sentence about historical identifiers with a timeless explanation of internal links.
2. State that the unramified base-change identity is **required from** ET.7. This retains the accepted supplier requirement without presenting the requested interface as already implemented.
3. Link the published Caraiani author copy used on pp.2410–2411. The existing arXiv link alone did not give the reader direct access to the longer purity-detection proof.

The following are the only 20 target blocks that differ from the accepted input in normalized statements, hypotheses or locator wording. Other fields of these blocks agree, and none of these transformations adds a new mathematical conclusion.

| Target suffix | Check of the transformation |
| --- | --- |
| dominant-weights-and-the-weight-w | Replace a node reference with “the Hodge multiset below”; dominance, repetitions and paired coordinates are unchanged. |
| regular-algebraic-of-weight | Say the AF.4 C/L distinction is imported rather than “not re-planned.” No cuspidality or self-duality is added to the definition. |
| polarized-automorphic-representation | Replace source-issue/node labels with the multiplier computation. Keep the corrected odd-weight parity and the unused Patrikis automatic-sign result. |
| polarized-galois-representation | “Comparison” replaces “node”; all pairing, multiplier and period conventions remain. |
| galois-representation-attached-at-good-places | The corrected “required from ET.7” preserves the requested base-change contract. Good-place attachment remains separate from global existence and local admissibility. |
| polarized-construction-inputs-shin-and-chenevier-harris | Replace proposed-owner language with the dedicated GSp4 construction prerequisite. CH arbitrary-regular existence keeps its CM and conjugate-self-dual hypotheses. |
| shin-regular-geometric-existence | Replace node/owner language with existence/comparison language. Odd-rank or slight-regularity, technical field assumptions and ST/END cases remain explicit. |
| algebraic-character-polarization-twist | Replace the erratum label with the already stated total-oddness convention. |
| cs-discrete-polarization-normalization | Use the same imaginary quadratic field 𝒦 in the splitting condition instead of the printed undefined F₀. See CS §5.1 pp.730–731 and Corollary 5.5.5 pp.745–746. |
| finite-slope-regular-target-existence | Remove “node” from the raw determinant supplier description. |
| pure-weil-deligne-comparison | State the requested pure-extension theorem mathematically; retain the warning that maximal rank alone does not determine WD equivalence. |
| automorphic-polarization-and-sign | Replace the source-issue label with the total-oddness convention. |
| extremely-weakly-compatible-system | Replace a description of contradictory current supplier statements with the precise conditional R24.5:operations prerequisite. Raw data and strength predicates stay separate; no second system carrier is introduced. |
| geometric-coefficient-prime-comparison | Explain geometrically why attachment alone is insufficient. Keep actual projectors, reduction hypotheses and comparison before admissibility. |
| compatible-system-of-pi | “Given the separation” replaces “once the request is fulfilled.” The dependency remains conditional. |
| very-weak-compatibility-under-dgi | Preserve the same conditional separation and weakening map, all density-one quantifiers and the independent residual irreducibility hypothesis. |
| rank-two-comparison-with-r19 | Sharpen CH's §1.5 formula (1.6) locator to p.7 and Theorem 3.2.3 to pp.11–12. This is a locator correction, not stronger comparison. |
| gsp4-crystalline-hodge-comparison | Name the dedicated GSp4 construction and ML.4 transfer instead of implying that AG2.2 constructs r_f. |
| pilloni-gsp4-normalization-comparison | Replace the extraction's source-issue label with the stated geometric-Frobenius and Hodge convention. |
| unitary-discrete-parameter-export | Typeset the chosen character as ϖ and its norm/determinant composition, use “representation” in place of “package,” and identify F₀ with 𝒦 without programme erratum labels. Parity twists, ranks n_i and Igusa occurrence are unchanged. |

The added GK locator is also supported: Theorem 5.1, §5, pp.23–24 includes the coherent/de Rham/rigid comparison and its proof. The bibliography identifies Newton–Thorne by arXiv:2212.03595v2; it does not depend on the earlier inconsistent journal-volume description.

## Boundaries and mathematical strength

Read the relevant AUDIT-31 library-coverage records, accepted RS-12 ownership result and the actual SchurWeyl-to-AG2.1a link. The reader preserves the rational normalized Young-idempotent input only: the map to actual correspondences, signs, coefficient descent, degree and Tate twist belong to AG2.1a. SemisimpleAlgebras supplies decomposition; it does not supply the missing geometric realization. The rec-free polynomial and raw cohomology precede local correspondence; the later comparison and arbitrary-regular existence blocks follow their mathematical parent layers even when a legacy target ID has another prefix.

R19 retains classical/Hilbert constructions and weight one. AG2 compares only the regular-weight overlap, with the arithmetic/geometric dual convention. R01 supplies generic representations, lattices, recognition and residual semisimplification; AF.4 supplies highest-weight/rational structures; IHG supplies the integral Hecke and determinant-law interfaces. R24.5:operations is the one shared raw compatible-system interface. General period comparison remains in R06, while projected higher-rank applications belong here. The three GSp4 entries are conditional specializations, with no invented stage ID or duplicated construction.

The numerical conventions retain geometric Frobenius, HT(ε)=−1, the signed integral polynomial, H_τ(a)={a_{τ,i}+n−i}, and purity weight w+n−1. The reader derives the multiplier's real-place sign with w present, rather than silently repeating the BLGGT odd-weight error.

AHTW Theorem 1.2.1, pp.5–6 gives the CM nonselfdual de Rham/full-Hodge and semisimplified comparison; Corollary 1.2.2 and §6 give a monodromy bound. They do not assert arbitrary ramified equality of N. The polarized branch retains full Frobenius-semisimple WD equality including N. Spherical crystalline and Iwahori semistable conclusions remain separate. ACC+ §7.1 pp.1084–1085 retains all-member determinant Hodge sums and density-one rational-prime quantifiers. CH Proposition 3.2.5 p.12 enlarges the common realization field, rather than deriving a model over the trace field without addressing Schur index.

The residual comparison concerns semisimplifications, not a canonical lattice or raw reduction. Genericity includes inertia and ordered ratios, permits repeated eigenvalues in the ACC+ condition, and keeps absolute irreducibility separate. The stronger CS ratio condition excludes 1 as well. The unitary discrete export keeps an actual reducible sum and the separate Remark 5.5.6 normalization input. These distinctions agree with the accepted plans and their reviewed supplier boundaries.

## Lean verification and its limits

Read the cited Mathlib declarations and surrounding assumptions at `082e2d37e8b0463410cdb532e111cd43d5a66174`: IsCMField, complexConj and complexEmbedding_complexConj; Multiset.prod_X_sub_C_coeff; AlgebraicClosure; Matrix.GeneralLinearGroup, map and toLin; charpoly, charpoly_map, charpoly_diagonal and charpoly_units_conj; Representation.IsSemisimpleRepresentation and IsIrreducible; Matrix.rank. These are existing algebra and are reused. The file imports no TauCeti module, so the declared Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369` supplies no declaration used in this elaboration.

Ran `lean-check research/blueprint/packages/AutomorphicGaloisRepresentationsPartII/Suggested.lean` with sufficient available memory. Exit status was 0. The output contained 100 warnings, all declaration-uses-sorry, and no errors or other warnings. No Lean language server or library build was started.

The complete 77-target first-part register names the mathematical signatures, API and tests, and explicitly identifies unavailable objects wherever a full executable form is omitted. It also contains real weight, polynomial, genericity and numerical examples. The later part retains its actual main/API declarations and labelled examples, including proof fields that express concrete equations rather than arbitrary Prop placeholders. It takes System as an externally supplied parameter rather than cloning the compatible-system carrier. Tests distinguish Hodge sums from multisets, raw reductions from semisimplifications, weak comparison from N, and a discrete sum from irreducibility.

Some named output signatures, for example polarizedCoefficientPrimeAdmissibility, logCrystallineAutomorphicPurity and fullPolarizedCoefficientPrimeComparison, deliberately lack the unavailable automorphic/geometric/period hypotheses. They would be false for arbitrary matrices or weight functions. Their per-declaration comments and the README state that limit expressly; this acceptance applies §13's permission to omit conditions that cannot yet be stated. It does **not** certify those signatures as unconditional mathematical theorems. The remaining full-object omissions were accepted in the input plans and are still exposed, not concealed by fabricated predicates. Before any implementation or mathematical theorem is claimed, the supplier carriers must exist and every README hypothesis must be restored. The package conversion has neither removed those requirements nor strengthened the fragmentary examples.

## Source acquisition and scoped checks

All 24 distinct primary source PDFs cited across the inputs were fetched from their public URLs and matched the accepted SHA-256 records. The additional published Caraiani-away author copy also matches its accepted version receipt. The fresh surrounding-text readings concentrated on the transformations and package-only locator additions: CH §1.5 and Theorem 3.2.3/Proposition 3.2.5; GK Theorem 5.1; CS §5.1 and §5.5; the published Caraiani tensor-square proof pp.2410–2411; ACC+ §7.1 pp.1084–1085; AHTW Theorem 1.2.1/Corollary 1.2.2; and Pilloni Theorem/Remark 5.1.7.1 pp.22–23. Other target locators were compared with the unchanged accepted plans and their independent review receipts. This package review does not claim to have re-reviewed every proof in every paper, or to have resolved the plans' recorded gaps. No restricted library source was needed or copied.

The following hash receipts permit version checks without retaining source files in the repository.

| Public source | SHA-256 |
| --- | --- |
| [blggt-potential-automorphy](https://arxiv.org/pdf/1010.2561v4) | `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24` |
| [accplus-cm-potential-automorphy](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |
| [patrikis-sign](https://arxiv.org/pdf/1306.1242v2) | `2bfa2a6a00a94465725cd7b0e48d64eef1fed4113a6be4b246a015e7927259f8` |
| [hltt-rigid-cohomology](https://www.kwlan.org/articles/rigcoh.pdf) | `abecfd049d617654dd0bb60e4945bf6967d3953ed20f2126de0624f2bd0bdbc7` |
| [chenevier-harris-II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf) | `9b5e76798f75273f53d1d4160f35815b1a3b656f04c965ad47fd4fa454840529` |
| [varma-local-global](https://arxiv.org/pdf/1411.2520) | `24076dfcc6ca9b9e3168efb0150e75d5200f66e64085625b3e52895cfd1e56ef` |
| [caraiani-monodromy-away](https://arxiv.org/pdf/1010.2188) | `769e68e2384b42caf16861d9011b35afe48018eba006074ce0d6c4111451f3b3` |
| [caraiani-monodromy-at-p](https://arxiv.org/pdf/1202.4683) | `6ec698414d5d3ad03f3d1c98de178b39d69722699f4a08a059e8d14027df885e` |
| [shin-compact](https://math.berkeley.edu/~swshin/StableGal.pdf) | `93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b` |
| [shin-igusa](https://math.berkeley.edu/~swshin/StableIgusa.pdf) | `e74cbbe4463f003b8ae2eb10636744c7ae032d25a566f8b441004c7f14e2faf0` |
| [taylor-yoshida](https://arxiv.org/pdf/math/0412357) | `a17d283d3a605cd3f031a1178f2914254ee9cbe430b11cfbff8c382e8cd1713b` |
| [grosse-klonne-dagger](https://arxiv.org/pdf/1408.3329) | `f75311cc7638b225ec79a528d59abdc71f3cf7e3270ff081287c328d60cb071b` |
| [cs-generic-published](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| [newton-thorne26](https://arxiv.org/pdf/2212.03595) | `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c` |
| [liu-et-al22](https://par.nsf.gov/servlets/purl/10323568) | `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97` |
| [bcgp21-purity](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af` |
| [bcgp25-racsdc](https://arxiv.org/pdf/2502.20645) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| [bellaiche-chenevier-sign](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D778DCD413972E114657F69ACC7BB6BC/S0010437X11005264a.pdf/the-sign-of-galois-representations-attached-to-automorphic-forms-for-unitary-groups.pdf) | `46a4a8c7dc1394b6ec72c4b908bb7616818db4d608dcadf2f96d0998b3e0caa8` |
| [hsbt-character](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf) | `5e3fc579911961071bb7e7f7a7a4f4154d621d0abccafcf4d03702fbcfb3d1ab` |
| [clozel-thorne17](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download) | `fb88e83c3c056c2fa6100d1fbb4d0853c4ec636cc68a33548ac4259336094742` |
| [ahtw-coefficient-prime](https://arxiv.org/pdf/2607.11763v1) | `a5a56b7917c387b24f717e31714675d2de183505250bbd3a3fae21bd1fa424bb` |
| [calegari-geraghty-20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) | `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5` |
| [pilloni-20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) | `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58` |
| [caraiani-monodromy-published](https://msp.org/ant/2014/8-7/ant-v8-n7-p02-s.pdf) | `a0c7963e45b4706c8d0e5ca4791d12f5de749ef77ca6ba8256371ecd215f5314` |
| [Caraiani-away, published author copy](https://www.ma.imperial.ac.uk/~acaraian/papers/lgc1.pdf) | `9801588a90444b611e10fe810c11c0099b54af4871217f3b7cf2c493d00595fe` |

## Every-target conversion receipt

“Exact” means normalized statement/hypothesis/locator fidelity, with the API, tests and prerequisites also checked. “Reviewed transformation” refers to the explicit table above; those targets also preserve API, tests and prerequisites. Parent layers are the accepted mathematical parents, not inferred from the target ID prefix. All entries have verdict **verified** after the three reader corrections.

| Target suffix | Mathematical parent | Conversion |
| --- | --- | --- |
| `the-normalization-dictionary-fixed-by-the-sources` | AG2.5 | Exact |
| `dominant-weights-and-the-weight-w` | AG2.0 | Reviewed transformation |
| `regular-algebraic-of-weight` | AG2.0 | Reviewed transformation |
| `polarized-automorphic-representation` | AG2.0 | Reviewed transformation |
| `polarized-galois-representation` | AG2.0 | Reviewed transformation |
| `galois-character-of-an-algebraic-hecke-character` | AG2.0 | Exact |
| `sign-of-the-polarization-multiplier` | AG2.0 | Exact |
| `expected-hodge-tate-multiset` | AG2.0 | Exact |
| `frobenius-polynomial-and-conventions` | AG2.0 | Exact |
| `galois-representation-attached-at-good-places` | AG2.0 | Reviewed transformation |
| `field-of-rationality` | AG2.0 | Exact |
| `polarized-construction-inputs-shin-and-chenevier-harris` | AG2.3 | Reviewed transformation |
| `hltt-construction-of-nonselfdual-systems` | AG2.4 | Exact |
| `varma-semisimplified-comparison-and-monodromy-bound` | AG2.5 | Exact |
| `caraiani-upgrade-away-from-p-and-temperedness` | AG2.5 | Exact |
| `attachment-twist-dual-and-conjugation` | AG2.0 | Exact |
| `unitary-similitude-central-character-dictionary` | AG2.0 | Exact |
| `prescribed-crystalline-twisting-character` | AG2.0 | Exact |
| `compact-shin-pel-instance` | AG2.1a | Exact |
| `kuga-sato-coefficient-projector` | AG2.1a | Exact |
| `coefficient-projector-degree-identity` | AG2.1a | Exact |
| `finite-level-coefficient-cohomology` | AG2.1a | Exact |
| `hecke-galois-projector-commutation` | AG2.1a | Exact |
| `finite-continuous-geometric-galois-action` | AG2.1a | Exact |
| `automorphic-multiplicity-spaces` | AG2.1a | Exact |
| `raw-fixed-point-trace-identity` | AG2.1a | Exact |
| `raw-nearby-cycle-traces` | AG2.1a | Exact |
| `compact-global-mantovan-formula` | AG2.1b | Exact |
| `shin-st-end-igusa-computation` | AG2.1b | Exact |
| `virtual-weil-constituent-comparison` | AG2.1b | Exact |
| `weight-separation-middle-degree` | AG2.1b | Exact |
| `archimedean-packet-multiplicity` | AG2.1b | Exact |
| `actual-galois-constituent-from-cohomology` | AG2.1b | Exact |
| `shin-regular-geometric-existence` | AG2.2 | Reviewed transformation |
| `algebraic-character-polarization-twist` | AG2.2 | Reviewed transformation |
| `discrete-unitary-galois-assembly` | AG2.2 | Exact |
| `cs-discrete-polarization-normalization` | AG2.2 | Reviewed transformation |
| `attachment-under-solvable-base-change` | AG2.2 | Exact |
| `definite-unitary-eigenvariety-instance` | AG2.3 | Exact |
| `strongly-regular-classical-density` | AG2.3 | Exact |
| `definite-family-determinant-interpolation` | AG2.3 | Exact |
| `finite-slope-regular-target-existence` | AG2.3 | Reviewed transformation |
| `s-general-solvable-extension-families` | AG2.3 | Exact |
| `effective-automorphic-galois-patching` | AG2.3 | Exact |
| `removal-of-geometric-field-hypotheses` | AG2.3 | Exact |
| `solvable-local-iwahori-reduction` | AG2.3 | Exact |
| `solvable-index-induction` | AG2.3 | Exact |
| `hltt-ordinary-boundary-instance` | AG2.4 | Exact |
| `boundary-support-dagger-cohomology` | AG2.4 | Exact |
| `hltt-functorial-dagger-rigid-comparison` | AG2.4 | Exact |
| `hltt-frobenius-trace-normalization` | AG2.4 | Exact |
| `ordinary-cusp-finite-slope-pieces` | AG2.4 | Exact |
| `hasse-weight-changing-congruence` | AG2.4 | Exact |
| `classical-cusp-galois-type` | AG2.4 | Exact |
| `uniform-integral-hecke-congruence-witnesses` | AG2.4 | Exact |
| `ordinary-hecke-determinant-limit` | AG2.4 | Exact |
| `logarithmic-cusp-section-spectral-sequence` | AG2.4 | Exact |
| `boundary-stratum-weight-zero-sequence` | AG2.4 | Exact |
| `boundary-levi-cohomology-realization` | AG2.4 | Exact |
| `hltt-factor-separation-specialization` | AG2.4 | Exact |
| `good-prime-unramified-polynomial` | AG2.5 | Exact |
| `monodromy-order-interface` | AG2.5 | Exact |
| `varma-integral-bernstein-operators` | AG2.5 | Exact |
| `varma-local-trace-congruence` | AG2.5 | Exact |
| `varma-monodromy-rank-bound` | AG2.5 | Exact |
| `caraiani-tensor-square-geometric-instance` | AG2.5 | Exact |
| `two-chart-nearby-cycle-monodromy` | AG2.5 | Exact |
| `caraiani-stratum-concentration` | AG2.5 | Exact |
| `racsdc-temperedness` | AG2.5 | Exact |
| `tensor-square-weight-spectral-sequence` | AG2.5 | Exact |
| `pure-weil-deligne-comparison` | AG2.5 | Reviewed transformation |
| `ch-polarized-local-monodromy-bound` | AG2.5 | Exact |
| `published-racsdc-comparison-specializations` | AG2.5 | Exact |
| `automorphic-polarization-and-sign` | AG2.3 | Reviewed transformation |
| `finite-number-field-of-realization` | AG2.3 | Exact |
| `late-gl2-modular-comparison` | AG2.5 | Exact |
| `relevant-automorphic-coefficient-field` | AG2.0 | Exact |
| `extremely-weakly-compatible-system` | AG2.6 | Reviewed transformation |
| `geometric-coefficient-prime-comparison` | AG2.6 | Reviewed transformation |
| `coefficient-hodge-comparison-through-families-and-descent` | AG2.6 | Exact |
| `polarized-branch-de-rham-and-crystalline` | AG2.6 | Exact |
| `log-crystalline-purity-on-the-automorphic-summand` | AG2.6 | Exact |
| `full-polarized-comparison-at-the-coefficient-prime` | AG2.6 | Exact |
| `all-cm-de-rham-and-semisimplified-coefficient-comparison` | AG2.6 | Exact |
| `nonselfdual-coefficient-prime-monodromy-bound` | AG2.6 | Exact |
| `all-cm-crystalline-and-iwahori-corollary` | AG2.6 | Exact |
| `totally-real-polarized-coefficient-prime-descent` | AG2.6 | Exact |
| `coefficient-embedding-independence-and-semisimple-uniqueness` | AG2.6 | Exact |
| `compatible-system-of-pi` | AG2.6 | Reviewed transformation |
| `complex-and-local-coefficient-conjugation` | AG2.6 | Exact |
| `strong-coefficient-field` | AG2.6 | Exact |
| `uniform-strong-realization-for-polarized-systems` | AG2.6 | Exact |
| `polarized-compatible-system-strictly-pure` | AG2.6 | Exact |
| `very-weak-compatibility-under-dgi` | AG2.6 | Reviewed transformation |
| `coefficient-prime-branch-and-what-it-does-not-give` | AG2.6 | Exact |
| `rank-two-comparison-with-r19` | AG2.6 | Reviewed transformation |
| `tensor-automorphy-independent-of-coefficient-embedding` | AG2.6 | Exact |
| `gsp4-crystalline-hodge-comparison` | AG2.6 | Reviewed transformation |
| `ordinary-gsp4-coefficient-prime-shape` | AG2.6 | Exact |
| `pilloni-gsp4-normalization-comparison` | AG2.6 | Reviewed transformation |
| `finite-p-adic-field-of-realization` | AG2.7 | Exact |
| `residual-representation-of-pi` | AG2.7 | Exact |
| `good-polynomial-reduction` | AG2.7 | Exact |
| `hecke-maximal-ideal-of-galois-type` | AG2.7 | Exact |
| `non-eisenstein-maximal-ideal` | AG2.7 | Exact |
| `residual-hecke-ideal-independence` | AG2.7 | Exact |
| `dual-and-character-twist-hecke-comparison` | AG2.7 | Exact |
| `the-residual-ratio-condition-for-taylor-wiles-primes` | AG2.7 | Exact |
| `completely-split-generic-prime` | AG2.7 | Exact |
| `existential-decomposed-genericity` | AG2.7 | Exact |
| `strong-local-decomposed-genericity` | AG2.7 | Exact |
| `infinitely-many-decomposed-generic-primes` | AG2.7 | Exact |
| `genericity-transfer-and-projective-qualification` | AG2.7 | Exact |
| `finite-exceptional-residual-genericity-for-relevant-pi` | AG2.7 | Exact |
| `good-prime-characteristic-zero-export` | AG2.7 | Exact |
| `nonselfdual-hodge-and-monodromy-bound-export` | AG2.7 | Exact |
| `polarized-hodge-and-wd-export` | AG2.7 | Exact |
| `unitary-discrete-parameter-export` | AG2.7 | Reviewed transformation |
| `lattice-residual-polynomial-export` | AG2.7 | Exact |
| `rank-two-residual-comparison-with-r19` | AG2.7 | Exact |

Verified Suggested.lean SHA-256: `a4a4d87cc79e4d374d1dc6bcf3f74350939e0221b275120da4afe69c8daa11f3`. No package-review correction remains outstanding.
