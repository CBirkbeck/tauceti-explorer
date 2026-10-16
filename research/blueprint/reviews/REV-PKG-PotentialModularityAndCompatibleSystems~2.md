# Independent fixing review: Potential Modularity And Compatible Systems

Issue #9232, job `REV-PKG-PotentialModularityAndCompatibleSystems~2`. Reviewer: Codex, session `codex-XtmzAQ`, 2026-10-16. Neither package round was written by this reviewer. **Verdict: needs_changes.** This is a completed fixing review, not a checkpoint. The mathematical repairs are applied to the package; the remaining supplier, source and proof gaps below prevent an upstream-ready verdict.

## Scope and fidelity

Read the package, both accepted inputs (49 R23.1 targets and 43 R24.3 targets), the previous independent review, and the revision handoff. All 92 input target anchors remain, with seven additional targets, giving 99 mathematical subsections in 13 layers. Generic operations now refer to their actual lower-tier owner rather than claiming a second construction. The full CG finiteness and Dieulefait–Pacetti endpoints are restored alongside explicitly narrower milestones: weakening a theorem's hypotheses or output is not a way to close its proof gap. No packet was edited.

Applied WORKERS, PACKAGE_REVIEW, PROTOCOL §§5, 13, 20, UPSTREAM_GUIDE and the expansion protocol. LocalGaloisGroups and ProfiniteArithmetic provided the current upstream prose and representative-signature models. The README keeps mathematical hypotheses, APIs, Checks, examples and exact supplier contracts. Its size is governed by that content, not the superseded size cap in the first review. The one-line metadata remains `topic = "math.NT"`.

The elaboration baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The independent current-coverage audit used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These current checkouts were read only; they were not used to elaborate signatures unavailable at the pins.

## Corrections applied

1. **Function-field Chebotarev (§2.11).** A twist of a connected cover with a nontrivial constant extension is not generally geometrically connected. The corrected count uses its geometric components. In a compatible degree class the main term is `d·#C/#G·q^m/m`, where d is the constant-field degree; incompatible degrees contribute zero. The quadratic constant extension gives all degree-even primes in the identity class and none of degree odd. This rejects both the false connectedness assertion and the missing factor d.
2. **Compactness over imperfect local fields (§2.7).** A regular, geometrically integral proper curve need not be smooth, and its degree-zero Picard scheme need not be proper. Replaced the incorrect abelian-variety shortcut with Moret–Bailly's compactified-Picard argument: after a finite separable extension with a rational point, rational rank-one torsion-free sheaves on the regular curve are line bundles; the proper compactification has the same rational points. Added the regular cubic `y²z=x³+tz³` over `F₂((t))`, geometrically cuspidal with geometric Picard group `Ga`, as a counterexample to properness. The missing compactification supplier is explicit.
3. **Ordinary polarized adapter (§8.7).** Separated the automorphic finite character from the cyclotomic factor of the G₂ multiplier. Retained the actual multiplier `ε⁻¹κ₀`, rather than imposing a finite-order condition on it. Wrote the rank-two prolongation at complex conjugation, its matrix symmetry, the multiplier value −1, and the direction of the finite restriction map. Closed Lean examples distinguish the odd involution from the even one.
4. **Ordinary patching (§8.5).** Renamed the proposed `rankTwoOrdinaryRT` to `rankTwoOrdinaryPatching`. Thorne's near-faithfulness and characteristic-zero factorization do not assert an unconditional integral universal R=T. Added the coefficient-root-of-unity assumption from the setup on author p. 48 and retained the repaired adequacy and cyclotomic hypotheses.
5. **Full endpoint fidelity (§§8.8, 12.5).** Reinstated the exceptional small-image branches of full CG finiteness, and the unrestricted regular de Rham DP target. The adequate-image and KW-type constructions have distinct milestone names and explicit missing inputs. Dieulefait's small odd crystalline-weight theorem does not prove the full de Rham endpoint.
6. **Brauer genuineness (§12.1).** Named the missing `brauerOverlapHomCharacters` contract, with all pairs of descent fields, Mackey double cosets and coefficient embeddings. Its input is common algebraic character data and compatible automorphic descent, not the desired norm-one equality. The elementary norm-one theorem in Lean does not supply this arithmetic lemma.
7. **Existing owners (§§1.1–1.7, 1.16).** Removed duplicate family constructors/predicates already owned by AutomorphicGaloisRepresentations §7.1; retained explicit KW/Taylor comparisons and the additional operations. Corrected the description of current `TauCeti.repRing`: it is available for arbitrary monoids, but is a split K₀ of algebraic finite-dimensional representations. The arithmetic target additionally imposes continuity, finite ramification and semisimplification relations. An unipotent nonsplit extension tests this distinction.
8. **Local/global character and point contracts (§§2.1, 2.9, 3.1).** Replaced a claimed bijection with equivalence of existence for integral closed subschemes and field-valued presentations. An enlarged field presenting the same base point need not give a different subscheme. Added the good-spread, uniform Lang–Weil and smooth Hensel steps with Poonen's exact locators. Removed the unsupported promise that the CM character is unramified outside the prescribed set.
9. **Source accuracy and visibility.** Added the verified CDT Lemmas 3.1.1 and 4.2.4; marked the unverified Duke small-prime input explicitly. Added Savitt's corrected Corollary 6.15, Remark 6.17 and corrigendum, including the equal-character boundary in Theorem 6.12(4) and its extra lattice in (5). Marked the Skinner–Wiles refinement, Geraghty classicality/base-change inputs, determinant-square-root adapter, S-unit congruence and Snowden lifting comparisons as gaps instead of treating a citation as their proof.
10. **Suggested file.** Uses `import Mathlib`, one module introduction, the required namespace and ordered layer comments. The representative definitions have actual bodies; no arithmetic/geometric data are defined by `sorry`. The closing comment now includes `Picard.generalizedPicard` and records the distinction between the full endpoints and their restricted milestones. No theory was developed in order to fake the absent carriers.

## Remaining blockers and durable continuation

The README's explicit gap statements give the mathematical contracts, without review/process narrative. The following is the handoff for the next maintainer or revision; it survives deletion of scratch files.

- **§2.7:** AlgebraicModuliForArithmeticGeometry §7.3 does not currently provide the compactified Picard space and rational-point comparison for a regular curve that is not geometrically smooth. Supply these exact objects, properness and comparison; a smooth-curve Jacobian is insufficient.
- **§3.1 and §4.7:** Identify the strong S-unit congruence cited as Taylor's [Ta2, Lemma 2.1], and prove the totally real quadratic determinant-square-root adapter with its local conditions and avoidance. Hecke-avatar existence and Taylor's correction on p. 777 do not themselves discharge these steps.
- **§§4.4–4.6:** The split-CM alternative now has a plausible, explicitly planned level-adjustment/crystalline-lifting chain, with Taylor 2006 pp. 745–755 and 762–763 checked. The exact Skinner–Wiles prescribed-place/ordinary refinement remains unverified. Obtain the Duke theorem and following remark, compare every extra condition, and remove or prove any excess refinement.
- **§4.12:** Obtain Khare's Duke Lemma 2.2 or an exact alternative for l=3. Taylor's verified Theorem 5.7 assumes l>3.
- **§4.15:** Supply the arbitrary-totally-real Snowden Theorem 4.4.2 interface, retaining (A1), (A2) and matching p-types. Where prescribed lifts are used, supply Theorem 7.6.1 independently of the later rational-field extraction. The KW rational-field supplier is narrower.
- **§§8.3–8.6:** Read the exact Geraghty ordinary preprint statements and compare classicality, nilpotent kernels, base change/descent and arithmetic specialization. Thorne supplies several ordinary-module and Galois statements, but does not by itself verify every assertion in these new blocks. Coordinate their ownership below tier 20 as described next.
- **§8.8:** Close the two nonadequate projective-image branches at p=3 and p=5 and the local R† comparison. The adequate-image milestone is conditional on its component/finiteness inputs too; it does not imply the full target.
- **§12.1:** Build the coefficient-independent overlap Hom-character lemma before claiming the Brauer combination has norm one. Trace recognition on an already existing representation is a near miss.
- **§12.5:** Supply potentially Barsotti–Tate types outside the KW construction and general regular de Rham potential modularity. Keep all-member de Rham output from DP Definition 1.10; do not replace it with the weaker KW almost-strict predicate.
- **Source leaves:** The original Picard/compactification, Larsen–Pink/Larsen/Bogomolov/Bruhat–Tits and several older small-prime inputs remain source obligations. Their use in an inspected paper confirms that paper's statement, not a gap-free plan for all imported proof ingredients. The ledger below distinguishes these cases.

## Dependency ownership and current duplication

Checked mathematical objects, not just proposed names, across all nine newer upstream roadmaps, the four named Completed roadmaps, the remaining current roadmap tree and the current library. No complete target-level endpoint among these 99 was identified as already provided by the current Tau Ceti checkouts. This is a search result with the limitations of a source audit, not a theorem of absence. The reviewed library audit in `data/library-coverage.json` corroborates that the arithmetic Galois, deformation-point and eigenform-family objects are largely absent at the pins; its AMAG and HMVSC entries also identify the shared geometry. Actual current declarations were inspected before treating them as suppliers.

| Existing owner | Deferred object; retained additional target |
| --- | --- |
| Tau Ceti `AlgebraicGeometry/LineBundle/{Class,Rigidified/Basic,Rigidified/Automorphisms}.lean` | Line-bundle classes, arbitrary-morphism rigidification, tensor/pullback/forgetting and global-unit recognition; retain relative finite-flat-boundary group sheaves and divisor fibrations, not a private replacement |
| AlgebraicVectorBundles Layer 0; JacobianChallenge Layer D | Tensor/dual geometric infrastructure and ordinary relative Picard functor; retain the specified boundary and compactified regular-curve comparisons |
| Tau Ceti `RepresentationTheory/RepresentationRing/{Basic,Restriction,Induction}.lean` | `repRing`, `repRingCharacter`, `repRingRes`, `repRingInd`; retain the arithmetic semisimplification quotient and its Euler-factor/continuity contracts |
| RepresentationTheory/InductionRestriction Layer 6 | Finite-group Brauer induction; transport it into the arithmetic setting rather than re-plan it |
| LocalGaloisGroups; ProfiniteArithmetic; Completed RestrictedProducts | Local inertia/Frobenius, profinite and adelic carriers; retain the controlled-field and local Picard applications |
| Tau Ceti `NumberTheory/NumberField/Global/HeckeCharacter/Purity.lean` | Infinity-type weight/purity and norm formulas (`exists_weight`, `IsAlgebraic.exists_weight_norm_apply`, `IsAlgebraic.unitaryPart_iff`); retain the arithmetic-avatar purity comparison |
| AutomorphicGaloisRepresentations §7.1 (tier 18) | Family data, weak/strict/DP almost-strict predicates and coefficient extension/sum/tensor/dual/twist/restriction/conjugation; retain weaker KW/Taylor comparisons, induction and symmetric/exterior powers |
| ArithmeticGaloisRepresentations §§7.4, 7.6 | Polarized individual representations and monodromy of one representation; retain family witnesses and independence across coefficient places |

**Cross-roadmap action required.** AutomorphicGaloisRepresentationsPartII (tier 17) still contains upward references to this tier-22 roadmap's R24.5 operations. Repoint generic family operations to the actual owner, AGR §7.1, and move any genuinely earlier required family/polarization wrappers further down or revise the bundle/order. Merely rewriting this package cannot make that order acyclic.

OrdinaryAutomorphicFormsAndModularityLifting (tier 20) explicitly requests an adequate ordinary seed (BLGG13 A.4.1, §6.9) and Thorne 9.1/10.2 for its Newton–Thorne application (§6.13); its scope also records corrected split-CM/nearly ordinary inputs. The new level-adjustment and rank-two ordinary blocks here are tier 22. These are **required additions**, not all existing literal dependency edges. Put the appropriate source contracts below tier 20, naturally with the GL₂ level-adjustment owner and a lower ordinary supplier, or change the bundle/order. Do not add a backward citation to this package. PotentialAutomorphyInfrastructurePartII should then import those rank-two instances. I did not edit another job's files.

The old handoff's assertion that the *current* GL2AutomorphicRepresentationsAndTransfer README still cites the old R23.3/R24.5 targets was not reproduced; I found no such matches there. This review does not perpetuate that stale finding. CHT prescribed-completion refinements and the remaining weight/monodromy ownership questions still need exact contracts, as distinguished in the ledger.

## Source inspection

The reproducible sample is `random.Random(9232).sample(headings, 15)`, with `headings` the 99 numbered target headings in README order. It yields the rows below in this order. Every source passage in these sampled blocks was inspected, including the page images where Taylor's 2002 text extraction was defective. Locating a theorem is distinct from independently closing every proof input it cites.

| Target | Version and locator read | Result |
| --- | --- | --- |
| 4.14 | KW Annals, printed pp. 234–237, Theorem 2.1 and proof | Ordinary and supersingular inputs differ; prime three still needs its separate source |
| 12.5 | DP arXiv v2, Definition 1.10 and Theorem 1.11, p. 7; Dieulefait arXiv v1, Theorem 1.1, pp. 1–2 | Restored the full regular de Rham target; the small-weight theorem is narrower |
| 3.3 | Taylor Fontaine–Mazur, printed p. 13; Taylor 2006, p. 762 | Good ordinary local open and actual smooth moduli component are required |
| 1.16 | BLGGT v1 §5.4, pp. 61–63 | Arithmetic semisimplification ring distinguished from current split K₀ |
| 4.11 | Taylor 2006, pp. 769–771, Lemma 5.5 and Theorem 5.7; CDT author manuscript, Lemmas 3.1.1 (PDF p. 13), 4.2.4 (PDF p. 18) | Added the exact CDT source; level adjustment remains conditional on its precise input |
| 1.1 | BLGGT v1 §5.1, p. 51; Taylor 2006, p. 773 | Corrected the carrier ownership and extra exceptional-prime de Rham comparison |
| 1.6 | BLGGT v1 §5.1, pp. 51–53; Taylor 2006, p. 773 | Regularity, purity and all-place assertions remain separate |
| 8.1 | KW II author preprint, pp. 90–91, §10.1 | Auxiliary modular witnesses and local residual-image finiteness are both needed |
| 1.22 | BLGGT v1, Lemma 5.2.3, pp. 58–59; v4, Lemma 5.4.5, p. 76 | Any subrepresentation is allowed; polarization and total oddness remain |
| 4.7 | Taylor Fontaine–Mazur, printed pp. 15–16; Taylor 2006 correction, p. 777 | Determinant-square-root adapter is still a genuine gap |
| 2.11 | Poonen, pp. 222–223, Theorems 7.7.1–7.7.2; BHKT published p. 78, Proposition 9.2 proof | Corrected geometric components, degree congruences and density factor |
| 12.1 | KW II §10.3.2, p. 93; Khare arXiv v1 §3, Proposition 3.1 proof, pp. 16–17 | Norm-one proof needs the named coefficient-independent overlap input |
| 4.5 | Taylor 2006, Theorems 3.2–3.3, p. 755, setup/proof pp. 745–755 | Crystalline lifting retains the quadratic-restriction irreducibility and Fontaine–Laffaille bounds |
| 1.15 | BLGGT v1 §5.1, pp. 52–53; v4 §5.1, pp. 63–64 | Meromorphic Gamma cancellation is distinguished from totalized pointwise division |
| 3.4 | BCGP published Proposition 9.1.11 proof, p. 458 | Weil restriction and the two distinct torsion primes are substantive inputs |

Additional targeted reading included Moret–Bailly II pp. 182–193 (especially compactness pp. 192–193), Poonen's smooth Hensel statement 3.5.63(a), p. 83, CHT Lemmas 4.1.1–4.1.2, Thorne 2012 §§6, 8–10, the Thorne 2017 repair §7 (manuscript pp. 30–32), Gee–Geraghty Lemma 3.2.5 and proof p. 14, CG Theorem 4.8 proof PDF pp. 65–68, and Snowden §§3.1, 4.4, 5.1, 7.6/7.9, 8.2. Savitt's corrected Corollary 6.15 (author pp. 38–39), Remark 6.17 (p. 39) and the full three-page corrigendum were read through the author's public site. Stacks Tag 0G4F supplies the cited Bertini irreducibility statement with its hypotheses; it does not supply every stronger interpolation/smoothness assertion automatically.

Retrieval of the Geraghty ordinary preprint, Skinner–Wiles Duke source, Moret–Bailly's 1990 note and the cited Swinnerton–Dyer copy failed (403/404, timeout or certificate mismatch, depending on endpoint). They are not counted as read. The EGA/Jouanolou/Murre/Altman–Kleiman and monodromy originals named below were not read. No uncleared book copy was used, and no source files or source passages are committed.

## Disposition of all inherited gaps

“Located” below means the primary statement or a specified alternate was read; “contract” means a planned supplier is named but the required comparison is not certified closed. Replacing an unread input by its name does not close it.

| Input gap | Disposition after this review |
| --- | --- |
| R23.1 1 | Stacks 0G4F located for irreducibility; SF/AMAG supply planned Chow, Picard and Abel contracts. Original EGA, Jouanolou, Murre and Altman–Kleiman inputs remain unverified. The regular/nonsmooth compactified-Picard contract in §2.7 is missing. |
| R23.1 2 | CDT Lemmas 3.1.1/4.2.4 located in the author manuscript and added. Duke Khare Lemma 2.2, needed at l=3, remains unverified in §4.12. |
| R23.1 3 | KW II Theorem 8.2/local-type and Gross/Coleman–Voloch inputs remain supplier-side contracts of GL2ModularityLifting/SerreWeight; this package does not certify their closure. |
| R23.1 4 | §8.1 retains the universal residual inertia condition and cites KW II §§2.7, 3.3 with the SerreWeight optimisation interface. The exact finite-inertia comparison is still required; the minimal-ring analogy alone does not establish it. |
| R23.1 5 | §8.2 has modular witnesses and a finite restriction map, but the exact KW II Propositions 9.2–9.3/8.2 hypotheses remain a supplier comparison, not an independent consequence of the ring name. |
| R23.1 6 | Taylor's crystalline alternative is located and planned in §§4.4–4.6. Closure still depends on the exact level-adjustment refinement. The formerly excluded split-CM case is not silently passed to an incompatible ordinary theorem. |
| R23.1 7 | H6 provides the intended local moduli inputs; the totally real determinant-square-root step in §4.7 remains explicit. |
| R23.1 8 | Skinner–Wiles exact source/refinements remain unverified. Taylor 2006 pp. 762–763 confirms his narrower use, not every strengthened prescribed-place claim. |
| R23.1 9 | Corrected §§2.9/2.11 with good spread, smooth Hensel, uniform point bounds, constant-field congruences and geometric components. Prime-degree counting now has the correct factor. |
| R23.1 10 | §§2.6–2.7 state the projective-module/boundary-value and S-unit quotient steps. Ordinary weak approximation and bare Dirichlet units are not by themselves the full contracts; regular-curve compactification is explicitly missing. |
| R23.1 11 | §2.20 names full-group specialization and exact completions; Bianchi Proposition 4.5.1 is the primary endpoint. The exact-completion/Galois refinement of the BLGGT argument and Jordan/full-group comparison remain proof obligations, not just nonempty local opens. |
| R23.1 12 | Moret–Bailly 1990 original not retrieved. BHKT published Theorem 9.3 and Calegari Proposition 3.2 give accessible alternate endpoints with their local and constant-field conditions; do not attribute the unread original as checked. |
| R23.1 13 | Snowden's (A1)/(A2) and Theorem 4.4.2 were located. Their arbitrary-totally-real lifting interface remains missing; §4.15 now says so. |
| R23.1 14 | Corrected prolongation multiplier, oddness and finite-map direction. Thorne's repair is located. Geraghty/base-change comparisons, lower-tier ownership and full CG exceptional-image branches remain open. |
| R23.1 15 | §9.1 correctly requires dimension/non-torsion as well as finiteness, a continuous integral point, residue embedding and universal specialization. DDPA R03.4 is the planned source; O/(π) is the negative control. |
| R23.1 16 | Avatar existence has an owner; Taylor's stronger S-unit congruence does not follow from it. §3.1 now explicitly records the missing [Ta2] comparison. |
| R23.1 17 | Snowden 7.6.1 and proof located; independent prescribed lifts over arbitrary totally real fields remain required. Later rational-field point extraction cannot substitute. |
| R23.1 18 | §4.3 gives the torsion Fontaine–Laffaille subquotient and crystallinity contracts and signs. These remain planned FiniteFlat/AGR suppliers, not installed results. |
| R23.1 19 | Weil-restriction splitting into conjugate factors explains smoothness/geometric connectedness and local products; RG2/AMAG/A6 must supply the indicated actual functors and comparisons, including quasi-projective charts. |
| R23.1 20 | MB II local density and separable/excellent completion statements located; §2.2 plans the needed analytic inverse/density step rather than mistaking topology alone for the theorem. |
| R23.1 21 | §2.1 existence comparison corrected; §2.5 imports real current rigidified classes and retains relative group-sheaf/divisor laws and boundary tests. Missing heavy Lean carriers are permitted by the current shape; this does not certify supplier closure. |
| R23.1 22 | §3.2 outlines simultaneous prime selection and the socle/subdirect-product argument, with p>3 and excluded finite sets. CM-character compatibility still inherits §§3.1/4.7 gaps. |
| R24.3 1 | Savitt corrected Corollary 6.15/Remark 6.17 and corrigendum read; local absolute irreducibility supplies scalar endomorphisms. R15.4 still supplies the Serre-weight translation. |
| R24.3 2 | Dieulefait 2004 and DP v2 read. Gee 2011 original remains unverified; the small odd crystalline theorem cannot cover general regular de Rham input. |
| R24.3 3 | Individual monodromy has an ARG owner; common-component/coefficient-descent target stays here. Original Larsen–Pink/Sen inputs remain source leaves; BLGGT locators do not replace all of them. |
| R24.3 4 | Hecke-avatar construction removes the need for an unauthorized Serre-book copy. Larsen maximality, Larsen–Pink, Bogomolov, Bruhat–Tits and torus bounds still need exact sourced supplier contracts. |
| R24.3 5 | Current compact shape permits README-only heavy targets. All representative Lean bodies are real; names for unavailable carriers remain in the closing comment. Omission is not implementation. |
| R24.3 6 | Explicit `brauerOverlapHomCharacters` gap added in §12.1, with coefficient-independent Mackey pairings, rather than falsely claiming the elementary norm criterion supplies them. |
| R24.3 7 | Full DP endpoint restored in §12.5; KW-type milestone named separately. Arbitrary potentially BT and regular de Rham potential modularity remain missing. |

## Lean signatures and tests

The final representative file elaborates with exit 0 and exactly 33 `declaration uses sorry` warnings; no other warnings or errors. It has 358 lines and no sorry-bodied data. The two new matrix examples are proved by computation. Compilation checks typing, not truth of the sorry-proved mathematical statements.

| Signature spot-check | Hypotheses, comparison or negative control |
| --- | --- |
| `Factors.dualPolynomial` | Invertible-operator rule requires nonzero constant coefficient; X−2, 1 and X distinguish reciprocal, rank-zero and excluded cases |
| `Factors.archimedeanD` | Determinant ±1 and even odd-rank weight for multiplicity interpretation; sign and geometric cyclotomic cases |
| `Factors.archimedeanGammaFactor` | Raw quotient only agrees after meromorphic cancellation away from denominator zeros; elliptic value at s=1/2 detects the issue |
| `Factors.archimedeanEpsilon` | Trivial, sign, complex, rank-zero, elliptic and cyclotomic normalizations checked |
| `RepRing.eq_single_one_of_norm_one` | Positive irreducible dimensions and positive virtual degree select +1 rather than −1; 3·1−ε has norm 10 |
| `Fields.towerLinearDisjoint` | Tensor disjointness, finite D/C and B≤A; does not infer tensor disjointness merely from trivial intersection |
| `Fields.eq_bot_of_fixed_by_generators` | Finite Galois extension, generated automorphism group, pointwise fixing E; correct fixed-field direction |
| `Presentations.HasPresentation` | Genuine multivariate formal-power-series quotient; zero-variable, killed-variable and unit-equation cases |
| `Presentations.IsFlatCompleteIntersection` and theorem | General complete DVR, chosen uniformizer, nonzero quotient, proper equations, m≤n and O-finiteness; regular sequence and flatness are conclusions |
| `LiftParameters.RequiredLiftParameters` | Numerical type only; true character-order formula, divisibility, dyadic parity, q=5 failure and q=7 order-eight witness |
| `RequiredLiftParameters.requiresSteinberg` | Minimal crystalline is excluded from the predicate; weight-two p=3,k=4 versus k=2 distinguishes monodromy requirement |
| `ResidualMembers.weight_ne_half_weights` | Odd l, b<a and strict large-prime bound; l=3 collision shows why the bound is required |

Every target block with a definition/API was inspected for at least three substantive prose Checks; the checks retain computed examples, degenerate cases and near-miss/nonexamples. Heavy carriers are intentionally not invented to force full-object Lean tests. The point/compactness, determinant, split-K₀ and constant-field controls above repair concrete weaknesses rather than counting `example` lines.

## Per-target adversarial disposition

The following table records the hypothesis or plausible wrong version tested for each of the 99 targets. “Conditional” refers to the precise blockers/ledger above, not acceptance of an incomplete theorem.

| Target | Adversarial check / disposition |
| --- | --- |
| 1.1 Weakly compatible families of arbitrary rank | Taylor/KW exceptional members need the extra de Rham hypothesis; the dual Δ polynomial is changed with the member. |
| 1.2 Rank-two plain, almost-strict and strict families | KW almost strictness retains its residual/odd-unramified exceptions; DP almost strictness cannot be substituted. |
| 1.3 Very weak and extremely weak families | Extremely weak data do not acquire all-member Hodge or WD conditions by a change of name. |
| 1.4 Induction of families | Induction needs the actual finite base extension and local coefficient-prime comparison, not only good Frobenius traces. |
| 1.5 Polarized weakly compatible families | A family polarization retains its multiplier, CM involution and total-oddness witness. |
| 1.6 Regularity, purity, strictness and automorphy | Repeated weights fail regularity; away-coefficient strictness does not imply all-place strictness. |
| 1.7 Linear-algebra operations on families | Tensor weights add and dual weights change sign; imported basic operations are not reconstructed. |
| 1.8 Operations with polarization witnesses | The polarization witness must be transported with each operation; even/odd signs cannot be forgotten. |
| 1.9 Algebraic character families | Algebraic Hecke avatar, coefficient embeddings and reciprocity convention are necessary; an arbitrary character is not a family. |
| 1.10 Rank-one purity | Current infinity-type purity is only one input to arithmetic-avatar purity; norm convention fixed by the cyclotomic example. |
| 1.11 Purity of induced character families | Induced purity uses the arithmetic induction comparison at every embedding and the same weight. |
| 1.12 Artin families | Finite image gives an Artin family of weight zero, including repeated Hodge weights. |
| 1.13 Purity of Artin families up to twist | Artin twist preserves the specified weight only after the rank-one weight is included. |
| 1.14 Independence of characteristic-zero reducibility | Potentially abelian rank-two reducibility argument uses actual Hecke avatars; no comparison between unrelated coefficient fields. |
| 1.15 L-functions and archimedean factors | Gamma cancellation is meromorphic; totalized pointwise quotient at the elliptic central pole is a negative control. |
| 1.16 The arithmetic representation ring | Split K₀ is distinguished from semisimplification K₀; positive degree alone does not make a virtual class genuine. |
| 1.17 The common monodromy component field | Common component field is independent of λ; multiplicity-one restriction requires regularity and lattices are not canonical. |
| 1.18 Rational-system monodromy data | Groups and torus maps come from actual system images; rank-only bounds do not bound all character exponents. |
| 1.19 Uniform bounds for Serre's torus map | Constants depend on the system, not λ; cyclotomic powers rule out a universal system-independent exponent bound. |
| 1.20 Good integral monodromy primes | All six integral/image conclusions are retained; named monodromy originals remain source contracts. |
| 1.21 Density-one residual irreducibility | Density-one conclusion concerns every irreducible constituent; a regular reducible sum is a negative control to whole-member irreducibility. |
| 1.22 Polarized constituents and CM descent | Subrepresentation need not be irreducible; polarization, oddness and the CM extensions remain hypotheses. |
| 2.1 Skolem data and integral points | Integral subschemes and arbitrary field presentations have equivalent existence, not a naive bijection. |
| 2.2 Local density and integral points | Generic smoothness and separable/excellent completion conditions are retained; a topology alone supplies no density theorem. |
| 2.3 Shrinking and enlarging Skolem data | Shrinking changes the local opens and enlargement changes the base; closure of the resulting integral point is needed. |
| 2.4 Reduction to curves | Bertini must preserve prescribed finite points and local smooth loci; unrestricted irreducibility is a weaker supplier. |
| 2.5 Rigidified Picard functors and divisor fibrations | Boundary rigidification, relative fppf exactness and divisor fibrations are distinct; empty/two-component/full-boundary tests retained. |
| 2.6 Local Picard opens and approximation | Projective modules and fixed boundary values need more than ordinary affine weak approximation. |
| 2.7 The compact generalized-Jacobian quotient | Regular nonsmooth curve can have nonproper Picard scheme; corrected compactified-Picard contract remains missing. |
| 2.8 The integral-point theorem | Incompleteness is essential; a complete Skolem datum need not have an integral point. |
| 2.9 From integral points to split-field density | Good spread plus uniform finite-field bounds and smooth Hensel are explicit; no point claim over arbitrary small residue fields. |
| 2.10 Split-field density | All local embeddings are constrained; finite-field point selection and Galois closure must preserve them. |
| 2.11 Chebotarev density for global function fields | Constant-field congruence, d geometric components and factor d are retained; quadratic constant cover detects the old formula. |
| 2.12 Generating Frobenius primes | Chosen Frobenius elements must generate the finite quotient, rather than merely lie in a large set. |
| 2.13 Avoidance by extra split primes | Extra split primes must exclude every nontrivial avoidance subextension; trivial intersection uses finite Galois hypotheses. |
| 2.14 Disjointness through towers | Tensor disjointness and D/C finite are explicit; intersection alone is not the hypothesis. |
| 2.15 Extending finite local characters | Finite-order character extension retains infinite-place and p-primary conditions; generic Hecke existence is weaker. |
| 2.16 Soluble prescribed-completion extensions | Prescribed completions are actual local fields and groups are soluble; no fixed-degree cyclic promise. |
| 2.17 Three kinds of local conditions | Split, unramified and arbitrary finite-extension opens are different contracts, all embedding conditions retained. |
| 2.18 Approximation above a preliminary field | Weil restriction splits into all conjugate factors; opens need local invariance, not an invented global equivariance. |
| 2.19 Soluble preliminary fields and split extensions | Splitting after tensoring with L_v is weaker than identifying each completion with L_v. |
| 2.20 Surjective specialization of finite quotients | Full finite-quotient image and exact completions must hold simultaneously; local nonemptiness does not certify either. |
| 2.21 The function-field isomorphism torsor | Isom torsor is a curve over K; nonconstant image is needed for an embedding of function fields. |
| 2.22 Function-field points with fixed constants | Constant field and geometric connectedness are separate; excludes a constant specialization. |
| 2.23 Potential realization of local Galois data | BHKT and Calegari endpoints have their own local conditions; the unread 1990 original is not claimed verified. |
| 3.1 CM characters with simultaneous local reductions | CM character may ramify away from S; simultaneous S-unit congruence remains an explicit gap. |
| 3.2 Auxiliary primes, characters and coefficient fields | Simultaneous conjugate Frobenius conditions, p>3, CM avoidance and coefficient choices retained; downstream character gap persists. |
| 3.3 The twisted Hilbert moduli application | Forget p-level before using the smooth integral model; multiplicative reduction is excluded at the auxiliary p. |
| 3.4 The Weil-restricted moduli application | Actual Weil-restricted moduli and two torsion identifications retained; torsion primes are distinct. |
| 4.1 The ordinary auxiliary Tate module | Ordinary Tate-module shape requires the selected local torsion points and determinant normalization. |
| 4.2 Quaternionic forms and Hecke–Galois realizations | Forms and their Galois realization are imported HMVSC/AGR objects; no duplicate quaternionic theory. |
| 4.3 Fontaine–Laffaille shapes of quaternionic forms | Integral torsion Fontaine–Laffaille passage uses subquotient stability, not just characteristic-zero weights. |
| 4.4 Level adjustment after a soluble totally real base change | Skinner–Wiles level adjustment is more than soluble base change; exact prescribed-place refinement is a source gap. |
| 4.5 Crystalline lifting in the Fontaine–Laffaille range | l>3, split l-adic completions, Fontaine–Laffaille bound and quadratic-restriction irreducibility retained. |
| 4.6 Modularity transfer through the auxiliary variety | Good ordinary reduction and the crystalline lifting alternative address split CM; level adjustment remains conditional. |
| 4.7 Ordinary residual potential modularity | Totally real determinant-square-root adapter and its local conditions remain missing; correction p. 777 is not its proof. |
| 4.8 The niveau-two potential-modularity theorem | Niveau-two argument still needs the good-reduction and crystalline-transfer chain, not the excluded CM ordinary theorem. |
| 4.9 Quaternionic weight reduction | Integral Hecke surjection and its torsion reduction are required; scalar extension alone does not give residual eigenforms. |
| 4.10 The weight shift by l+1 | The l+1 shift changes the actual weight with compatible residual data, not just a formal integer. |
| 4.11 Weight and level removal | CDT locators verified; removal of level still depends on precise level adjustment and its hypotheses. |
| 4.12 The Serre-weight level-one witness | Verified Taylor theorem has l>3; Duke small-prime input remains explicit at l=3. |
| 4.13 Controlled residual potential modularity | Controlled extension keeps residual image, cyclotomic irreducibility and both modular witnesses. |
| 4.14 The ordinary Annals variant | Ordinary and supersingular branches use different sources; weight p is excluded. |
| 4.15 Residual modularity over totally real fields | Arbitrary-totally-real Snowden lifting has (A1)/(A2) and matching p-types; narrower KW supplier is insufficient. |
| 4.16 The two-prime ordinary refinement | Distinct p,q and both splitting conditions retained; q-ordinary local shape and determinant are fixed. |
| 5.1 Potential modularity of a given lift | A given lift is an input, not a consequence of residual potential modularity; KW-type restrictions remain. |
| 6.1 Local control and avoidance | Every local embedding and avoidance condition survives extension; Galois closure is tracked. |
| 6.2 Local Galois data over a composite field | Composite-field local data retain the two distinct coefficient primes and the specified embeddings. |
| 8.1 The auxiliary field for global finiteness | Auxiliary field contains actual modular witnesses and the finite universal residual-image comparison. |
| 8.2 Finiteness of the KW unframed ring | Unframed ring only; framed power-series variables defeat module finiteness. |
| 8.3 Definite unitary groups in two variables and their ordinary Hecke algebras | Ordinary projector, torsion-free level, Λ-finiteness and arithmetic classicality distinguished; Geraghty source gap retained. |
| 8.4 Galois representations on the rank-two ordinary Hecke algebra | Residual prolongation, multiplier, ordinary local factorization and automorphic descent all needed; source comparison remains. |
| 8.5 Rank-two ordinary patching for adequate residual image | Near-faithfulness/factorization replaces an unsupported universal integral R=T; repaired adequacy hypotheses retained. |
| 8.6 Rank-two ordinary automorphy lifting and ordinary finiteness | Automorphy lifting and finiteness are separate conclusions; seed, fixed multiplier/Hodge type and cyclotomic conditions retained. |
| 8.7 Ordinary unframed-ring finiteness | Odd versus even involution controls prolongation; finite-map direction is extension-field ring to original-field ring. |
| 8.8 The Calegari–Geraghty finiteness application | Full target includes nonadequate small images; adequate milestone and local R† comparison cannot erase them. |
| 9.1 Points give lifts with the required local type | Finiteness plus dimension/non-torsion yields an integral characteristic-zero point; O/(π) refutes finiteness alone. |
| 9.2 Points on prescribed Newton–Thorne components | Hida seed has determinant ε⁻²ω, not the original ε⁻¹; selected components and ring-level factorization retained. |
| 10.1 Böckle's global-ring presentation | Actual global deformation presentation with the required equation/variable bound; framed and unframed counts differ. |
| 10.2 Finite presentations and complete intersections | Complete DVR, chosen uniformizer, proper equations, finite nonzero quotient and m≤n; no assumption of the flatness conclusion. |
| 10.3 From auxiliary to minimal R=T | Auxiliary finite-flat R=T is an input; minimal comparison is not an unconditional existence theorem. |
| 10.4 The minimal-lift theorem | Odd characteristic, cyclotomic irreducibility and k≠p retained; endpoint crystalline and semistable choices differ. |
| 10.5 The four required lift types | Full arithmetic lift type is distinct from numerical parameters; level-two character has actual p-power order and parity. |
| 10.6 Minimal crystalline lifts | Minimal crystalline type at p=2 requires k=2; determinant/minimal-away-p clauses retained. |
| 10.7 Minimal weight-two lifts | Weight k=p+1 selects nonzero Steinberg monodromy in the weight-two lift. |
| 10.8 A level-one type at q | q odd, p divides q−1, residual q-shape and dyadic parity retained; p=3,q=5 is a nonexample. |
| 10.9 A level-two type at q | Genuine niveau two, p divides q+1, order and parity retained; q=5 dyadic failure versus q=7 order eight. |
| 10.10 Lift prescriptions in the modularity arguments | Application table uses the right one of four types and preserves auxiliary-prime restrictions. |
| 10.11 Prescribed-type local-to-global lifting | Modern prescribed-type existence requires the actual local components, residual image and determinant, not arbitrary O-algebras. |
| 11.1 Residual weight witnesses for lifting | Both residual modularity witnesses and local weight conditions are verified before invoking lifting. |
| 11.2 The full rational-field lifting theorem | Full odd-prime/dyadic rational-field theorem retains its separate residual and local hypotheses. |
| 12.1 Genuine families from Brauer induction | Virtual rank two is insufficient; coefficient-independent overlap Hom characters remain the missing norm-one input. |
| 12.2 The historical almost-strict comparison | KW almost-strict exceptions include reducible residual ramified coefficient-prime members; de Rham is not automatic there. |
| 12.3 All-place strictness of the Hilbert–Brauer family | Skinner full coefficient-prime theorem is a separate supplier, including dyadic/reducible cases; away-prime BLGGT is weaker. |
| 12.4 Families through the four required lifts | Savitt scalar-endomorphism hypothesis and corrected equal-character lattice case retained; q=2 has a separate argument. |
| 12.5 Families through given lifts | Unrestricted regular de Rham target kept; KW-type milestone cannot prove other potentially BT/high-weight cases. |
| 13.1 Residual members and their weights | Equal weights excluded from normalized Serre-weight formula; cofinite rank-two and general density-one conclusions differ. |
| 13.2 Local information at the coefficient prime | Only the exact KW clause is available abstractly; constructed strict families use the stronger coefficient-prime theorem. |
| 13.3 Links and modularity transfer | Residual link alone does not transfer automorphy; every local/image hypothesis of the lifting theorem is checked. |

## Public version fingerprints

The following downloaded public versions were used for source-location work on 2026-10-16. A fingerprint identifies a retrieved file; it does not claim the entire paper was read. The source-inspection section identifies the passages checked. Savitt's corrected paper and corrigendum were inspected through the public browser reader; no local byte hash is claimed for them. The Stacks citation is [Tag 0G4F](https://stacks.math.columbia.edu/tag/0G4F). No private paths or source content are preserved here.

| Public version | SHA-256 |
| --- | --- |
| [taylor-2002-fontaine-mazur](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf) | `e00ebd580b4bdb591345c051c6ae85801663b4a5807a12269c909a47eff3a57d` |
| [taylor-2006-meromorphic-continuation](https://ems.press/content/book-chapter-files/27484) | `6ec26bfc12e1cf38d410b36c18f985e2fb26c1cb1bb03d6e5197ccf58f92c51c` |
| [thorne](https://www.dpmms.cam.ac.uk/~jat58/bigness.pdf) | `5e9d15afa98ca38eb079c378b2ce59db7a57327f179073a59aaadea509a6b15b` |
| [blggt-2014](https://arxiv.org/pdf/1010.2561v1) | `697e2d318887d8eb940b914101bbcebcde9aaffb296ad95db45b328408df5fe6` |
| [blggt-2014-v4](https://arxiv.org/pdf/1010.2561v4) | `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24` |
| [kw-serre-modularity-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [kw-serre-modularity-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| [kw-annals-2009](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf) | `154c0c2a2245e50cb2be3c82705f9176fe0e9b597424236ddca11299d38cdb22` |
| [dieulefait-pacetti](https://arxiv.org/pdf/2108.07577v2) | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |
| [dieulefait-2004](https://arxiv.org/pdf/math/0304433v1) | `164b3f5d51ad3317c7aabecb81357cf4bd8c94fec57982258e6e2ce2b74b8ee1` |
| [khare-level-one](https://arxiv.org/pdf/math/0504080v1) | `3012a51759ad10695792bc8a2d1af75890f38d6ebacd37fb61e01bfdb89c9c2f` |
| [bcgp-published](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af` |
| [bhkt-published](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf) | `15c4b9668e335f75225215bb367c1051769990595232f8015f441d2e2c86ba2c` |
| [poonen-qpoints](https://math.mit.edu/~poonen/papers/Qpoints.pdf) | `42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579` |
| [cht](https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf) | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| [snowden](https://arxiv.org/pdf/0905.4266v1) | `b0c0008a55489b000d6a7b2004f6412c8829243b7254ba0efe152ac6e5fc06a2` |
| [gee-geraghty](https://www.ma.imperial.ac.uk/~tsg/Index_files/cfug.pdf) | `314ebde76e04254c788f59e1f6b9069d996e50943caf0dbd28774fd313f15e31` |
| [cg](https://math.uchicago.edu/~fcale/papers/CG.pdf) | `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5` |
| [newton-thorne](https://arxiv.org/pdf/2212.03595v2) | `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c` |
| [moret-bailly-1989-II](https://www.numdam.org/item/10.24033/asens.1582.pdf) | `fcd52552f0d04f06c9c07301341581ac37f04ef84eb5867a596c560588ab5fdd` |
| [moret-bailly-1989-I](https://www.numdam.org/item/10.24033/asens.1581.pdf) | `b1bec60bc061ae9c64fd08596aa9ad5b8e3d8d022766039cf88986aaae0a0d7a` |
| [qian](https://arxiv.org/pdf/2104.09761v1) | `4110023d4691d628adbc96842793696978de962b6109044e5d32779160835415` |
| [blght](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf) | `225cab84210837ca6130c1c76a5eababeffeaa8d1594b6267e853ce0ae8eabb3` |
| [bhkt](https://arxiv.org/pdf/1609.03491v2) | `ec54cf92ce04146c73b48945be2765f675359255d46cc94a0aa35a39229743b9` |
| [bianchi](https://arxiv.org/pdf/2309.15880v3) | `0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d` |
| [calegari](https://arxiv.org/pdf/1012.4819) | `8c95a021afd8fb5b7479f248bac5366389b6dd93b33f272f95f3ae3cbbda126b` |
| [bhkt-correction](https://arxiv.org/pdf/2502.20611v1) | `0735ecd6e5b41679c71f92a68db1c76f751a14cd17cb4de08ac77aa8ee10a6ad` |
| [bockle-appendix-2003](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf) | `67de08f6a1958d6c350d6de0ad70839cc737cc14c9c3636ab68fb1bd638202de` |
| [skinner-2009](https://ems.press/content/serial-article-files/26055?nt=1) | `4a2a489aa1401431b5b8279c5a246bfa147debba10698764fd6612ef37d0928d` |
| [acc-2023](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |
| [rank-two-adequacy](https://www.ma.imperial.ac.uk/~tsg/Index_files/U2.pdf) | `31838df42505245f32079aa3b3d4ba9ee81525079aa415daab05bfa17cf1eb96` |
| [thorne-2017](https://www.repository.cam.ac.uk/bitstreams/9bca3a85-7db2-4da6-b8cb-b91c54ee9620/download) | `f7b706eb2eb69354f5be3ce846193dc75f73ed46a7437eb54451b8f177af74c9` |
| [cdt](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf) | `e9dac063b9db6fd7b34e79907ce09095688b1fd8b1ea48c8527797b6090ae91c` |

## Validation

- `lean-check` on the package Suggested.lean: exit 0, 33 warnings, all `declaration uses sorry`; 358 lines. Available memory was 89 GiB before the final run.
- `python3 scripts/check_blueprint.py` on each unchanged accepted input: exit 0, zero errors and warnings (49/43 nodes, 22/7 recorded gaps).
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0, no offenders.
- `python3 research/blueprint/intake.py check-files` on the report and all four package files: zero problems.
- Target/link audit: 92 input anchors mapped, 99 target headings, no missing internal anchors or reference definitions; definition/API blocks retain at least three Checks. Every primary README target name is a declaration or named in the closing comment.
- `git diff --check`: passed. No packets, source files, other packages or current upstream files changed. The report is the durable handoff; no separate out-of-scope handoff file was created.
