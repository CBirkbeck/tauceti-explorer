# PKG-OrdinaryAutomorphicFormsAndModularityLifting

Complete package for #9782, written by Codex, session `codex-Wr9UzQ`, 2026-10-14. Claim confirmed by the swarm bot on comment 6174396190. The accepted input is the 93-target, six-layer packet and its reader and suggested file; none of those inputs was edited. This is packaging, not an independent review, and no independent verdict is recorded here.

## Deliverables and validation

- `packages/OrdinaryAutomorphicFormsAndModularityLifting/README.md`: full prose roadmap, opening Summary, boundaries, conventions, exact supplier contracts, six layers, every accepted target and its API/checks/acceptance conditions, worked examples, and source locators. Washington's distinct-prime theorem is an additional explicit §5.9 target, replacing an inadmissible supplier edge.
- `Suggested.lean`: 243 lines, `import Mathlib`, one module docstring and namespace, layers in README order, two real-bodied finite-function definitions, four theorem signatures with `sorry`, 29 proved examples, and a closing list of the heavier README definitions. No data definition is sorry'd; no arithmetic carrier is fabricated.
- `metadata.toml`: `topic = "math.NT"`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/OrdinaryAutomorphicFormsAndModularityLifting.json`: exit 0, 0 errors, 0 warnings. The unchanged packet reports 93 nodes, 106 definition/construction API items, 74 definition/construction unit tests, six planned stages, six gaps and 25 requests. These are planning counts, not implemented mathematics.
- Inventory against the raw input: all 93 targets, all 109 API names and all 78 named checks remain (the checker counts only definition/construction APIs/tests). Every one of the 22 definitions/constructions has at least three tests. The package adds the field-valued nondegeneracy and trace-composition signatures and further negative controls.
- Final `lean-check` of the package: exit 0, only four `declaration uses sorry` warnings, at lines 32, 38, 44 and 105. No errors or other warnings. Memory was checked before starting; one elaboration ran at a time. These signatures elaborate; the four target theorems are not proved.
- Pin: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti baseline `f790474821cf4256814db967cb154e7af3d0c369`. Read the twelve baseline declaration statements locally, including the generated additive `Fintype.sum_fiberwise`, and distinguished their hypotheses from the missing arithmetic constructions.
- Current duplication check: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read only. Searched mathematical fields/operators and hypotheses across current Suggested files, READMEs and Completed roadmaps, including all nine roadmaps newer than the atlas snapshot. Read ModularForms and ProfiniteArithmetic as full README models, and their suggested signatures. No ordinary arithmetic comparison target was found already implemented. The library-coverage audits of PadicFamilies L0/L0a/L4/L5 and AutomorphicGaloisRepresentations R19.6 were read.
- Every explicit local prerequisite ends in this roadmap or an allowed lower-tier supplier; no later-layer prerequisite remains. No `FoundationsAndLibraryIntegration`, `UPSTREAM:`, packet/job IDs or machine paths remain in the package. The exact supplier contracts preserve distinctions between data that exist and arithmetic results to be proved.

`python3 research/blueprint/intake.py check-files` on all four deliverables: 4 files, 0 problems. `git diff --cached --check`: passed. Independent package review is the next programme step; this worker must not take that review.

## Ownership and moves for the manager

1. The ordinary projector and towers, their weight algebra/control/freeness and ordinary big representation stay with PadicFamilies L0/L0a/L4/L5. The kept targets state exponent comparison, arithmetic localization/compatibility and the EPW new-quotient refinements. Definite class sets and integral pairings are imported from R18.3; the finite function formulas add no second class-set construction.
2. Generic pseudocharacters, determinants and integral Hecke representations are already covered by current IntegralHeckeAndGaloisDeterminants. The boundary now cites that roadmap. The ordered Wiles triple `(a,d,x)` keeps the extra ordered matrix-entry data of the residual reducible problem; it is not a second generic determinant theory. Classical modular forms, Hecke/q-expansion and newform infrastructure are imported at their existing scope; the current `Newforms/Coefficient.lean` prime-power recurrence was read as a concrete witness.
3. Replace the upward `AutomorphicPadicLFunctions:L3` edge by the already allocated PadicFamilies L5 Deligne–Ribet/Eisenstein-measure contract. No AutomorphicPadicLFunctions package is imported.
4. Replace `IntegralIwasawaTheory:L4` (not in the permitted lower-tier chain) by the distinct-prime Washington theorem here, §5.9. A higher Iwasawa roadmap can import this statement; a same-prime μ=0 result does not supply it.
5. The p-adic unit-rank estimate is an explicit DiophantineApproximationAndTranscendence DT.3, Part II contract, at its lower tier. Its correct bibliography is the Bolyai article (1984), Theorem 1.1, p. 1620, not the inherited Compositio reference. Require the character projection and class-field rank calculation too.
6. Raynaud's exact Cohen–Macaulay connectedness result remains an R03.6 extension contract, not an application of that supplier's narrower patched-domain theorem. The residual-level theorem is an R17.4 extension contract with the newly checked statement below.
7. BLGG tensor automorphy/untwisting, the adequate-image unitary ordinary theorem, Allen's dihedral input and Newton–Thorne's rank-two global component/finiteness argument remain explicit requirements of this lower-rank interface. No upward import from GL2ModularityLifting or PotentialAutomorphyInfrastructure is introduced. Those higher roadmaps import this interface when its proof chains are supplied. The existing restructuring question is not resolved by this packaging job.

No current Tau Ceti target was removed from the accepted inventory: the inherited targets are arithmetic refinements with the above boundaries. Supplier constructions themselves are not re-planned as independent targets.

## Source audit and status of the six inherited gaps

Read primary public PDFs in scratch and the cleared ACC author copy in place; no source files, excerpts or section-by-section summaries were committed. Source page numbers below distinguish printed and PDF pagination. The package uses its own words.

| Inherited gap | What this package establishes and what still needs proof |
| --- | --- |
| Raynaud connectedness | Read SW99 Appendix A.1–A.2, printed pp. 123–124 (PDF 120–121), including its dimension induction. Corrected the proof locator. Raynaud's original primary proof was not checked; the exact R03.6 theorem is still a supplier requirement. |
| Washington | Read the primary theorem, §1 p. 87, and the proof §§2–4, pp. 88–97, from the public GDZ Inventiones volume. Added §5.9 with abelian-field and distinct-prime hypotheses. The old primary-statement uncertainty is discharged; a Lean construction/proof of the stated theorem remains work on the roadmap. |
| Waldschmidt | Read the primary statement, Theorem 1.1 p. 1620, and introductory notation in the public author scan. Corrected its bibliographic identity and the odd-degree rounding. The full primary proof was not audited. In even totally real degree d the required bound is δ≤d/2; for relative minus units of a totally real quadratic extension it gives δ⁻≤d/2. It supplies no such bound for CM minus units. The Part II proof contract remains. |
| Residual-level base change | Read the primary Duke theorem on p. 17 and preparation on pp. 18–19; inspected the theorem image to check notation. For a weight-two modular irreducible residual representation, p-places split completely, irreducibility is preserved, and the new level divides the **p-power part** of the old level times the residually ramified primes away from p. Ordinary/nearly ordinary and the chosen distinguished good quotient are preserved. Weight conversion is the paragraph on p. 17; arbitrary auxiliary prescribed splitting/ramification is limited to places outside the original level. Added the primary bibliography/link. The old unread-statement gap is discharged; even-degree/large-local-degree preparation is a separate step. |
| Full CM/mixed dihedral lifting | Still unresolved. Preserve the restricted §5.6–5.7 route and the explicit original-scope §5.8 target. The CM unit-rank counterexample prevents using the printed universal d/2 argument. Skinner's cited 2009 correction was not obtained and is not asserted to close the proof. |
| Rank-two ordinary seed/component automorphy | Still unresolved at proof-chain level. Preserve all §6.7–6.13 targets, their precise local determinants/components and the named tensor, untwisting, adequate-image, dihedral and finiteness inputs. Their source statements are not proofs supplied by earlier ordinary projector layers. |

Additional source checks (more than fifteen locators, chosen across the layers and source families):

| Package target | Locator read and result |
| --- | --- |
| 1.3 | SW99 §3.2, printed pp. 31–33: ordinary summands have full tame invariant factors; corrected the false one-dimensional-everywhere tensor formula. |
| 3.8 | SW99 Lemma 2.10, p. 20 (PDF 17): finite tangent bound, with finite elementary abelian p-quotient rather than finite full abelianized pro-p quotient. |
| 3.12 | SW99 Proposition 2.15, p. 26 (PDF 23), construction pp. 24–25: domain hypothesis; ratio adjunction/localization/completion is not a finite birational assertion. |
| 3.19 | SW99 Lemma 3.16, pp. 44–45 (PDF 41–42): conductor comparisons and order hypotheses. |
| 3.21 | SW99 Proposition 3.20 and proof, pp. 50–51 (PDF 47–48): the infinite-order inertia element is at v dividing p; corrected I_w to I_v. |
| 3.22 | SW99 Lemma 3.21/Remark 3.22, pp. 51–52 (PDF 48–49): tame trace δ+δ⁻¹. |
| 3.30 | SW01 Lemma 2.2, p. 191 (PDF 8): retained the inducing-field signature restriction needed by its dimension argument. |
| 4.3, 4.6 | SW99 Appendix A.1–A.2 and Proposition 8.4, pp. 123–124: corrected connectedness proof page and kept the minimal/all-level distinction. |
| 4.7 | SW99 Main Theorem, pp. 73–74 (PDF 70–71): exact permissible good solvable extension hypotheses. The trace comparison uses absolute irreducibility of the attached cuspidal representation, now explicitly included in the R19.2 contract. |
| 4.10 | SW99 Lemmas 6.1–6.5, pp. 88–91 (PDF 85–88): distinguished local characters exclude the dihedral summand; only the specified pro-p subgroup has all finite-order eigenvalues equal to 1 in characteristic p. |
| 5.1–5.3 | SW99 Hypothesis H and Theorems A/B, pp. 74–79: conditional versus abelian route, uniform c(ε), ε>0 and distinct tower prime. |
| 5.5 | Dieulefait–Pacetti Theorems 1.6–1.7, pp. 4–5; Pan Theorem 1.0.2, p. 3: the mod-3 cyclotomic case is the excluded Pan ratio, so it needs the separate branch. |
| 6.3 | EPW Theorem 2.3.1 and Propositions 2.3.2–2.3.5, pp. 10–13: corrected inertia **coinvariants**, Theorem 2.3.4 page 13, and the full cyclotomic determinant convention. |
| 6.4 | Hida Corollary 3.7, printed p. 253 (PDF 24): primitive family uniqueness; the weight-two entry also uses EPW's control interface. |
| 6.5 | Mazur Proposition II.9.7, printed p. 96 (PDF 65): X₀(11) Eisenstein index 5. |
| 6.7–6.8 | BLGG12 Propositions 6.1.3–6.1.4, pp. 35–40, and Theorem 6.1.9, pp. 44–45: seed/disjointness and prescribed-component hypotheses differ. |
| 6.9–6.10 | BLGG13 Proposition 2.1.1 and Theorems A, 2.1.2, 3.1.1–3.2.1, PDF pp. 1–5: adequacy is weaker than 2-big; the exceptional F₅ realizability condition is retained. |
| 6.11 | BCGP Proposition 10.1.3, pp. 265–267: the printed p=5 case is F₅-valued. The F̄₅ refinement needs the separately stated determinant-one/scalar image argument; it is not attributed to BCGP as an extra statement. |
| 6.12–6.13 | Newton–Thorne arXiv v2, Lemma 2.6 p. 12, Lemma 3.1 pp. 13–14, Proposition 6.1 proof pp. 46–47: q is the lifting coefficient prime in the Steinberg construction; same local component does not mean same representation. |
| 3.37 | ACC Proposition 6.2.12, published pp. 1036–1037, read in the cleared author copy: keep the spectrum/component comparison at the distinct-character locus, not an equivalence of nonreduced coefficient functors. |

Locators outside this table remain locators of the accepted plan; this is not a claim that every source proof was re-proved. In particular Hida's [H2]/[H3] results, Raynaud's original connectedness proof and the general rank-two automorphy inputs retain their exact supplier obligations. The primary Washington PDF can be found at the GDZ digitization of Inventiones 49 (1978); the package bibliography gives the DOI. The primary Waldschmidt scan is linked directly in the bibliography. The private ACC file stays in the maintainer's library; consult its index for the approved copy.

## Mandatory adversarial mathematics pass

This is the author's full arithmetic audit, not the independent package review. Every target below was checked against its hypotheses, coefficient scope, defining examples and map/normalization direction. Existing discriminating checks are retained; corrections and explicit counterinstances are listed. The pass also covers all opening conventions: p odd, even quaternionic degree, O the integers of a finite extension of Q_p, separate equal-characteristic patching, unit stabilizer denominators, full versus p-adic cyclotomic character, ordered ordinary flags, weight coordinates, adjoint versus norm-factor module, square determinant twist, and local completion scope.

| Section / accepted target | Instances and result |
| --- | --- |
| 1.1 / `projector-exponent-comparison` | m=0 gives 1 on the nilpotent factor; require m≥1. Unit 2²⁰=1 mod 25 and 5³=0 mod 125. Finite residue field and complete O-algebra are explicit. |
| 1.2 / `ordinary-part-kills-norm-forms` | N divisible by p acts nilpotently on the finite O-lattice; tensor to arbitrary R only afterwards. No topology on arbitrary R is inferred. |
| 1.3 / `quaternionic-nearly-ordinary-hecke-algebra` | Multiple tame oldvectors may occur; ordinary p-factors are good lines, away-p factors are full invariant spaces. Algebra faithfulness survives choosing an eigenvector. |
| 1.4 / `ordinary-hecke-adjoint-pairing` | Empty set, c=1, c=2 over Q, c=0, and c=2 over F₂. Distinguish unit denominators from positive integer counts; central z has adjoint z⁻¹. |
| 1.5 / `ordinary-trace-compatibility` | Two-point fibre gives 5, empty fibre gives 0; stabilizers 2/1 give arithmetic trace 6 at value 3. Multiplicities cancel in weighted adjunction. |
| 2.1 / `nearly-ordinary-representations` | Ordinary implies nearly ordinary; ramified quotient gives nearly ordinary only. Good-line uniqueness uses the local newform hypotheses, not arbitrary eigenspaces. |
| 2.2 / `nearly-ordinary-hecke-algebra-comparison` | Norm-factor quotient and ordinary projector yield the same Hecke eigenalgebra; oldvector multiplicity does not imply a larger algebra. |
| 2.3 / `permissible-maximal-ideal` | Eisenstein trace congruence alone lacks the selected unit quotient. Ramanujan mod 691 congruences and residue choice test the extra T₀ condition. |
| 2.4 / `eisenstein-ideal-existence` | L_p is a nonzero nonunit; a unit yields no congruence and zero is not interchangeable. p odd and the Eisenstein constant-term normalizations remain. |
| 2.5 / `permissible-weight-algebra` | r_i=0 gives rank 1; p=5,r=1 gives rank 5. Quotient eigenvalue formula divides by β−α and respects the opposite labels used in §3.17. |
| 2.6 / `permissible-localisation-finite` | Λ-freeness needs the permissible localization, including its extra coordinate action. No freeness over every completed finite-torsion group algebra is inferred. |
| 2.7 / `auxiliary-level-freeness` | Δ=1 recovers ordinary freeness; nonidentity fixed-point freeness is the criterion. Trace is coinvariants, not an averaged projection. |
| 2.8 / `hecke-module-duality` | ⁺ is the Hecke adjoint action. Coefficient-of-identity duality differs from augmentation; complete-DVR compact/discrete duals are the required coefficients. |
| 2.9 / `ihara-lemma-quaternionic` | At norm-factor/Eisenstein loci Ihara injectivity has a kernel; retain the localization, quotient and auxiliary-prime hypotheses. |
| 2.10 / `ihara-exact-sequence` | r=1 and successive deeper levels test the two-/three-copy map directions. The deeper exactness claim is separate from the first Ihara injection. |
| 2.11 / `hilbert-ordinary-weight-change` | Residual ε̄⁻²ω=ε̄⁻¹, so weight change preserves determinant reduction. Arbitrary totally real degree requires the Hilbert Hida contract, not only definite even degree. |
| 3.1 / `deformation-datum` | c=0 loses the nonsplit Schur residual condition. Local split-at-p admissibility permits the designated χ-sub/1-quotient flag. |
| 3.2 / `deformation-of-type` | Q empty is the original functor; removing torsion determinant gives minimality. A split representation can admit both flags, so wrong labels test the chosen flag. |
| 3.3 / `permissible-extension` | Self-extension is permissible. Full residual splitting fields and F(χ) fail total reality for odd χ; local distinguishedness can fail independently. |
| 3.4 / `global-presentation-bound` | Schur, not absolute irreducibility, is the reducible residual presentation hypothesis. Count every local relation and determinant variable in the lower bound. |
| 3.5 / `matrix-entry-subring` | Trace alone does not see a nonzero upper extension. Matrix-entry generation retains its ordered presentation and topological closure. |
| 3.6 / `ramification-types` | Type A requires nonzero extension; nontrivial p-power inertia characters vanish in characteristic p. Scope fields to characteristic 0 or p for typeC_charZero. |
| 3.7 / `pseudo-representation` | Diagonal matrices give x=0 even for different extensions; diagonal conjugation cancels the two scaling factors. A commutative coefficient ring with 2 invertible is explicit. |
| 3.8 / `universal-pseudo-deformation` | H1–H3 give only a hull. Unique coefficientwise fibre-product gluing gives H4; finite elementary abelian p-quotient controls the tangent dimension. |
| 3.9 / `pseudo-to-deformation-map` | Independent admissible tangent extension classes c+ηh have the same pseudo-data and different strict-equivalence classes. Non-surjectivity is conditional on such an h. |
| 3.10 / `pseudo-deformation-localisation` | At reducible primes, invertible matrix-entry normalization is unavailable. One-dimensional irreducible primes are required for the stated localization. |
| 3.11 / `lattice-reduction-lemma` | Irreducible fraction representation may have a nonsplit reducible residual lattice. Extension class is only defined up to scalar/coboundary as stated. |
| 3.12 / `pseudo-deformation-lifting` | k[η]/η² cannot inject into a domain. Added R-domain hypothesis; no finiteness of the ratio-adjoining completed extension is asserted. |
| 3.13 / `deformation-iwasawa-algebra` | 1+T maps to determinant and 1+Y to quotient, not inverses. Minimal torsion determinant and auxiliary empty Q preserve these directions. |
| 3.14 / `hida-family-representation` | Minimal-prime fraction field versus integral coefficient model are separate. Frobenius determinant S(ℓ)Nm(ℓ) and ordinary quotient eigenvalue remain normalized. |
| 3.15 / `hecke-pseudo-representation` | At reducible residual systems integral traces/pseudo-data exist without an integral GL₂ model. Fixed complex-conjugation eigenlabels determine ordered entries. |
| 3.16 / `permissible-residual-comparison` | Semisimple χ⊕1 does not choose the p-quotient by itself; T₀−1 supplies that condition in the permissible ideal. |
| 3.17 / `hecke-generation` | β=3,α=1,u=5,v=1 gives quotient 1; multiplying gives 4, equal eigenvalues give a false zero-recovery. Unit difference is explicit. |
| 3.18 / `level-type-control` | Unramified, type A, B and C require different local subgroup/conductor levels. V contains U, so the Hecke quotient map points in the stated direction. |
| 3.19 / `inertia-character-constraints` | r=1 forces the inertia character trivial where claimed; finite order prime to p is not the same as p-power order. Read both conductor formulas. |
| 3.20 / `family-twisting` | Twist multiplies trace by ψ and determinant by ψ²; quotient eigenvalue 3 twisted by 2 gives 6. Corrected nonminimal Q⊆Q′ direction. |
| 3.21 / `characteristic-p-primes-auxiliary` | Infinite-order inertia is at v dividing p, not tame w away from p. Residual/cyclotomic restrictions and non-dihedrality remain in Chebotarev selection. |
| 3.22 / `auxiliary-trace-identity` | δ=1 gives trace 2; δ+δ⁻¹−2 is s²/(1+s). Coefficient subgroup is tame p-inertia, and the level change commutes with this action. |
| 3.23 / `deformation-hecke-rings` | Q empty recovers the base ring/module. Augmented, minimal and torsion-character structures have separate quotients; ⁺ denotes adjoint action. |
| 3.24 / `minimal-hecke-ring-decomposition` | N_D trivial gives T=Tmin; otherwise square twisting accounts for determinant. Retain the specified reduced/minimal quotient. |
| 3.25 / `level-raising-congruence-modules` | Repeated residual eigenvalues at the auxiliary prime defeat the no-level-raising criterion. Non-Eisenstein and residue-size hypotheses are retained. |
| 3.26 / `nearly-ordinary-arithmetic-control` | Localization and algebraic weight specialization have different kernels. Unit quotient control is not inferred from trace congruences. |
| 3.27 / `reducible-locus-dimension` | x=0 is the reducible/diagonal bound locus; torsion determinant is specialized before the dimension comparison. Do not replace the finite-order quotient conditions. |
| 3.28 / `irreducible-deformation-datum` | Residual ordinary extension can be nonsplit; wrong ordered flag is a separate datum. Q empty and N_Σ trivial recover the base/minimal versions. |
| 3.29 / `irreducible-presentation-bound` | Nonsplit local ring dimension is required, not the split formula copied without proof. d, t and #M count separate local/global relations. |
| 3.30 / `dihedral-deformation-dimension` | CM minus unit rank is 0 and δminus can be d when all p-places split; totally real quadratic minus unit rank is d. Restrict the half-degree assertion. |
| 3.31 / `irreducible-trace-generation` | Residual absolute irreducibility is essential for Carayol trace generation. Enlarging excluded S retains density, not an equality of finite generating lists. |
| 3.32 / `integral-hecke-galois-representation` | Integral GL₂ model is only for irreducible residual m. Weight coordinates and finite free Λ/Λ′ rank agree with the reducible route. |
| 3.33 / `irreducible-permissible-hecke-rings` | H_def requires an existing good modular seed. Residually reducible Eisenstein existence is not substituted for this irreducible hypothesis. |
| 3.34 / `irreducible-hecke-surjection` | Residual ramification at w∈M excludes the unramified specialization; tame nilpotence gives an integral rank-one flag. Surjectivity uses trace generation. |
| 3.35 / `irreducible-minimal-hecke-quotient` | N_Σ=1 is the identity decomposition. Tame trace and torsion determinant are compatible with square twists; no arbitrary nonreduced algebra is identified. |
| 3.36 / `ordinary-local-tangent-hecke-comparison` | Local tangent conditions depend on the prescribed ordinary flag. Trivial local class and dual complement test the Greenberg–Wiles pairing scope. |
| 3.37 / `ordinary-determinant-flag-contract` | Distinct-character open locus is necessary. Spectra/component comparison does not identify nonreduced coefficient functors or all flag choices. |
| 4.1 / `pro-modular-prime` | A reducible residual point need not be pro-modular. A pro-modular prime is a kernel of the specified pseudo-map; component and all-prime statements differ. |
| 4.2 / `good-pair-and-nice-primes` | Goodness uses strict degree inequalities and a nonzero nonunit L-value. Nice primes are dimension one in characteristic p with infinite local quotient ratios. |
| 4.3 / `raynaud-connectedness-corollary` | r=0 tests the original Cohen–Macaulay punctured spectrum; r=d−2 is the endpoint, while r>d−2 is excluded. Both partition parts must be nonempty. |
| 4.4 / `pro-modularity-key-proposition` | Dimension cuts include determinant, p and local ramification relations. Pro-modularity needs both P1 and P2 and every strict good-pair bound. |
| 4.5 / `p2-criterion` | c proportional to c₀ is the easy case; independent c requires the two-class cut. Type B′ with p-power inertia is excluded in characteristic p, not all type B′. |
| 4.6 / `property-p1` | Minimal torsion twist must be undone after localized R=T. Even degree is used for modules; this statement alone is not unrestricted global R=T. |
| 4.7 / `main-theorem` | Only L needs even degree. Use attached cuspidal absolute irreducibility in the trace comparison; preserve permissible extension and solvable Galois closure. |
| 4.8 / `formal-patching-datum` | N varies through odd cutoffs and generator counts stay uniform. A_N acts on modules; B_N naturally acts on rings. Separate arithmetic verification from generic patching. |
| 4.9 / `formal-patching-theorem` | Inverting T is essential for freeness and the 2ⁿ comparison. n=0 is excluded by the datum, not silently a new arithmetic theorem. |
| 4.10 / `char-p-adjoint-irreducibility` | Characteristic-p finite roots on the pro-p subgroup are 1; global prime-to-p roots need not be. Infinite ordinary ratio and distinguishedness rule out dihedral adjoint summands. |
| 4.11 / `auxiliary-prime-sets` | Uniform Q_N cardinality is separate from congruence accuracy. Frobenius and cohomology selection retains its image and determinant hypotheses. |
| 4.12 / `minimum-level-surjection` | Completion, localization and Λ-tilde base change are in the map domain. A formal tangent map does not give a global ring isomorphism. |
| 4.13 / `minimum-level-r-equals-t` | Freeness after localizing at a nice prime yields the minimal comparison only; trace ring and full deformation ring are still distinguished. |
| 4.14 / `level-raising-congruence-maps` | Higher/lower levels have different multiplicities and congruence annihilators. Trace/residue directions agree with weighted adjunction and Ihara quotient. |
| 4.15 / `nice-prime-r-equals-t` | All-level R=T still means completed local rings after weight base change. Minimal comparison and congruence maps are both needed. |
| 4.16 / `irreducible-good-pair-and-nice-primes` | Minimal good-pair inequality uses #M₀. The strengthened general-level #Σ bound is additional; not implied by minimal goodness. |
| 4.17 / `irreducible-pro-modularity` | d=40,t=1,#M₀=0,#Σ=4 is a counterexample to the weaker general argument. Add d/2>2+2t+7#(Σ−P) and every encountered dihedral-locus bound. |
| 4.18 / `irreducible-selmer-auxiliary-primes` | Characteristic-p DVR and residual irreducibility are retained in Selmer selection. Auxiliary congruence depth and uniform cardinality are separate. |
| 4.19 / `irreducible-nice-prime-r-equals-t` | Only after Λ-tilde base change, localization, completion and T-inversion in patching. Rtr=R uses residual irreducibility; no reducible Carayol shortcut. |
| 5.1 / `hypothesis-h` | S empty tests the bound only; c(ε) independent of K,S and ε>0 yield the vanishing normalized tower bound. ε<1/4 remains the source range. |
| 5.2 / `theorem-a` | Abelian F and F(χ), distinct ℓ,p and χ odd/distinguished are needed. Same-prime class growth is not bounded by Washington. |
| 5.3 / `theorem-b` | Hypothesis H is conditional with the same constant through solvable extensions. It is not an unconditional replacement for Washington. |
| 5.4 / `theorem-a-over-q` | Reducible 1⊕ε has the same residual system and ordinary determinant but no cuspidal newform; irreducibility cannot be dropped. |
| 5.5 / `theorem-a-at-three` | At p=3, ω=ω⁻¹ and is ramified, so distinguishedness is automatic. Pan excludes exactly this ratio; p=2 remains outside the theorem. |
| 5.6 / `nearly-ordinary-irreducible-lifting` | Totally real inducing field gives the usable bound; CM/mixed inducing fields require §5.8. Residual modularity and the chosen good quotient remain hypotheses. |
| 5.7 / `nearly-ordinary-irreducible-lifting-over-q` | Imaginary quadratic induced branches need full scope, including the level-one application at p≡3 mod 4. Do not claim the restricted route proves them. |
| 5.8 / `nearly-ordinary-irreducible-lifting-full-scope` | Original statement retained as a target with an explicit replacement dihedral proof requirement; the cited unavailable 2009 correction is not treated as established. |
| 5.9 / added Washington target | Distinct primes are essential. Bounded p-primary orders plus injective extension/norm splitting in an ℓ-tower imply eventual constant orders. |
| 6.1 / `exported-ordinary-modularity-over-q` | Conductor away from p comes from compatible local realization, not ordinary projection. Newform weight and determinant use the classical convention. |
| 6.2 / `independence-from-serre` | Independence from Serre applies to the reducible-residual Eisenstein route. BLGG/NT assume residual modularity and do not supply its initial cases. |
| 6.3 / `hida-family-galois-representation-over-q` | EPW specializes inertia coinvariants, not invariants. Reducible residual m need not have integral GL₂ model; full cyclotomic determinant gives classical weight k−1. |
| 6.4 / `ordinary-newform-lies-in-a-hida-family` | Primitive versus stabilized form and tame new quotient matter. Weight-two input uses EPW control; Hida uniqueness Corollary 3.7 is stated for k>2. |
| 6.5 / `required-examples-x0-11-at-five` | numerator(10/12)=5; a₅≡1. Irreducible cuspidal representation differs from 1⊕ε; k>2 trivial-character p-new eigenvalue square is nonunit. |
| 6.6 / `required-examples-p-distinguishedness` | p odd, k even implies p−1 does not divide k−1. −23≡1 mod 3 gives a distinguishedness nonexample, not an asserted existing ordinary lift. |
| 6.7 / `ordinary-weight-zero-seed` | 2-big and cyclotomic degree >2 differ from adequacy. Keep modularity, avoidance fields and the extra local-triviality step in the CM-induced seed. |
| 6.8 / `prescribed-type-modular-lift` | l≥7, degree>4 and local nonempty components are separate. Type determinant is ψε, lift determinant ψ; Barsotti–Tate need not be ordinary. |
| 6.9 / `nonexceptional-ordinary-lift` | l=3,5 exceptional projective images are excluded. Avoidance field is ker rbar, not its stronger cyclotomic compositum. |
| 6.10 / `blgg-ordinary-modular-lift` | Residual local reducibility and modularity are inputs. Exceptional l=5 realizability is retained; headline theorem does not fix weight/determinant. |
| 6.11 / `small-prime-ordinary-weight-two-lift` | p unramified makes inertia ratio order p−1; dual extension orientation is explicit. Fbar₅ refinement checks scalars in determinant-one subgroup, not just full projective A₅ exclusion. |
| 6.12 / `ordinary-steinberg-lift` | q≥7 is the coefficient prime, p the Steinberg place. Residue sizes 1 and local component nonemptiness are inputs; symmetric-power equivalence is outside this target. |
| 6.13 / `ordinary-weight-change-prescribed-components` | ε̄⁻²ω=ε̄⁻¹ and {0,2} are the weight change. Residue size −1 enables Steinberg at v₀; same component away from p,v₀ is weaker than isomorphic local representations. |

## Resume point

The package is ready for its independent review; the reviewer should start with the four proof-chain obligations and the original-scope dihedral target above, and repeat the mandatory mathematics pass. Any correction of the accepted packet or its higher-roadmap ownership edges must be done by the appropriate later job, since this issue authorizes only the package and this handoff. All information needed to resume is here and in the package; scratch is disposable and no source extraction is a deliverable.
