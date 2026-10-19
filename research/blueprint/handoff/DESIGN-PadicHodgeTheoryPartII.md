# DESIGN-PadicHodgeTheoryPartII

Worker: Codex — codex-cp0FrJ. Issue: #3426. Claim confirmed by the swarm bot on 19 October 2026. This is a completed design pass, submitted for independent review; it is not a claim that the mathematics is formalized or that its supplier contracts are closed.

## Delivered scope

The issue permits planning its first independent direction and proposing the remaining directions. This pass plans generic crystalline monodromy, retaining the mandated id `PadicHodgeTheoryPartII` and aliasing the routed `PadicHodgeTheoryGenericMonodromyPartII`. All 18 assigned GLX items have an explicit route-coverage disposition: 15 are planned here, two are exact parent imports, and one is assigned to the generic-filtration supplier with a recorded gap.

The restructuring proposal preserves the six original paper routes, their complete item arrays, original proposed ids, titles and route-brief references. The other directions are p-adic Simpson (Heuer and Esnault–Groechenig, 34 items), relative crystalline local systems (Guo–Reinecke, 32), and equivariant bundles on the curve (Fargues–Fontaine and Breuil–Hellmann–Schraen, 122). Their primary-source reading and designs belong to their own jobs. No source passage or section-by-section source synopsis is included.

There are 23 nodes: three definitions, one construction, thirteen theorems, two comparisons, three lemmas and one application. The four definition/construction nodes have 16 API items and 16 discriminating unit tests. There are 16 planets and five distinct pinned baseline declarations. Every node has `implementationStatus: unchecked`.

## Layer status and exact remaining work

All five stages are **planned**, none is closed. Packet status is **complete**, in the protocol's sense that every target in this design pass is accounted for, including explicit imported contracts and gaps.

- **GM0:** finite decent fibres, vector degrees, coefficient lines, the full-group line criterion and ambient period comparison are planned. The current Chevalley stabilizer needs its representation/comodule adapter at the adopted library baseline. Rational periods, coefficient categories, weak admissibility and full-versus-connected monodromy remain exact parent imports.
- **GM1:** all arithmetic inequalities are planned. G01 must supply quasisplit generic filtrations, nonnormal reflex-field descent, multiplicities and Frobenius transport. A split highest-weight character basis alone does not give this interface.
- **GM2:** uniform descent, Hodge specialization, generic admissibility and derived monodromy are planned. Supply SF.0's determinantal rank interface and the structure layer's finite algebraic coefficient conjugacy. G01 is required for derived monodromy, not for generic admissibility.
- **GM3:** sparse Witt coordinates, infinite transcendence over Q_p, actual generic classical flags, open-image points and fixed bounded z-extension lifting are planned. Discharge inherited G01 plus the étale-coordinate, algebraic central-lifting and rational-point openness requests.
- **GM4:** compact torsor components and open stabilizers are planned, with D5's compact-coset separation request explicit. The quasisplit converse needs G02, independently proved. The result for every ambient component assumes global transitivity explicitly; no transitivity is deduced from connectedness of a quotient.

**G01** belongs to the proposed `ReductiveGroupsLocalGenerationPartII`, already identified by the reductive-group restructuring but not staged. Its complete contract is in the packet and reader prerequisites. Preserve that ownership: do not replace it by `ReductiveGroupsPartII:RG2.1` or by the split `ReductiveGroupsPartIII:RG3.0/highest-weight-character-basis`.

**G02** belongs to the proposed GLX continuation `HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig`. It is not the existing He21 dimension continuation `HeckeStacksAndLocalShtukasPartII`. Supply only GLX Theorem 6.1(a), (4)⇒(3), for the converse here, without a circular appeal to the forward generic theorem. Component transitivity belongs to that geometric direction too.

## Five requests to existing suppliers

These are recorded contracts, not comments sent to other workers or changes to their files.

1. Current ReductiveGroups, representation/comodule layer: adapt the already proved scheme-theoretic Chevalley exterior-power line stabilizer to the generated neutral category, including coefficient restriction. Do not reimplement Chevalley theory.
2. Current ReductiveGroups, structure layer: algebraic central lifting `f(J°) ⊇ G_der` implies `J° ⊇ G_tilde_der` for a central torus quotient of connected reductive groups; and dominant rational Newton-cocharacter normalization after finite algebraic coefficient extension.
3. ReductiveGroupsPartII:RG2.0: nonempty analytic opens are Zariski dense in connected smooth Q_p-groups; finite central derived isogenies are open on rational points, without rational surjectivity.
4. SchemeAndStackFoundations:SF.0: determinantal intersection-rank loci for universal filtrations, and nonempty quasi-compact étale coordinates with finite separable field fibres, using Stacks Tags 054L, 02GL and 02GH.
5. DiamondsAndVStacks:D5: compact-coset invariant clopen separation and the qcqs inverse-limit interface for finite transitive Galois sets. Its existing restricted-quotient result is conditional; no universal orbit formula is imported.

The current Tau Ceti declaration `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` is reused, not planned. It is present at current commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, beyond the fixed atlas pin. The packet's `upstreamNotes` records that boundary. `TauCeti.Tannaka.fgPointTensorIsoEquiv` is already at the pin but concerns specified finite comodules, not all abstract neutral categories.

## Mathematical review points

The reader and packet distinguish full algebraic monodromy H from MT=H°, line preservation from vector fixation, and ambient period conjugation from abstract inner forms. Coefficient rank-one objects have possibly unequal jumps with total equal to the Newton exponent. Their underlying F-dimension is s.

Generic admissibility uses the unfiltered decent fibre functor before any admissibility assertion. It imports only the independently established finite-classical nonemptiness part of HS2, and proves all subobject inequalities by uniform descent and upper semicontinuity. It does not depend on the converse or an ADLV component classification. Standard-fibre torsor triviality requires the parent's bounded theorem, rather than weak admissibility alone.

Highest-weight estimates use all distinct refined Galois orbits, weighted by their sizes. A common normal closure handles a nonnormal reflex field. Pairing equivariance uses inverse Frobenius powers before full-period reindexing. Dominant Newton normalization uses an algebraic coefficient change preserving genericity; arbitrary G(F) translations transport the final point only.

Central lifting uses algebraic monodromy and Serre–Sen on both crystalline lifts. An arbitrary continuous central extension of compact images would not justify the argument. Compact torsor components are right cosets gC, with left stabilizer gCg^(-1); orbit connectedness and clopen separation are both needed.

Nine source findings are recorded with own-word explanations, corrections, counterexamples or proof repairs, and dated correction searches. These are findings for independent review, not independent-review verdicts:

- E1: GLX p. 836, full tensor group versus identity component (already found in the parent and paper extraction).
- E2: GLX Proposition 5.7, pp. 840–841, nonnormal reflex-field orbit indexing (previously found; explicit cubic torus test supplied).
- E3: GLX equation (5.29), p. 843, duplicated refined components.
- E4: Chen Proposition 3.3.4(2) proof, p. 743, the single mixed tensor power reduction; use all representations here.
- E5: GLX Lemma 6.12 proof, pp. 855–856, the component-quotient gap; compact separation supplies the specific repair.
- E6: GLX Proposition 6.7, p. 851, the omitted derived-intersection bridge in central lifting.
- E7: GLX equation (5.34), p. 843, inverse Frobenius in the pairing before reindexing.
- E8: GLX Theorem 5.8 proof, p. 842, arbitrary F-translation need not preserve genericity over the finite reflex field.
- E9: Chen Proposition 2.0.3 proof, p. 735, strengthen the residue-degree choice by the factor p^r coming from Lemma 2.0.4. The degree is m·p^(n−b), with m outside the exponent; this was checked against the typeset page.

## Sources and baseline audit

Read the published GLX text, Inventiones 243 (2026), pp. 805–861: §§2.1–2.2, all of §5, Theorems 6.1–6.2, Propositions 6.6–6.7, Lemma 6.12 and its surrounding argument through Lemma 6.15. Read Chen's published Annales ENS 47 (2014), pp. 723–764: Proposition 2.0.3 and Lemma 2.0.4 with proofs, §§3.1–3.3, and Theorem 5.0.6 with proof. Exact URLs, editions, access dates, PDF hashes and target-level theorem/section/page locators are recorded in the packet and roadmap. Stacks stable tags were checked against the actual statements.

Read the current ReductiveGroups and AdicSpaces roadmaps as prose models; checked the relevant current ReductiveGroupsPartII signatures, all nine post-snapshot roadmap directions, and current Tau Ceti for duplication. The library audit entries for VB0, BG0 and BG1 were checked; no PadicHodgeTheory entry certifies these new targets. At the pins, Mathlib's named isocrystal classification is rank one, and Witt completeness and concrete Hopf-point reconstruction already exist.

Serre–Sen, the perfect-residue-field Colmez–Fontaine equivalence and the DOR bounded standard-fibre theorem are imported by the exact parent node contracts. Their primary proofs were not reread for this pass. The parent's source and proof obligations stay with it. No claim is made to have read the separate Simpson, relative crystalline or equivariant-curve primary sources. No private source file or source passage is included in the submission.

## Validation and suggested file

The compact suggested Lean file has two real-bodied definitions, ten theorem signatures and six examples, with no new surrogate carriers and no placeholder data. It elaborated with `lean-check` at pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, exit status 0, with only five `declaration uses sorry` warnings. Heavy carriers and their mathematical signatures remain in the README under the current compact-file rule. No language server or library build was run.

The blueprint checker and intake file checker pass. Source issues are checked by the blueprint checker. The independent reviewer should first check the two supplier contracts and the corrected nonnormal orbit argument, then the coefficient-line criterion and central-lifting repair. The remaining three independent designs should follow the preserved route briefs, not expand this generic-monodromy scope. No second issue was claimed.
