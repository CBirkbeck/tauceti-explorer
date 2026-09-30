# Independent review of FIX-RT-AREA-ktheory-1

Reviewer: Codex, session `codex-J6LwjP`, 2026-09-30. Job: #5157.

## Decision and scope

The ownership repairs are substantial, but the fix is not complete. Five packets
remain `needs_changes`: Arithmetic N.7, General K.1, General K.6, Symbols T.1,
and Symbols T.3. Arithmetic N.1's number-field fixes and K3BlochGroups' V.1
ownership repair are accepted **within this fix review's scope**. This does not
assert closure of either partial packet or re-review every pre-existing node.
The prior review objects are preserved verbatim in `reviewHistory`.

I compared fix commit `c0d6e82` with its parent, read all 49 original findings,
their verifier qualifications, and the fix report, then checked the applicable
contracts in the current packets. Later area-2 work (`0ba7ef0`) is preserved;
this report does not substitute for its independent review. I did none of the
fix being reviewed. The separate T.3 red-team verification in PR #5300 is used
below as explicitly identified prior evidence, not presented as a new audit.

The original report's count should be corrected: /1–/39 comprise **39** high or
medium findings; /38 was rejected, leaving **38** confirmed. /40–/49 are low
severity. A §17 handoff to an unfinished blueprint is a valid disposition,
not a claim that the supplier theorem has been planned or proved completely.

## Finding-by-finding dispositions

Every number below denotes `RT-AREA-ktheory-1/<number>`. “Handoff verified”
means the named issue contains the requirement and its blueprint is unfinished;
it does not certify that future work. Existing checkpoint packets at those
destinations do not constitute finished blueprints.

| Finding | Verdict and reason |
| --- | --- |
| 1 | Corrected locally. N.3 now decomposes the rank filtration, comma category, suspended building, spectral sequence and nonfree-projective arithmetic-group reduction. R.1's integral finiteness and the orientation twist remain its single-owner request (#74). I corrected rank-zero language and the range of the relative-layer formula; see C1. |
| 2 | Handoff verified to M.1/M.5d (#957/#959). Preserve the verifier's topology, naturality and coefficient conditions; the Dedekind statement must not silently be reduced to a smooth-over-a-field statement. No motivic proof is claimed here. |
| 3 | Correct N.5 import; handoff #959 retains Suslin's real-field comparison in positive degrees and the topological KO supplier. Degree zero is not covered by the positive-degree statement. |
| 4 | Partial. Early S-construction/additivity/fibration and early products are requested, and construction/cofinality are distinguished. Proposed stage parents are not an applied restructuring. The path-space and general group-completion errors required C3/C4. K.6 still needs the noncommutative projective-line proof inputs and early product interfaces. |
| 5 | Partial handoff. H.3/H.4 simple-space, local-coefficient Whitehead and obstruction inputs occur in #999. Its carried raw finding still puts rational Hurewicz in H.3; the binding verifier and /33 require H.6. Correct that handoff before treating it as settled. |
| 6 | Handoff verified to Borel #74: the relevant split-at-infinity inner-form case, arithmetic input and sufficient nonzero rational volume are retained. Do not claim a general Tamagawa-number theorem where the argument needs only the stated rationality. |
| 7 | Correct locally plus #74 handoff. N.3's S-integer rank formula is restricted to degree at least two; degree one uses the S-unit rank. R.3's order formulation is the supplier's remaining work. |
| 8 | Correct ownership. M.3 owns the Galois symbol, its formula/Steinberg relation, Tate's theorems and the S-integer comparison. T.7 compares conventions and N.6 imports. #957 is the unfinished supplier. This does not close T.7's local/Chern comparison gaps. |
| 9 | Partial. The order-certificate interface is in N.6, with upper generation and an independent lower bound; N.2/N.8 import it. T.5 owns K₂(ℤ), K₂(ℚ), while T.2 owns the elementary finite-field case. The K₂(ℤ) upper-bound proof remains missing. U.1's low-degree handoff is #764. |
| 10 | Correct N.4 statement and #998 handoff. The twist in w₂ and its finiteness are explicit; finite K₂ is supplied by N.3, not deduced from Birch–Tate. |
| 11 | Needs changes. The two real sign characters give an independent lower bound four for ℚ(√5). The alleged presentation still lacks proof that its two symbols generate. C10 removes the claim of a completed certificate; B.3 (#998) may consume it only after that proof, without supplying either bound. |
| 12 | Partial. T.4 includes proper regular curves and inseparable extensions, not only smooth curves. The general Milnor norm–residue formula and mixed inseparable normalization-finiteness argument remain gaps. M.4's use is handed to #957. The separable and purely inseparable pinned results alone do not discharge the mixed case. |
| 13 | Handoff verified to #959. Keep imperfect fields in the Bloch–Gabber–Kato contract, early Cartier/de Rham inputs, and distinguish mod-p from prime-power constructions. This review does not certify a proof in the unfinished M.5d packet. |
| 14 | Handoff verified to #957. Kummer theory and cup products are early imports; the general-field M.3 symbol precedes M.5c and uses the tensor twist, not multiplication as a purported bilinear pairing on roots of unity. |
| 15 | Partial handoff to #999. Realization/fibration and properness/connectedness hypotheses belong to H.2; connective-space identifications have their degree restrictions. K.4's relative-S zero term was wrong and is corrected in C3. |
| 16 | Handoff verified to #999: chain-level Eilenberg–Mac Lane spectra, Hℤ-modules, grading, truncation and representability are separate obligations. Naming spectra does not supply these comparison theorems. |
| 17 | Partial. K.6 now owns the ring projective-line/Nil route; S.5 (#987) imports it. C6–C8 repair the MR argument, the map on the whole Nil category, and handedness. The noncommutative canonical resolution/localization input remains to be read and decomposed. |
| 18 | Partial. K.5 includes all four interior positions of a Milnor square and K.6 owns negative Bass groups. The late U.6 excision comparison is a separate obligation: see the connectivity warning below. No connective excision theorem follows merely from negative exactness. |
| 19 | Partial. The early ring model and scalar-extension requests correctly prevent K.6/K.7 from redefining connective ring K-theory. C9 corrects Morita-product scope and the nonunital corner-map continuity gap. Those adapters remain necessary. |
| 20 | Correct ownership/order proposal. Classical ring comparison belongs to early K.2, exact-category cofinality follows K.4. `proposedParentStageId` records a proposal, not an already changed stage graph. C2 fixes its degree-zero counterexample. |
| 21 | Corrected locally. The plan uses the pinned exact structure, finite-projective subcategory and ExactK0 APIs. Bühler's exact-category axioms provide the 3×3/cokernel route. C2 fixes the maximal-tree calculation; C5 gives the actual K-transfer source and finite-resolution hypothesis. Detailed localization/fibration proof gaps remain in K.1. |
| 22 | Handoff verified to #999. Nerves, local coefficients, twisted Serre comparisons and the H.1 interface are explicit supplier work, not supplied by an untwisted homology isomorphism. |
| 23 | Handoff verified to #999/#987: H.6 owns the general exact-couple/spectral-sequence infrastructure consumed by S.4. No duplicate scheme-specific general construction is needed. |
| 24 | Handoff verified to U.4 (#764): S-unit rank and finite-index subgroup issues are part of the argument; rank-one cases must not be swallowed by a stable higher-rank assertion. |
| 25 | Handoff verified to #764 with the verifier's **number-field** scope. Bass–Milnor–Serre uses the named CFT/Chebotarev/reciprocity inputs. Do not extend this proof to global function fields from the raw claim alone. |
| 26 | Correct shape, incomplete proof closure. T.3 has the Dedekind localization boundary and T.5 has both the outside-S tame-kernel and in-S relative sequence. Surjectivity uses U.4's SK₁ vanishing, not a general Dedekind assertion. The degree-one boundary normalization still needs an upstream owner without the S.3 cycle. |
| 27 | Partial. CFT 5/10 and QFI 6E/7B are reused; CFT 14 owns the quadratic product formula and CA.1 is requested for higher-power reciprocity with an explicit primitive-root pairing. C11 fixes m=1 and invariant coordinates. Higher local comparison and the Chern sign are still source gaps; CA.1's broad text is not a proof of the requested normalized theorem. |
| 28 | Partial. Milnor norms/elementary identities belong before the Quillen comparison. The new comparison node correctly identifies the missing general base-change input; the quadratic case in III.6.1.5 is insufficient. The arbitrary-base-change versus finite-extension residue mismatch from PR #5300 remains. |
| 29 | Accepted ownership repair in K3BlochGroups. The three duplicate UCE lemmas were removed; V.1 imports T.1's UCE/perfectness results and keeps its plus-fibration/Hurewicz interface. This does not assert that the T.1 supplier gaps are closed. |
| 30 | Needs changes. Seventeen nodes substantially decompose the UCE/Hopf route, but `G-Hopf` and `G-natural-Hopf` still lack the low-degree Hochschild–Serre construction and map-level naturality comparison. Löh states the spectral-sequence input without constructing it. C12 fixes the Q/ℤ test and notation scope; those changes do not prove the missing sequence. H.3's future topological side is in #999. |
| 31 | Correct source correction and handoff #765. K-book II.8.2.4 and Ex. II.9.10(d) use affine space of dimension at least two (the plane suffices), not the doubled affine line: K₀VB = ℤ and perfect K₀ = G₀ = ℤ². The corresponding source issue is preserved. |
| 32 | Correct supplier boundaries. AC Layer 12 supplies the regular point/place dictionary and EC Layer 2 uses disjoint-support evaluation. The elliptic test on y²=x³−x with f=x/(x−2), g=(x−3)/(x−5) gives the same normed evaluation 81/25 on both sides. C11 removes two inverse-convention errors in the degree-two reduction. |
| 33 | Handoff correction required. H.6 must be the single owner of rational Hurewicz/Cartan–Serre/Milnor–Moore with the verifier's connected CW, associativity and finite-type/cohomological-dual qualifications. #999 still carries /5's H.3 placement and does not incorporate /33's resolution. R.3 (#74) must import H.6. |
| 34 | Handoff verified to #74 with the verifier's topological-Adams qualification. R.4 needs S.6 operations and the RT.4 comparison; merely importing algebraic Adams operations does not identify Borel eigenspaces. |
| 35 | Handoff verified to #74. The early characteristic-zero quotient/de Rham/Lie comparison belongs to ALS.5 before its R.2 use, not to a downstream AS.5 result. No algebraic-groups roadmap is replanned here. |
| 36 | Handoff verified to #74. Burgos' all-weight factor Bo = 2 Be is the normalization input (and gives 2^d on determinants); the Bloch–Wigner weight-two test alone is insufficient. |
| 37 | Handoff verified to finite/local-field job #763. Retain Green's choice-of-root/induction interface, the RT.4 Atiyah–Segal and Adams input, K⁻¹(BG)=0, and the simple-space Whitehead hypothesis. No unrestricted acyclic-space argument is licensed. |
| 38 | Verifier rejection upheld. The required ancestry already exists through CFT 5→T.7→L.3 and CFT 5→D.7→M.7→L.6. No repair is required for this finding. |
| 39 | Handoff verified to #763. General log Witt construction precedes L.5; the DVR calculation/TR comparison remains there and CR.6 owns Hyodo–Kato comparison. Preserve odd-p and ℤ_(p)-algebra scope; these models are not interchangeable without comparison. |
| 40 | Confirmed low severity; outside this fix's assigned high/medium work. M.7 must import L.2's invertible-coefficient henselian rigidity. No completion claimed. |
| 41 | Confirmed low severity; N.5's M.7 ownership direction is consistent with the fix. A fresh check of the dyadic Suslin supplier is future work, not certified here. |
| 42 | Confirmed low severity; N.1 should import Z.4/U.5 norm interfaces. No independent completion of those low-degree suppliers is claimed. |
| 43 | Confirmed low severity; N.7's Vandiver-dependent statements remain explicitly conditional. This fix does not supply the early L.3 ancestry repair. |
| 44 | Confirmed low severity; the general Eilenberg–Mac Lane/HR-module supplier belongs in H.5. The aggregate handoff is not a completed implementation or a replacement for checking the source-specific compatibility. |
| 45 | Confirmed low severity; Z.1's projective-complement result should be imported by U.2. No change to the unfinished low-degree packet was authorized here. |
| 46 | Confirmed low severity; U.3/U.6 must share elementary/transvection calculus. This report does not claim it was completed by the high/medium fix. |
| 47 | Confirmed low severity; L.7 owns the general completion comparison, with D.4 consuming it as needed. Preserve D.3's p>3 unramified specialization. No new repair claimed. |
| 48 | Confirmed low severity; L.1 imports elementary K₀/K₁/K₂ cases and proves agreement with its higher model. The elementary finite-field K₂ owner is now T.2. Pinned SplitK0 is not already π₀ of an absent spectrum. |
| 49 | Confirmed low severity; R.4 must reuse ZLattice covolume, with the chosen Haar normalization, after proving its new regulator image is a full discrete lattice. No higher-regulator theorem is supplied by the unit regulator. |

## Corrections made in this review

**C1 — rank zero and relative layers.** In N.1 the relative formula is stated for
m≥1, avoiding natural-number subtraction at zero. Q₀ is equivalent to a terminal
category and BQ₀ is contractible; an unskeletal category need not literally have
one zero object. The packet and suggested signatures agree, with rank-zero tests.

**C2 — Q-category calculation and cofinality.** In K.1 the maximal tree contains
the distinguished inflation 0↣A, not all Q-morphisms from 0 to A. The latter
instruction would kill generators: already a one-dimensional vector space has
different such arrows. The free/projective K₀ counterexample now requires a
class outside the subgroup generated by free modules, detected by a nontrivial
determinant over a Dedekind domain. Mere non-freeness is insufficient for a
stably free module.

**C3 — path object.** For f=id_C, S₀f≃C, not 0. The augmented simplicial path
construction contracts by its extra degeneracy onto S₀C=0. The corrected proof
uses that augmentation. `E-relative-S-zero-term` records the erroneous printed
line in author chapter IV, p.69, and the comparison with p.72. Its novelty is
not established: the live author errata PDF returned 404. This is scoped to the
inspected author version, not asserted to be a new error in every edition.

**C4 — group completion.** Removed the assertion that |wC|→Ω|wSC| is the group
completion under coproducts for an arbitrary Waldhausen category. In the exact
category of finite abelian p-groups with isomorphisms, the direct-sum monoid
retains the cyclic-length generators, whereas exact K₀ imposes
[ℤ/p²]=2[ℤ/p]. The monoidal group-completion route is used only in the split
exact/isomorphism case through H.4 and plus-equals-Q.

**C5 — proper ring transfer.** K.1 now uses H(R) as modules with finite
resolutions by finitely generated projectives, not arbitrary modules of finite
projective dimension. Restriction of scalars goes P(S)→H(R), and also
H(S)→H(R), under S∈H(R). The supporting K-theory reference is V.3.2/3.3.2,
chapter PDF p.21, including its graded projection formula. The former V.3.5
G-theory/base-change citation did not establish this assertion. Products are
an explicit early supplier obligation, not silently available from late K.7.

**C6 — handedness and nonzero rings.** K.6's noncommutative gluing construction
uses right modules, hence ModuleCat Rᵐᵒᵖ at the pin and an opposite-ring bridge
to the early left-module ring model. The u₀≄u₁ test excludes the zero ring.
The dual-number test now states A=k[ε]/(ε²).

**C7 — projective-line splitting.** The canonical resolution is taken in VB,
not incorrectly asserted to stay in MR: O(−1) is not Mumford regular.
Use K(MR)≃K(VB) to extend the exact v₀,v₁ functors. With u₋₁=O(1), the
matrix for u₀,u₋₁ is [[1,2],[2,3]]. The Koszul relation
u₁=2u₀−u₋₁ gives [[1,0],[2,1]] for u₀,u₁, which is invertible. This
does not fill the separately recorded noncommutative resolution proof gap.

**C8 — the entire Nil map.** Added `K.6/nil-inclusion-is-forgetful`.
For (P,ν), the chart maps (t−ν,1−t⁻¹ν) give
0→u₁P→u₀P→(P_ν,0,0)→0. The second chart has the finite geometric-series
inverse because ν is nilpotent. This natural resolution and additivity identify
the map from Nil with (u₀−u₁)∘forget, so it is null on reduced Nil. Knowing only
its restriction to zero endomorphisms, or split injectivity of u₀−u₁, did not
prove the required claim. Tests cover ν=0, ν²=0 and the excluded ν=1 over ℤ.
The general-ν derivation is identified as the reviewer's, extending the
zero-endomorphism calculation in the proof of V.8.1.

**C9 — Morita and infinite matrices.** Matrix Morita invariance requires n>0.
A bare Morita equivalence need not preserve an internal product or its unit:
tensoring with a nontrivial line bundle sends [R] to [L]. The external product
comparison now requires compatible equivalences on both inputs and the target,
and a natural isomorphism of the biexact pairing functors. Unital internal
products additionally require unit-preserving monoidal data. The vacuous
Morita `True` declarations were replaced by proposed signatures.

The corner maps M_n(R)→M_(n+1)(R) are nonunital: diag(1,0)≠1. Unital ring
continuity cannot be applied to them. A new gap specifies unitization ℤ⊕A,
relative fibres, finite-limit/filtered-homotopy-colimit compatibility, and
compatibility of the finite matrix Morita equivalences with the corner maps.
The unital case ℤ⊕A≅ℤ×A identifies relative and ordinary K(A); this adapter
must be proved, not assumed.

**C10 — certificates.** N.7 no longer calls the ℚ(√5) or Gaussian example a
completed certificate while omitting its span proof. For ℚ(√5), the two unit
symbols have sign vectors (−1,−1) and (1,−1), so the lower bound four is valid.
The required upper-bound generation theorem remains a precise gap. The empty
Gaussian presentation likewise needs Tate's generation/vanishing argument.

**C11 — residue and symbol conventions.** T.3's real factor in global
reciprocity is 1 when m=1, the quadratic sign when m=2, and absent for m>2
under the root-of-unity hypothesis. The m=1 counterexample is ℚ with a=b=−1.
Two T.4 proof steps now use equality with the tame symbol in degree two for
the uniformizer-last convention, not its inverse: at 5, {2,5} has value 2.
The local invariant exponent uses the coordinate isomorphism
(ℚ/ℤ)[m]≃ℤ/m, [a/m]↦a, rather than multiplication by m inside ℚ/ℤ,
which is zero. The higher-power sign remains an explicit comparison gap.

**C12 — central extensions.** The A₅ test for Q/ℤ coefficients now uses the
pushout of SL₂(𝔽₅)→A₅ along C₂→Q/ℤ, 1↦1/2; the original C₂ extension
was not itself an instance of that coefficient target. The suggested T.1
file opens the pinned `commutatorElement` notation scope. This is a static
signature correction, not a claim that Lean elaboration was run.

## Work still required

* **K.1:** decompose the still-unread plus-equals-Q and fibration/localization
  inputs, and obtain the stage-order decision for early construction/products
  and late cofinality. The source and statement corrections above do not
  discharge those proof obligations.
* **K.6:** supply the noncommutative projective-line resolution/localization
  proofs, Karoubi-to-Bass comparison, and the nonunital matrix adapter. Several
  changed-node prototypes still assert `True` (including derived invariance,
  continuity and negative-K comparisons); these do not meet §13. Replacing
  the Morita block does not repair the whole suggested file.
* **N.7:** prove independent upper generation for both quadratic examples;
  synchronize the certificate APIs and examples only after those proofs exist.
* **T.1:** construct and assign the discrete Hochschild–Serre low-degree
  sequence and its naturality, compare the actual maps with pinned
  `groupHomology.map`, and retain the previous review's other unresolved gaps.
* **T.3:** source and decompose the general Milnor/Quillen comparison and
  norm–residue formula, settle the acyclic degree-one DVR boundary owner,
  supply mixed-inseparable normalization finiteness and the missing K₂(ℤ)
  generation proof, and determine the normalized local/Chern comparisons.
  PR #5300 additionally verified three defects not repaired here: relative
  Dennis–Stein D3 needs r∈I or s∈I or t∈I; a total real conic symbol at
  (0,0) cannot satisfy the units-only strict-negative criterion; and the
  arbitrary-base-change proof cannot invoke a finite-extension-only residue
  lemma or ignore valuations restricting trivially. These keep T.3 unaccepted.
* **Maintainer handoffs:** update #999 to the verifier's H.6 owner in /33,
  reconcile proposed stage changes, and synchronize the reader documents with
  these corrections. Reader documents and supplier issues are outside this
  review's authorized deliverables, so they were not edited.

For /18 specifically, CMM Theorem 4.33, Proposition 4.34 and Corollary 4.35
use nonconnective excision fibres and a connectivity argument. A comparison
of absolute negative groups alone does not identify the relative π₀ groups:
the long exact sequence also involves positive-degree maps. The U.6 adapter
must state the needed surjectivity/connectivity and fibre comparison. The
Milnor-square negative Mayer–Vietoris theorem in K-book III.4.3 is not by
itself the all-degree excision theorem.

## Evidence and checks

The reviewed library audits were read before planning new claims. I read the
69 new/changed baseline contracts at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: 10 in N.1, 18 in K.1,
2 in K.6, 32 in T.1, 6 in T.3 and 1 in K3. This is the fix's baseline delta,
not a claim to have reread every older citation in seven large packets.

In particular, I read ExactStructure's base/cobase change, composition and
Noether axioms, ExactK0's lift/hom_ext/additive-invariant and Cartan-map
smallness conditions, finiteProjectiveModules, the pullback-ring API and
two-sided-ideal quotient hypotheses. On homology I checked the trivial-action
H₁ interface, map/mapIso and projective-resolution comparison, the actual
degree-one corestriction/coinflation exactness, free-group/subgroup results,
factor sets and extension classification. The H₁ exact sequence does not
contain the missing H₂ injection. ModuleCat is left-module valued, hence
the right-module correction. The normalization declarations checked include
the finite separable and purely inseparable cases; the general Noetherian
normalization theorem alone is not module finiteness in the required form.

Supplier contracts checked include CFT 5/6/10/14, QFI 6C/6E/7B, AC 12,
EC 2, and CA.1. Their comparisons and ownership boundaries are respected;
the broad CA.1 promise does not establish T.7's specific sign. Fresh issue
reads covered #74, #957, #959, #999, #987, #764, #765, #998 and #763.

Public sources inspected for this review (PDF page numbers):

* [Weibel, K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf),
  author version 29 August 2013: chapters II (characteristic sequence, pp.68,
  77, 100), III (negative Mayer–Vietoris pp.31–32, UCE pp.36–38, quadratic
  transfer p.49, Kato pp.64–65), IV (pp.43–45, 54–55, 59, 69, 72, 75),
  V (pp.3–6, 8, 20–23, 41–42, 53–55, 60–64), VI (pp.12, 16, 43, 50–53).
  Full-PDF p.438 contains the Nil map calculation used in C8.
* [Kahn, arXiv:1108.2441v3](https://arxiv.org/pdf/1108.2441v3), pp.5,
  10–12, 15–18, for the rank filtration/comma category/building route.
* [Putman–Studenmund, arXiv:1909.01217v4](https://arxiv.org/pdf/1909.01217v4),
  pp.3–4, 7–10, 17, especially the orientation character in Theorem C.
* [Sun, arXiv:1604.04700v1](https://arxiv.org/pdf/1604.04700v1), pp.5–7,
  including finiteness for every projective module and finite-index descent.
* [Bühler, Exact categories, v2](https://arxiv.org/pdf/0811.1480v2),
  pp.5, 7, 10–11, 13–16, for the exact-category axioms and 3×3 machinery.
* [Löh, Group cohomology](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf),
  pp.38, 63–65, 133, 137–140, for Hopf's formula, free-group resolution,
  and the stated Hochschild–Serre naturality input.
* [Clausen–Mathew–Morrow, v2](https://arxiv.org/pdf/1803.10897v2), p.35,
  Theorem 4.33 through Corollary 4.35, for the excision-fibre warning above.
* [Schlichting, Negative K-theory of derived categories](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf),
  pp.14–15, Theorem 7.1 and Remarks 7.2–7.3, for the ring/additive-category
  comparison and its separate scheme qualification.

All seven `check_blueprint.py` checks with the pinned declaration index pass
with **0 errors and 0 warnings**. The issue has no link-map or standalone
restructuring deliverable, so those checkers are inapplicable. Intake file-scope
validation and `git diff --check` were also run. No pinned compiled environment
was available; **none of the suggested Lean files was compiled** and no build,
cache download or language server was started. All implementation statuses
remain unchecked. Passing schema checks does not close the proof gaps above.

Source-file SHA-256 checksums (for the public versions linked above):

| File | SHA-256 |
| --- | --- |
| Kbook | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| Kbook-II | `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607` |
| Kbook-III | `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307` |
| Kbook-IV | `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248` |
| Kbook-V | `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8` |
| Kbook-VI | `efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1` |
| Kahn | `71b5da651ba9feca4c1abcc58f566afbf11019dda465cbc3a95aace7cb1e2406` |
| PutmanStudenmund | `3421bcfaffc1e05198ae8323971872ca3774bd73c067077e94f46ed5d073d7ad` |
| Sun | `c0585949df902e30b7368c235210e8b20a0dea344ed88a9e7a65577ec681e793` |
| Buhler | `b7eaa8df7b6e572e2615776be4ab1930907f6c64b6a6610286d9ea5abc51d295` |
| Loeh | `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76` |
| CMM v2 | `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c` |
| Schlichting | `f59620e3ba25d5a8591a108d2b9647b68b5caf04794745862d2aa71e178b5aa6` |
