# Independent package review: Global Galois deformation rings, round two

Job: `REV-PKG-GlobalGaloisDeformations~2` · Refs #9216

Reviewer: Codex — `codex-TPVLTj` · 2026-10-14

Verdict: **accepted after the corrections in this review**. Review complete.

The package is ready for the maintainer's draft TauCetiRoadmap PR under the binding
12 October 2026 shape. This accepts a roadmap, not an implementation of its targets.
The reviewer did neither package-writing job. The accepted plan and the first review
were read; the packet was not edited.

## Required checks

| Check | Result and evidence |
| --- | --- |
| Upstream form | Pass. Read the current ProfiniteArithmetic and LocalGaloisGroups READMEs and representative suggested signatures, and UPSTREAM_GUIDE.md. The package has a mathematical Summary, boundaries, conventions, exact suppliers, dependency-ordered prose targets, APIs, Checks, examples and references. Removed the introductory process-oriented description. |
| Plan fidelity | Pass with corrected mathematics and supplier boundaries. There are 66 numbered targets: the plan's 67 targets, minus the two wholly imported tangent/local-cohomology targets, plus continuous pseudodeformation rings. The imported anchors remain in Scope. All 91 plan API names and 71 plan test names occur. No target, API family or substantive condition was discarded to shorten the package. |
| Sources and own words | Pass for the required audit: no author-flagged unverified locator was found; all locators on the 15 randomly sampled targets below were opened, with additional checks of the high-risk proofs. The README is organized by its constructions, contains no source passage and is not a section-by-section source summary. |
| Prerequisite closure and ownership | Pass. Compared the targets with current upstream and library objects and the authoritative supplier packages/PRs below. Every target ends at earlier layers, pinned library carriers, a lower-tier supplier or the LocalGaloisDeformationRings bundle partner. No upward prerequisite, `FoundationsAndLibraryIntegration` or `UPSTREAM:` identifier remains. |
| Definitions and Checks | Pass after corrections. Every section with an API list has at least three prose Checks; these include values, degenerate cases and plausible incorrect definitions. All 71 plan test contracts remain, with corrected conclusions where necessary. The new pseudodeformation API has its own three Checks. |
| Lean | Pass. The final 632-line file elaborates with zero errors and exactly five warnings, all `declaration uses sorry`. All 32 examples are proved. Definitions, instances and their proof fields have real bodies. The ten signature comparisons below agree with the README, including the explicitly wider unbundled interfaces. |
| Metadata and product text | Pass. Metadata is exactly `topic = "math.NT"` plus a newline. No private path, source quotation, job/review/checkpoint narrative or unresolved target stub occurs in the product files. |
| Submission validation | Packet checker: zero errors and warnings. Sorry-data checker: no offenders. Intake file checker: zero problems. Internal fragment links, API/test presence, JSON syntax and `git diff --check` pass. |

## The first review and the October 12 shape

The first review's blocking finding required all 91 APIs, universal rings and arithmetic
constructions to be native Lean declarations. PACKAGE_REVIEW.md's later binding shape instead
requires full mathematical statements and Checks in the README, real-bodied light definitions
in Lean, and omission of statements whose carriers do not exist at the pins. Heavy definitions
must be named in the closing comment. The round-two package follows that rule: no admitted
carrier is introduced to make a large signature appear elaborated. Its admitted proofs are
exactly `Def.mk_eq_mk_iff`, `strict_of_full`, `PhiP.open`, `phiP_of_fg`, and
`exists_unique_nthRoot_of_residue_eq_one`. No missing heavy Lean carrier is a residual blocker
under that rule. The earlier review's mathematical corrections and concrete conjugation
regression are retained.

## Mathematical corrections made here

1. **Module marking and restriction (1.2, 1.5, 1.6, 3.3, 3.5).** Different rank-one characters
   remain nonisomorphic after forgetting the residual identification; the rank-two swapped-line
   example detects its loss. The centralizer of `1 ⊕ 1` is all of `M₂(k)`. Restriction of strict
   classes is well defined without a frame; a frame supplies an invariant matrix-valued lift.
   Forgetting frames induces `R_unframed → R_framed`; a map the other way needs chosen frames.
2. **Reducible determinant comparisons (1.10, 2.11).** Use a nonsplit extension of distinct
   characters with at least two independent extension directions. A variation transverse to
   the original extension cannot be removed by strict diagonal scaling. This gives a Schur
   example where the natural map from the pseudodeformation ring is not surjective, without
   claiming that the two rings cannot be abstractly isomorphic.
3. **Representability (2.2, 2.5).** Local `Φ_p` at residue characteristic different from `p`
   uses ClassFieldTheory's finite local `H¹`, not the `K/ℚ_p` theorem of LocalGaloisGroups.
   Non-Schur does not by itself imply nonrepresentability: the trivial group has ring `𝒪`.
   Added an actual failure of Schlessinger H4 for the trivial two-dimensional representation
   of `ℤ_p`, using `k[t]/t³ → k[t]/t²` and the matrices `1+tE₁₂`, `1+(t+t²)E₁₂`.
4. **Trace and finite-module arguments (2.7, 4.2).** A closed trace subring is not automatically
   Noetherian. The corrected trace-generation argument uses separation of dual-number points,
   finite cotangent dimension and complete Nakayama; Gee Exercise 3.8, p. 13 is added as the
   direct locator. Finitely many coset representatives likewise do not imply a finite algebra.
   In the residual restriction fibre the universal image factors through a finite group;
   its traces are integral, hence generate a finite-dimensional closed `k`-algebra. Complete
   Nakayama gives module finiteness. The argument was compared with BLGGT Lemma 1.2.3.
5. **Formal quotients (4.6, 4.7).** Corrected the Krull-dimension formula to add the relative
   group dimension, not its coordinate ring's absolute dimension. The inverse system of
   truncated rings now has a common compatible Noetherian coefficient source; arbitrary
   Artinian inverse systems need not have Noetherian limit. The constant-action Check uses
   the actual truncations `A/𝔪_A^m`. A rank-two determinant fibre is preserved by `T[2]`,
   irrespective of the deeper torsion used in action chunks.
6. **Dyadic stabilizer (4.10).** The induced self-twist counterexample is over dyadic
   characteristic-zero coefficients, with quadratic character factoring through the permitted
   twisting quotient. There `diag(1,−1)` is strict. The odd-residue-characteristic version is
   not a counterexample to this strict-class action.
7. **Point detection (6.3).** A finite flat nonreduced dual-number algebra loses its nilpotent
   direction at every characteristic-zero point. The residue field itself does factor through
   the residual quotient, so it was a false counterexample. A torsion dual-number thickening
   gives the intended vacuous-point failure, explicitly violating both flatness and reducedness.
8. **Rank-one and global torsion examples (3.7, 7.2, 7.4).** Ring `𝒪` or the unrestricted
   character group algebra requires unrestricted local conditions (and `Λ_v = 𝒪` in G8).
   Local roots of unity or class-group torsion alone do not establish torsion in the global
   abelian pro-`p` quotient. Use the explicit case `F=ℚ`, `p=3`, `S={3,7}`, whose quotient is
   `ℤ₃ × ℤ/3` and whose group algebra has special-fibre relation `Y³=0`.
9. **Conventions and obstruction hypotheses (3.6, 5.1, 8.3, 8.6).** Added the computed
   two-term mapping-fibre sign witness. Scalar Frobenius has many eigenlines, with no distinct
   eigenvalue labeling. CHT's polarized obstruction class is conditional on chosen local
   lifts across the small extension; that hypothesis and a failed-local-lift Check are now
   explicit. Enormous-image detection is described by its trace projections.
10. **Pseudodeformation continuity and library ownership (2.11, 4.5).** The finite quotients
    indexing the completed Roby algebra must carry a continuous universal determinant.
    Added the current library's ordinary diagonalizable character equivalence as a boundary
    and prerequisite; 4.5 retains its formal completion and truncation theorem.

The Lean changes add accessor docstrings, name the heavier README definitions in the closing
comment, and prove three negative controls: the minus sign in the mapping fibre over `𝔽₃`, a
nonzero square-zero dual-number element, and the different reductions of `diag(1,−1)` modulo
two and four.

## Mandatory adversarial pass over every target

Each row includes the defining equations and its named API, not just the title. Standing
coefficient hypotheses were also tested against a field, a DVR, ramified mixed-characteristic
coefficients, and an equal-characteristic ring. The arithmetic roadmap assumes the stated
mixed-characteristic DVR; the light Lean interfaces sometimes apply to a larger class and do
not assert the arithmetic results there. All ranks in the arithmetic statements are positive;
the native matrix definitions also make sense at rank zero.

| Target | Instances and plausible failure tried | Outcome / correction |
| --- | --- | --- |
| 1.1 Lift | Residue coefficients; rank one on `ℤ_p`; discontinuous character of an infinite product | Reduction and continuity retained; coefficient maps act on entries. |
| 1.2 ModDef | Rank one; trivial rank two and swapped nonzero character | Corrected rank-one assertion; residual identification is essential in rank two. |
| 1.3 Def | Scalar strict conjugators; non-Schur swapped diagonal lifts | Strict orbits differ from full-conjugacy orbits; quotient direction correct. |
| 1.4 Module/strict comparison | Residue ring; two choices of lifted basis | A basis reducing to the residual basis changes by a strict matrix. |
| 1.5 Strict/full conjugacy | Rank one; `1⊕1`; nonlocal integral `S₃` example | Locality, residue surjectivity and Schur hypotheses present; corrected centralizer. |
| 1.6 Restriction | Identity subgroup; noncentral strict conjugator | Corrected class-vs-matrix distinction. |
| 1.7 Fixed determinant | Rank one; determinant congruent but unequal to `χ` | Exact equality retained; conjugation preserves determinant. |
| 1.8 Coefficients | Identity and composite; finite residue extension | Residue square and continuity retained; no arbitrary ring map accepted. |
| 1.9 Determinant laws | Rank one; residue point; split/nonsplit same semisimplification | Polynomial law on the group algebra retained, not just determinant character. |
| 1.10 δ | Rank one; two independent extension directions | Corrected noninjectivity witness; transverse extension direction survives strict conjugation. |
| 2.1 Φ_p | Finite group; `ℤ_p`; inversion semidirect product; native `p=0,1` | Every-open-subgroup quantifier retained; profinite open-kernel maps to `ℤ` are trivial. |
| 2.2 Galois Φ_p | `G_ℚ`; `G_{ℚ,{p,∞}}`; local residue characteristic unequal to `p` | Ramification bound retained; local supplier corrected. |
| 2.3 Framed ring | Trivial group; rank one; trivial rank two of `ℤ_p` | No Schur hypothesis needed; finite framed tangent, not full conjugacy. |
| 2.4 Universal lift | All Artinian quotients; incompatible quotient representatives | Uses compatible universal lifts and adic completeness/separatedness. |
| 2.5 Unframed ring | Schur rank one; trivial group in rank two; explicit H4 failure on `ℤ_p` | Replaced unsupported non-Schur implication by computed failure. |
| 2.6 Frames | Rank one; rank two | Relative dimension `n²−1`, with chosen representative; contravariant forgetful map. |
| 2.7 Trace generation | Rank one; reducible extensions; dual-number functionals | Absolute irreducibility kept; replaced unjustified Noetherian-subring step. |
| 2.8 Determinant isomorphism | Rank one; absolutely irreducible; same-law reducible lifts | Imports henselian reconstruction; no reducible isomorphism claimed. |
| 2.9 Fixed determinant rings | `p∤n`; `p=n=3`; rank zero excluded by root hypothesis | Unique roots only when `n` is invertible; cubing loses the infinitesimal direction. |
| 2.10 Coefficient rings | Identity; successive residue extension | Completed scalar extension with fixed residue data, not unrestricted ordinary tensor product. |
| 2.11 Pseudodeformations | Rank one; reducible Schur example; infinite product `ℤ/p` | Continuity in completion added; profinite non-Noetherian case distinguished. |
| 3.1 Local problems | Unrestricted problem; fixed noncentral matrix over `𝔽₃[ε]` | Strict-conjugation stability and all closure axioms present. |
| 3.2 Problem ideals | Zero ideal; residue ideal; noninvariant equations | Invariant ideals give exactly the intended local subfunctors. |
| 3.3 T-frames | Empty, one and two frames; simultaneous action | `α⁻¹ρα` invariant; quotient condition uses restriction classes correctly. |
| 3.4 Global ring | Empty T; unrestricted local conditions; residual point | Residual Schur and quotient-stable type data retained. |
| 3.5 Local/global map | Two local frames; forgetting frames | Arrow is local tensor ring to global framed ring; unframed forgetting arrow corrected. |
| 3.6 Relative tangent | Rank one; T empty/one/two; two-term differential over `𝔽₃` | Full degree-zero adjoint, scalar boundary and minus sign pinned. |
| 3.7 Presentation | Rank-one unrestricted problem; `x²=0` local obstruction; dyadic scalars | Rank-one hypothesis corrected; relation bound requires local lifts/liftability. |
| 3.8 Dimension | `F=ℚ`, `S={p,∞}` in KW convention; negative integer bound | Finite/infinite-place conventions distinct; lower bound not finite-over-𝒪 theorem. |
| 4.1 Restriction rings | Index one; inversion semidirect product | Ring arrow contravariant; finite nonflat example remains valid. |
| 4.2 Finite restriction | Index one; induced reducible restriction; trivial rank-two `ℤ_p` | Corrected finite-generation proof and nonrepresentability reasoning. |
| 4.3 Ramification | Equal sets; strict enlargement; tangent closed immersion | Surjective ring map corresponds to injective tangent map; source typo not propagated. |
| 4.4 Twists | Trivial twist; determinant changes; finite-order root after base change | Determinant scales by `χⁿ`; source-specific base extension retained. |
| 4.5 Formal diagonalizable group | `a=ℤ`; `ℤ/p`; prime-to-p torsion; `(1+X)²−1` | Uses principal units, not all units; ordinary group imported; truncation level correct. |
| 4.6 Free quotient | Trivial group; torus on itself; μ_p fixing origin | Corrected relative dimension; nonfree example is not a torsor. |
| 4.7 Action chunks | Actual truncations; incompatible involutions; torus square fibre | Common Noetherian source added; compatible limit; fixed fibre preserved by T[2]. |
| 4.8 Determinant on S | Trivial twisting group; determinant-one fibre; 2-torsion character | Square-equivariance and noninjective twisting-pair example retained. |
| 4.9 Twist action | Identity; rank-two determinant; odd p | Local split-at-S characters preserve local data; only square-trivial twists fix determinant. |
| 4.10 Dyadic freeness | Trivial twist; nonsolvable image; induced self-twist | Corrected strict stabilizer to dyadic coefficients; trace equation retained. |
| 4.11 Determinant torsor | γ=0; formal torus rank one; odd p | Degree 2^γ only in dyadic case; relative dimension γ, not γ+1. |
| 4.12 Inertia rigidification | Trivial inertia; nontrivial type; vertical components | Fixed determinant; flat quotient; absolute dimension d² and regular generic fibre. |
| 5.1 TW datum | Empty Q; distinct/scalar Frobenius; ordering | Scalar has many lines but no distinct-eigenvalue labeling; datum retains ordering. |
| 5.2 Image hypotheses | Dihedral rank two; dyadic nonsolvable image; characteristic three | Separate hypotheses and distinct inducing characters; no adequate/enormous identification. |
| 5.3 Dyadic disjointness | F=ℚ, n₀=2; x₂=0; Chebyshev R₄ | y₂=1/2, not x₂²; this target discharges AGD's conditional input. |
| 5.4 Dyadic sets/counts | Substitute cohomological identities; scalars in ad⁰; negative formal count | Ring counts checked in ℤ; two surviving cohomological directions retained. |
| 5.5 Inertia/diamonds | Empty Q; one fixed-determinant rank-two prime | One character factor per prime, inverse on the second line; augmentation quotient. |
| 5.6 Shared selection | Zero space; dependent detector; q larger than dimension | Kernel decreases only on an actual detector; padding and finite avoidance explicit. |
| 5.7 Odd primes | KW branch; Gee over ℚ; p=3 vs p≥5 | Source-specific detecting/vanishing inputs retained; no l>3 proof applied at 3. |
| 5.8 Generator counts | F=ℚ; inclusion/exclusion of infinity | KW and Gee constants differ by the archimedean contribution; counts in ℤ. |
| 6.1 KW data | Empty local product; finite vs infinite places; common coefficient point | Imports exact bundle local tensor dimension and flatness; no blanket domain assertion. |
| 6.2 Trace subring | Choice of universal representative; abs irreducible reduction | No canonical representative claimed; trace subring and framing comparison use suppliers. |
| 6.3 Factorization | A=𝒪; flat nonreduced dual numbers; k; torsion thickening | Replaced false residue counterexample; characteristic-zero points do not detect nilpotents. |
| 6.4 TW system | Empty auxiliary level; augmentation; p=2 | Compatible quotient maps and odd-prime assumptions; no dyadic complete-killing claim. |
| 6.5 Numerology | F=ℚ; symbolic h,S; small/negative formal parameters | Integer identity yields h+\|S\|−1 after framing removal; nonnegativity separately required. |
| 6.6 Dyadic patching data | Character quotient; scalar ad⁰; determinant-on-S vs global | Distinct rings/actions retained; chunk passage does not create an unrestricted fixed-det action. |
| 7.1 Variable problem | Unrestricted D_v; fixed noncentral matrix; ramification outside S | Global type includes unramified outside S and strict stability. |
| 7.2 Variable frames | Rank one; n=2 with three frames; T empty | Unrestricted rank-one example qualified; 11 variables and empty-T exception correct. |
| 7.3 Variable presentation | Rank one; ζ_p in F; full-adjoint trace pairing | Scalar summand retained; no fixed-det \|T\|−1 term inserted. |
| 7.4 Fixed vs variable | Rank one; p divides n; global ℤ₃×ℤ/3 example | Corrected hypotheses and global torsion witness; restrictive types need twist stability. |
| 8.1 Polarized data | Rank one; j-conjugation; reducible centralizer | Imported CHTGroup/pairing; ν(j)=−1; Schur not synonymous with irreducible. |
| 8.2 Polarized frames | n=2,T singleton; scalar conjugation; p=2 | Four variables; residually trivial scalar square-one is trivial only at odd p. |
| 8.3 Polarized obstruction | Rank one odd multiplier; p=n=3; failed local lift | Added chosen-local-lifts hypothesis; full adjoint and archimedean sign retained. |
| 8.4 Polarized presentation | Rank one; nonliftable condition; formally negative g | Relation bound conditional; variables indexed only after nonnegativity proof. |
| 8.5 Rank-n diamonds | n=1; n=2; permuted eigenvalue ordering | n factors per prime, unlike rank-two fixed determinant; relative local dimension n². |
| 8.6 Enormous primes | q-padding; ζ_p in F; adequacy in place of enormous | Exact ACC image condition and scalar Kummer hypothesis retained; detector wording clarified. |
| 8.7 ACC presentation | n=1; q below n[F⁺:ℚ]; prime ramified in F₀ | g=qn−n²[F⁺:ℚ] in ℤ; qn diamond factors; degree-one selection with avoidance gives splitting. |

## Source receipts

The reproducible sample was `random.Random(9216).sample(packet['nodes'], 15)` in the packet's
existing order. All locators on these targets were checked, not just one locator per row.
Page numbers below refer to the package bibliography's public editions. ACC v2 and published,
and KW ESI and final, were checked separately where both are cited. These are locator receipts
and mathematical checks, not source excerpts.

| Sampled target | Opened locator and result |
| --- | --- |
| 2.5 Universal deformation ring | Kisin Lecture 1, Proposition (1.2.1)(2), p. 2; Gee Lemma 3.5, p. 12. Schur representability confirmed. |
| 8.6 Enormous primes | ACC v2 Definition 6.2.28, Lemmas 6.2.29/6.2.31, pp. 148–151; published Definition 6.2.29, Lemmas 6.2.30/6.2.32, printed 1044–1046, PDF 148–150. Edition correspondence confirmed. |
| 3.4 Global representability | Gee Lemma 3.22, p. 15. Fixed type and T-framing confirmed. |
| 5.6 Shared selector | ACC published Lemma 6.2.32, proof, printed 1045–1046, PDF 149–150. Conditional detecting-element induction and padding confirmed. |
| 5.7 Odd primes | KW final Lemma 5.2(1), p. 47, Lemma 5.3, pp. 47–48; Gee Proposition 5.10, pp. 38–39; Taylor Lemma 2.5, printed 749–750, PDF 21–22. Distinct hypothesis branches confirmed. |
| 1.7 Fixed determinant functors | Gee §3.18, p. 15. Exact determinant equation confirmed. |
| 4.5 Diagonalizable groups | KW final §2.5, p. 12, Proposition 2.8, p. 14. Formal identity neighbourhood and truncation confirmed. |
| 5.8 Generator counts | KW final Proposition 5.5, p. 48; Gee Proposition 5.10, p. 38. Both counts and their different conventions confirmed. |
| 3.1 Local problems | Gee Definition 3.16, p. 14. Closure and strict equivalence axioms confirmed. |
| 3.2 Invariant ideals | Gee Lemma 3.17, p. 14. Quotient ideal correspondence confirmed. |
| 2.9 Fixed determinant rings | Gee §3.18 and Exercise 3.19, p. 15. Invertibility of n and character splitting confirmed. |
| 8.5 Rank-n diamonds | ACC v2 §6.2.18/Lemma 6.2.19, p. 143, and datum on p. 149. Ordered eigenvalues and n character factors confirmed. |
| 4.3 Ramification enlargement | KW final §2.1, p. 6, Proposition 5.11, p. 53. Ring-surjection direction confirmed; retained correction of tangent typo. |
| 3.5 Local/global map | Gee §3.23, p. 15; KW ESI §4.1, printed p. 29 (PDF 30). Ring direction and framed local representative confirmed. |
| 3.8 Dimension bound | Gee Proposition 3.24(3), p. 18; KW ESI Proposition 4.4, p. 32 (PDF 33); KW final Proposition 4.5, p. 42, Corollary 4.7, p. 45. Convention-dependent bound confirmed. |

Additional direct checks: Kisin Lecture 1 pp. 1–4; Gee pp. 12–18, especially Exercise 3.8
for trace generation; Chenevier arXiv:0809.0415v2 Theorem 2.22 p. 34 and §3.1 pp. 41–43
for the new target 2.11; BLGGT arXiv:1010.2561v4 Lemma 1.2.3 and proof pp. 16–17;
CHT Lemma 2.2.3 p. 19, Lemma 2.2.11 pp. 24–25 and Corollary 2.2.12 p. 25 for local ideals,
chosen local lifts and the conditional relation bound. Public source files were used; no
uncleared book copy was needed. Existing package source warnings about Kisin's open-subgroup
quantifier, KW's tangent-map typo and Gee's scalar boundary correction remain explicit.

## Current suppliers and duplication

The read-only upstream comparison used TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27`, including all nine roadmaps newer than the atlas
snapshot and Completed. Searches used mathematical objects: conjugation kernels, principal
units, polynomial laws, continuous representations, framed local restrictions, mapping fibres,
character duals and determinant constraints. The relevant current library is Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No complete additional global deformation target
was found there. The ordinary diagonalizable character functor was found and is now imported;
its formal identity completion is the strictly different target retained in 4.5.

The open authoritative suppliers were checked at ArithmeticGaloisRepresentations PR #856
head `e95c677e32e7748dfe5f6368ceadb941645a43b7`, ArithmeticGaloisDuality PR #858 head
`7dce743a33f51ea80d463a0ec7c3da8b75f9a7e3`, and SelmerIwasawaCohomology PR #869 head
`c883651676be47d63fcb8d13195fd7d245df00b9`. Their README contracts, not tentative old Lean
names, determine the supplied mathematics.

| Component | Existing owner and treatment |
| --- | --- |
| Continuous low-degree cohomology | Pinned Tau Ceti `ContCohomology.Z1`, `B1`, `H1`; the algebraic B1 range and continuity requirement read. |
| Profinite finiteness inputs | Pinned `IsTopologicallyFinitelyGenerated.finite_monoidHom_isOpen_ker`, `maximalProPQuotient`; current open-subgroup generator-rank and finite-dual declarations. Only Φ_p and its assembled equivalences remain here. |
| Ordinary diagonalizable characters | Current `TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic`: `DiagonalizableGroup.pointEquiv`, `pointsMulEquiv`. Newly recorded boundary; formal completion/truncation remains here. |
| Tangent cocycles and determinant boundary | AGD D8. The former standalone tangent target stays removed and its anchor stays in Scope. |
| Strict trace conjugacy and centralizers | AGR §5.10 `GaloisRep.carayol_conj_of_trace_eq`, §7.2 `GaloisRep.span_eq_top_and_centralizer_of_residually_absIrred`; IHG `coefficient_descent`. 2.7 keeps universal trace generation only. |
| Henselian determinant reconstruction | Current IHG `Determinant.exists_ofMatrix_eq_of_henselian`, stated on the group algebra. 2.8 assembles the continuous comparison; 2.11 owns continuous representability, which IHG explicitly excludes. |
| Local Galois finiteness | CFT Layer 5 `finite_H` for all characteristic-zero nonarchimedean local fields; LocalGaloisGroups Layer 3 only for its finite extensions of ℚ_p. |
| Relative complexes and duality | AGD R02.4–R02.6/D8 and Selmer Layer 2 §2.21. D8 does not give H² duality from tangent subspaces alone; this package fixes its actual complexes and uses the source-specific duality setting. |
| Local TW cohomology and KW auxiliary sets | AGD R02.6. The standalone local-cohomology target stays removed; KW sets/counts are imports, while Gee's additional branch and the ring counts remain here. |
| Dyadic disjointness | 5.3 remains here because the current AGD dyadic-prime statement assumes it. Its proof sketch also mentions the argument; this supplier ambiguity is recorded for the maintainer, not silently used as a second proof. |
| Local rings and local tensor product | Bundle partner LocalGaloisDeformationRings, especially 8.17. Its current `t8-17` anchor resolves; the previous handoff's duplicate-anchor warning is obsolete. Local domain claims retain their restricted hypotheses. |
| Polarization group and image predicates | AGR §7.4 `CHTGroup`/triple correspondence and §§4.6, 4.7, 7.10. No second construction of these is planned here. |
| Formal finite quotients and algebra | ModularCurves 0C; DDPA R03.1–R03.3. This package assembles completions, smooth quotients and the deformation application. |

All these are baseline/upstream, lower tier (IHG tier 3, AGR 7, AGD/Selmer 8, DDPA 10)
or bundle prerequisites under CaraianiNewton.md. No whole target was newly removed in this
review. The existing removals/partial deferrals above are preserved. The coverage audit has
no direct row certifying these global targets; that absence was not used as proof of novelty.

## Ten Lean signature comparisons

The shared build pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Referenced matrix-map, determinant, action/quotient
and profinite declarations were read at those pins. The module header explicitly separates
unbundled topological coefficient data from actual coefficient-category objects.

| Signature | README agreement and adversarial check |
| --- | --- |
| `strictKernel`, `Lift` | Kernel of reduction, homomorphism, continuous entries and exact residual equation; n=0 allowed in this light interface and harmless. |
| `Def`, `Def.mk_eq_mk_iff` | Orbit quotient by the strict kernel; equality iff conjugation by a matrix reducing to one. No full-conjugacy quotient substituted. |
| `LiftDet`, `DefDet` | Pointwise equality to χ and the restricted orbit action, not merely residual determinant equality. |
| `strict_of_full` | Local ring, surjective residue map, maximal-ideal kernel and Schur all explicit. The nonlocal and non-Schur regressions remain. |
| `Lift.map`, `Def.map` | Continuous ring map with commuting residue square; actual quotient descent proof; identity/composition checked. |
| `Lift.restrict`, `framed_restrict_invariant` | Continuous group map for lifts; matrix formula α⁻¹ρα and simultaneous left action. Both work without assuming arithmetic representability. |
| `PhiP`, `PhiP.open`, `phiP_of_fg` | Every open subgroup and open-kernel maps. Native p is general: at p=0 the finite-image map to ℤ is trivial, at p=1 the target is trivial. |
| `exists_unique_nthRoot_of_residue_eq_one` | Artinian local A, prime residue characteristic, p∤n, and principal unit; no DVR or finite-residue-field assumption accidentally needed. README extends to complete coefficients by inverse limits. |
| `TFramedLift`, `UnrestrictedTFramedDef`, `scalarFrameCokernel` | Actual frame tuple with simultaneous left action; name makes absence of type conditions explicit. Scalar cokernels at zero/one/two frames computed. |
| `Lift.twist`, `Lift.trace_twist` | Continuous residually trivial character, scalar twist of the same residual lift; trace scales by χ. Determinant exponent separately pinned by the rank-two matrix example. |

## What remains

No uncorrected defect remains that blocks this package's draft upstream PR. The heavier
universal rings, coefficient categories, local problems, Selmer comparisons and arithmetic
prime theorems remain future formalisation targets in the README; the Lean check does not
prove them. Higher-tier requests for additional image hypotheses, refinements or reducible-point
comparisons recorded by the package author remain possible later extensions, not claims made
by this package. The maintainer should retain the explicit dyadic-disjointness ownership note
when reconciling the two upstream PRs.
