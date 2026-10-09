# Independent review of HodgeTateAndCanonicalSubgroups T6, round 2

**Accepted after corrections in this review.** Issue #7067; reviewer Codex,
session `codex-sCM2dJ`; 2026-10-09. This session wrote neither the original
planning pass nor its second-round revision. Input commit:
`f68373d0707f2844181139f5dcf5caac130ecc10`.

This is acceptance of a complete target-level planning pass. T6:log-sites,
T6:comparison and T6 remain **planned**, with precise remaining work. None is
closed. Every implementation status remains `unchecked`. The eleven gaps and
twelve requests below are mathematical closure work for subsequent owners;
they do not represent an unfinished step in this review.

## Input and completion of the previous review's requests

Reviewed the [packet](../packets/HodgeTateAndCanonicalSubgroups--T6.json),
[reader](../readmes/HodgeTateAndCanonicalSubgroups--T6.md),
[suggested Lean file](../suggested/HodgeTateAndCanonicalSubgroups--T6.lean),
the [first review](REV-HodgeTateAndCanonicalSubgroups--T6.md) and the
[revision handoff](../handoff/BP-HodgeTateAndCanonicalSubgroups--T6~2.md).
The revision made the reader reflect all 68 targets and the corrected supplier,
ownership and source records. It extended the continuous-derivation B-module
interface, split two-lattice filtration model, reduction modulo t, pointwise
projector and change-of-Tate-generator calculations. Those additions have
typed signatures and honest descriptions of their omitted geometric conditions.

The first review's corrections are retained: integral chart images, normal
crossings rather than unnecessarily strict normal crossings, complete continuous
derivation targets, Kummer index invertible in O, boundary-preserving root
covers, corrected ordinal covering conditions, all-integer-divisible chart
limits, properness and almost/exact distinctions, filtration completion of
structural periods, normalized residues, restricted tensor and ramified-pullback
statements, full Gᶜ coefficients and the homological Tate convention. Its six
added nodes are still present. Its historical verdict is preserved in
`reviewHistory`; the current `review` contains this session's 68 verdicts.

The independent source reading also found errors that the preceding passes
missed. All clear corrections were applied in this review to the packet,
reader and Lean catalogue, with the constructor correction also made in the
typed Lean component.

## Counts

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 68 | 68 |
| Definitions / constructions / theorems / applications | 11 / 24 / 32 / 1 | 11 / 24 / 32 / 1 |
| API entries | 246 | 247 |
| Discriminating unit tests | 126 | 130 |
| Planets | 11 | 11 |
| Baseline declarations | 9 | 9 |
| Source locator/match entries | 257 | 259 |
| Supplier requests | 11 | 12 |
| Recorded gaps | 10 | 11 |
| Source findings | 13 | 26 |
| Typed component names / all distinct packet names | 123 / 406 | 125 / 411 |

There are 56 verified and 12 corrected nodes, including one prose-only
correction. No node was added or removed, and no node is `unverifiable`.
The node budget and target granularity are preserved. Every definition and
construction still has at least three discriminating tests. The 11 planets
remain key definitions or central named constructions/theorems; they use
mathematical names, remain within the per-stage budget and introduce no new
ownership claim.

## Sources and access

The three source files were fetched again from their public primary locations:

- DLLZ-adic, [Logarithmic adic spaces: some foundational results](https://www.kwlan.org/articles/log-adic.pdf),
  100-page author copy, arXiv:1912.09836v2 final-version record. Checked the
  target-relevant definitions, statements and proof inputs in §§2–6.
- DLLZ-RH, [Logarithmic Riemann–Hilbert correspondences for rigid varieties](https://www.kwlan.org/articles/log-RH.pdf),
  80-page author copy, arXiv:1803.05786v4 final-version record. Checked §§2–3,
  §§5.2–5.6 and the needed Appendix A decompletion statements and applications.
- Boxer–Pilloni, [Higher Coleman theory](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf),
  180-page author manuscript. Checked §4.4.38, Remark 4.4.39 and following
  finite-level statements, pp. 79–80; §4.4.8, p. 68; §4.4.23, p. 74; §4.0,
  p. 49; Theorem 4.4.40 and §4.6.1 as ownership boundaries.

All three SHA-256 hashes exactly match the full hashes in the packet and reader.
Printed page numbers equal PDF page numbers in these copies. All 259 current
locator/match entries have been checked at their locators. This does not claim
to have read every unrelated theorem or proof in these papers. Selected pages
with problematic signs, tensor factors, indices and domains were also inspected
as rendered PDF pages, including DLLZ-adic pp. 27, 30, 36, 38–39 and DLLZ-RH
pp. 10, 40, 75.

The published Springer chapter and AMS journal bodies could not be obtained
through their publisher pages. Their text was **not collated**. All findings
are explicitly against the hashed author copies, including findings that
change a statement. The records do not accuse a publisher version of containing
an unobserved error. Searches checked the authors' publication page, arXiv
version histories, publisher correction/metadata pages and existing repository
source-issue records. No existing correction for E14–E26 was located.

No restricted book was used. In particular, no alternative copy of Huber (1996)
or Bruns–Gubeladze (2009) was read. The false raw-plus claim is checked by an
explicit independent counterexample; inaccessible external results remain
precise proof inputs in the packet's requests/gaps. All new prose states results
in our own words, with theorem, section and page locators. There are no source
passages, PDF files or extracted source texts in the deliverables.

## Corrections made here

**Monoid-chart plus ring.** DLLZ-adic Lemma 2.2.11, pp. 9–10, asserts that raw
R⁺[P] is integrally closed for arbitrary P. For R=Q₂, R⁺=Z₂ and P=C₂ with
u²=1, e=(1+u)/2 is idempotent and hence integral over Z₂[C₂], but its
coefficients 1/2 do not lie in Z₂. C₂ is an fs monoid, so the fs restriction
does not fix this. The plus ring is now the integral closure of raw R⁺[P]
inside R[P], with the corresponding completed integral ring. A bounded valuation
on the raw subring is bounded on its integral closure; the Spa and rational
subsets are unchanged. This replaces the source's invalid normality argument.
Added `MonoidAlgebraLog.plus` to the API and `torsion_units` to the tests. The
typed component constructs the actual integral closure and its Q/Z algebraic
counterexample, while explicitly omitting the Huber topology from that model.

**Differential proof signs and adjunctions.** With d(b)=b⊗1−1⊗b and
δ(n)=eⁿ−1, the square-zero lift is b₁⊗b₂↦(b₁b₂,b₂d(b₁)), not the
source's b₁d(b₂). It then sends the universal d to d and satisfies dβ=βδ.
Added the coordinate `diagonal_sign` test. R0's opposite diagonal convention
is identified by negating that generator. Formal unramifiedness gives
injective restriction on derivations, hence zero relative derivations and
zero relative differentials; it does not give the surjectivity used in the
source proof. The scalar-extension adjunction has no extra tensor on a target
already carrying its B′-module structure. Chart generators map to monoid
elements tᵢ, with δ(tᵢ) a differential basis. These repairs are E15–E18.

**Uniform strictification.** Lemma 4.2.5, pp. 49–50, needs quasi-compact Y,
or an explicit uniform exponent bound. A log disc over C_p with Y the disjoint
union of all prime-degree root discs has no common strictifying root level:
given n, choose q not dividing n, and boundary index q survives saturated
pullback. The statement, API, hypotheses and proof now have the extra condition,
with `no_uniform_noncompact` as a test. Finite Y→X already meets it. The finite
covering-refinement theorem is retained by first choosing finitely many
quasi-compact chart domains with jointly surjective open images (E19).

**Coherent Kummer acyclicity.** The action in Theorem 4.3.7(2), proof p. 56,
is by the diagonalizable dual G^D. After adjoining μ_n it is the constant group
Hom(G,μ_n); averaging and strict-étale-stalk descent give the vanishing. The
source's character group G is not silently regarded as that acting group (E20).

**Completed log sheaves and tilt.** Proposition 5.4.2, pp. 78–79, is restricted
to the qcqs basis for its sectionwise filtered colimit. On a countable disjoint
union of log discs, with the common i!-root level at stage i, component j can
have exponent 1/j! in the limit sheaf without a common finite descent level.
Added `noncompact_sections` and the D0 coherent-site colimit prerequisite (E21).
The Frobenius limit modulo p is a characteristic-p ring; the power-map limit
of characteristic-zero sections is a multiplicative carrier with tilt addition.
Sharp is multiplicative. Exact quotients of completed sections are separated
from the almost comparison with sections of a quotient sheaf. The exact tilted
sections argument no longer infers an exact modulo-p Čech equalizer merely
from p-torsionfreeness and sheafness (E26).

**Arithmetic descent.** Lemma 3.3.17, pp. 31–32, chooses K=k̂∞ for the
Galois-invariant computation. The packet's formula with Gal(K/k) for arbitrary
perfectoid K has been narrowed to that choice, including its API and proof.
The arithmetic pushforward remains intrinsic, and general perfectoid K remains
available for the geometric RH coefficient extension. This was a packet error;
it is not attributed to the source.

**Two lattices and completion.** The horizontal frame is first built in the
positive formal-series model and then extended through localization and the
additional filtration completion. No equality
OB_dR,log=OB⁺_dR,log[1/t] is used. The two lattices retain their separate
t-adic filtrations and the image/intersection HT formula. Untwisted Poincaré
exactness does not provide a coefficient horizontal frame: a precise coefficient
formal-trivialization request/gap has been added to P8:local-rational, including
compatibility with filtration completion. The lattice-filtration node also
loses obsolete source-quotation wording; its mathematics is unchanged.

**Hodge-type algebraization.** DLLZ-RH Lemma 5.5.3, proof p. 63, uses full
faithfulness of analytification for regular algebraic connections, citing
AB01 Ch. 4, Cor. 6.8.2 and ABC20 Cor. 34.6.2. Proper GAGA on the open Shimura
variety is not this input. The proof was corrected and the precise external
theorem added to the existing external-input gap. The dual H₁ convention,
special-point normalization and tensor-summand comparison remain as before.

The structural positive-period statement also now explicitly requires perfect
residue field κ, already present in its hypotheses and needed for the W(κ)
maps. The hypothetical CM cycle description is refined to include R28.3 in
the actual dependency path.

## Independent source-issue verdicts

E1–E13 were rechecked at their locators. All are confirmed: missing properness
in p-adic finiteness; the completeness hypothesis; the higher-direct-image Tate
twist; perfectoid toric base and residue-p proof hypotheses; completed tensor;
O_Z in local pushforward; the cyclotomic decompletion coefficient base; residue
field/Tate-descent coefficients; perfect κ for the structural construction;
the residue pullback subscript; F in the regularity proof; and BP's first-lattice
period symbol/second-lattice notation. Their old verdicts are retained in
`reviewHistory`, with this job named as the current independent reviewer.

The new entries are the following; full arguments, copy hashes and searches are
in the packet and reader. Seven findings are errors, seven are gaps and twelve
are misprints across all 26 entries.

| Finding | Public-copy locator | Correction / reach |
| --- | --- | --- |
| E14 | DLLZ-adic Lemma 2.2.11, pp. 9–10 | Integral closure of raw plus; changes the stated pair. |
| E15 | DLLZ-adic Proposition 3.2.9 proof, p. 27 | Correct square-zero lift sign; proof. |
| E16 | DLLZ-adic Theorem 3.2.18(3) proof, p. 30 | Injective derivation restriction under unramifiedness; proof. |
| E17 | DLLZ-adic Proposition 3.3.7 proof, p. 36 | Remove extra tensor from restriction adjunction; proof. |
| E18 | DLLZ-adic Proposition 3.3.16 proof, pp. 38–39 | Monoid chart generators, log qualifier, relative comparison; notation. |
| E19 | DLLZ-adic Lemma 4.2.5, pp. 49–50 | Quasi-compactness/uniform exponents; stated result. |
| E20 | DLLZ-adic Theorem 4.3.7(2) proof, p. 56 | Character-dual action after roots of unity; proof gap. |
| E21 | DLLZ-adic Proposition 5.4.2, pp. 78–79 | Qcqs section formula, descent elsewhere; stated result. |
| E22 | DLLZ-RH abbreviated definitions, p. 10 | Strictness plus underlying étaleness; definition typo. |
| E23 | DLLZ-RH Lemma 3.5.9, p. 40 | Source Z for the complex, rather than target Z′; domain typo. |
| E24 | DLLZ-RH Appendix A.2.3, p. 75 | m-indexed systems for fixed r; index typo. |
| E25 | DLLZ-RH Theorem A.2.3.4, p. 75 | Γ₁ is the geometric acting group; group typo. |
| E26 | DLLZ-adic Theorem 5.4.3(4) proof, p. 80 | Completed power-map limit or tilted descent; proof gap, theorem retained. |

## Pinned baseline and library audit

Read the actual nine declarations and surrounding assumptions at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, rather than only the name index.
No baseline citation was removed or replaced.

| Declaration | Confirmed interface and limit |
| --- | --- |
| `TauCeti.Huber.Pair` | Open integrally closed plus subring contained in power-bounded elements; not bundled log geometry. |
| `TauCeti.Huber.Pair.Hom` | Continuous ring map preserving the plus rings. |
| `TauCeti.Huber.Pair.Hom.spaComap` | Continuous contravariant Spa map for pairs; not a morphism of log sites. |
| `CategoryTheory.GrothendieckTopology` | Generic covering-sieve topology axioms. |
| `CategoryTheory.Sheaf` | The full subcategory of presheaves satisfying the sheaf condition. |
| `Derivation` | R-linear Leibniz map; continuity is extra analytic data. |
| `AdicCompletion` | Inverse limit modulo Iⁿ; not a Banach completed tensor or a general completeness theorem. |
| `BDeRhamPlus` | Kernel-adic period carrier with prime/nonunit-p/p-adic-completeness assumptions; no sheaf, DVR or principal-kernel theorem. |
| `fontaineThetaInvertP` | Fontaine map after p-inversion under its stated assumptions. |

The reviewed `data/library-coverage.json` has no direct T6 record. Its neighbouring
HodgeTate duplicate findings concern T0–T5. This packet imports their results
and generic log algebra; it neither redefines them as missing nor treats an
existing affine carrier as the whole geometric target. The three baseline
records not used as direct prerequisites describe a verified boundary and do
not conceal a proof assumption.

## Supplier closure, ownership and red-team findings

Read the statements of all **91 distinct concrete direct external suppliers**.
All resolve uniquely, with 144 concrete external prerequisite occurrences in
the corrected packet. The scope checks distinguish generic sites from analytic
geometry, scheme log algebra from ringed-site log algebra, finite projective
descent from coherent descent, and replete-topos machinery from basis-acyclicity
derived limits. Near misses are recorded as precise requests or gaps.

The twelve requests are directed to R0, R3, CR.5:log-algebra, H0, E1, E2, P8,
ALS.1, V8.general, T1, T2 and now P8:local-rational. The last request asks for
formal horizontal trivialization of an integrable coefficient connection on
B_dR⁺[[y₁,…,y_d]] and compatibility after filtration completion. The existing
P8 untwisted formal Poincaré node does not state this coefficient result.

The eleven gaps concern the proposed early ordinary primitive owner; analytic
normalization/root extraction/bounded extension/rigid resolution; general
Banach decompletion; arithmetic rigidity/congruence; Shimura embeddings/descent;
CM special-point comparison; basis-acyclicity derived limits; the unaccepted
Liu–Zhu ordinary RH owner; external analytic/regular-singular/relative-finiteness
inputs (now including regular-connection analytification); published-source
collation; and the new coefficient formal-trivialization input. Each names its
actual consumers. Requests do not count as available theorems or closed stages.

The concrete-node graph reachable from the 68 targets has **801 nodes and no
cycle**. The 37 distinct cross-stage supplier pairs reverse no path in the
atlas's stage graph. Seven missing ancestry pairs are already named in the
dependency-line restructuring: A4, R3, H0, P0, P1 and P3 into log-sites, and
ALS.1 into comparison. No comparison, P8 or CP.3 node is a local ancestor of
log-sites. No MC.7 input was added. This is a scoped graph check, not an assertion
that every unrelated proposed roadmap in the repository has an acyclic graph.

The refused MC.7 supplier has a concrete reverse path once recorded packet
dependencies are included: T6:comparison → B5 → C5 → PEL M6 → R28.1 → R28.3
→ R28.4 → MC.7. Adding MC.7 → T6:comparison would close that cycle. The CM
inputs therefore need an early owner independent of T6.

The three confirmed red-team findings were checked against their findings,
reviews, fix record and the source/route boundaries:

1. **RT-AREA-padic-1/4:** BP Theorem 4.4.40, p. 80, is the infinite-level
   toroidal diamond/period-map theorem and belongs to PerfectoidShimuraVarieties
   S6. T6 exports the finite-level canonical flag and Levi comparison only.
2. **/23:** BCGP-25 Theorem 4.4.1 usual/cuspidal comparisons belong to TC.2;
   analytic variants belong to higher Hida/Coleman route 22. The old route 23
   still needs its separate authorized edit. The packet's routing ledger
   reports that situation and asserts no such theorem as a local T6 target.
3. **/24:** The decided P8:primitive comes **after P8:local-rational**. It is
   not yet an atlas stage. Current P8 requests are retained until exact exports
   exist; the six log primitive targets are proposed for T6:log-primitive.
   Log-sites has no primitive-comparison input. The comparison-specific P8
   citation is not a log-sites dependency or a cycle through CP.3.

The same ownership separation is present in the reader. No atlas stage,
source-route file, other packet or upstream roadmap was edited.

## Suggested Lean and validation

`lean-check research/blueprint/suggested/HodgeTateAndCanonicalSubgroups--T6.lean`
exited **0**, with **131 warnings, all declaration uses `sorry`**. Available
memory was 102 GB before checking. Only one elaboration was run, through the
shared wrapper, with no language server, library build, update or cache fetch.
The shared Mathlib checkout has the exact pinned commit; its imported
TauCeti Huber Pair module is identical to the Tau Ceti pin. The nine cited
declarations were separately read at the exact pins.

Typed components cover **125 of 411 distinct packet names**: 20 of 68 node
names, 50 of 213 API names excluding names shared with nodes, and 55 of 130
tests. The other 286 names are explicit full-signature omissions in the
catalogue. No full geometric theorem node is claimed typed. Missing adic/log
site and structural-period carriers are not replaced by uninterpreted Prop
fields or assumed comparison conclusions. The file states the components it
can express with existing carriers; the full mathematical contracts and exact
supplier needs remain in the packet/reader. This limitation is visible at each
omitted signature and accepted under the protocol's honest-omission rule.

The new `MonoidAlgebraLog.plus` typed API constructs an integral closure rather
than a raw ring-hom range. Its new counterexample checks the idempotent, failure
of raw membership and membership in the corrected plus ring. The geometric
noncompact tests remain catalogue contracts, since their site carriers are not
yet available. No component calculation is counted as geometric descent.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeTateAndCanonicalSubgroups--T6.json`:
  zero errors and zero warnings.
- Field-by-field reader parity: all statements, hypotheses, proof routes,
  acceptance checks, API/test contracts, prerequisites, source locators/matches,
  uses and library placements for all 68 nodes; all requests, gaps and source
  findings. Zero omissions.
- Lean catalogue parity for every declaration/API/test contract and its
  prerequisites/hypotheses/locators; generation is idempotent.
- Exact 68-node current verdict coverage; all 26 source findings attributed
  to this independent review; historical reviews retained.
- Graph checks, three source hashes, nine pinned baseline statements and the
  supplier/ownership audit described above.
- `git diff --check`; only the four authorized deliverables and this review's
  handoff changed. No private paths or source excerpts were introduced.

## Work for the orchestrator and subsequent owners

There is no permission question or editing blocker for this review. Remaining
programme work is concrete and already represented by the packet:

1. Adopt the decided ordinary/log primitive substages and dependency-line
   restructuring, then retarget current coarse requests to exact exports.
2. Settle PAPER-LIU-ZHU-17 route 8 and the ordinary RH/rigidity owner before
   claiming those proof inputs closed.
3. Assign the early CM comparison package an owner independent of T6, and
   close the analytic, decompletion, rigidity, embedding and derived-limit
   requests at their stated generality.
4. Add the coefficient formal-trivialization result at P8:local-rational and
   an owner/interface for regular-connection analytification; neither is
   supplied by the neighbouring untwisted Poincaré/proper-GAGA statements.
5. Collate source findings against accessible publisher bodies. Retain the
   public-copy scope until that evidence is available.
6. Replace whole-stage T6:comparison consumer citations with the exact
   finite-level exports. B5's compact-support request needs the separate
   Lan–Liu–Zhu source, arXiv:1912.13030, at its owner.

## Per-node verdicts

The table below is the current review record, not inherited attribution.
Sources name the public copies above; page numbers are printed page numbers.

| Node | Verdict | Independent check / correction |
| --- | --- | --- |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space` | verified | DLLZ-adic Definition 2.2.2, pp. 8–9: the unit fibre, logification, characteristic and logified pullback agree. The analytic A1 specialization is explicit; CR.5 ringed-site generalization stays a request. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space` | corrected | DLLZ-adic Lemma 2.2.11, pp. 9–10: corrected the raw plus subring to its integral closure (E14). The Q₂/Z₂ torsion-unit idempotent distinguishes the two; topology, bounded valuations and rational subsets remain the intended ones. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart` | verified | DLLZ-adic Definition 2.3.1 and Propositions 2.3.11–2.3.22, pp. 13–18: integral structural image, étale-local fine/fs charts and characteristic-stalk comparison are retained. A monoid with finite generators alone does not define an fs sheaf. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log` | verified | DLLZ-adic Examples 2.3.16–2.3.17, pp. 16–17: normal crossings may have self-intersecting global components; the additional strict hypothesis is used only for global component residues. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products` | verified | DLLZ-adic Propositions 2.3.23, 2.3.27 and 2.3.32, pp. 18–20: saturated analytic products can change the underlying space. Generic saturation is imported from CR.5, and coherent analytic descent remains an R3 request. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion` | verified | DLLZ-adic Definition 3.1.1 and Propositions 3.1.3–3.1.10, pp. 21–25: the groupification torsion is inverted in O, the comparison map is ordinary étale, and the integral chart restriction is kept. The RH abbreviated strictness typo is E22. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation` | verified | DLLZ-adic Definitions 3.2.1–3.2.2, p. 26: d is continuous into a complete Hausdorff module, δ is relative-zero, and dβ=βδ. The typed B-module and continuous-derivation projection express these affine conditions. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-differentials` | corrected | DLLZ-adic Proposition 3.2.9, p. 27: corrected the square-zero lift to b₂d(b₁), matching b⊗1−1⊗b (E15), and identified the opposite R0 convention by a sign. Formal unramifiedness uses injective restriction and zero relative derivations (E16). |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent` | corrected | DLLZ-adic Proposition 3.3.7 and Proposition 3.3.16, pp. 35–39: removed the proof’s extra scalar extension from the adjunction (E17); chart generators lie in the monoid, with their δ-images a basis (E18). Transitivity retains smooth splitting and the unramified zero quotient. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham` | verified | DLLZ-adic Definition 3.3.19, p. 40, and DLLZ-RH (3.4.1), p. 33: exterior algebra, differential square-zero, filtered connections and coordinate residues have the intended sign. Residue sends dlog T to 1 and dT to 0. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism` | verified | DLLZ-adic Definition 4.1.2 and Lemma 4.1.13, pp. 41, 45: Kummer plus log étale is checked on characteristic stalks, with index invertible in O. Boundary points and the ordinary finite étale special case remain present. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers` | corrected | DLLZ-adic Lemmas 4.2.5–4.2.6, pp. 49–50: added quasi-compactness of Y for a single strictifying root level (E19). Finite covers already satisfy it; finitely indexed covering refinement uses a finite quasi-compact chart refinement. The diagonalizable action is kept. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-ramification-index` | verified | DLLZ-adic Definition 4.1.12, p. 44: the index is a finite characteristic-group index, independent of the chart. The multiplier test is confined to the boundary and composition multiplies indices. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site` | verified | DLLZ-adic Definition 4.1.16 and Propositions 4.3.4–4.3.5, pp. 46–54: representable sheaves, structure sheaves, stalks and projections agree. Covers are jointly surjective, without discarding boundary points. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-coherent-acyclicity` | corrected | DLLZ-adic Theorem 4.3.7, pp. 55–56: coherent and étale-coherent cases remain distinct. Corrected the averaging proof to use the character-dual group after adjoining roots of unity, with strict-stalk descent (E20). |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent` | verified | DLLZ-adic Propositions 4.2.7–4.2.8 and Theorems 4.4.12, 4.4.15, pp. 50–63: finite Kummer descent and finite-coefficient local systems have the stated conditions. They do not assert arbitrary nonfinite coherent descent. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-higher-direct-images` | verified | DLLZ-adic Lemma 4.4.29, p. 65: the exterior characteristic-group formula keeps the negative Tate twist corrected in E3. The affine/stalk exterior-power model does not claim the geometric comparison. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar` | verified | DLLZ-adic Proposition 4.2.1 and Lemmas 4.2.2–4.2.3, pp. 47–48: the ramified boundary is retained. Analytic normalization, small-radius root extraction and bounded-function extension are precise proof inputs, not supplied by ordinary algebraic normalization. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension` | verified | DLLZ-adic Theorem 4.6.1 and Lemma 4.6.2, pp. 68–69: finite local systems extend across the normal-crossings boundary without properness. Algebraic/analytic étale comparison and log purity are recorded external gaps. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations` | verified | DLLZ-adic Definition 5.1.1 and Lemma 5.1.4, pp. 70–71: inverse-limit presentations are distinguished from associated completed spaces. Eventual finite transitions and the relevant quasi-compact conditions agree with the source. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/corrected-pro-kummer-covers` | verified | DLLZ-adic Definition 5.1.2(3), p. 70: the ordinal successor-to-earlier-limit condition is retained together with eventual finite surjectivity and joint topological surjectivity. The corrected ordinary pro-étale topology is cited as a model, not treated as the log proof. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site` | verified | DLLZ-adic Proposition 5.1.5 and Definition 5.1.9, pp. 71–73: the site uses the corrected covers and its actual morphisms. Generic site/category infrastructure is imported; it does not supply the Kummer geometry. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections` | verified | DLLZ-adic Propositions 5.1.6–5.2.1, pp. 72–73: projection, exact inverse image and cohomological descent have the required finite-presentation setting. Their supplier uses are separated from higher derived-limit acyclicity. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower` | verified | DLLZ-adic Lemma 5.3.4, p. 75, and DLLZ-RH §2.3, p. 15: the all-integer root tower has a divisible chart limit and both geometric and cyclotomic actions. A p-power-only chart is not substituted for this tower. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid` | verified | DLLZ-adic Definition 5.3.1 and Lemma 5.3.8, pp. 74–76: the associated perfectoid pair and an all-root presentation are distinct data. The eventual finite Kummer maps become étale after completion under the divisibility hypotheses. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis` | verified | DLLZ-adic Propositions 5.3.11–5.3.13, pp. 77–78: log affinoid perfectoids form a basis and the required maps can be strictified. The proof uses local bounded finite charts, without requiring every site object to be quasi-compact. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves` | corrected | DLLZ-adic Definition 5.4.1 and Proposition 5.4.2, pp. 78–79: separated the characteristic-p ring limit from the characteristic-zero multiplicative limit, restricted the sectionwise monoid colimit to the qcqs basis (E21), and distinguished quotient-sheaf sections from quotienting sections. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity` | corrected | DLLZ-adic Theorems 5.4.3–5.4.4, pp. 79–80: kept almost integral acyclicity and exact rational/projective descent separate. Replaced the unjustified exact modulo-p equalizer step by the completed power-map limit or tilted descent (E26); the precise derived-limit request remains open. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems` | verified | DLLZ-adic Definition 6.3.1, p. 88: finite-level locally constant Z/pⁿ-modules and their compatible inverse system define the Kummer Z_p-system. Torsion is allowed; no automatic locally free Z_p condition is inserted. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems` | verified | DLLZ-adic Lemmas 6.3.3 and 6.3.6, pp. 88–89: inverse-limit completion, torsion reduction and pullback are properly distinguished. The needed basis-acyclicity derived-limit statement is requested instead of assuming repleteness. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy` | verified | DLLZ-adic Definition 6.3.7 and Lemma 6.3.11, pp. 89–90: geometric boundary monodromy uses the algebraic-closure tower and does not impose arithmetic unipotence. It supplies exactly the later tensor and residue-zero restrictions. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology` | verified | DLLZ-adic Proposition 6.1.1 and Lemma 6.1.7, pp. 81–83: perfectoid base and residue characteristic p are retained, fixing E4. The almost cohomology estimates distinguish the integral toric cases. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness` | verified | DLLZ-adic Theorem 6.2.1(1) and Lemma 6.2.4, pp. 85–86: proper log smoothness and characteristic-zero/residue-p hypotheses are explicit. The ordinary primitive input stays a precise P8 request pending its adopted substage. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison` | verified | DLLZ-adic Theorem 6.2.1(2), pp. 85–87: the coefficient tensor comparison is almost and requires the proper log-smooth setting. The red-team decision places its six-target prefix in proposed T6:log-primitive after the ordinary P8 primitive export. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing` | verified | DLLZ-adic Theorem 6.2.1 and Corollary 6.2.3, p. 85: cohomological finiteness/vanishing keeps properness and residue-p assumptions; Remark 6.2.2 gives the nonproper counterexample. Rigid resolution and compactification are a gap rather than an algebraic-resolution import. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology` | verified | DLLZ-adic Corollary 6.3.4, p. 88: extension is separate from proper p-adic cohomological finiteness (E1). Derived completion and the mod-p inverse-limit controls remain explicit proof inputs, not an inference from finite generation at each level alone. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/kummer-proper-pushforward-local-systems` | verified | DLLZ-adic Corollary 6.3.5, p. 89: proper log smooth pushforward and restriction to the interior agree. The SW20 relative finiteness input is recorded; ordinary finite étale descent is not used as its substitute. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods` | verified | DLLZ-RH Definition 2.2.3 and Proposition 2.2.4, p. 12: the ordinary period sheaves, theta map and local primitive generator have the intended coefficient assumptions. The pinned BDeRhamPlus carrier alone supplies no sheaf/DVR theorem. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus` | corrected | DLLZ-RH (2.2.8)–Definition 2.2.10, p. 13: made the perfect residue-field hypothesis explicit in the statement (E10). The completed/logified monoid presentation and relative W(κ)-algebra maps retain their coefficient assumptions. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete` | verified | DLLZ-RH Definition 2.2.10(3) and Remark 2.2.11, p. 13: structural B_dR,log is the additional filtration completion after inverting t. Even the trivial-log case does not justify identifying it with the localization alone. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection` | verified | DLLZ-RH (2.2.13)–(2.2.17), p. 14: continuous connection extends ordinary d and dlog, kills t and satisfies Griffiths transversality. The divided structural directions are kept distinct from the constant periods. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model` | verified | DLLZ-RH Proposition 2.3.15 and Corollaries 2.3.17, 2.3.20, pp. 18–20: the positive toric formal-series model and completed/integral variants match. The local chart action uses the actual geometric character group. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare` | verified | DLLZ-RH Corollaries 2.4.2 and 2.4.6, pp. 20–21: positive and completed Poincaré complexes are separated; the completed tensor from E6 is retained. This theorem gives untwisted exactness, not an assumed coefficient horizontal frame. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-faltings-extension` | verified | DLLZ-RH Corollary 2.4.5, p. 21: the Faltings extension has the Tate twist and specified horizontal scalars. A splitting is stated only after the local toric choice, not as a global canonical splitting. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves` | verified | DLLZ-RH Definition 3.1.1 and Lemma 3.1.4, pp. 22–23: Banach coefficient sheaves and scalar-completed tensors are explicit. Their coherent étale descent is an R3 request beyond finite-projective descent. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection` | verified | DLLZ-RH Definition 3.1.7 and Lemmas 3.1.8–3.1.9, p. 24: Griffiths transversality, completion after localization and Higgs reduction are retained. Generic modules with an arbitrary map are not asserted to be geometric connections. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion` | verified | DLLZ-RH Appendix A.2.1.2, A.2.2.3, A.2.3.4, pp. 73–76: logarithmic tower instances use the correct coefficient base (E8), m-indexed systems (E24) and geometric Γ₁ (E25). General Banach/Tate–Sen decompletion remains a separate supplier gap. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward` | verified | DLLZ-RH Proposition 3.3.3 and Lemmas 3.3.15–3.3.16, pp. 28–31: O_Z is the tensor target (E7). Degree-zero coherence and higher acyclicity on the local log tower are supplied through decompletion, not inferred from arbitrary pushforward. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert` | verified | DLLZ-RH Theorem 3.2.3(1) and §3.3, pp. 25, 27–28: RH_log is a degree-zero filtered pushforward with connection. The ordinary Liu–Zhu restriction is not silently attributed to P8; its owner is still a recorded gap. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor` | verified | DLLZ-RH Theorem 3.2.4 and Lemma 3.1.9, pp. 24–26: the Higgs functor is the graded period construction with the stated twist and base change. Its geometric Higgs field is not replaced by an arbitrary linear endomorphism. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension` | verified | DLLZ-RH Propositions 3.4.16–3.4.17, p. 37: regularity/local freeness and normalized extension uniqueness apply to the torsion-free module F (E12). The regular-singular analytic theorem remains an external proof input. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues` | verified | DLLZ-RH Lemma 3.4.7 and proof of Theorem 3.2.12, pp. 35, 38: t⁻¹log of geometric monodromy gives rational eigenvalues in [0,1), and zero under unipotence. The normalization is not unconditional tensor compatibility. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham` | corrected | DLLZ-RH Lemma 3.3.17, pp. 31–32: restricted the Galois-invariant description to K=k̂∞. The intrinsic arithmetic pushforward and general geometric coefficient extension remain valid; filtered adjunction and de Rham rank use Lemma 3.4.18 and Corollary 3.4.21, p. 38. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback` | verified | DLLZ-RH Theorem 3.2.3(4) and Corollary 3.5.7, pp. 25, 39–40: pullback isomorphisms retain the boundary multiplicity hypothesis. The source residue typo is corrected in E11; arbitrary ramified pullback is not asserted. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor` | verified | DLLZ-RH Theorem 3.2.12, pp. 27, 38–39: tensor/pullback compatibility is restricted to unipotent geometric monodromy. The proof order imports pullback rather than creating the earlier reversed dependency. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology` | verified | DLLZ-RH Theorems 3.2.3(3), 3.2.7(3) and Lemma 3.6.1, pp. 25–26, 41–42: all proper period-cohomology conclusions keep properness, including the arithmetic comparison. The complex used for proper pushforward lies on the source (E23). |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/relative-log-comparison` | verified | DLLZ-RH Theorem 3.2.7(5) and Corollary 3.5.14, pp. 26–27, 41: relative filtered comparison has the proper smooth/log-smooth and interior de Rham hypotheses. Gauss–Manin residue normalization and the projection formula have explicit supplier requests/gaps. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations` | verified | DLLZ-RH Proposition 5.2.10 and Proposition 5.2.17, pp. 54–56: full Gᶜ representations give the canonical étale and algebraic log de Rham realizations, with Hecke change of level. An arbitrary Levi representation does not define this full-group local system. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison` | verified | DLLZ-RH Propositions 5.4.1 and 5.4.4, pp. 58–60: the special-point comparison is a normalized tensor-compatible isomorphism. CM Hodge tensors, potential good reduction and descent are explicit gaps; MC.7 is rejected as a circular supplier. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy` | verified | DLLZ-RH Propositions 5.4.5, 5.5.9 and Lemma 5.6.7, pp. 61–66: rigidity recognizes the arithmetic monodromy for general data. The exact density/superrigidity/congruence and embedding hypotheses remain ALS.1/V8.general requests. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison` | verified | DLLZ-RH Theorem 5.3.1, p. 56, and BP §4.4.38, p. 79: association follows through the special-point and arithmetic-recognition nodes, not from a hypothetical general Shimura motive. Boundary extension uses the unipotent canonical coefficients. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices` | corrected | BP Remark 4.4.39 and following text, p. 79: corrected the horizontal-frame proof to extend through filtration completion, retaining the two separate t-adic lattices. Added the coefficient formal-trivialization request to P8:local-rational; untwisted Poincaré exactness alone is insufficient. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration` | corrected | BP after Remark 4.4.39, p. 79: verified the image/intersection filtration and its kernel, with the rank-one jump at a for M⁰=tᵃM. Removed source-quotation wording; the negative homological Tate jump and Siegel (1,0) test are unchanged. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor` | verified | BP after Remark 4.4.39, p. 80: the associated HT flag is tensor-compatible and respects Hecke level maps. The linear split model tests the weight flag without claiming sheaf-level descent or a canonical global splitting. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction` | verified | BP after Remark 4.4.39, p. 80, and §4.0, p. 49: the homological flag gives the P^c_µ reduction; Tannakian compatibility comes from T2. It is a finite-level torsor construction, not the infinite-level HT map. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor` | verified | BP after Remark 4.4.39, p. 80, and §4.4.8, p. 68: the Levi comparison uses the central µ cyclotomic extension with the homological orientation. Change of Tate generator acts by the weight, and weight −1 uses the inverse scalar. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-type-comparison-agreement` | corrected | DLLZ-RH Lemma 5.5.3 and proof, pp. 62–63: replaced proper GAGA on the open Shimura variety with full faithfulness for regular algebraic connections. The precise AB01/ABC20 input is a gap; dual H₁ normalization and tensor-summand comparison remain intact. |
| `HodgeTateAndCanonicalSubgroups:T6/finite-level-canonical-package` | verified | BP §4.4.38–text before Theorem 4.4.40, pp. 79–80: the exported package stops at the finite-level flag and Levi comparison. The toroidal diamond limit and infinite-level period map stay with PerfectoidShimuraVarieties S6. |
