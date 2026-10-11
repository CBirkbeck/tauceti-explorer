# Independent review: AutomorphicCongruences L5w and L5b

**Verdict: accepted as a complete target-level planning pass.** The packet has
23 justified targets, with 9 verified and 14 corrected; none was added or left
unverifiable. Both stages remain **planned**, not closed. Its 23 supplier
requests and 7 linked gaps describe work still needed before the arithmetic
results can be treated as library theorems. Acceptance does not discharge those
contracts or certify formalization.

Review job `REV-AutomorphicCongruences--L5b`, issue #358, session
`codex-J4CWy1`, 2026-10-11. This session did none of the original blueprint
work. The checked objects are the issue-listed packet and suggested file;
this report and the handoff record the corrections and synchronization work.

| Item | Reviewed count |
| --- | ---: |
| Nodes | 23: 12 theorems, 5 applications, 5 comparisons, 1 definition |
| L5w / L5b nodes | 13 / 10 |
| Verified / corrected / added / unverifiable | 9 / 14 / 0 / 0 |
| Definition API items / discriminating tests | 5 / 4 |
| Planets | 10: 5 in each stage |
| Baseline declarations | 8: 5 Mathlib, 3 Tau Ceti |
| Public source versions checked | 8 |
| Source findings independently confirmed | 7: original E1–E5 and added E6–E7 |
| Requested supplier contracts / recorded gaps | 23 / 7 |
| Closed stages | 0 |

## Sources and source findings

The cited target results and their relevant proof steps were inspected in
public primary sources. Imported supplier statements were checked for their
actual scope; unread or unavailable supplier refinements remain explicit gaps. The packet records URLs, editions, SHA-256 hashes,
access dates and the read sections. Source passages and PDFs are absent from
the deliverables. The issue's older excerpt instruction is superseded by the
maintainer's own-words rule and PROTOCOL §5.

| Source | What was checked |
| --- | --- |
| [BCS, published IMRN copy](https://web.math.ucsb.edu/~castella/BCS-print.pdf) and [arXiv v2](https://arxiv.org/pdf/2405.00270v2) | Hypothesis 3.1.1, Theorem 3.2.1 and proof, pp.7–8 published; Lemmas 5.1.1–5.1.2, Proposition 5.2.1, Lemma 5.2.3 and Theorem 1.1.2 proof, pp.10–12. Bibliographic reference numbers were checked against pp.14–15. |
| [Wan 2015, published open PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf) | Theorems 3/8, pp.3–7; Theorem 27, p.23; period and interpolation 79–88, pp.65–71; Fourier coprimality 95/96, pp.78–81; Hecke dictionary and congruence 97, pp.81–84; polarized extension 98 and applications 100/101, pp.84–89; minimal base-change proof of 103, pp.91–92. |
| [Fujiwara v2](https://arxiv.org/pdf/math/0602606v2) | Exceptional type in §3.1 p.16, Hypothesis 5.9 and §6.2, Definition 6.11 pp.54–55, Proposition 9.8 p.83, Theorems 11.1/11.2 p.95 and Corollary 11.5 p.97. |
| [Skinner–Urban author manuscript](https://www.math.columbia.edu/~urban/eurp/MC.pdf) | Discrete coefficient and quadratic decomposition §§3.1–3.2 pp.16–25; control 3.2.8, principal-majorant specialization 3.2.9 and quotient control 3.2.11 pp.23–24; split Satake families §9.5 pp.130–132. Manuscript numbering differs from the published numbering BCS cites. |
| [CGS v1](https://arxiv.org/pdf/2303.04373v1) and [final v2](https://arxiv.org/pdf/2303.04373v2) | Analytic construction/normalization and cyclotomic product: v1 §§1.1–1.2, Definition 1.2.2, Remark 1.2.3 and Proposition 1.2.4 pp.6–8; corresponding v2 §§2.1–2.2, 2.2.2–2.2.4 pp.6–8. Its Eisenstein main-conjecture results are not imported. |
| [Kato, published Numdam scan](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | Theorem 12.5 printed pp.221–222 and §12.8 p.223 (PDF pages 106–108); ordinary rational/integral bound 17.4 and good periods 17.5 printed pp.273–274. The original packet's pp.211–213 for §12 were wrong. |

The seven findings have independent `confirmed` verdicts with reasons and
this review's job identifier in `sourceIssues`:

- **E1, Fujiwara §3.1 p.16:** the induced exceptional representation has
  reducible inertia. Inertia lies in the index-two unramified subgroup, so
  restricting induction gives two characters. Keep absolute irreducibility
  of the entire local representation; BCS H3 has the matching inertia test.
- **E2, BCS Δ p.7 versus Wan §1 p.1:** Wan requires noncontainment in the
  narrow Hilbert class field. Literal ordinary-field noncontainment is weaker.
  The strengthened Δ+ and a selected new finite ramification prime are a
  sufficient common input. This is a hypothesis-discharge gap, not a claimed
  counterexample to the BCS endpoint.
- **E3–E4, BCS p.11:** the minimal-lift and interpolation steps cite [40],
  the 2021 Heegner paper, instead of [38], Wan's 2015 Hilbert paper. The actual
  matches are Theorem 103 pp.91–92 and Proposition 84 pp.68–69 respectively.
- **E5, Wan Theorem 8 p.7:** its literally printed irreducible-inertia test
  does not exclude the induced reducible-inertia exceptional type. The packet
  verifies both tests and the actual no-exception condition. It asserts no
  counterexample to the Gorenstein conclusion.
- **E6, added, Wan §9.1.1 p.82:** the conjugate-prime polynomial repeats the
  first Hecke-family index. The two split Satake families defined on that page
  and SU §9.5.3 p.131 require exchanging the family index as well as the
  central index. The Eisenstein-ideal dictionary now uses both families.
- **E7, added, CGS v1 Remark 1.2.3 and v2 Remark 2.2.3 p.7:** substituting its
  discriminant-scaled quadratic period into the raw pullback-area identity
  introduces a square root absent from the displayed Petersson comparison.
  The corrected proof compares raw areas with degree divided by Manin constant
  squared, then tracks this discriminant and the twist-period scalar. It is a
  p-adic unit in the selected split, prime-to-p case; the up-to-unit product
  conclusion is not refuted.

Version histories, the Wan publisher page, author-hosted copies and targeted
correction searches were checked. No separately published correction was found
for these findings; the CGS v2 comparison is explicitly recorded. An absence of
search results is not treated as mathematical evidence for a finding: the
source text and the displayed algebra provide the reasons above.

## Baseline and current upstream boundaries

All eight declaration statements were independently read at the full pinned
commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The original six citations exist;
none was removed. One overstated description was narrowed, and two built
multiquadratic results were added to replace a stale roadmap import.

| Declaration | Checked scope |
| --- | --- |
| `Ideal.comap`, `Ideal.mem_comap` in Mathlib `RingTheory/Ideal/Maps.lean` | Preimage ideal and its membership characterization under any ring map. These do not establish arithmetic kernel base-change equality. |
| `Ideal.map_span`, `Ideal.map_mul` in the same module | Extension of generated ideals and products. These justify mapping the early product bound, not specializing an arbitrary characteristic divisor. |
| `Ideal.span_singleton_mul_left_unit` in Mathlib `RingTheory/Ideal/Span.lean` | Principal ideals are unchanged by multiplying a generator by a unit. The analytic comparison must establish the actual unit. |
| `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` in Tau Ceti `AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | Existing point-group equivariance. The receipt no longer claims it automatically supplies the Tate inverse limit or ordinary sublattice; these comparisons remain explicit Selmer/elliptic contracts. |
| Added `NumberField.ncard_primesOver_multiquadratic_iff` in Tau Ceti `NumberTheory/Multiquadratic/MultiquadraticSplitting.lean` | Prime splitting for a number field generated by square roots, at an odd prime avoiding the radicands, iff all Legendre symbols are one. It does not prove auxiliary-field existence. |
| Added `TauCeti.Multiquadratic.isGalois` in Tau Ceti `NumberTheory/Multiquadratic/Galois/Basic.lean` | Galois structure of the specified square-root-generated intermediate field, with two nonzero. The character/Selmer identification is still supplied by its owner. |

The reviewed library audit records L5w and L5b as unbuilt. It also records
elliptic twist geometry as existing, Hilbert Hida theory as PadicFamilies-owned
and the cyclotomic equality as an input for ModularIwasawaMainConjectures L3.
No existing construction is replanned here. The current read-only upstream
roadmaps and library were inspected, especially IHG, ProfiniteCohomology,
EllipticCurves, NumberFieldArithmetic, LocalGaloisGroups and ProfiniteArithmetic;
the atlas snapshot was not treated as current-library evidence.

Two particularly consequential upstream near misses are now explicit:
ProfiniteCohomology's Shapiro theorem uses **discrete** coefficients, and the
written IHG.6 matrix/lattice theorem is **rank two with two characters**. The
packet imports their actual ingredients. A Selmer adapter supplies discrete
p-primary/tower coefficients; the polarized rank-four three-block theorem of
Wan 98 needs an explicitly recorded extension contract. No existing upstream
roadmap is rewritten or represented as already supplying that enlargement.

## Corrections to closure and suppliers

The complete node-by-node receipts below and in the packet's `review.checked`
record every node correction. The main changes have mathematical consequences:

1. **Localize the congruence surjection.** The Hecke quotient source must be
   localized before mapping onto the DVR quotient. Global coefficient-to-Hecke
   quotient surjectivity is a different statement. A coefficient functional
   becomes a ring map only after the congruent eigenvalue relations prove
   multiplicativity. For example, `k[y]→k(y)` arising from `k[x,y]/(x)` is not
   onto before localization.
2. **Use divisorial theory over a normal Hida branch.** The read PadicMeasures
   characteristic-ideal node assumes a normal noetherian UFD and a principal
   generator. Wan's finite normal Hida branch need not be a UFD. The packet
   requests height-one divisorial lengths, multiplicativity, principal-bound
   detection and completed coefficient transport instead of applying that
   narrower node unconditionally.
3. **Specialize a principal majorant.** SU 3.2.9 takes a principal analytic
   bound containing the big characteristic divisor and gives the corresponding
   specialized bound when the element specializes nontrivially and control
   applies. It does not prove the packet's former image-of-an-arbitrary-ideal
   assertion. On the cyclotomic two-variable UFD, using a characteristic
   generator is justified separately. Tor, localization-image and local Euler
   corrections remain visible.
4. **Preserve the correct rank-four extension input.** IHG determinant
   ingredients do not produce the integral Wan 98 lattice theorem by themselves.
   All ten source conditions, including polarization, scalar Selmer term and
   local disjointness, remain required. Localization/completion does not
   automatically recover a global ideal by contraction: the source model or
   a justified primary saturation must preserve the local quotient lengths.
5. **Correct the scalar-main-conjecture owner.** The required totally real
   abelian-character bound is in the scope of IntegralIwasawaTheory I.5.
   DirichletPadicLFunctions L4 plans GL1 Eisenstein coefficient families and
   does not supply Wiles's totally real main conjecture. The new contract
   specifies the scalar-character module, local conditions and twists.
6. **Separate faithful coefficient descent from norm.** PadicMeasures
   L4/api-9 concerns restriction of scalars and its characteristic norm.
   Extension of scalars, faithful ideal contraction and the analytic unit
   comparison are separate requested statements. The integral endpoint now
   directly lists that supplier too.
7. **Use discrete Shapiro.** Restriction is applied to finite-level discrete
   p-primary coefficients and their filtered direct limit, or to the discrete
   Iwasawa coefficient with reciprocal action. The compact Tate lattice is
   retained to specify the integral arithmetic representation; it is not
   silently inserted into a discrete cohomology theorem.
8. **Correct period and source locators.** The Manin constant occurs in the
   denominator of the degree comparison. The discriminant factor in E7 is
   tracked as a unit; Kato §12 locators use printed pp.221–223. Arithmetic
   comment signatures in the suggested file were synchronized with the packet.

Every request now lists its consuming node IDs, including requests refining a
narrower existing node; every gap lists its consumers. The requests preserve
finer imports when they really apply: Selmer kernel/derived/rational control,
P7 pseudo-coherent residual Nakayama, R03.6 finite-module support base change,
Kato's qualified bounds and nonvanishing, and the cyclotomic UFD characteristic
and multiplicativity nodes. Their hypotheses are not erased. R21.4's nice-prime
Skinner–Wiles statement and R04.6's written deformation-system theorem are not
claimed to be the exact Fujiwara minimal/freeness and base-change exports.
APL's Katz and unitary doubling interfaces similarly need the precise Wan
and elliptic normalization refinements described in the requests.

## Stage targets, red-team findings, API and Lean

All targets of L5w are represented: exact minimal theorem application, canonical
and quaternionic periods, Klingen interpolation, nonconstant coefficient
primitivity, the coefficient ideal, cusp congruence, Galois extension, exceptional
height-one primes, family divisibility, arithmetic specialization, quartic-CM
export and selected-field hypothesis checks. L5b represents the integral
four-twist dictionary, quadratic Selmer decomposition, cyclotomic control,
analytic factorization, early product bound, image-condition twist stability,
four Kato inequalities, factor separation and distinct rational/integral
endpoints. No proof was split into incidental lemma nodes.

**RT-AREA-iwasawa-1/31 is satisfied in both the packet and reader:**
L5w → L5a → {L5b, HE.8b}; L5b then supplies ModularIwasawaMainConjectures L3.
Kato L4 gives an independent upper bound. BCS 5.2.1 is the early product
inequality; HE.8b and the anticyclotomic endpoint are not prerequisites.
The older atlas stage description/edge still says otherwise, so the maintainer
must reconcile it; no unauthorized atlas edit was made.

**RT-AREA-langlands-2/35 is satisfied:** general totally real R=T and freeness
stay R21.4-owned, with the exact minimal lift requested from R04.6. L5w checks
the actual local types and application hypotheses. It does not reprove Hilbert
Hida theory or a generic modularity theorem. RS-11 amendments remain unreviewed;
existing stage IDs are retained.

The one new definition is a source-indexed coefficient preimage ideal on existing
ideal theory. Its five API statements cover membership, the quotient kernel,
generator reduction, the quotient universal property under real surjectivity,
and functorial inclusion under a commuting square. An extra custom constructor
or extensionality structure would duplicate the existing ideal API. Its four
tests distinguish zero differences, multiplicity of a nonunit relation, a unit
relation and a noninjective coefficient kernel. The actual source Hecke dictionary
remains a supplier obligation, now with both corrected split families.

The suggested file has one definition, five API lemmas, four definition tests,
six explicitly labeled algebraic reductions and three further algebraic/baseline
examples. Missing arithmetic carriers and signatures are named in comments
with the exact targets and hypotheses; no Prop-valued field, fake carrier or
assumed arithmetic conclusion is introduced. Its mathematical comments were
updated together with the packet. All implementation statuses remain unchecked.
The ten retained planet names are source-based mathematical nouns/theorems,
with five per layer, below the limit of six.

## Node-by-node receipts

Node IDs below omit the common `AutomorphicCongruences:` prefix. Each verdict
checks the source, direct inputs, proof route and limits of the suppliers.

| Node | Verdict | Receipt |
| --- | --- | --- |
| `L5w/fujiwara-instance` | verified | Verified Fujiwara 6.11, 11.1/11.2/11.5 and Wan 8 against the published PDFs. Exact minimality/freeness remains requested from R21.4/R04.6; p=5 and both literal/actual exceptional-type checks are retained. |
| `L5w/canonical-period-duality` | corrected | Removed IHG.6 as a congruence-line supplier; requested the actual minimal free-module and Gorenstein pairing comparison from AC L0. Wan 79/80/82 fixes the period/projector conventions. |
| `L5w/quaternionic-period-primitivity` | verified | Verified Wan 85–87, parity, residual ramification and primitive NV2. The APL L3h Hung/Hsieh extension is explicit; nonsplit removed Euler factors can have positive mu. |
| `L5w/klingen-interpolation` | verified | Verified Wan 82/88 and ordinary lifting 27, including all cusps and degenerate indices. GU(2,2) carriers, integral normalization and boundary control are explicit suppliers rather than invented local definitions. |
| `L5w/fourier-coefficient-coprimality` | verified | Verified Wan 95/96 and the CM-character unit argument. Only primes not pulled back from the plus ring obtain a unit coefficient; exceptional primes use their separate node. |
| `L5w/eisenstein-coefficient-ideal` | corrected | Corrected the conjugate-prime Hecke-family index (new sourceIssue E6), retaining both split families. Independently verified all five algebraic API statements and four discriminating tests. |
| `L5w/height-one-congruence` | corrected | Localized the source of the surjection to the DVR quotient; distinguished it from global coefficient-quotient surjectivity. The Fourier-coefficient functional requires eigenvalue relations for multiplicativity. Normal-ring valuation input is explicitly requested. |
| `L5w/galois-selmer-instance` | corrected | Distinguished current rank-two IHG.6 from Wan 98 rank four, retained all ten source hypotheses and added the precise gap. Removed automatic global-ideal contraction after localization. Corrected the scalar main-conjecture owner to IntegralIwasawaTheory I.5 and requested divisorial/completed coefficient transport. |
| `L5w/exceptional-height-one-primes` | corrected | Verified Wan 87/101 and retained the nonsplit Euler mu terms, compact global vanishing and non-torsion zero convention. Replaced principal/UFD supplier assumptions by the required divisorial normal-ring extension. |
| `L5w/wan-family-divisibility` | corrected | Verified the visual PDF inequalities p>=5, even weight>=2, and the integral versus fractional Sigma statement. Made its characteristic ideal divisorial over the normal branch, not automatically principal. |
| `L5w/arithmetic-specialization` | corrected | Replaced an unjustified image-of-characteristic-ideal assertion by SU Corollary 3.2.9 specialization of a principal analytic majorant with nonzero specialization. Derived/local corrections and the rational-only scope of the rational-specialization supplier remain explicit. |
| `L5w/quartic-cm-divisibility` | verified | Verified BCS 3.2.1 with the full source/minimality inputs and the strengthened narrow Delta+. Primitive local, fixed integral normalization and genuine torsion are already explicit requests. This is one divisibility, not equality. |
| `L5w/selected-base-change-hypotheses` | corrected | Replaced the stale Multiquadratic roadmap import by two pinned built Galois/splitting declarations. Verified the q versus q^2 argument, n-minus=1, p=5 and minimal base change. Auxiliary-field existence and new finite ramification stay L5a-owned. |
| `L5b/four-twist-lattice-dictionary` | verified | Verified the pinned point-equivariance theorem and the integral restriction/inverse-limit/ordinary comparison obligations. The baseline receipt now expressly distinguishes the existing point theorem from the unbuilt Tate/Selmer bridge. |
| `L5b/quadratic-selmer-decomposition` | corrected | Corrected Shapiro to discrete p-primary finite-level/filtered-limit or discrete Iwasawa coefficients. Compact Tate lattices are not discrete coefficients; Selmer L2/L3 adapters and local conventions are explicit. The integral plus/minus reduction is sound for odd p. |
| `L5b/cyclotomic-control` | verified | Verified SU 3.2.8/3.2.9/3.2.11, map orientation, localization-image/Tor corrections and early Kato torsion. Here O[[T+,T-]] is a UFD, so the principal majorant may be the nonzero-specializing characteristic generator; no analogous assertion is made for a general Hida branch. |
| `L5b/cyclotomic-analytic-factorization` | corrected | Corrected degree/Manin-constant division in the proof, recorded the missing discriminant square-root factor in CGS v1 and v2 as E7, and retained its unit comparison. Replaced the restriction-of-scalars norm citation by faithful extension/base-change/contraction requests. |
| `L5b/four-factor-product-bound` | verified | Verified BCS 5.2.1 and the proof of 1.1.2: map the EARLY product inequality, apply the two correctly oriented control comparisons and analytic factorization. No anticyclotomic endpoint is imported. |
| `L5b/rank-one-image-twist` | verified | Verified the exact free rank-one quotient condition. Determinant one and the free cokernel give an integral unipotent matrix with unit parameter; squaring preserves the cokernel for odd p. Rational rank or residual surjectivity is not substituted. |
| `L5b/four-twist-kato-bound` | corrected | Corrected Kato 12.5 pagination to printed pp.221–222. Verified 17.4/17.5, rational torsion and period/image qualifications; the exact elliptic (im) integral refinement and separate CM route remain requested, not supplied by a near-miss large-image theorem. |
| `L5b/factor-separation` | corrected | Verified the nonzero principal-factor cancellation theorem and integral/rational prime distinction. Replaced api-9 norm by the precise faithful coefficient-descent request; cancellation itself requires all four individual upper bounds. |
| `L5b/rational-cyclotomic-endpoint` | corrected | Verified BCS 1.1.2(a), including p=5 and irreducibility without added surjectivity. Corrected the coefficient-descent supplier; classical/ordinary Selmer and the separate CM upper bound remain explicit. |
| `L5b/integral-cyclotomic-endpoint` | corrected | Verified BCS 1.1.2(b) on the original integral Tate lattice and the prime-(p) cancellation step. Added the direct faithful coefficient comparison request; integral upper bounds and all period/Euler comparisons are required before equality. |

## Validation and orchestration follow-through

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicCongruences--L5b.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/AutomorphicCongruences--L5b.lean`: **exit 0**, exactly **19 declaration-uses-sorry warnings**, no errors or other warnings. Available memory exceeded the required 20 GiB; the file was checked serially in the shared pinned build. This validates signatures, not the sorry proofs or the arithmetic comments.
- Additional integrity checks compare all 23 review receipts, all request/gap consumers, the definition API/test names, source SHA-256 metadata, the local prerequisite DAG, unchecked statuses and the absence of excerpt/private-path fields. `git diff --check` is clean.

There are no added nodes and no unresolved contradictory assertion in the
reviewed packet. The two planned stages deliberately end at explicit contracts
and gaps; they are not closed. The main questions for the maintainer are:

1. **Reader synchronization:** issue #358 permits only the packet, suggested
   file and report, plus the required handoff. The pre-existing reader is not
   an authorized deliverable and was not edited. Its RT order/ownership is
   correct, but synchronize L5w sections 2, 6–11 and 13, L5b sections 2, 4 and
   7–10, the supplier/closure summary and source-verification section from this
   corrected packet before packaging. In particular replace the unlocalized
   map, arbitrary characteristic-ideal specialization, rank-four IHG claim,
   Dirichlet L4 owner, coefficient-norm descent and Kato pagination.
2. **Supplier routing:** allocate the exact rank-four Wan 98 enlargement beyond
   the written upstream IHG.6 theorem, and the normal/Krull and faithful-descent
   extensions of PadicMeasures L4. Their mathematical contracts and consuming
   IDs are recorded; no second generic theory is planned here.
3. **Atlas reconciliation:** apply the confirmed /31 and /35 order/ownership
   to the older stage descriptions/edges when the maintainer reconciles the
   accepted restructuring. This review does not edit atlas data, promote the
   plan or apply the unreviewed RS-11 amendments.

The independent review job is finished. Supplier implementation, reader
synchronization and packaging are downstream programme work, not unfinished
review of these two issue-listed files.
