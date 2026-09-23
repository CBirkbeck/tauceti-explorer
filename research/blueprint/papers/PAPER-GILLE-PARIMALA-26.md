# PAPER-GILLE-PARIMALA-26

**Status: partial after independent review.**

Gille and Parimala prove a local-global principle for twisted flag varieties over a semiglobal field F = K(X), K the fraction field of a complete DVR with arbitrary residue field k: if the characteristic exponent p of k does not divide the order of the automorphism group of the absolute root system of G_ad, a twisted flag of G has an F-point if it has points over all completions at divisorial valuations of normal models, and only valuations nontrivial on K are needed (Theorem 5.4). Without the condition on p, the same holds with all points of the special fibre of one model, with all rank-one valuations, or when G extends to a reductive model (Theorem 4.5, Corollaries 4.6–4.8). The proof combines an analytic factorization of elementary and R-trivial subgroups over a patching diamond (§3), field patching (§4), and tame loop torsors after a prime-to-p finite structure reduction (§5), with a purity theorem for torsors on regular surfaces (§7). 152 items (7 library, 4 planned, 141 missing) are routed to SchemeAndStackFoundations (SF.0, SF.1, SF.2, SF.4), ReductiveGroupsPartII (RG2.0, RG2.0a), InverseGaloisAndArithmeticFundamentalGroups (IG.0, IG.1), DeformationAndDerivedPatchingAlgebra (R03.3) and the proposed ReductiveGroupsPartIISemiglobalFlags. Nineteen findings are recorded: the Tits-index formulas print the inclusion reversed, the purity theorem omits codimension-zero points, three proofs have gaps with repairs, two corrections are already in Gille's errata (whose witness series is itself wrong), and one finding concerns HHKP20. Independent review: retain partial status until the explicit supplier gaps and dependency closure are completed. General type/parabolic/form interfaces remain imports of the upstream ReductiveGroups roadmap.

The machine-readable extraction preserves 152 items: 7 library, 8 planned and 137 missing. Every missing item is routed once. Forty-two definitions/constructions have explicit uses, 84 API theorem clauses and 126 planning tests. The independent review is complete with verdict **revise**; routes 1,3,5,6,7,8,9 are accepted, and 2,4,10 require further source work.

See [the independent review](../reviews/REV-PAPER-GILLE-PARIMALA-26.md) for source provenance, all item/status checks, source-finding reasons and the exact change log. The full statements, API tests and twenty-two reviewed source issues remain in [PAPER-GILLE-PARIMALA-26.result.json](PAPER-GILLE-PARIMALA-26.result.json).

## Main theorem and conventions

Let T be a complete DVR with fraction field K and arbitrary residue field k, F the function field of a smooth projective geometrically integral K-curve, G reductive over F and Z a twisted flag. Finite patch points and all-special-fibre-point tests give local-global principles. HHKP20 together with GP26 Corollary 4.6(1) yields the unrestricted rank-one T-valuation test. For the divisorial-completion theorem without a reductive model, retain p prime to the automorphism-group order of the absolute root system of G_ad, where p is the residue characteristic exponent (1 in characteristic zero). The vertical divisorial family suffices.

Delta_0 is the type of a minimal parabolic: a type I has points iff Delta_0⊆I. The global Delta_0 is the star-stable closure of the union of local subsets. Use actual completed point/open patch rings for the V/W modules, then take fraction fields. In the tame-loop proof complete the regular local ring first, use coordinate parameters for the SNC divisor, and prove finite-group torsor tameness from inertia after unramified trivialization.

## Routes and source boundary

### Route 1: SchemeAndStackFoundations — accept

Own relative Spec, vector schemes and coherent Hartogs/vector-bundle extension here. Import existing Module.IsReflexive and the small-dimensional local algebra corollary from R03.3. Export these to SF.1's torsor proof; do not create a cycle by making vector bundles depend on torsor purity.


### Route 2: SchemeAndStackFoundations — reject

Own the source-scoped torsor descent, affine quotient reduction and corrected codimension-two purity proof. CTS79 proof inspection resolves G4; require U to contain codimension at most one and the quotient to represent the fppf sheaf quotient. Import vector-bundle/Hartogs machinery from SF.0; no flatness of an arbitrary quotient map is asserted.


### Route 3: SchemeAndStackFoundations — accept

The reviewed audit leaves affine quasi-coherent acyclicity and site comparisons missing. Supply the additive-torsor vanishing used by the Artin devissage; R-path interpolation is the elementary consumer of this vanishing.


### Route 4: SchemeAndStackFoundations — reject

Own complete local models, finite-Artin lifting interfaces and two-dimensional excellent resolution once. Reuse TauCeti.Model and the pinned Artinian algebra results. The blow-up valuation is a geometry export to the semiglobal theorem; do not assume general positive-characteristic resolution. Add the specific infinite point-blow-up valuation limit and its henselization comparison from HHKP Lemma 2.4; distinguish Lipman 1969 indeterminacy termination from Lipman 1978 SNC resolution. Use the upstream ModularCurves local/strict-local carrier interfaces where applicable.


### Route 5: ReductiveGroupsPartII — accept

Reuse the existing affine finite-locally-free restriction of scalars and add smooth/etale and nilpotent-algebra comparisons. Keep reductivity preservation restricted to separable field extensions. Projective nonaffine flag representability is an explicit extension item in the new Part II.


### Route 6: ReductiveGroupsPartII — accept

Generalize the chart-topology and etale analytic-chart foundation to the arbitrary complete discretely valued fields needed here. Retain local compactness and compact integral-point conclusions only under the original local-field hypotheses. This prevents duplicate point-topology definitions in two reductive-group continuations. Smooth completion-to-henselization point descent needs arbitrary rank-one valued fields, including nondiscrete ones, as an exported analytic/étale interface.


### Route 7: InverseGaloisAndArithmeticFundamentalGroups — accept

Add the generic-point surjection for normal connected schemes to the finite-etale Galois-category interface; the diagram-torsor descent consumes this exact map.


### Route 8: InverseGaloisAndArithmeticFundamentalGroups — accept

Add the tame local SNC Kummer-cover theorem as a source-scoped foundation of tame fundamental groups. This is Abhyankar’s local lemma, not the Abhyankar inverse-Galois conjecture or complex Riemann existence.


### Route 9: DeformationAndDerivedPatchingAlgebra — accept

R03.3 and its accepted decomposition already own regular-local finite global dimension, depth and Auslander–Buchsbaum. Add only the finite reflexive-module freeness corollary in dimension at most two; do not rebuild those theorems in SF. Its statement is for arbitrary regular noetherian local rings, not only complete coefficient-DVR algebras. AUDIT-17 has regular sequences/projective dimension but lacks depth and Auslander–Buchsbaum. Export the corollary R03.3→SF.0→SF.1; no reverse dependency is introduced.


### Route 10: ReductiveGroupsPartIISemiglobalFlags — reject

The parent owns algebraic groups and general relative structure, while the existing RG2 continuation concerns local fields with finite residue field, buildings and parahorics. Neither owns semilocal R-equivalence, semiglobal patching or tame-loop flag descent. FunctionFieldArithmetic concerns global finite-constant-field arithmetic and is not this owner. One additional continuation supplies these reusable interfaces without duplicating the existing finite-local-field or number-field Brauer–Manin projects.

Build Reductive algebraic groups, Part II: semiglobal flags and R-equivalence. Import Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), especially Layers 2–9, instead of re-planning its group, root, parabolic, central-cover and Chevalley constructions. Import affine Weil restriction and generalized valued-point charts from Reductive groups, Part II: local structure and arithmetic models (ReductiveGroupsPartII:RG2.0a, RG2.0), geometry/descent/lifting from Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations:SF.0–SF.4), and tame covers from Inverse Galois theory and arithmetic fundamental groups (InverseGaloisAndArithmeticFundamentalGroups:IG.0–IG.1). Keep these producers independent of this consumer. Existing Mathlib strict submersion and analytic differentiation supply the Banach analysis; do not rebuild them or assume finite dimension over K.

Import the parent’s general parabolic representability, anisotropic type, form/diagram torsor and central-isogeny flag interfaces (items 5, 7, 12, 124). Construct their type-preserving reduction and semiglobal applications; semilocal R-equivalence and elementary subgroups with nilpotent-Artin invariance; the product-compatible last unipotent subgroup and its Lie spanning chart; corrected analytic factorization on saturated complete T-modules V,W; restriction of projective flags along arbitrary finite, possibly inseparable, extensions. Prove Theorem 3.13 for the specified diamond with F1 dense in F0 and F1 intersect F2=F, using the supplied module hypotheses. Give separate elementary and R-factorization statements with each isotropy hypothesis retained. Optional Proposition 3.11 is not used by Theorem 3.13; build it with the repaired proof (Prasad's Theorem (T), Tits' normal subgroup theorem, torus approximation, and the open-factor argument of item 57), and keep it out of the main dependency chain.

Build the normal-model point/open/branch fields and finite patching system, including the finite P1-model map and tensor decompositions. Prove Z(F) nonempty iff all finite-patch points exist for every reductive G/F and twisted flag Z, and deduce the all-special-fibre-points and unconditional all-rank-one-valuations forms. Read HHKP20's precise family Omega_F of nontrivial valuations whose rings contain T; testing its rank-one subfamily already suffices. Prove the finite bad-point set, blow-up termination, rank-two coarsening and finite-stage point descent, importing SF.4's valuation-limit/henselization interface and RG2.0's smooth completion-to-henselization theorem. With a reductive model, prove the discrete-valuations form without a residue-characteristic restriction. State the Tits-index corollaries using Delta_0 equal to minimal-parabolic type: the global subset is the smallest Gamma_F-stable subset containing the transported local subsets. This is the correction recorded as E13; the manuscript prints the inclusions reversed.

For the final theorem let T be any complete DVR, K its fraction field, k its arbitrary residue field, F=K(X) for a smooth projective geometrically integral curve, and p the characteristic exponent of k. If p does not divide the order of the automorphism group of the absolute root system of G_ad, prove Z(F) nonempty iff Z has points over all divisorial completions of F arising from normal projective T-models. It suffices to test those nontrivial on K. Import SF.0–SF.1's corrected affine-quotient surface purity, whose local freeness step imports DeformationAndDerivedPatchingAlgebra:R03.3; do not omit codimension-zero points or replace the represented fppf quotient by a categorical quotient. Prove the finite-subgroup reduction, SNC spreading, prime-to-p finite-etale loop reduction and loop-parabolic criterion; complete the local ring at P before applying henselian arguments and prove the Grothendieck-completion comparison. The G2 refinement requires residue characteristic different from 2 and its special finite-reduction proof. Do not replace the divisorial family by a fixed model or omit the order hypothesis.

Every definition/construction has an API and three tests in the items. Mandatory boundary tests include nonreduced E tensor F_i, a proper but not strictly proper parabolic in a product, a non-smooth projective quotient in characteristic p, the factorial-pole series outside Frac(k[x][[t]]), and the corrected V/W derivative condition. The tests of finite algebra and Tits-index conventions must import the existing carriers. Prove, rather than encode as structure fields, every external theorem contract. Before implementation, extract the exact prerequisite proof interiors listed in the ledger. Suggested future files may separate REquivalence, AnalyticFactorization, PatchFields and TwistedFlags; this paper job supplies no Lean file and asserts no formalization.

## Remaining work

- Remaining relative structure and flag-product source proofs: Read SGA3 XXVI and MPW at the exact cited results, CGP Appendix A.5.2 and Demazure–Gabriel III.3.2.1; reconcile general imports with their precise type/semilocal hypotheses.
- Elementary/R-equivalence and Lie-span suppliers: Finish Petrov–Stavrova and Gille–Stavrova inputs and Raghunathan Lemma 3.1. Preserve existing targeted reads; complete their proof-level dependency outline and exact exports.
- Field-intersection, finite-model map and completed-patch spreading: Read HH10 Theorem 5.9/Lemma 6.2 and HHK15 Proposition 5.8 directly; the GP26 and HHKP20 quotations do not establish these source proof interiors.
- Surface and local-group suppliers: Read Lipman 1969 Theorem 26.2 separately from 1978 resolution; GP1 Corollary 1.8 and finite-flat linear quotient construction need direct source checks. Keep the parent local-ring/regularity carriers.
- Optional closure-factorization sources: Prasad was checked directly; read Tits normal-subgroup theorem and Harder Hauptlemma before closing the repaired Proposition 3.11 branch. It is not an input to Theorem 3.13.
- Uniform prerequisite graph and complete supplier hypothesis audit: Complete a theorem-level acyclic dependency graph after those source reads. The current literal APIs and tests repair interface omissions but do not assert full closure.

## Sources

- Codex codex-hjdg0j, 23 September 2026: all 26 HAL v5 manuscript pages plus references; page images checked for the analytic, closure, patching and appendix issues. Cached public PDF hash matched the recorded author hash; current HAL access returned a challenge.
- Published Appendices A and B read on the publisher HTML; final main text remains paywalled.
- CTS79 original GDZ scan, printed pp. 109–110 and 127–130, read as page images; Prasad 1982 pp. 197–202 read in full.
- HHKP20 v3 read in full, especially printed pp. 6–8 for Lemma 2.4 and Theorem 2.5. Gille current errata GP entry read directly. Earlier extraction source reads are retained as their authors’ provenance, not attributed to this reviewer.
- Gille 2024 published pp. 159–165, §§1–4.3, including Lemma 3 and Theorems 4,6; page images checked for E21–E22. This is a targeted prerequisite read, not an audit of every proof in that paper.

The extraction retains earlier workers’ source-reading provenance separately from this reviewer’s reads. Public URLs and source hashes are in its `source` object. The final main-text PDF remains inaccessible; unprefixed locators use HAL v5, with published numbering only where directly known.

## Validation

Paper checker passes; intake: five files, zero problems. Structural checks preserve all 152 IDs, verify 7/8/137 status counts and all supplier stages, route each of the 137 missing items once, and check 42 uses/API/test interfaces, all ten route verdicts, all 22 source-finding verdicts and six gap references. Seven library files match exact pinned GitHub bytes; source hashes match. The exact five-file archive diff and unchanged inputs on refreshed main pass. Finite diagnostics check the erratum series identity, 257 factorial-pole thresholds, the diagonal-S3 counterexample, the characteristic-two cubic resultant and 512 Tits-type subset comparisons; these supplement the written arguments, not replace them.

No Lean file requested, produced or compiled. Nothing is claimed formalised.
