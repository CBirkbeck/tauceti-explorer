# BP-DrinfeldModulesAndTModules

Issue [#10922](https://github.com/CBirkbeck/tauceti-explorer/issues/10922). Agent: Codex, session `codex-iUf6YW`; 20 October 2026. Complete target-level planning pass for exactly DM.0–DM.8, submitted for independent review. Every layer is **planned**, none is closed, and every target's implementation status remains **unchecked**.

## Deliverables and inventory

The [packet](../packets/DrinfeldModulesAndTModules.json), [reader](../readmes/DrinfeldModulesAndTModules.md) and [Suggested file](../suggested/DrinfeldModulesAndTModules.lean) give the reconciled plan. The reader includes all statements, hypotheses, proof routes, prerequisites, source matches with theorem/section/page locators, APIs, uses, acceptance conditions and checks.

The effective plan has **134 targets**: **22 definitions, 40 constructions, 57 theorems, 7 lemmas and 8 comparisons**; **278 API items**, **197 discriminating checks**, **48 planets**, **81 pinned baseline declarations**, **18 gaps** and **13 supplier contracts**. No layer has more than six planets. Every definition/construction has an API, uses and at least three checks. All 29 extracted items explicitly routed by the issue have entries in `routedSourceCoverage`.

The submitted packet owns **11 new nodes**: one definition, two constructions and eight theorems, with 17 API items and 12 checks. Its **123 `reusedNodes`** keep the exact stable IDs of the accepted DM.0 and DM.8 part packets. Their full reconciled contracts appear in `importChecks`, with `target` in place of `id` and the original owner path. The `ownerPackets` records contain hashes and historical independent-review provenance. Historical verdicts do not accept this new reconciliation.

This import pattern follows other whole-roadmap packets: the checker rejects redeclaring an existing part's ID in a third packet. The ordinary checker therefore reports 11 owned nodes, not the 134 effective targets. The inventory and reader count each imported target once. The old part packets, their part readers and their part Suggested files were not edited.

## Promotion requirement

**The automatic promoter does not rewrite historical part contracts from `importChecks`.** The maintainer must apply the packet's `dependencyReconciliation`, `parentReconciliation` and revised full contracts before treating the promoted whole-roadmap graph as reconciled. Do not promote just the eleven new nodes and discard the imported contracts. This is the eighteenth recorded gap.

Two parent moves preserve stable IDs:

- `DM.8/coefficient-twist`: restore mathematical ownership from DM.2 to DM.8.
- `DM.2/omega`: move mathematical ownership from DM.2 to DM.8 while retaining the ID.

The issue explicitly requires alignment with the sibling Part II routes; neither the packet nor this handoff claims an earlier agreement. Sibling consumers must import the relocated owner and preserve the sign adapter below. The historical parts' graph remains historical until promotion applies these changes; the **reconciled** target graph and its layer contraction are acyclic.

## Mathematical changes

- **RT-AREA-finitefields/13:** FF.4 remains the sole owner of q-linearized polynomials, the Ore/composition comparison, evaluation, roots and subspace polynomials, under each existing node's actual hypotheses. DM.0 imports the existing IDs and adds only Drinfeld structure. The dependency is explicit; no link-map file was within this job's editable paths. Generic valued-skew-field normal forms needed by the Maurischat comparison extend FF.4 as Part II.
- **Algebraic DM.4:** add the finite-dimensional rational pre-t-motive category over k̄(t), its tensor/unit/internal-Hom/dual operations, rationalization of broad effective dual motives and rigid abelian structure. Morphisms satisfy σ(B)Φ_Q=Φ_P B, and the dual matrix is the inverse transpose. End(unit)=F_q(t) is proved by normalized rational denominators; finite Hom follows by minimal fixed-vector dependence. Neither argument imports analytic DM.8. The broad polynomial-finite effective condition does not imply Anderson freeness over k̄[σ]; the unit is a test distinguishing them.
- **Anderson comparison:** add the equivalence between uniformizability of an abelian t-module over C∞ and rigid analytic triviality of its associated τ-motive. For coefficients descending to k̄, compare the rationalized dual motive via the star dictionary. General C∞ coefficients do not silently descend. The survey statement was checked; the original 1986 proof remains an explicit gap.
- **Ω and signs:** DM.2 constructs the numerical period independently of Ω. DM.8 owns coefficient twisting, E and Ω. The product has simple zeros θ^(q^i), is a Tate unit, and belongs to E: its coefficient recursion proves algebraicity while product convergence puts the coefficients in the finite field k∞(ρ). With ρ^(q−1)=−θ, π_P=θρ∏(1−θ^(1−q^i))^(−1) and π_N=1/Ω(θ)=−π_P. A weight-w denominator changes by (−1)^w. Carlitz dual and τ trivializations are respectively Ω^n and ((t−θ)Ω)^n. Scalar Frobenius descent/degree estimates stay in Part II MZ.4.
- **ABP proof inputs:** keep the accepted lifting target and estimate aggregate, adding precise conjugate-size, Liouville, counting, linear/polynomial Siegel, auxiliary-row and auxiliary-vanishing targets. For K0/F_q(θ) finite separable of degree d, full constants k0 of degree f and D∞=Σe_v v, the count uses **f deg_(k0)D∞=d** and q^(dn+f(1−g)); it does not assume k0=F_q. The normalized leading-coefficient contradiction is recorded explicitly, with the Schwarz–Jensen bound requested rather than inferred from preparation alone. The scalar lifting case and the final rescaling to the prescribed relation are included.
- **Exact suppliers:** reuse SF.2's existing `abelian-torsor-h1` and `quasi-coherent-topology-comparison` for the vector-group fibre, after establishing that particular logarithm kernel is vectorial. No new additive Hilbert 90 request remains. The particular kernel separability proof is still a gap. MC.6 reconstruction is imported; only its missing subcategory/recognition/graded-group exports remain requested. RR itself is already pinned; only the infinity-norm/place/divisor adapter is additionally requested from FA.1 and the curve owners.

## Current upstream and baseline

Read the supplied current [TauCetiRoadmap](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27) and [Tau Ceti library](https://github.com/TauCetiProject/TauCeti/tree/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039) without building there. Full nearby readers checked: JacobianChallenge and AlgebraicVectorBundles; also the relevant AdicSpaces Layer 0, AlgebraicCurves, StableReduction and ReductiveGroupsPartII sections and matching signatures.

AlgebraicVectorBundles L0B/L2B already owns finite locally free sheaves, affine finite-projective comparison and totalSpace(E)=linearSpec(E∨); these are imports. Current Tau Ceti already has Fitting ideals, presentation independence/base change and univariate Weierstrass preparation, units and the restricted-series principal-ideal result. They postdate the elaboration pins and are recorded under `currentLibraryImports`, never re-planned as new definitions. The additional analytic contracts are normalized C∞ zero/pole comparisons, entire-product zeros and the exact bounded-disk growth inequality.

The older assembly asserted current-main imports from RestrictedPowerSeries, NewtonPolygons and SchemeAndStackFoundations. Those roadmaps are absent from the supplied current checkout. They are not retained as verified current-main imports; atlas SF node contracts are still consumed as atlas contracts. RG2.3.7 already owns Lang's theorem, but its displayed signature uses AlgebraicClosure F; FA.0 must supply the GL_r specialization and base extension to the larger coefficient algebraic closure.

All 81 cited pinned declarations were checked against actual statements, not just name lookup, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Five new citations supply divisor spaces, their valuation characterization and finiteness, high-degree RR and finite vector-space cardinality. Exact suppliers and module locations are recorded in the packet and reader.

## Sources and findings

Reused the accepted parts' source locators and 18 source findings, preserving their version-scoped histories and reviews. No source passage or excerpt is stored in the new packet or reader. Targeted re-reading this run:

- Brownawell–Papanikolas, Theorem 4.2 and §§4.2–4.4, pp.16–18.
- Papanikolas arXiv v2, §1.1.3–1.1.6 p.2 and §§3.1–3.4 pp.9–19: rational category, rationalization, denominator proof and integral analytic trivialization.
- ABP's published version, §§2–3, printed pp.244–256, including the arithmetic estimates and lifting proof.
- Ngo Dac HAL, Definition 4.1 and §§4.2–4.3, printed pp.16–18 / PDF pp.17–19.
- Chang–Chen–Mishiba v2 §4.1 p.13 and the uniqueness/denominator application on p.24; Im–Kim–Le–Ngo Dac–Pham v2 Definition 2.1/Theorem 2.2 p.26; CPY v2 §§2.1–2.2 pp.4–6, including Proposition 2.2.1 and its proof.

The new HAL download has hash `3141c9337b19447ee970498d30fd10cdcdb6333bb54f8a264440adf3ec513096`. Both aliases now identify that artifact, while the older accepted-part hash remains historical provenance; byte identity is not claimed. The published Stalder download returned HTTP 500 in this run; its earlier independent reading/collation receipt is retained, without claiming fresh access. No private book was needed. The original Anderson comparison proof has not been inspected; its public survey statement is the precise evidence used.

## Suggested file and checks

The 216-line file follows the current WORKERS shape, which overrides the issue's older request for all heavy signatures. It has one `import Mathlib`, **six real-bodied light definitions**, **nine milestone theorems** and **ten fully proved examples**, at most two per definition. Heavy carriers and their complete APIs/checks remain reader targets. The obsolete per-node `suggestedInterface` claims were removed from the reconciled contracts; the packet's `suggestedFile` gives the actual boundary.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/DrinfeldModulesAndTModules.json --index "$TAUCETI_BASELINE/declarations.tsv"`: **0 errors, 0 warnings**, against the shared pinned declaration index.
- Effective-union audit: reconstruct each imported contract's `id` from `target`, combine it with the eleven new nodes, register those IDs to the temporary union view, and apply the same checker and index. **134 targets, 0 errors, 0 warnings**. This additionally checks every imported contract's APIs, tests, prerequisites, source IDs and baseline references; it is distinct from the normal eleven-node CLI check.
- Effective node graph and layer contraction: acyclic. Owner hashes unchanged; coverage ID lists agree exactly; all implementations unchecked; all 29 routed items resolve.
- Reader parity: one target block per effective ID, all 278 API statements and 197 checks present, unique explicit anchors, all internal anchors and relative file links resolve.
- `lean-check research/blueprint/suggested/DrinfeldModulesAndTModules.lean`: **exit 0**, only nine expected theorem-placeholder warnings, no other warnings. All ten examples are proved.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/DrinfeldModulesAndTModules.lean`: passes, no admitted data.
- Intake file validation and whitespace/diff checks: run on all four deliverables before submission. Standalone restructure/naming validators are not applicable: no restructure result or naming-job file is edited. Blueprint validation and the effective-union audit enforce the planet counts.

## Closure work for the next pass

The packet's gap/request entries and each coverage record give the exact affected targets and mathematical contracts. The main remaining work is:

| Layer | Status | Closure frontier |
| --- | --- | --- |
| DM.0 | planned | General rank integrality, nonreduced-base standardization and imported curve/Dedekind interfaces. |
| DM.1 | planned | Strict finite F-module/finite-shtuka realization, effective characteristic-local shtukas, torsion bases and compatible completed limits. |
| DM.2 | planned | General-A analytic surjectivity and kernel rank; normalized completion/quotient and entire-product inputs. |
| DM.3 | planned | Fine moduli chart/deformation proof, reciprocal-ring normality and projective quotient/section-ring comparison. |
| DM.4 | planned | Complete analytic exponential inputs, valued-skew-field comparison and exact general-A foundation adapters. Its rational category is specified algebraically; the comparison proof is an outgoing DM.8 obligation. |
| DM.5 | planned | Integral Tate saturation, the Drinfeld semisimple-motive input and completed coefficient/local-algebraization adapters. |
| DM.6 | planned | Completion/norm/quotient adapters and the post-pin Fitting compatibility import, retaining the trace/determinant hypotheses. |
| DM.7 | planned | Bounded-shift elliptic-chain morphisms, non-rational-infinity residue-factor descent and strict finite/local-shtuka comparisons. |
| DM.8 | planned | Original Anderson comparison proof; C∞ analytic zero/growth exports; exact norm/divisor counting adapter; coefficient-Frobenius/separability/Lang and filtered-growth exports; MC.6 recognition; the particular Carlitz logarithm-kernel separability proof. |

Apply the historical-contract and sibling ownership reconciliation before counting any of these changes as live graph repairs. Then independently review the added algebraic category, Anderson variance, arithmetic estimates and reader/Lean boundary. Nothing in this submission claims proof closure or formal implementation.
