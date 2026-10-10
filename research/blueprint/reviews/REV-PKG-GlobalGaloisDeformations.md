# Independent package review: Global Galois deformation rings

Job: `REV-PKG-GlobalGaloisDeformations` · Refs #7605

Reviewer: Codex — `codex-Qv4914`

Date: 2026-10-10

Verdict: **needs_changes**

Review status: **complete**

The README accounts for the accepted plan's 67 targets, but the suggested Lean file does not yet supply their required declarations, APIs and regression examples. It elaborates successfully; this is a check of the declarations it actually contains, not of the mathematical contracts inside its final block comment. PROTOCOL §13 requires the definitions, API items, tests and named theorems to have Lean forms. The standard introductory note that Suggested.lean is not exhaustive does not waive that requirement. Item 5 therefore prevents package acceptance.

## Six required checks

| Check | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form and size | Pass | The document has conventions, supplier boundaries, dependency-ordered layers, precise targets, API and regression contracts, numbered source locators and exports to its consumers. The revised README is 123,442 UTF-8 bytes, below 200 KB. Its organization was compared with the complete current ProfiniteArithmetic and Chebotarev roadmaps. |
| 2. Fidelity to the accepted plan | Pass after the corrections below | All 67 target anchors, all 91 API names and all 71 regression names occur in the README. Every layer's statements, hypotheses, proof routes and supplier boundaries were compared with its nodes. Mathematical counterexamples were qualified rather than retained as unrestricted assertions. No new representability, flatness, finiteness or automorphy theorem was added. |
| 3. Own words and sources | Pass for the checked package | The document organizes constructions by mathematical dependencies, not by a source's sections, and contains no source passage. The bibliography distinguishes editions and physical from printed pagination. Primary-source checks and their limits are recorded below. |
| 4. Product document | Pass | The README has no job identifiers, packet names, review decisions, checkpoints or coverage statuses. Source-edition distinctions and supplier conditions are mathematical content. Review findings remain in this report and review.json. |
| 5. Suggested Lean forms | **Fail: missing declarations and tests** | The final `lean-check` exits 0 with 40 warnings, all `declaration uses sorry`, and no errors or other warnings. Most required API items and theorem statements remain in a block comment. The precise gap is described below. |
| 6. Metadata | Pass | The existing file is exactly the single line `topic = "math.NT"`, with its terminating newline. Number theory is appropriate. |

## Target-by-target coverage

All targets have their own README section. The accepted plan contains 15 definitions, eight constructions, 14 lemmas and 30 theorems. Coverage of mathematical prose does not count as coverage by Lean declarations.

| Layer | Targets checked | Principal checks |
| --- | ---: | --- |
| R04.1 | 11 | Residual identification for module deformations; strict conjugation; fixed determinant; coefficient and restriction functoriality; continuous adjoint cocycles; polynomial-law determinants kept separate from scalar determinant characters. |
| R04.2 | 10 | Open-subgroup quantifier in Φₚ; Schur versus absolute irreducibility; residue/locality and completeness conditions in trace recovery; continuity of the universal lift; the n²−1 framing count; p∤n on determinant splitting. |
| R04.3 | 8 | Closure axioms of local problems; invariant quotient ideals; global type and simultaneous framing; contravariant local-to-global maps; full-adjoint frame boundaries; separate tangent and relation bounds. |
| R04.4 | 12 | Finite restriction without an unsupported flatness claim; actual finite-image argument; formal diagonalizable groups; closed immersions; truncated products; determinant-on-S and square-equivariance; scalar framing torsors; finite-inertia rigidification. |
| R04.5 | 9 | Distinct residual eigenvalues; odd/dyadic separation; source-specific image assumptions; detection of individual adjoint constituents; the separate characteristic-three supplier obligations; exact cardinality, padding, degree-one and finite-avoidance conditions in the shared selector. |
| R04.6 | 6 | Condition-specific local dimensions and a common coefficient point; the trace subring and its universal representation; compatible finite-level quotients; explicit odd and dyadic generator counts; no R=T or finite-over-𝒪 conclusion from the ring data alone. |
| G8 | 4 | Local Λᵥ and their completed tensor product; unramified-outside-S in global type; nonempty T for n²|T|−1; variable and fixed determinant comparisons with p∤2n. |
| G7 | 7 | Imported 𝒢ₙ and multiplier/pairing conventions; polarized Schur condition; actual framed tangent complex; signs in the Euler term; enormous image distinct from adequacy; qn diamond factors; the integer nonnegativity obligation for qn−n²[F⁺:ℚ]. |

The fragment-link check found no missing target or reference anchor. The README's supplier table and individual prerequisite lists retain ownership of coefficient categories, abstract representability and completed tensor products in DeformationAndDerivedPatchingAlgebra; arithmetic duality and Selmer complexes in ArithmeticGaloisDuality; the shifted mapping fibre in SelmerIwasawaCohomology; determinants and henselian reconstruction in IntegralHeckeAndGaloisDeterminants; local rings in LocalGaloisDeformationRings; and the pairing group and image detectors in ArithmeticGaloisRepresentations. The shared arithmetic prime selector is one target here; its applications do not replan the underlying density theorem.

## Corrections made in place

1. `moddef_needs_iota` now assumes a nonzero continuous additive character. With the zero character the displayed lifts coincide. The explanation also identifies why strict conjugation fixes the first-order matrices.
2. Both semidirect-product counterexamples now specify inversion. The Φₚ example uses continuous additive characters and an explicit open subgroup with infinitely many coordinate characters. The restriction example retains the finite, nonflat quotient map.
3. `defProblem_not_conj_stable` and `fixed_matrix_not_problem` now use the concrete cyclic group of order two over 𝔽₃[ε]. Conjugating diag(1,−1) by 1+εE₂₁ produces lower-left entry 2ε. The former generic assertions failed for central prescribed matrices and for trivial group elements. A native Lean example checks the generator's square, both inverse equations, identity reduction, conjugation formula and nonzero lower-left entry on Mathlib's actual dual-number ring.
4. The dihedral regression now requires odd p, a proper quadratic K=F(√p*) contained in F(ζₚ), and distinct conjugate inducing characters. Without these conditions an induced representation need not be absolutely irreducible.
5. `twSystem_not_p2` now records the actual failure of distinct-eigenvalue detection on the dyadic Ad⁰/Z constituent. It no longer claims that every dyadic dual Selmer group is nonzero.
6. `GlobalDeformationProblem.IsOfType` now includes unramified-outside-S. `problem_unrestricted` explicitly concerns lifts on G_{F,S}; unrestricted local conditions do not allow ramification at new places.
7. The unrestricted native framing quotient is renamed `UnrestrictedTFramedDef`. Its definition has no global type, local problems or determinant parameter and cannot serve as the specified `TFramedDef` of type 𝒮. This rename preserves the auxiliary action while exposing the missing conditioned construction.
8. The open-subgroup lemma now has the requested name `PhiP.open` (escaped as `PhiP.«open»` in Lean). Native `LiftDet.conj` and `mem_LiftDet_iff` now give the requested fixed-determinant subtype operation and its exact membership equation.

The corresponding mathematical text in Suggested.lean's block comment was updated with the README, so the two presentations do not disagree on these corrections. The input plan was not edited.

## Blocking finding: native Lean coverage

Removing nested block comments and line comments before inspecting declarations leaves 14 of the 91 requested API names as identifiable native interfaces: `Lift`, `Lift.map`, the structure projection `Lift.reduce`, `Lift.conj`, `Def`, `Def.mk`, `Def.mk_eq_mk_iff`, `Def.map`, `LiftDet`, `DefDet`, `LiftDet.conj`, `mem_LiftDet_iff`, `PhiP` and `PhiP.open`. This is a name-and-statement inventory, not a claim that admitted definitions are implemented. The other 77 API contracts are comments, including these entire families:

| Required construction | Missing native contract |
| --- | --- |
| Module deformations | `ModDef`, `ModDefFramed`, base change, basis lifting and `Def.toModDef`. |
| Change of residue coefficients | `Lift.changeCoeff`, `Def.changeCoeff`, `isSchur_baseChange`, `LiftDet.changeCoeff`. |
| Determinant deformations | `DetDef`, its coefficient map, characteristic polynomials and rank-one comparison. |
| Universal rings and lifts | The representing objects, `univLift`, its reduction and continuity, `liftEquivHom`, and the framing and determinant ring comparisons. |
| Local and global problems | `DeformationProblem`, its closure API, `DeformationType`, conditioned `TFramedDef`, its framed local restriction and forgetting map, `Rloc` and `locToGlobal`. |
| Ring restriction | `resRing`, `resRingUnframed`, their universal-representation equation, composition and finite-map theorem. A native restriction operation on individual lifts is not this contravariant ring map. |
| Formal groups and twisting | `DiagGroup`, its points/torus/truncation API, represented `twistAction` and `twistAut`, `RdetOnS`, `detMap`, square-equivariance and the fibre equation. The existing native twist of one lift is useful but does not supply these represented constructions. |
| Auxiliary primes | `TaylorWilesDatum`, its group and deformation-type API, source-specific image predicates, the local cohomology statements and the shared arithmetic selector. Matrix calculations do not state arithmetic prime existence. |
| KW finite-level system | `KWDeformationData`, condition-specific local rings, trace subring/universal representation, `TWSystem`, its quotient and generator API, and `DyadicPatchingDatum`. |
| Variable and polarized problems | `GlobalDeformationProblem`, its type and framed functors; `PolarizedDeformationProblem` and the pairing-triple equivalence; the framed presentation and enormous-image prime/presentation statements. `GroupGn` must consume its existing supplier, not be independently redefined here. |

Additional incomplete APIs include `Lift.limEquiv` and the two finite-generation equivalences for Φₚ. The native tangent, Carayol, restriction-of-lifts, strict-conjugation and scalar-quotient signatures were inspected and have substantive mathematical content; they do not fill the missing global declarations. Native tangent comparisons also need their packet-facing names and full API where these are prescribed.

There are 40 native `example` declarations, including the new conjugation witness. Several check useful subcases of the specified tests, such as coefficient-map equations, scalar framing quotients, the characteristic-three root obstruction and the S₃ sign line. This count is not a claim that 40 of the 71 contracts are covered one-to-one. All 71 names occur in the final comment; many have no native example testing the defined functor, representing ring or arithmetic hypothesis. The algebraic numerical identities do not replace tests of local-to-global maps, Selmer complexes, augmentation quotients or deformation types.

To accept a revision, introduce genuine supplier-backed data and the missing consumer signatures, with exact hypotheses and names, then add the specified examples against those definitions. Keep the unrestricted framing auxiliary distinct from the conditioned global quotient. State named ring and arithmetic theorems as Lean propositions; leave proofs admitted where necessary. PROTOCOL §13 permits an honestly omitted condition that cannot yet be stated, but not a placeholder predicate or a structure field that merely assumes the desired conclusion. Such an omission must remain an explicit limitation; its mathematical prose cannot be counted as an elaborated declaration.

## Primary sources and current suppliers checked

The source audit concentrated on hypotheses that can change the claimed functor, dimension or theorem. These are review receipts, not summaries of the sources.

- Kisin, Lecture 1, (1.1.1), Proposition (1.2.1), Lemma (1.3.1), Theorem (1.4.1) and Exercise 1, pp.1–4: residual identifications, Schur representability, open-subgroup finiteness, tangent conventions and the Artinian-local trace statement.
- Gee, arXiv:2202.05818v2, §§3.1–3.26, pp.12–18, and §5.6/Proposition 5.10, pp.33–40: local-problem axioms, tangent/presentation inputs, framed determinant conventions and the stronger SL₂ branch. The package retains the full-adjoint frame boundary; an elementary dimension example is not certification of the modified Selmer-complex comparison.
- Chenevier, arXiv:0809.0415v2, Theorem 2.22 and Corollary 2.23, pp.34–35, and §§3.1–3.8, pp.41–43: the Cayley–Hamilton quotient, residual split absolute irreducibility and continuous polynomial-law deformation functors. A determinant character G→Aˣ is not the required degree-n law on A[G].
- Khare–Wintenberger author final (2009), §2, pp.5–17; §4, pp.37–45; Lemmas 5.1–5.4 and 5.10, Proposition 5.11 and Lemma 5.12, pp.46–53; §9.1 and Proposition 9.3's construction, pp.78–87: finite-image restriction arguments, local/scalar framing, relation bounds, dyadic residual terms and compatible twisting chunks.
- Taylor (2006), Lemma 2.5 and proof, printed pp.749–750 (PDF pp.21–22): constituent-by-constituent detection. Its l>3 vanishing argument does not certify the package's characteristic-three branch. That branch retains its explicit, separate R01.4 detector and R02.6 vanishing obligations.
- BLGGT, arXiv:1010.2561v4, Lemma 1.2.3 and proof, pp.16–17: module-finiteness of the restriction map uses a finite universal residual fibre and trace generation; it does not establish flatness.
- CHT, Definitions/Lemmas 2.2.1–2.2.11, Proposition 2.2.9 and Corollaries 2.2.12–2.2.13, pp.16–25, and Lemma 2.3.4, pp.30–31: polarized local/global problems, nilpotent ideals, local liftability for the relation bound, nonempty framing and signs in the Euler term.
- ACC published (2023), Definition 6.2.2, Theorem 6.2.3 and Lemma 6.2.4, printed pp.1032–1033 (PDF pp.136–137); Proposition 6.2.25, printed p.1041 (PDF p.145); Definition 6.2.29, Lemmas 6.2.30/6.2.32 and Proposition 6.2.33, printed pp.1044–1047 (PDF pp.148–151): variable determinant, local coefficient rings, p∤2n, enormous-image detectors, degree-one prime selection and qn−n²[F⁺:ℚ]. The cleared published copy was read in place; the legacy arXiv-v2 citations were compared with the plan's edition correspondence, not independently checked in a second downloaded copy.
- Calegari–Geraghty published (2018), §§8.5–8.6, Lemma 8.3 and Propositions 8.4–8.5, PDF pp.113–115: its fixed-determinant count and image hypothesis remain distinct from the ACC enormous-image presentation.

Current TauCetiRoadmap main `3c18d9fbfceed0dc5c1edb1070a3927152d19e28` was inspected read-only. The complete ProfiniteArithmetic and Chebotarev documents were read for form and the latter's Layers 10 and 11.3(2) for the existing density/degree-one supplier. LocalGaloisGroups Layer 3 and its signature already supply finite generation of local maximal pro-p quotients. IntegralHeckeAndGaloisDeterminants IHG.1's actual `Theorems.henselian_irreducible` requires a Cayley–Hamilton determinant, residual splitness and absolute irreducibility, exactly the boundary retained here. ClassFieldTheory's ray-class correspondence and ModularCurves 0C's affine finite-flat quotient contracts were also inspected. These are imported planned interfaces, not baseline implemented theorems.

Current Tau Ceti main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was inspected for existing deformation constructions. The reviewed coverage file has no direct GlobalGaloisDeformations rows; this absence is not an implementation verdict. The raw AUDIT-32 roadmap rows and neighbouring reviewed coverage were read separately. The audit's old overlaps do not override the current supplier division or certify missing consumer declarations.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GlobalGaloisDeformations.json`: exit 0, zero errors and zero warnings; 67 nodes, eight planned layers, 91 APIs, 71 tests, zero gaps and 20 requests. The packet's existing `partial` status and open supplier requests were not changed.
- `lean-check research/blueprint/packages/GlobalGaloisDeformations/Suggested.lean`: final exit 0, zero errors, 40 `sorry` warnings and no other warnings. The shared build pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the imported LowDegree source was also compared byte-for-byte with the pinned Git object. The new dual-number matrix example has a closed proof.
- Target/API/test presence, fragment-link, README size, process-text and exact metadata checks passed.
- JSON syntax and `git diff --check` passed. Only this issue's package files, review report and required handoff are changed.

This is a completed independent review with a negative package verdict, not an unfinished package implementation or a checkpoint. Resume with the native Lean contract inventory above; package acceptance still requires those declarations and examples.
