# REV-OverconvergentAutomorphicForms--O0~5: accepted

Independent reviewer: **Codex — codex-RdtZaC**, 20 October 2026. Refs #11494.
This session authored none of the five input planning jobs. Claim confirmation:
[claim bot](https://github.com/CBirkbeck/tauceti-explorer/issues/11494#issuecomment-6301497554).
This is a completed review of revision 5, not a checkpoint.

Accept the **complete target-level plan**, retaining its three explicit gaps.
O1, O2, O4 and O6 are closed at planning granularity; O0, O3, O5 and O7 remain
planned. PROTOCOL §§0 and 3 distinguish a finished planning pass from a closed
mathematical dependency chain. No implementation is certified here. The current
WORKERS/PACKAGE_REVIEW shape makes the detailed reader authoritative when the
required geometric carriers do not exist at the pins.

I independently read the 79 target contracts and their hypotheses, proof plans,
source matches, APIs, checks and planets, the reader and the full suggested Lean
file. I read the 38 recorded baseline declarations at their exact commits and
the consumed supplier interfaces at the revisions below. The fresh register has
72 verified targets, one corrected proof sketch and six targets unverifiable as
unconditional conclusions because of the recorded gaps. A verified conditional
contract does not discharge its additional hypothesis. Earlier reviews and
source-issue verdicts are preserved in history rather than reused as evidence.

## Correction: Frobenius retains the Igusa level

The old proof of `O5/aip-frobenius-restriction` said that the dual canonical
subgroups of A and A/C₁ were identified at the level in use. That explanation
omitted the maps and their level dependence. The target itself agrees with
AIP ADIC Theorem 6.7(3), p.29.

For F:A→A′=A/C₁, AIP ADIC §4.3.2, p.19, constructs the quotient
H_(n+1)(A)→H_n(A′) and its dual injection Fᴰ. A level-(n+1) frame ψ gives a
level-n frame ψ′ through Fᴰψ′=ψ∘(×p). Thus the comparison uses
Ig_(n+1,r)→Ig_(n,r−1), together with the forgetful map on the source. For a
finite character factoring modulo p², a common level-three refinement retains
both level-two character actions. Its deck equivariance and forgetful
compatibility are the descent checks. The proof and reader now state these
maps and add a check that would fail if ×p were replaced by an identity between
different residue modules.

The frame comparison also uses the normalized map w↦p w of that section,
with the target differential viewed through the generic-fibre identification
F*. Its membership in the target modified lattice and its Hodge–Tate
congruence are required. Proposition 4.8, p.19, gives the resulting weight-sheaf
isomorphism; it does not say that raw pullback on integral differentials is
invertible. Tensoring with the finite-character comparison gives the full
sheaf comparison, without assuming the positive-radius integral freeness
still missing in O5. This is a correction to this plan's proof sketch, not a
new alleged source erratum. No target, API item, unit-test record or planet was
removed; the additional check is in the comparison target's acceptance list.

## Scope and unresolved inputs

| Quantity | Reviewed result |
| --- | ---: |
| Targets | 79 |
| Definitions / constructions | 5 / 31 |
| Lemmas / theorems / comparisons / applications | 5 / 23 / 13 / 2 |
| API items / unit-test contracts | 133 / 113 |
| Planets / explicit baseline declarations | 32 / 38 |
| Supplier requests / mathematical gaps | 2 / 3 |
| Closed / remaining planned stages | 4 / 4 |
| Suggested Lean lines / proved examples | 280 / 4 |

The definition and construction tests include computations, degeneracies and
wrong-convention examples; each has at least three checks and its use-derived
API. The four Lean examples test the weight-map and right-cocycle definitions,
two per definition. The other checks remain exact reader targets, as the
current shape requires. Planet counts O0–O7 are 6,3,3,3,5,2,6,4; they name
mathematical objects and principal results, with at most six per layer.

The local prerequisite graph is acyclic. Its external leaves are recorded
baseline declarations, exact supplier nodes and interfaces, or explicit gaps.
The assembled roadmap's existing `O4/effective-arithmetic-descent` is an
external adapter used by two presentations; its proof depends on the
noncircular congruence-unit cancellation and continuity argument, not those
presentations. The assembly and its imported-contract fingerprints are outside
this issue's deliverables. This review does not certify their synchronization.

The remaining mathematical inputs are precise:

1. **O0 Jacquet eigenvariety geometry.** Ding §4.2.2, pp.66–68, supplies the
   target: dimension n d_K, Cohen–Macaulayness of the actual coherent sheaf and
   reducedness for the definite-unitary model with one varying place and s≥1.
   LR.6 already owns the full torus character variety and coherent Jacquet
   dual. The Hecke spectral algebra, BHS dimension/depth inputs and separate
   classical-density/reducedness argument are the additional request. The BHS
   Lemma 3.10, Proposition 3.11, Corollary 3.12, §5.2/Corollary 3.20 and companion
   references were not independently established here. Ding's completed
   coefficients remain in O0; the GL₃ all-place adapter of CompletedCohomology
   Part II §8.5 does not replace them.
2. **O3/O5 full-character integral freeness.** AIP ADIC Propositions 4.3 and 4.7
   give the universal-character formal line; §6.4, p.29, gives coherence and
   rational/ordinary invertibility of the finite-character factor. A unit
   eigenfunction on a split Igusa product does not give an O⁺ generator on
   the positive-radius base, as the annulus test demonstrates. This gap stays
   O5-owned. The integral comparison instead compares actual eigenfunction
   equalizers by unit multipliers, valued lifting and transitivity. It does
   not use that freeness. AIP CUSP Proposition 3.14 and Remark 3.15, p.17,
   also prevent an unconditional integral base-change assertion.
3. **O7 nondiscrete unit balls.** Over a discrete valuation ring, reduced
   special fibre identifies a formal chart R_i with A_i°. The criterion in
   AdicSpacesPartII R0 requires reduced reduction modulo a topologically
   nilpotent unit. After nondiscrete perfectoid base change, O_L/ϖ is
   nonreduced, so the criterion does not prove that the completed formal
   lattice is the spectral unit ball. The required norm/tensor comparison, or
   a discrete-field comparison followed by completion, remains in O7. P9
   supplies actual all-open function descent; it does not discharge this gap.

The second request, to ShimuraCompactifications C3, names its existing C3.6a
formal-functions interface for proper locally Noetherian algebraic spaces and
coherent higher direct images with étale localization. The supplier reader
states it, but there is no finer atlas node. It is an interface request, not a
second construction or an additional unrecorded mathematical gap.

## Sources read independently

The seven PDFs were fetched independently and their SHA256 values matched the
packet. The scopes below are the passages inspected, not claims to have read
all seven papers. Every citation is a paraphrase of a mathematical contract;
no source passage is copied into these deliverables.

| Source | Independently read scope | SHA256 |
| --- | --- | --- |
| [BHW-2023](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf) | Published PDF pp.29–30, 42–58, 61, 66, 68–85 (printed pp.1736–1737, 1749–1765, 1768, 1773, 1775–1792): the cited period, weight, AIP, arithmetic, Hecke and ordinary passages; all nine source-issue locators. | `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4` |
| [BHW-ARXIV-V4](https://arxiv.org/pdf/1902.03985v4) | arXiv:1902.03985v4, PDF pp.27–31: direct comparison with the published weight/radius, subgroup order and comparison-arrow passages (E1–E6). | `8ee48970dc500f60a6409cca0e6d9feeb693071da00a8b37174776717b708dac` |
| [AIP-ADIC-2016](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf) | Author PDF pp.7–10, 15–19, 27–30 and 34–39: weight extension, modified lattice and frames, Frobenius level change and Proposition 4.8, Theorem 6.7, ordinary and cusp comparisons, torsion-line higher vanishing and operators. | `34f517fd8d02d778f16f19745f4303b3955d48646d0ce6665b88a10f6fcdebbd` |
| [AIP-CUSP-2016](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf) | Author PDF pp.14–24, 26–28 and 31–33: coefficient lines, Proposition 3.14/Remark 3.15, cusp vanishing, Banach (Pr), compactness, arithmetic descent and Appendix split toric power maps. | `1f42b2c19b9542e937b6d02c244f71c7a1ef1d15840b8fab209950227269c406` |
| [BP-HIGHER](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf) | Author PDF §§6.2–6.3, pp.147–155: algebraic and analytic induction, closed M₁ neighbourhoods and the distinct Banach/projective dual constructions. | `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae` |
| [DING-2025](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) | Published §4.2.2, pp.66–68: single-place completed coefficients, s≥1, Hecke eigenvariety and Proposition 4.14 with its BHS dependencies. Those BHS sources were not independently read; the corresponding input remains a gap. | `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba` |
| [HEUER-2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf) | Published Corollary 1.4, p.3, and Definition 3.7/Proposition 3.8 with proof and Example 3.10, pp.16–17: dense-open line effectivity, formal units and the natural map to analytic O⁺. No general unit-ball identification follows. | `1a435945b817b8081b34e490b39b43c707676d4142cb83b77493b112908cdadf` |

In Heuer the published dense-open result is **Corollary** 1.4, not Theorem 1.4;
the fresh metadata uses the correct label, leaving old reading records intact.
The BHW journal PDF has a one-page offset in the file: printed page equals the
one-based PDF page plus 1707. AIP locators use the author-PDF pagination.

All nine BHW findings were checked directly against the version of record;
E1–E6 were also compared with the corresponding arXiv v4 passages. Their
classifications and limited consequences remain appropriate:

| Finding | Independent diagnostic and consequence |
| --- | --- |
| E1 | Pullback along the printed positive-norm coordinate has the wrong t-factor; invert that coordinate. |
| E2 | A nontrivial Teichmüller character is a bounded point with all-unit deviation one; keep the pro-p diagnostic separate from AIP coordinates. |
| E3 | At p=3, κ(4)=ζ₉ contradicts the claimed radius by an accumulating kernel sequence and the value at 4³; use an existential common radius. |
| E4 | A rank-one O_F/p^m module has p^(mg) elements; retain the degree factor. |
| E5 | The Banach cusp theorem is AIP CUSP 3.16 (arithmetic 4.4), not the cited ADIC item. |
| E6 | Frame pullback sends AIP functions to perfectoid functions; the named display arrow is reversed but the isomorphism assertion survives. |
| E7 | The central kernel includes all tame-congruent units, including −7−4√3 modulo 4; norm congruence repairs the positivity-only proof. |
| E8 | Integral embedding evaluation at a ramified quadratic algebra misses (1,0); an unsplit proof is required, not a claim that the period inclusion is false. |
| E9 | The contracted-product relation changes the first period coordinate; diag(u,1)π_HT(x) descends while first projection alone does not. |

Existing atlas/supplier attribution for E7–E9 remains recorded. I inspected the
[Centre Mersenne article page](https://aif.centre-mersenne.org/articles/10.5802/aif.3560/),
[arXiv history](https://arxiv.org/abs/1902.03985),
[Heuer publication page](https://bheuer.github.io/),
[AIP ADIC publisher page](https://link.springer.com/article/10.1186/s40687-016-0076-7)
and [AIP CUSP publisher page](https://smf.emath.fr/publications/propos-des-formes-modulaires-surconvergentes-cuspidales-de-hilbert),
and title/author searches with erratum/correction for the cited BHW, AIP,
Boxer–Pilloni, Ding and Heuer papers. No correction appeared in the inspected
results. This establishes neither novelty nor absence of an erratum. No author
was contacted.

In particular, the cusp higher-vanishing proof was checked against AIP CUSP
Appendix Definition 6.1, Proposition 6.2, Lemma 6.3 and Proposition 6.4,
pp.31–33: a unit-equivariant split toric power map and an ample toric divisor
supply the argument. AIP ADIC Theorem 8.2, p.35, includes torsion-line twists,
including p-primary torsion. No finite étale trivialization or vanishing of
finite-group cohomology is used. Family q-expansions retain their coefficient
line, cusp-unit action and component coverage, separately from the classical
q-expansion theorem.

## Baseline, current upstream and ownership

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.
All 38 declarations in the reader's baseline table were read with their section
variables and typeclass assumptions. The finite/free tensor and finrank uses
have the required hypotheses. `LinearMap.det` is used in its finite-free
case; no finite-projective trace or analytic geometry is attributed to it.
The representation tensor/dual, sheaf, units, valuation, narrow-class and
module-topology interfaces likewise supply only their stated scope.

AUDIT-15's O0–O8 library coverage was read, then checked against the current
Tau Ceti tree at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and the nine
post-snapshot roadmap suggestions: AlgebraicVectorBundles,
DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory,
OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and
RealAlgebraicGeometry. Classical modular-form/slash and generic algebra APIs
are imported; none supplies the planned Hilbert analytic/Igusa/Jacquet
constructions. The completed roadmap directories named by WORKERS were also
checked for relevant suggested files. No existing upstream target was
replanned or edited.

The read-only upstream working branch was not main. I therefore read the
`origin/main` git objects at
`c4d22422c3f1aaa3d806c42f432953c26cb91969`, leaving that checkout untouched.
AdicSpaces and AlgebraicVectorBundles were read in full as two merged roadmap
models; the relevant adic Parts II–IV and AdicEtaleGeometry interfaces were
read at the same main revision. R0 gives the restricted reduced-reduction
criterion and completed tensors; R3 supplies complete continuity and finite
traces with their hypotheses; R5 supplies sousperfectoid smooth products and
actual coefficient sheaves; A1 supplies O/O⁺ on the étale site and valued
geometric points. Generic algebraic vector-bundle descent does not duplicate
the analytic coefficient construction.

The following open supplier PR heads were inspected as data, with their actual
consumed reader interfaces. Their being planned or open is not evidence of
implementation.

| Supplier PR | Read head | Consumed interfaces |
| --- | --- | --- |
| [#816](https://github.com/TauCetiProject/TauCetiRoadmap/pull/816) | `537fec2d9dc75b76b85fd4c203bc00a6a974b579` | P9.6–P9.13: tower functions, smooth coefficient products, all-open equalizers and conditional finite-rank effectivity |
| [#854](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854) | `8f2b3dabf11bae0c35974923dde7d0e97f479c53` | §§0.3, 4.1, 4.15: analytic stages, compact restriction/(Pr), completed scalar extension and common-radius universal characters |
| [#1035](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1035) | `1337958d2e3b2f68f5589ad3ef3c4ee2e71e0e10` | §§1.1–1.3, 2.1, 2.6, 2.10, 8.5: ordered completion, action, topology and the limited definite-unitary adapter |
| [#1005](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1005) | `5db7b73b405791d16da682c5f9e7c52c6b864fbf` | H1.4/7; H3.1/6/7/8; H4.8/13/15/16/17: moduli, units, ideal/Hecke transport and effective stack/free-locus torsors |
| [#1084](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1084) | `c024ddcf595ebc700814ce08c53e67b67cbf2e6f` | T3.8/10/12, T4.1–8, T5.1–4/8–12: canonical bounds, unsplit generator, periods, modified lattice and frame torsors |
| [#1085](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1085) | `21b9aa169621b507da3e0cacf76d38b09af04531` | S5.4/5/5a/6/7/8/10: three towers, mixed span, completed groups/pairing, torsors and period descent |
| [#1069](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1069) | `218de510ae5e76e447293fcacb7c9c1949f037de` | B0.2/8, B2.3, B4.12, B5.10/16–19: coefficient conventions, stabilizers, classical Hecke and line-valued expansions |
| [#1053](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1053) | `b5675ac208c9deb521a784a27908f77e09b19c73` | C3.5/6a/8, C5.22/24/26, C6.11/12/21/38/42/43/46/48: toric/formal geometry, Koecher, boundary/cusp ideals, all-prime models and maps |

LR.6's exact atlas character-variety and Jacquet-properties nodes were also
read. Their existing generic work is imported, while the extra eigenvariety
request remains explicit. The ownership boundaries are unchanged: T4/T5 own
periods/lattices/frame geometry, O5 the coefficient comparison and its
finite-character freeness problem, O6 cusp cohomology and analytic-family
expansions, P9 actual function descent, and O7 its formal-to-spectral unit-ball
problem. No notion was moved into a higher supplier or introduced as duplicate
upstream work. The atlas's older P9/R3/R5 stage IDs remain stable.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/OverconvergentAutomorphicForms--O0.json`: zero errors, zero warnings.
- Embedded `source_issues.check_issues` and `check_errata.versions_checked`: zero errors for all nine findings and seven source versions. The standalone errata-job command is not the schema validator for a blueprint packet.
- `lean-check research/blueprint/suggested/OverconvergentAutomorphicForms--O0.lean`: exit 0, 15 placeholder-proof warnings and no other diagnostics; memory admission checked before elaboration. The suggested file is unchanged. It imports Mathlib only, so this confirms elaboration at the pinned Mathlib rather than a new build or proof of geometric targets.
- Suggested-file shape: 280 lines, no placeholder data definition, four proved construction examples, no placeholder example; all 15 placeholders are named theorem proofs.
- Packet/reader agreement, full 79-entry review coverage, local dependency acyclicity, definition/construction APIs and checks, allowed-file/no-local-path intake rules, source-history preservation and `git diff --check`: passed.

No untrusted-source instruction was followed, no suspicious instruction was
encountered, and no source file or source passage was added to the repository.
The handoff records the remaining mathematics and the assembly synchronization
boundary. No second job was claimed.

## Fresh target register

The exact contracts, hypotheses, sources, APIs and tests remain in the packet
and reader. Each entry below records this review's independent assessment;
“unverifiable” identifies a stated unresolved input, not a missing prototype.

### O0

| Target | Verdict | Independent assessment |
| --- | --- | --- |
| `units-at-p` | verified | The left scalar tensor and module topology give the integral carrier and rank; finite freeness supplies compactness without a ramified embedding decomposition. |
| `norm-at-p` | verified | Multiplication determinants are continuous in finite free coordinates; determinant base change gives the global norm and its separate units restriction. |
| `principal-units` | verified | The reduction kernels, finite residue quotients and successive positive-depth p-groups justify the open finite-index and pro-p claims. |
| `geometric-weight-characters` | verified | Point characters use the correct units topology; rigid representability comes from the LR.6 compact character-variety contract. |
| `arithmetic-weight-characters` | verified | Restriction to each factor and multiplication reconstruct a continuous product character, naturally in the coefficient algebra. |
| `weight-dual-group-map` | verified | The second coordinate must be the inverse determinant norm; its pullback gives the convention used in arithmetic descent. |
| `weight-comparison` | verified | Precomposition is the claimed natural point-character map; its rigid realization remains an application of the imported representing functor. |
| `weight-comparison-formula` | verified | Evaluation yields the square of w times the inverse of t on the norm, with no exchange of the two character domains. |
| `weight-comparison-norm-factor` | verified | Cancelling the w-square gives the inverse norm factor; the algebraic power check detects the opposite sign. |
| `weight-comparison-totally-positive-units` | verified | The product over real embeddings makes the integer unit norm positive, hence one; this assertion does not identify all congruence units as positive. |
| `weight-radius-parameter` | verified | The supremum over a fixed pro-p subgroup is only a spectral boundedness diagnostic, separately from the AIP coordinate and analytic radius. |
| `continuous-character-bounded` | verified | Compact pro-p image and the compatible spectral norm give the strict bound; arbitrary equivalent Banach norms are excluded. |
| `analytic-continuation-of-bounded-weights` | verified | AIP Proposition 2.8 and the common affinoid analytic-stage interface give some radius; the disproved numerical radius is absent. |
| `bounded-weight-families` | verified | Affinoid image boundedness and smoothness of the weight base are different hypotheses; the common analytic extension is included in the data. |
| `finite-analytic-coefficients` | verified | Finite projectivity, analytic orbit maps and canonical topology are specified; neither a chosen stable lattice nor integral freeness is inferred. |
| `coefficient-tensor-dual` | verified | Diagonal tensor action and inverse contragredient action have the right order; finite projectivity controls completed scalar extension. |
| `analytic-induced-coefficients` | verified | BP uses analytic neighbourhoods of the closed subgroup M₁; its ordinary Banach dual is kept distinct from the projective distribution module. |
| `algebraic-induced-comparison` | verified | The algebraic highest-weight and dual twists match the induced realization; analytic induction contains more than polynomial functions. |
| `unitary-completed-coefficients` | verified | Ding's single varying p-place, fixed other coefficient lattices, inverse equivariance and ordered completion are retained, including s≥1. |
| `unitary-jacquet-eigenvariety` | unverifiable | The full torus and actual Hecke spectral algebra are required. LR.6's coherent Jacquet module alone does not build that algebra; the request remains open. |
| `unitary-eigenvariety-geometry` | unverifiable | Ding Proposition 4.14 states dimension n d_K and Cohen–Macaulayness of the coherent sheaf; its cited BHS local inputs were not established in this review. |
| `unitary-eigenvariety-reduced` | unverifiable | Reducedness needs the separate classical-density and local-geometry inputs listed in the gap; Cohen–Macaulayness alone does not imply it. |

### O1

| Target | Verdict | Independent assessment |
| --- | --- | --- |
| `right-automorphy-cocycle` | verified | The right cocycle and gauge identities preserve matrix order; translated inverse and noncommuting examples distinguish the convention. |
| `equivariant-coefficient-sheaf` | verified | The object is the analytic sheaf equalizer on the actual torsor, with a separately specified integral lattice and all-open descent. |
| `coefficient-descent-functoriality` | verified | Tensor, dual, gauge and pullback operations use effective descent; coarse stabilizers and integral averaging retain additional hypotheses. |
| `analytic-line-effectivity` | verified | Heuer Corollary 1.4 supplies dense-open analytic line effectivity; Proposition 3.8 has the distinct formal-unit scope, with no arbitrary-rank extension. |

### O2

| Target | Verdict | Independent assessment |
| --- | --- | --- |
| `admitted-hilbert-domain` | verified | T4's prime-dependent constants and strict odd-prime endpoints agree; the ramified level-two condition and scaled Atkin–Lehner source are explicit. |
| `hilbert-automorphy-factor` | verified | The factor cz+d is evaluated on the actual left period coordinate, with admission for both the character and its inverse. |
| `hilbert-cocycle-law` | verified | Direct matrix multiplication gives the left law; conversion to a right vector cocycle inverts the group element and coefficient. |
| `geometric-hilbert-sheaf` | verified | The independent rational equalizer uses the geometric deck group and inverse weight; its analytic line assertion uses the specified effectivity theorem. |
| `hilbert-level-radius-maps` | verified | Level forgetting and radius restriction preserve equivariance; the finite-level p-scaled source and the level-zero adapter are distinct. |
| `hilbert-algebraic-specialisation` | verified | The algebraic character recovers the supplied Hodge line with its twists; norm weights are distinguished from trivial weights. |

### O3

| Target | Verdict | Independent assessment |
| --- | --- | --- |
| `integral-hilbert-sheaf` | verified | Actual O⁺ eigenfunctions define the lattice before any freeness assertion; full-character positive-radius freeness is explicitly conditional on O5. |
| `integral-rationalisation` | verified | Quasicompact inverse-image charts give a common denominator while preserving equivariance; no commutation of integral invariants with tensor is assumed. |
| `hilbert-weight-pullback` | verified | Rational line pullback and conditional integral base change are separated, consistently with AIP CUSP Remark 3.15's finite-group obstruction. |
| `fixed-radius-hilbert-forms` | verified | Sections retain weight base, tame and wild level, radius and polarization; the definition makes no finite-rank assertion. |
| `overconvergent-hilbert-forms` | verified | The colimit runs over positive Hasse neighbourhoods approaching the ordinary locus, with its LB topology; ordinary restriction is a separate map. |
| `ramified-modified-lattice` | verified | T5 supplies the modified Igusa lattice and its estimates; the naive Hodge lattice or an integral embedding product cannot replace it. |

### O4

| Target | Verdict | Independent assessment |
| --- | --- | --- |
| `presentation-geometric-small` | verified | The small geometric inverse-weight equalizer is defined before comparison, using its own geometric cover and deck group. |
| `presentation-geometric-full` | verified | The hybrid full cover has the full Γ₀ action; it is not identified with the small-cover equalizer by definition. |
| `presentation-arithmetic-intermediate` | verified | The completed E-group and full congruence-unit central closure are used, on quotient stacks or verified coarse free loci. |
| `presentation-arithmetic-full` | verified | The effective projective deck group, determinant weight and central relation are specified before comparing arithmetic presentations. |
| `arithmetic-representatives` | verified | For every tame-congruent unit the norm is ±1 and congruent to one modulo N, hence one; continuity handles its closure without positivity. |
| `geometric-full-cover-comparison` | verified | The contracted-product span and diagonal level action yield the geometric comparison; projection alone is not a period-map descent. |
| `twisted-polarisation-action` | verified | The inverse polarization pullback with weight multiplier cancels squares and factors through the finite tame Δ(N). |
| `finite-polarisation-descent` | verified | Finite twisted invariants are formed as an actual equalizer, without dividing by the group order; coarse torsors retain freeness. |
| `weil-pairing-comparison` | verified | The inverse w(e_β) multiplier cancels the determinant and polarization laws; character values and their inverses are integral units. |
| `polarisation-class-forms` | verified | The finite indexing is by narrow classes; transport of fractional ideals uses global positive p-units rather than arbitrary local units. |
| `polarisation-choice-independence` | verified | Transport composition and trivial arithmetic positive-unit stabilizers give independence; the geometric presentation retains comparison choices. |

### O5

| Target | Verdict | Independent assessment |
| --- | --- | --- |
| `aip-independent-coefficients` | verified | The universal formal factor and finite-character factor give actual analytic eigenfunctions, without identifying O⁺ on a weight product with a formal tensor lattice. |
| `aip-translation-valuation-units` | verified | Finite-order values, including p-primary roots, and admitted analytic multipliers are units at every valuation; translation reflects integral bounds. |
| `aip-line-and-gluing` | unverifiable | A unit eigenfunction on the base would give local integral freeness. The split-cover unit does not supply it; the full-character positive-radius gap remains. |
| `geometric-aip-comparison` | verified | The frame pullback is rationally an isomorphism; valued lifting and torsor transitivity identify integral equalizers independently of their freeness. |
| `arithmetic-aip-comparison` | verified | The geometric map descends through the four actual arithmetic presentations with the inverse pairing multiplier and converted AIP weight convention. |
| `aip-comparison-naturality` | verified | Common source and target admission makes the weight, level, radius and polarization diagrams commute; finite-level scaled domains are retained. |
| `aip-torsor-structure-invariants` | verified | Étale-local splitting is distinct from an étale projection. Evaluation at the unit section and étale O/O⁺ descent give invariants on every open. |
| `finite-character-integral-generator` | verified | The split analytic product has the explicit unit eigenfunction. Full Čech descent and the annulus model prevent an inference of integral base freeness. |
| `aip-frobenius-restriction` | corrected | Replaced the unqualified same-level explanation by H_(n+1)→H′_n, its dual injection and Igusa level n+1→n; recorded normalized frame scaling and a finite-character test. |

### O6

| Target | Verdict | Independent assessment |
| --- | --- | --- |
| `hilbert-cusp-forms` | verified | Cusp forms are sections twisted by the boundary ideal, with the same arithmetic descent; Koecher extension alone cannot impose vanishing. |
| `hilbert-koecher` | verified | Higher-degree extension uses normality and the ordinary codimension condition; the elliptic cusp calculation remains separate. |
| `tame-hilbert-hecke` | verified | The coefficient isogeny precedes finite trace, with degree q+1 and normalizer q⁻¹; constants test the resulting (q+1)/q. |
| `wild-hilbert-hecke` | verified | The q-degree correspondence and determinant twist use the stated arithmetic level and radius transport; partial operators need not improve all directions. |
| `hilbert-diamond-operators` | verified | Degree-one level transport and its weight character give the diamond operator without an extra trace-degree factor. |
| `aip-hecke-equivariance` | verified | The same isogeny transports both coefficient frames before tracing, so geometric and AIP maps intertwine with their normalizers. |
| `hilbert-q-expansion-comparison` | verified | Restriction to actual completed cusp charts compares coefficient-line-valued expansions, preserving weight frames and cusp-unit transport. |
| `fixed-cusp-banach-modules` | verified | The fixed-radius arithmetic cusp module has (Pr) under the common weight and cofinal global-Hasse affinoid conditions; it need not be finite projective. |
| `compact-radius-restriction` | verified | Strictly nested admitted affinoids give finite-A-rank approximations in operator norm; equal-radius identities are correctly excluded. |
| `controlling-hilbert-operator` | verified | The product uses exponents e_𝔭, giving the p⁻ᵍ normalization and simultaneous improvement of every Hasse direction. |
| `controlling-complete-continuity` | verified | The controlling action factors through strict radius restriction followed by a bounded correspondence, so the complete-continuity ideal property applies. |
| `hecke-lattice-renormalisation` | verified | Multiplication by q_𝔭 or pᵍ clears the specified trace denominators and preserves the integral lattice; optimality is not claimed. |
| `cuspidal-coefficient-vanishing` | verified | The coefficient-sensitive vanishing uses the cusp boundary twist, cofinal neighbourhoods and formal comparison, rather than an unsupported Koecher argument. |
| `hilbert-cusp-higher-vanishing` | verified | The U-equivariant toric split-power map gives the source appendix argument; ADIC Theorem 8.2 covers torsion-line twists including p-torsion, without averaging. |
| `padic-hilbert-q-expansion` | verified | The target is completed weight-line-valued series with unit action; injectivity uses cusps meeting each relevant finite ordinary Igusa component. |

### O7

| Target | Verdict | Independent assessment |
| --- | --- | --- |
| `ordinary-completed-functions` | verified | Precision inverse limits follow level colimits on formal affine charts before sheafification; interchanging them loses completed functions. |
| `ordinary-weighted-forms` | verified | Inverse weight equivariance is imposed on the completed Igusa functions; this construction makes no Hida control assertion. |
| `igusa-completion-comparison` | unverifiable | Discrete reduced special fibres identify formal rings with unit balls. After nondiscrete scalar extension that criterion fails; the norm-completion input remains open in O7. |
| `ordinary-restriction` | verified | Admitted overconvergent sections restrict compatibly to the ordinary endpoint and completed functions; an isomorphism is not asserted. |
| `ordinary-coefficient-comparison` | unverifiable | The line comparison follows from structural completion and the unit frame cocycle, conditionally on the same O7 unit-ball input. |
| `ordinary-hecke-expansions` | verified | The restriction, expansion and Hecke diagrams preserve their frame conventions and normalization factors; no ordinary-projector theorem is inferred. |

