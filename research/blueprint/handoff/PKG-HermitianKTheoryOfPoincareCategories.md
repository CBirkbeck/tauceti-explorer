# PKG-HermitianKTheoryOfPoincareCategories handoff

Complete package for issue #11253. Agent: Codex (GPT-6), session `codex-qMUkz8`.
The claim bot confirmed this session at 2026-10-19 23:58:22 UTC. Only this job was taken.
The four deliverables are the package README, Suggested.lean, metadata.toml and this note.
No accepted packet, reader document, existing suggested file, library or upstream roadmap was edited.

## Result and input accounting

The README supplies nine mathematical layers, exact source locators, supplier contracts,
proof routes, named APIs, discriminating Checks, worked examples and downstream interfaces.
The accepted input has 62 nodes, 88 API entries and 52 named tests. All 62 nodes are accounted
for below: 61 retained mathematical subsections and one existing shift-equivalence contract.
All test mathematics is retained. The 13 principal definition/construction subsections each
have at least three Checks (4–7 each); additional locally introduced notions also have Checks.
The README contains no packet-node identifiers, process field blocks or removed-target stubs.

Suggested.lean is 123 lines: one real-bodied coherence predicate, six theorem targets and
two proved examples of that predicate (integral coefficients and arbitrary fields). It uses
`import Mathlib` only. It states the ordinary-complex connectivity milestone and coherent-ring
resolution/dimension milestones on existing carriers. It does not encode spectra or infinity
categories through proxies. The closing comment lists the definitions whose carriers remain
README targets. The headline GW/L theorems retain their full generality in the README.
No admitted examples, admitted data or auxiliary theory development were retained from the
older suggested file. In particular the arithmetic-only `omega` tests and coefficient-formula
helpers were not substituted for the missing Poincaré carriers.

## Current-library and duplication audit

Read the complete current upstream StablePeriodicCurved and GrothendieckEulerForms READMEs
and representative Suggested.lean sections before writing. Searched the current upstream
roadmaps (including the nine additions and Completed) by the mathematical objects, module
hypotheses, dualities, Tate constructions, symmetric/quadratic forms, projective resolutions,
t-structures and surgery, not only by proposed names. Read the relevant supplier sections.
The runner-provided current checkouts have heads:

- TauCetiRoadmap: `0d144d044dacebca17b654695b6f1ad58f159b27`.
- Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Both were used read-only; no Lake command ran there. The checked-out roadmap tree has
unrelated existing working changes; none was touched. The library-coverage audit contains no
HermitianKTheoryOfPoincareCategories entry. Its absence was not treated as proof of missing API.
The 16 accepted baseline declarations were read in the pinned build (Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`). Also read the native augmented
`CategoryTheory.ProjectiveResolution` carrier and projective-dimension-zero equivalence.

Removals, reuse and naming changes:

| Accepted item | Resolution |
| --- | --- |
| HK.0/shift-periodicity | Removed as an owned target; exact contract, source, sign and endpoint checks retained under Exact supplier contracts. GeometryOfNumbersAndQuadraticArithmetic §6.8a already supplies the genuine shift comparison. Later Layer 0 subsections are renumbered. |
| `HasGlobalDimensionLE R d` | Removed. Current StablePeriodicCurved Layer 4, `HasFiniteGlobalDimension`, is already the uniform right-module projective-dimension bound. Apply it to R^op for the left convention; Lean signatures write the bound directly with `HasProjectiveDimensionLE`. Its unused field/algebra context is not an added ring hypothesis. |
| `finitePresentation_hasProjectiveDimensionLE` | Removed as an owned theorem: this is direct specialization of the uniform all-module hypothesis, without a coherence argument. The substantive finite **finitely generated** projective resolution theorem remains. |
| Generic integer-shift bordism delooping in HK.1 | Consumed from GeometryOfNumbersAndQuadraticArithmetic §6.8a. The retained theorem is its genuine-flavour consequence, including the sign and two-/four-periodicity statements. |
| Generic bounded/projective complex carriers and resolution comparison | Consume Mathlib, StablePeriodicCurved and GrothendieckEulerForms. Keep the new connectivity/width and coherence-dependent finite-resolution theorems. |
| Field Witt ring | Consume current `TauCeti.WittRing` and `wittClass` in `TauCeti.LinearAlgebra.QuadraticForm.Witt.Ring`, and QuadraticFormInvariants Layer 4, with the field and invertible-two hypotheses. Characteristic-two Witt groups are not assigned to that API. |
| Three coherence API names | `IsLeftCoherentRing.of_isNoetherianRing`, `hasGlobalDimensionLE_zero_iff`, and `IsDedekindDomain.hasGlobalDimensionLE_one` become `isLeftCoherentRing_of_noetherian`, `globalDimension_zero_iff_semisimple`, and `dedekind_projectiveDimension_le_one`, matching Suggested.lean. All statements remain. |

Thus of the 88 accepted API entries, 83 retain their names, three are renamed and two duplicate
or immediate interfaces are supplied as inputs. The main existing Poincaré carriers stay in
GeometryOfNumbersAndQuadraticArithmetic. The metabolic target supplies the relative-form,
arrow-duality and Lagrangian-surgery API extending those carriers, not a second stable foundation.
The general-ring surgery and comparison results are not replaced by the supplier's ℤ examples.

Supplier direction and tiers: GeometryOfNumbersAndQuadraticArithmetic is tier 3 and
EnhancedDerivedSheaves tier 4 in CaraianiNewton's order. This roadmap, GeneralAlgebraicKTheoryPartII,
RefinedTraceMethods and ChromaticHomotopyTheory are outside that 94-roadmap tier list; no
invented numeric tier or bundle is assigned. The C₂/Tate input is taken directly from the
first supplier's §6.1a, avoiding an unnecessary dependency on RefinedTraceMethods. Use the
left-module construction in EnhancedDerivedSheaves §E5:abstract; its HR/derived comparison
is commutative-only, so noncommutative realization instead uses the general perfect-derived
supplier. Ordinary t-structures come from Mathlib and GeneralAlgebraicKTheoryPartII §KII.3.

Neighbouring-roadmap note: GeometryOfNumbersAndQuadraticArithmetic §6.8a's Dedekind-specific
Corollary 1.3.15 requires the general surgery/comparison argument specified here. This package
uses only its general weight-heart comparison, then proves the Dedekind conclusion. Do not
use its Dedekind specialization to prove the coherent-ring theorem. Its ℤ calculations remain
useful numerical checks. Existing dyadic and finite-local-field consumers should reference
the general comparison here and the supplier's coefficient and spectral carriers there.
The input's possible retitling as a further GeometryOfNumbersAndQuadraticArithmetic part is a
maintainer decision; the assigned roadmap id is preserved.

## Primary-source verification

Read the source statements and relevant proofs for all retained targets, rather than treating
issue or PR text as evidence. All repository mathematics is paraphrased; no source passage was
copied. The cleared-library INDEX was consulted; no restricted book or uncleared copy was used.

| Source edition | Passages read and used |
| --- | --- |
| CDH III, arXiv:2009.07225v4, PDF dated 28 April 2026 | Introduction pp. 1–4; Recollection pp. 6–11; all relevant statements and proofs of §1, pp. 12–33; §2 opening and dévissage context, pp. 33–35. Every retained III locator uses this preprint's printed pagination. |
| CDH I, arXiv:2009.07223v3 | p. 21 universal structure; p. 23 quadratic factorization; pp. 36–38 metabolic category and cobordism; p. 43 Thom comparison; pp. 47, 52–53 ring-spectrum structures; pp. 59–60 shift; p. 68 invertible coefficients; pp. 71, 73–75 derived polynomial functors, genuine structures, form parameters and quadratic actions. |
| CDH II, arXiv:2009.07224v5 | p. 20 Bott–Genauer; pp. 87–88 bordification and shift; pp. 100–101 forgetful/hyperbolic sequences; pp. 106–107 fundamental square, orbit fibre sequence and two-inverted splitting. |
| Ranicki, Algebraic theory of surgery I (1980), author archive | Printed pp. 96–104 (PDF 10–18) complexes, dimensions and Q-groups; pp. 112–114 (PDF 26–28) Wu classes; pp. 133–139 (PDF 47–53) pairs, cobordism and even groups; p. 153 (PDF 67), Proposition 4.5. An n-dimensional complex is understood up to chain homotopy, with a strict [0,n] projective model chosen for the comparison. |
| Lurie, Higher Algebra, 18 September 2017 | Proposition 7.2.2.18 and Corollary 7.2.2.19, pp. 1244–1246, including the projective-lifting argument. This gives equivalence of homotopy categories of projectives, not an infinity-category equivalence. |

Public source locations are in the README References. Download SHA-256 values, recorded for
edition reproducibility (no retained scratch copies):

- CDH III: `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c`.
- CDH I: `2c423b7f8fa95e1ee236c1d59a22d559de26fb8882328d9604e7680f31a7c68e`.
- CDH II: `eaa19b40046c953f6aedc5d11ed86eaee16018fcad995fcbafeb4746af6239a3`.
- Ranicki: `f8da5efcdb26cf6ed96ce1454a304b3aaab8833b27fc8ebdf5fc7da091cc2da7`.
- Higher Algebra: `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3`.

The version of record was not used to confirm statements or errata: the journal page was not
readable through the browser. No assertion is made that the preprint corrections below remain
in the published article. Lin, the Ranicki–Shaneson original proofs, Read, Schlichting's separate
regular-domain theorem, the ko Tate computation and Paper IV were not independently proved or
read in this run; their consequences stay explicitly conditional as follows.

## Six inherited mathematical boundaries

| Input gap | Package treatment |
| --- | --- |
| G1: C₂ Segal–Lin equivalence | Scope and §5.6 explicitly assume 𝕊^{tC₂}≃𝕊̂₂ for the symmetric finite-spectrum consequence; the alternative sphere witness in §5.7 assumes it too. Q^u and the general quadratic comparison do not need it. |
| G2: Laurent splitting, ℤ/4 and regular-domain results | Scope and §7.3 assume the natural splitting with its K₀ conditions for the Laurent sharpness examples. Read and Schlichting remain external comparisons, with no unsourced assertion about an unspecified class of domains. |
| G3: ko Tate spectrum | Scope and §5.7 keep the calculation as an extra hypothesis used only for linear-part-estimate optimality. CH.11 supplies ko only. |
| G4: arbitrary form parameters | Scope and §7.7 state the form-parameter/polynomial-functor equivalence and full derived restriction equivalence. Arbitrary-parameter consequences in §§7.7–7.8 and 8.4 inherit that input; the three standard flavours and the main quadratic-to-symmetric comparison do not. |
| G5: odd formations | §4.5 retains the conditional odd-genuine/formation comparison. Exact-category formation groups do not silently prove it. |
| G6: invert-two comparison | §8.3 assumes the existing supplier's spectrum-level multiplicative/telescope input. No integral main theorem is made dependent on it. |

## Accepted source corrections retained

The nine input source issues were checked against the editions above and applied without
copying their issue/process scaffolding into the mathematical README.

| Input issue | Location and mathematical correction |
| --- | --- |
| E1 | III, proof of Corollary 1.2.12, p. 18: the injectivity bound is n≤2m−3, not n≤2n−3. |
| E2 | III, Proposition 1.3.1, p. 27: retain general C in both surgery conclusions; no ring R is part of those hypotheses. |
| E3 | III, Remark 1.2.28, p. 23: the width result is Lemma 1.1.6. |
| E4 | III, Example 1.3.11, p. 31: only L^gs_{−2}(𝔽₂) vanishes; L^gs_0(𝔽₂)=ℤ/2. |
| E5 | III, proof of Corollary 1.3.10, p. 31: common-duality cartesian GW/L squares use II, Corollary 4.4.13, not III, Theorem 1 alone. |
| E6 | III, Remark R.7, p. 9: the diagonal takes values in R[2] with action r², witnessed by x² over 𝔽₂[t]. |
| E7 | III, Remark 1.3.17, p. 32: coherent global dimension ≤1 is required, not merely Krull dimension 1. |
| E8 | III, Example R.2(ii), p. 7: with bar²=conjugation by ε, coefficient involution is ε⁻¹bar. The noncentral matrix witness detects the wrong ε factor. |
| E9 | III, Remark 1.3.2, p. 27: general symmetric surgery gives connectivity. Projective interval representatives need the discrete-ring width criterion or extra duality control. Shifted duality on Perf(ℚ) gives a counterexample to the unsupported interval. |

Additional clarifications: the controlled category in §4.6 is explicitly stable, as required
to speak of its Poincaré L-theory; a quasi-isomorphism in the short-complex comparison must
carry the form to the specified form; and the Burnside parameter uses a quadratic multiplicative
ring action, not an ordinary linear module action.

## Complete target crosswalk and adversarial pass

For every definition, theorem, identity and convention, tested the defining examples, zero or
boundary cases, signs/parities, generality, quotient domains and supplier interfaces. The rows
record concrete trials and the resulting decisions. Every division by two in width formulas has
its parity hypothesis; the general Lagrangian bound uses ceiling/floor when that parity is
absent. The only scalar inverse in a general coefficient formula is the specified unit ε;
rank/2 and averaging occur after localizing at two. No characteristic-two division is used.

| Accepted node (HK layer/slug) | Package location | Instances and outcome |
| --- | --- | --- |
| `HK.0/module-with-involution-operations` | §0.1 | R=0 versus a nonzero ring; sign in characteristic two; noncentral Mat₂(ℤ) witness. Keep J(x)=ε⁻¹x̄ and the action-swapping unit map. |
| `HK.0/flavour-notation` | §0.2 | Over ℤ, gs→s on L₀ is identity, while gq→gs is multiplication by 8. The minus superscript changes the coefficient, not the degree. |
| `HK.0/tate-collapse-criterion` | §0.3 | Norm/difference over ℤ and −ℤ; two a unit. Degree −m in Tate cohomology matches the m-th truncation layer. |
| `HK.0/shift-periodicity` | Exact supplier contracts: shift equivalence (duplicate removed) | m=0,1 and both infinite endpoints; apply twice and check coefficient signs cancel. Imported from the supplier, not a new target. |
| `HK.0/opposite-ring-transport` | §0.4 | Commutative untwisted R; noncommutative R; double transport. Use the duality and coefficient M∨, not an asserted ring identification. |
| `HK.0/shifted-gw-symplectic` | §0.5 | 𝔽₂[t], b(x,y)=xy gives x²; the alternating plane versus the line [1] in characteristic two. Keep Frobenius action. |
| `HK.1/metabolic-category` | §1.1 | Zero category; hyperbolic object; nonalternating metabolic plane over 𝔽₂. A metabolic object need not be hyperbolic. |
| `HK.1/bott-genauer-sequence` | §1.2 | Zero category and F=L. Vanishing on Met gives L(Q[−1])≃ΩL(Q), fixing the shift direction. |
| `HK.1/forgetful-hyperbolic-sequence` | §1.3 | A field: forgetting the hyperbolic plane has rank 2. Zero category gives K=GW=U=V=0. |
| `HK.1/karoubi-periodicity` | §1.4 | m=0 with coefficients ℤ and −ℤ; invert two; endpoint flavours. V(Q)≃ΩU(Q[2]) before the genuine shift. |
| `HK.1/karoubi-periodicity-special-cases` | §1.5 | ℤ is 2-torsion free; the fourth formula reaches Q^{≥3}, not automatically gq. Retain that distinction. |
| `HK.1/bordism-invariant-periodicity` | §1.6 | The ℤ tables, characteristic-two sign collapse and L^gs_{−2}≃L^ge_0 with sign. Genuine theory is not declared four-periodic. |
| `HK.2/r-symmetric-m-quadratic` | §2.1 | gs over 𝔽₂ has r=2 but not 3; over ℤ it has r=3. Q^s_ℤ has no finite m bound. |
| `HK.2/genuine-family-bounds` | §2.2 | m=0,1,2 yield (m,r)=(0,2),(1,1),(2,0). Truncation formula agrees with those endpoints. |
| `HK.2/opposite-ring-bounds` | §2.3 | A line not of order two changes to a different dual coefficient; an order-two line does not. Bounds survive either case. |
| `HK.2/width-criterion` | §2.4 | ℤ/2 has width [0,1] and dual homology in −1, but cannot have width [0,0]. Zero complex and a projective in degree zero. |
| `HK.2/shifted-projective-connectivity` | §2.5 | k=−1,m=0 gives min(2,1)=1; k=1 gives −2. Zero projective satisfies every bound. |
| `HK.3/cobordism-presentation` | §3.1 | Hyperbolic object is zero; ⟨1⟩ over ℝ has signature 1; ⟨1⟩⊕⟨−1⟩ has a diagonal Lagrangian. |
| `HK.3/lagrangian-surgery` | §3.2 | Z=0 leaves the pair unchanged. A general W≠0 datum can kill a hyperbolic target, so is not surgery relative to a fixed target. |
| `HK.3/bounded-l-monoids` | §3.3 | (n,a,b)=(0,0,1) versus (0,0,2) tests ceiling/floor; odd n+a is excluded. For b=a−1 do not assert a group without the extra surgery theorem. |
| `HK.3/strictly-metabolic-witt` | §3.4 | Zero form, signature over ℤ and characteristic-not-two fields. The nonalternating metabolic plane over 𝔽₂ is killed although not hyperbolic. |
| `HK.3/strictly-metabolic-hyperbolic` | §3.5 | Quadratic forms satisfy the conclusion. The nonalternating 𝔽₂ plane violates it without 1-quadraticity. |
| `HK.3/widen-lagrangian-bound` | §3.6 | (n,a)=(0,0) gives L^{0,0}_0≃L^{0,1}_0; bottom-degree surgery splits a metabolic summand. |
| `HK.4/quadratic-surgery` | §4.1 | At equality a=n−2m and b=n−2m+1, test both parity choices. The arithmetic estimates remain strict in the induction. |
| `HK.4/quadratic-representatives` | §4.2 | Even n uses (a,b)=(0,1); odd n uses (1,0). The odd inequality n≤2m is automatically n≤2m−1. |
| `HK.4/genuine-symmetric-representatives` | §4.3 | n=0 gives projective forms and Lagrangians in [−1,0]; n=1 gives the adjacent two-term interval. |
| `HK.4/quadratic-low-degree-comparison` | §4.4 | m=0 gives isomorphism through −3 and surjection at −2; ℤ/2→0 in degree −2 forbids injectivity there. |
| `HK.4/witt-group-computes-L0` | §4.5 | Over 𝔽₂, symmetric Witt is ℤ/2 and even Witt is zero. Over ℤ, gq uses signature/8. Odd formations remain conditional. |
| `HK.4/controlled-variants` | §4.6 | A PID recovers free complexes; C=D^p recovers the unrestricted case. Require a full stable duality-closed C and M free for the free version. |
| `HK.4/ranicki-short-complexes` | §4.7 | The map 2 on ℤ[0] is degenerate. Degree −2 over 𝔽₂ is zero in the short extension but not in periodic symmetric theory. |
| `HK.4/short-to-bounded` | §4.8 | C in [0,n] is sent to DC in [−n,0], not to C. n=0 gives the Witt group. |
| `HK.4/genuine-symmetric-bounded-agreement` | §4.9 | r=2,a=n,b=n+1 meets both inequalities exactly. Form and null-homotopy comparison use different truncation bounds. |
| `HK.4/short-even-comparison` | §4.10 | n=0 over 𝔽₂: vanishing diagonal/Wu obstruction gives the zero even Witt group. |
| `HK.4/ranicki-genuine-symmetric` | §4.11 | Check n≥0 by bounded groups, n≤−3 by quadratic comparison, and −2,−1 by shifted even groups; no gap between ranges. |
| `HK.4/ranicki-quadratic-wall` | §4.12 | Over ℤ, Wall L^q_2=ℤ/2 while L^gq_2=L^gs_{−2}=0. Do not identify q with gq. |
| `HK.5/ring-spectrum-setting` | §5.1 | Moore spectrum 𝕊/2 is compact connective but not projective. Hℤ→H𝔽₂ is 0-connective, not 1-connective. |
| `HK.5/compact-connective-pi0` | §5.2 | The discrete [k,k] and [k,k+1] cases agree with the width criterion. Both X and DX bounds are needed to detect projectivity. |
| `HK.5/ring-spectrum-surgery` | §5.3 | A=HR recovers ordinary quadratic surgery, with the same parity and m inequalities. |
| `HK.5/lifting-projectives` | §5.4 | 𝕊→Hℤ lifts integer matrices and projectives. Claim equivalence of homotopy categories, not of stable or infinity categories. |
| `HK.5/connective-comparison` | §5.5 | p=∞ for quadratic structures gives all degrees; f=id with distinct structures gives p=m−1. Hℤ→H𝔽₂ fails the map hypothesis. |
| `HK.5/ring-spectrum-quadratic-comparison` | §5.6 | m=0 gives −3/−2. Q^u has connective linear part without Lin; Q^s on finite spectra needs the separate Segal–Lin input. |
| `HK.5/pi0-comparison` | §5.7 | p=∞,1,−1,0 yield the four stated ranges. The ko calculation tests linear-part connectivity only; do not infer L-range optimality. |
| `HK.5/sphere-integers-comparison` | §5.8 | The Tate target uses p=1, while the genuine symmetric target uses p=0: ranges 0/1 versus −1/0. |
| `HK.6/coherent-global-dimension` | §6.1 | Fields, ℤ, dual numbers and the nonmaximal order ℤ[√−3]. Coherence and Krull dimension do not imply the needed global-dimension bound. |
| `HK.6/perfect-postnikov-t-structure` | §6.2 | D(ℤ/2)=ℤ/2[−1] attains −d. The noncoherent infinite-variable quotient has a perfect two-term complex with non-finitely-generated H₁. |
| `HK.6/t-structure-bounded-l` | §6.3 | Zero category; a field; duality transported through [1] on Perf(K). Bounded objects use connectivity, not an unsupported upper interval. |
| `HK.6/symmetric-surgery` | §6.4 | d=0 with shifted duality distinguishes connectivity from concentration. Heart theorem needs both halves exchanged. Check the two strict numerical estimates. |
| `HK.6/coherent-symmetric-surgery` | §6.5 | d=1: odd n uses (1,1), even n uses (0,1). The parity resolves the apparent extra unit in the bound. |
| `HK.6/low-dimension-witt` | §6.6 | k=1−r endpoint; ℤ with gs gives symmetric W at k=0; 𝔽₂ with ge gives zero. Separate k=m−2 from the high-degree range. |
| `HK.7/symmetric-comparison-range` | §7.1 | r=2 yields d−2/d−1; r=0 yields d+2/d+3. Check equality in the injectivity argument separately. |
| `HK.7/genuine-comparison-theorem` | §7.2 | d=0 and d=1; same-duality K homotopy-orbit term gives cartesian GW/L squares. Cite Paper II, Corollary 4.4.13. |
| `HK.7/sharpness-examples` | §7.3 | 𝔽₂ in degree −2, then Laurent shifts. This proves bijectivity-bound sharpness under the splitting assumption, not injectivity-bound sharpness. |
| `HK.7/right-coherent-version` | §7.4 | Commutative case agrees; for general R apply the left theorem to R^op and transport the coefficient and Q. |
| `HK.7/dedekind-comparison` | §7.5 | d=1 gives gs injectivity at −1 and isomorphism from 0; gq gives 3 and 4. Four-periodicity is asserted only for nonnegative gs groups. |
| `HK.7/two-torsion-free-improvement` | §7.6 | ℤ gives classical GW injection at 1 and isomorphism from 2. Keep M=R, commutativity and 2-torsion-freeness. |
| `HK.7/form-parameter-structures` | §7.7 | τ=ρ=0 fails over ℤ; standard parameters recover the three flavours. Burnside quadratic action has cross-effect (2rs a,0). Use coherent global dimension ≤1. |
| `HK.7/burnside-l-theory` | §7.8 | Two refinements (1,1),(1,3) of ⟨1⟩; zero complex; L^b_2(ℤ)=0 whereas L^q_2(ℤ)=ℤ/2. |
| `HK.7/field-l-groups` | §7.9 | Characteristic not two gives residues 0 and 2 mod 4; characteristic two gives the two Witt groups and gs_{−2}=0. For 𝔽₂ both Witt groups are ℤ/2 with different invariants. |
| `HK.8/classical-gw-fibre-sequence` | §8.1 | Over ℤ, hyperbolic map sends 1 to (1,1), and signature (a,b)↦a−b computes the cokernel. K homotopy orbits are connective. |
| `HK.8/quadratic-gw-fibre-sequence` | §8.2 | Over ℤ the third π₀ is signature/8 and the GW group has generators hyperbolic plane and E₈. Shift is Σ⁴, not Ω⁴. |
| `HK.8/karoubi-splitting-recovered` | §8.3 | Field rank/2 and Witt class after inverting two; coinvariants equal invariants only after this localization. Extra spectrum-level comparison remains an assumption. |
| `HK.8/quadratic-symmetric-gw-comparison` | §8.4 | d=1 and 2-torsion-free ℤ: GW^q_1=(ℤ/2)² injects into GW^s_1=(ℤ/2)³; isomorphism begins in 2. No GW sharpness claim imported from L-theory. |

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/HermitianKTheoryOfPoincareCategories.json`: **passed**, 0 errors, 0 warnings; the accepted input is unchanged.
- `lean-check` on the package Suggested.lean in the existing pinned shared build: **exit 0**, exactly six `declaration uses sorry` warnings. Removed a redundant domain instance found by the first check. No other warning remains. The two examples contain proofs and no `sorry`.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: **passed**, 4 files, 0 problems.
- `git diff --check` and `git diff --cached --check`: **passed**. Only the four authorized paths are staged.
- Package shape cross-check: nine layers, 61 owned target subsections, nine Examples and Dependencies sections; all Lean declaration names occur in the README; one definition, six theorem targets, two proved examples; metadata parses as `math.KT`.

No second issue was claimed. No untrusted comment, fetched page or other PR content was
executed or treated as an instruction; no suspicious instruction was encountered. No restricted
source file or source passage is included. Scratch sources and notes are disposable once the
submission opens; this note retains all information needed by the independent reviewer.

The package job is complete. The next step is independent package review, especially the
one-way supplier dependency and the six explicitly conditional consequences. This submission
does not claim to have formalized the theorems or closed those inherited mathematical inputs.
