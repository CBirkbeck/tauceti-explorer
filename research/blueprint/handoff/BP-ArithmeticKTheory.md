# BP-ArithmeticKTheory — completed target pass

Codex, session `codex-NtMPRq`; issue [#10807](https://github.com/CBirkbeck/tauceti-explorer/issues/10807). Claim confirmed by the swarm bot at [comment 6269111360](https://github.com/CBirkbeck/tauceti-explorer/issues/10807#issuecomment-6269111360). This submission completes the target-level planning pass; it does not claim proof closure or implementation. It is ready for independent blueprint review.

## Deliverables and continuation of earlier parts

The main packet has `part: null`, exactly the ten requested stage IDs, and nine new nodes: seven theorems, one definition and one construction. They add periodic and genuine L-group finite generation, classical symmetric/quadratic GW finite generation, the all-integer FGV Bott/cohomology tables with their canonical Adams edge maps and ordinary comparison range, and the arithmetic K3 examples.

The seven existing part packets retain all 130 historical node IDs and their source/review records. The checker prohibits redeclaring the same ID in two packets of one roadmap. The main packet therefore records every historical ID in `inheritedTargets`, with thirteen `contractRevision` records; the combined reader applies those revisions and includes every active target. Three historical function-field/curve extensions remain in their original part but are outside this number-field scope. The result has 136 active targets: 71 theorems, 15 comparisons, nine lemmas, ten constructions, 17 definitions and 14 applications, with 182 API items and 132 test specifications.

Assembly must resolve each manifest reference to its original packet and apply `contractRevision` before constructing its statements, proof plans and prerequisite graph. Apply the `planetOverride` as well. Concatenating the unmodified parts would preserve superseded dependencies. There are 36 selected planets across the active targets, at most six in any stage. N.6 retains its two-rank computation as a target but gives its planet position to the new Adams splitting. Two planets are newly declared in the main packet.

The revised reader contains the complete APIs, hypotheses, proof steps, checks and locators, including the follow-up rank, ramification, e-invariant, wild-kernel and finite-certificate material absent from the previous combined reader. The suggested Lean file follows the current WORKERS shape: six light real-bodied definitions, expressible milestones and examples; no constructed higher carriers or placeholder data definitions.

## Confirmed findings assigned to this job

| Finding | Treatment |
| --- | --- |
| RT-AREA-ktheory-1/1 | R.1 is the single owner of the building, Steinberg module, Solomon–Tits theorem, Borel–Serre boundary and orientation-correct integral arithmetic homology, including nonfree lattices. N.3 imports `R.1/steinberg-duality-finiteness` and retains the Q-construction rank filtration and assembly. The rank-specific layer-poset suspension comparison remains here. The generic connected H-space finite-type supplier gap is explicit. |
| RT-AREA-ktheory-1/3 | N.5 imports M.7's existing named Suslin-real comparison, real-place correction and dyadic extension nodes. The real KO/BO computation and Bott periodicity are requested from RT.4:topological; complex KU or Clifford periodicity is insufficient. Full M.8 is not a prerequisite of the early real arithmetic table. |
| RT-AREA-ktheory-1/7 | R.3 supplies the orders-only Borel rank formula. N.3:ranks owns its finite-S extension via the actual localization map and the finite-field residue terms in positive degrees. Degree one uses the S-unit rank separately. |
| RT-AREA-ktheory-1/9 | S.3/T.5 supply the normalized localization and degree-two rows. N.6 imports the tame subgroup but retains the certificate engine and distinct raw/symbol wild kernels. N.8 imports K0(Z), K1(Z), K2(Z) and K2(Q) from Z.6/U.6/T.5; its Gaussian and real-quadratic certificates remain independent arithmetic targets. |
| RT-AREA-ktheory-1/10 | N.4 remains the single W2 owner; N.3:ranks supplies K2(O_F) finiteness. The proposal adds both supplier edges to B.1 and removes its duplicate finiteness task. |
| RT-AREA-ktheory-1/11 | N.8 owns the real-quadratic certificate and independent bounds. The proposal adds N.8 → B.3; B.3 retains the w2, L-function and special-value comparison. |
| RT-AREA-ktheory-2/22 | The new arithmetic K3 node derives Z/48 and Z ⊕ Z/24 from N.5 and N.4. N.8's compilation and Gaussian target no longer depend on V.5. The proposal adds N.5/N.8 → V.5, which retains decomposable/indecomposable analysis. |
| RT-AREA-ktheory-2/42 | N.2 imports S.3's Dedekind sequence and boundaries, retaining arithmetic finite support, degree-specific consequences and ramified restriction. Pullback has coefficient e(q/p), while transfer uses residue norms. |

The combined internal graph check also caught two circular prerequisites introduced by connecting the old compilation nodes to their refinements. The low-degree restriction refinement now uses S.3's independent finite-pushforward theorem instead of the combined arithmetic restriction/transfer theorem. The raw kernel definition uses the completion/localization suppliers; the raw-versus-symbol comparison depends on that definition, rather than the definition depending on its comparison theorem.

## Sources and library audit

Fresh direct sources are identified in the main packet by version, URL, SHA-256 and the sections actually read:

- Calmès et al., arXiv:2009.07225v4, Corollary 8, p. 5; Corollaries 2.3.16–2.3.19 and proofs, pp. 47–48; comparison ranges, pp. 18 and 31. The published Annals version is identified but not claimed collated. The quadratic comparison is imported from HK.5 and the symmetric range from HK.7; the adjacent boundary degrees are checked.
- Feng–Galatius–Venkatesh, published Inventiones 230 PDF, §§1.4, 2.6–2.7, pp. 233–234 and 240–247. Both tables include negative weights, dualization signs and natural edges. Ordinary comparison is all i≥0 after inverting p, and i=0 or i≥2 before inversion; degree one retains its valuation class. Mod-3 spectrum operations are not promoted to an associative Moore-spectrum product.
- Weibel's author-hosted combined K-book draft of 29 August 2013, the precise V.6 and VI.1–3, VI.8–9 portions listed in the source record. Earlier parts retain their other proof-source inventories and gaps; their appearance in the reader is not a fresh reading claim.

The new source finding `ArithmeticKTheory/E-BP-FGV1` records a twist-index misprint in the proof of Corollary 2.12, published p. 245 (PDF p. 21): the target twist in the indicated multiplication is 2k. The tables themselves have the correct indices. The rendered page was checked; no published erratum was verified. Statements and proof plans are in our own words, without source excerpts.

Inherited source findings retain packet-and-locator identities because earlier packets reuse IDs for different findings. The independently rejected N.6/E-N6-2 signature-defect allegation is not adopted. The Weibel preprint's flawed exceptional dyadic proof remains a gap, without asserting anything about an uncollated publication. Washington's book was not read; no uncleared copy was used.

The reviewed library audit, current Tau Ceti and the nine newer upstream roadmap directories were checked for ownership. GlobalNumberFields and ProfiniteCohomology supplied nearby upstream style examples. Current library contents are distinguished from the pins. The five direct baseline declarations in the new packet were checked against actual statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; earlier packets retain their baseline inventories. In particular the native eigenspace is `Module.End.eigenspace`.

## Coverage and exact remaining work

All ten stages are **planned**, and none is **closed**. Every target has a statement, ownership and proof plan; every implementation status remains unchecked. The packet has nine explicit gaps and nine open supplier requests. These are proof/contract boundaries, not omitted stages.

| Stage | Status and remaining boundary |
| --- | --- |
| N.1 | Planned; integrate pinned S-integer and imported low-degree maps, keeping arbitrary-S statements distinct from finite-S finiteness. |
| N.2 | Planned; integrate S.3/T.5 maps, ramified restriction refinements and K.7 coefficient-boundary compatibility. |
| N.3 | Planned; categorical homology comparison and connected H-space finite type, allowing nonzero fundamental group. |
| N.3:finite-generation | Planned; exact H.3/H.6 finite-type and GN.6 Witt-signature/classical comparison exports. |
| N.3:ranks | Planned; combine R.3's orders-only formula with finite-S rational localization and separate finite generation. |
| N.4 | Planned; integrate continuous twists and cyclotomic exponent interfaces, with nonzero-weight finiteness and corrected w10(Q). |
| N.5 | Planned; coefficient/edge compatibility, original Harris–Segal detected-summand proof, real KO supplier and cross-roadmap Chern-family boundary correction. |
| N.6 | Planned; higher raw completion comparison, exceptional dyadic proof repair, Keune proof/normalization and exact Bott/coefficient suppliers. |
| N.7 | Planned; permitted Kummer/Herbrand–Ribet proof sources and the regular-prime coefficient Bott-module proof. Vandiver remains distinct. |
| N.8 | Planned; integrate N.5's K3 output and the certificate engine's soundness/cutoff theorems. Finite certificate data have been checked independently. |

The nine requests name GN.6, H.6, H.3, K.7, M.7, RT.4:topological, R02.3, L.1 and early IntegralIwasawaTheory L.0 with exact consuming targets. The nine gaps additionally preserve the unread original Harris–Segal/Keune/regular-prime proofs, higher raw-kernel obstruction and exceptional dyadic proof issue.

The main packet's five restructuring proposals require maintainer application outside this issue's deliverables. In particular, the inherited external cycle N.5 → M.8 → R.7 → Polylogarithms P.2 → K3BlochGroups V.3 → V.2 → N.5 is recorded, not claimed resolved globally. The proposal separates the early M.7 torsion edge and makes V.2 use N.3 finite generation plus R.3 ranks. The revised internal ArithmeticKTheory graph is acyclic; independent review should check the external boundary changes before closure or packaging.

## Validation and where review resumes

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory.json`: zero errors and zero warnings, including the pinned declaration index.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: passed.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ArithmeticKTheory.lean`: passed.
- `lean-check research/blueprint/suggested/ArithmeticKTheory.lean`: exit 0 on the pinned shared build, with only 20 intended proof-placeholder warnings. The file is 198 lines with six real-bodied light definitions; no data placeholder. Elaboration does not establish the mathematical targets.
- Combined manifest audit: all 136 active targets form an internal DAG; every one of the 17 definitions has an API and at least three tests; all 36 selected planets meet the six-per-stage cap.
- Independent exact arithmetic verified all eleven inherited Q(√5) residue certificates: 173 relation witnesses, 23 selected determinants, their gcds and generation of each finite residue multiplicative group. In the basis ε²=ε+1, multiply (a,b)(c,d)=(ac+bd,ad+bc+bd) and use norm a²+ab−b². Recompute A, B and C from their signed exponent vectors using rational arithmetic, check A−B=πC and vector differences, evaluate each selected determinant by exact elimination, and check gcd=Nπ−1. Form the residue fields directly (quadratic fields at norms 4 and 9, scalar roots at the other prime norms) and enumerate the subgroup generated by the listed residue images. These checks validate finite data, not the unimplemented Tate soundness or large-prime cutoff theorem.
- `git diff --check`: passed. Only this job's three deliverables and this handoff are changed.

Review should start with the new hermitian comparison ranges and low quadratic degrees, the canonical all-degree Bott edges and degree-one exception, the thirteen inherited contract revisions and planet override, and the exact gap/request boundaries. No further extraction job or second claim was taken in this session.
