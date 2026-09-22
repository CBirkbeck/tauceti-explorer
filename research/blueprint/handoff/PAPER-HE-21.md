# PAPER-HE-21 handoff

Codex — `codex-a71f92`; issue #1397. Partial follow-up to `codex-c83e7a`, preserving /1–105 and adding /106–129.

## Current checkpoint

129 items: 7 library, 10 planned, 112 missing. All missing items are routed exactly once through eight source routes and three Part II briefs. The internal DAG has 373 edges; all 44 definitions/constructions have structured APIs and tests (138 API entries, 132 specified tests). No Lean implementation or compilation.

All 15 published He21 pages were reread. New supporting reading: full HY12; selected He14 published passages including all §§6 and 11; HN14 Theorem2.10/proof and class-polynomial construction; complete GH10 Proposition2.5.2 induction and Lemma2.6.1 proof; full GHN erratum. Exact scopes/hashes are in the JSON. Do not treat selected-source reading as exhaustive prerequisite closure.

## Resume in this order

1. **G1 — /61 and /127.** Prove the actual-to-auxiliary lattice comparison, including κ, γ and double-flat compatibility, then the geometry/dimension descent. SL2 ρ∨=α∨/2 is not an original cocharacter. GHN's corrected componentwise equal-characteristic theorem has a prime restriction; it does not give unrestricted mixed-characteristic dimension comparison. RG2.1 owns the lattice adapter; GS0 owns geometric descent.
2. **G2 — /123–126, then /69.** Construct the universal bounded convolution projection and finite-level action. Write the cartesian diagrams for X2→X3 and X4→X5. Restrict to a nonempty finite-type open of a maximal-dimensional target component and apply /124; global quasi-compactness is unnecessary. Mixed characteristic requires compatible deperfection of the map and its fibres, not just separate models of the two spaces. SF.0 owns /68,/124; GS0 owns the actual flag/perfect geometry.
3. **G3 — /117–122, then /92.** There is now a restricted non-shrunken seed proof. With γ≠0 set J=S,x=a,y=1,μ=γ in He14 Proposition11.6; combine Proposition11.7/HY12 Theorem1.1, positive class-polynomial recursion and He14 Corollary6.2. This works in the explicitly recorded simple-adjoint equal-characteristic source scope, without a shrunken premise. Do **not** invoke shrunken Theorem11.4 instead. Handle γ=0 through a finite reductive parahoric quotient and Lang. The general He21 datum/characteristic transfer /122 remains open.
4. **Complete the corrected twisted induction.** Printed He14 p.399 image confirms a descent selected inside δ⁻¹J1 after x1 was chosen left-minimal there; it must be outside. Keep supp_δ(x′), not ordinary support. The statement's undefined v is x. HZZ21 arXiv2109.02594v1 Proposition3.4.2 gives a later proof with the correct outside descent and σ-support. Its motivic reduction framework is a concrete next lead for /122; only the selected proof was read here. This is not an official erratum. HN's cocenter basis/nice-class proof and HY Dynkin-case verification remain G4.
5. Finish G5–G10: MV Newton purity/completion, original Viehmann closure, upper-bound/Mazur and dimension comparison, Levi Hodge–Newton decomposition, Lang/rank-one geometry, and atomic Demazure/root proof leaves. Every unresolved supplier must remain a named gap; graph acyclicity is not proof closure.

## Ownership to preserve

- RootSystemsPartIIDominanceAndDemazure is the existing candidate; KPZ26 also reuses it and requests consolidation of KZ25's RootSystemsDominancePartII alias. Do not create another dominance order.
- Reuse **SmoothRepresentationsPartIIParahoricCenters** from KP18 for the early generic Iwahori-Hecke/cocenter branch, preserving its existing center targets. Center ≠ cocenter; the latter is only a module quotient. A generic Z[v,v⁻¹] deformation is not the pinned actual double-coset Hecke module without a specialization theorem.
- Classical ADLV geometry belongs to HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig, importing flags from GS0 and invariants from BG. Do not rebuild local shtuka diamonds.
- The three formerly unrouted interfaces now have routes. Routing is not a claim that they are resolved.

## Regression examples and conventions

The split adjoint A2 example remains decisive for the bad citation: λ=(0,1), x=s2s1, y=1 gives w(u,v)=(v−1,1−u−v), with intervals (−2,−1),(1,2),(0,1). The construction gives a=s1s2,γ=λ and at^γ(u,v)=(1−u−v,u), with intervals (1,2),(−1,0),(1,2). The input is shrunken; the output is not. This does not disprove seed nonemptiness.

Retain t^λ acting by −λ, the corrected Levi conjugator x, all closure bars, nonnegative coroot coefficients, the known lower endpoint in cordial saturation, and basic-only Levi-class uniqueness. A1 s·a=(0,1) is shrunken in this convention.

## Checks and reproduction

Fresh finite checks: 36 A2 generic-Hecke products; 216 Hecke and 216 Demazure associativity triples; split/twisted Coxeter norm sums; exact A2 intervals; A1 lattice guard. The report gives the algorithm and matrices. Previous-worker broader subtraction/reduction test counts are historical, not rerun.

Run `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HE-21.result.json` and `research/blueprint/intake.py check-files` on the exact three deliverables, checking existence independently. Also check route uniqueness, structured APIs/tests and the dependency DAG. Refresh current main, stage ownership and peer routes before publication. The audited snapshot is `6a3c7756d3446bd54797604ac7089df94a7f8551`; no reserved candidate is a proved library theorem.

Only this paper's JSON, report and handoff are authorized deliverables. Keep status partial until the mathematical and recursive source gates are genuinely closed.

The final protocol refresh added 14 structured source findings with correction-search records; all await independent review. Preserve these records and the already-known GHN erratum provenance. No author contact is authorized by this extraction.
