# BP-KTheoryLowDegrees--U.4 — finite Mennicke defects and arithmetic kernels

Codex — **codex-z7TRCa**. Refs #7560. The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7560#issuecomment-6074136370) was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/7560#issuecomment-6074138015). Branch: codex-z7TRCa-u4. This is a complete planning pass under PROTOCOL §0, with U.4 **planned**, not closed. It is not a checkpoint. No second job was claimed.

## Delivered

The packet contains **91 fresh nodes**: 76 lemmas, nine theorems, three definitions, one construction and two applications. There are **20 API items, 16 unit tests, 19 checked baseline declarations, 11 supplier requests and 11 gaps**. All implementations remain unchecked. No inherited U.1 node, packet, document or suggested file was edited. The six inherited U.4 planets remain selected; this part adds zero planets and proposes a coherent sublayer split.

The new mathematical chain comprises:

- The last-two-coordinate swap calculation in the general smaller-corner case and the Dedekind Kubota rank-two case. Product preservation is proved before bundling the actual standard-form value, and the extension is iterated with its conditions.
- The finite GL quotient projection, surjective stabilization, injective stabilization by extension, high-rank commutators and pullback. The finite quotient's two Mennicke laws are explicit inputs to finite relative universality; stable SK₁ is not substituted for them.
- The native determinant-one defect quotient, its universal-symbol normalization, arithmetic order r(I), surjective ideal transitions and their root-power normalization, deep cofinality and the compatible inverse limit.
- Finite residue rings and indices, profinite lattice descriptions, kernel comparison, and the rational completion/centrality boundary.
- Serre's normal closure in SL₂, ray/cyclotomic choices, diagonal commutators, abstract inverse-limit centrality, finitely generated abelian defects, and the Moore-relative-cover boundary. Finiteness of Serre elementary levels is deduced after the completed kernel computation.
- Three valuation-image refinements of the inherited S-unit theorem and four conditional arithmetic-to-Hecke/cohomology interfaces.

The reader contains every statement, proof outline, direct prerequisite, API and test, arranged by mathematical interfaces rather than source sections. Its introduction identifies all original U.4 targets by their inherited ids. The suggested file uses native Mathlib matrix, quotient, unit-torsion and normal-closure carriers. Its Inherited namespace supplies stand-alone prototypes of already owned inputs, to be replaced by imports during assembly.

## Exact remaining work

Resume from the eleven packet gaps and their neededBy lists; each is reproduced in the reader and the coverage remaining list:

1. **CA.1 reciprocity and cycle.** The three arithmetic-symbol nodes still depend on K2SymbolsBrauer:T.7, which leads through T.3, T.2, K3BlochGroups:V.2 and ArithmeticKTheory:N.5 back to U.4. No cyclic CA.1 edge was added. Replace its proof prerequisites with local/global Artin inputs before importing those existing nodes. Match the BMS Art_v(b)-on-root-a orientation and the A.21 specialization allowing b at primes above m.
2. **Higher-unit formulas and Artin dictionary.** The public BMS A.17–A.18 statements and reduction were read. A.17 compares the image on U_h×U_0 with that on U_{h+1}×K_vˣ, both μ_{p^{n−j}}; changing h also changes the second argument. A.18 assumes ord_v(b)≥h and is trivial at equality. Source the remaining local-ramification inputs from Corps locaux XIV or a permitted equivalent source. Extend CFT layer 6's quadratic comparison to the required degree-m dictionary; layer 5 is cohomological and excludes reciprocity.
3. **Exact-level symbol surjectivity.** Check the local-value and global-prime construction at r(I), preserving I and each primary generator; BMS calls the surjectivity immediate.
4. **Rank-two scalar choice.** Prove simultaneously s∈I, c=1+sy₁≠0 and the coprime pair condition, separating proper/unit/zero ideals and field cases.
5. **Residue-ring bridge.** Supply the exact nonzero integer in an O_F ideal and the finite-quotient localization argument.
6. **Rational two-sided completions.** Provide the Hausdorff group completion, open-subgroup comparison and denominator/conjugation refinement. The native lattice profinite completion does not supply this noncompact ambient construction.
7. **Serre algebraic input.** Supply arithmetic Zariski density, proper normal algebraic subgroups being central and simplicity of PSL₂(F).
8. **Serre root and row refinements.** Finish the p.493 ideal-producing calculation and same-ambient transition surjectivity. Do not identify SL₂-normal closure with E₂-normal closure.
9. **Arithmetic SL₂ finite generation.** Serre invokes O'Meara Theorem 24.8, whose proof was not read here. Find its exact owner or source and specialize it.
10. **Moore relative covers.** Supply the category and theorems quoted by Serre as Moore 13.1 and 12.3, including the μ(F)/trivial computation and rational splitting. Moore's paper was not read here.
11. **Hecke support and dual degree.** Prove Eisenstein support of determinant, continuous congruence and central-kernel characters, including p dividing the central order. Supply the complementary-degree vanishing and Hecke-dual ideal for compactly supported H¹.

The eleven requests are the seven inherited arithmetic contracts reissued at new consumers (CFT 5/12/13, Chebotarev 4/10, GlobalNumberFields 6/7), plus CFT 6, CFT 11, ProfiniteProPGroups 0 and ALS.4. They are open contracts, not completed upstream results. CA.1 retains higher-reciprocity ownership; generic topology and cohomology remain with their suppliers. No upstream-to-upstream link was changed.

## Findings, source evidence and conventions

RT-AREA-ktheory-1/24 is handled by importing the existing s-unit-theorem and fundamental-s-units, then providing principal-prime-power, finite-index valuation-image and exact-sequence rank refinements. The negative valuation sign is the pinned Tau Ceti convention. ArithmeticKTheory N.3 continues to cite the inherited theorem.

RT-AREA-ktheory-1/25 is handled by the inherited A.10/A.11 and prime-choice nodes and the exact new supplier contracts. The actual reciprocity cycle is preserved as a gap/restructure proposal. A.12 is a function-field result outside this number-field scope.

Fresh public reads on 9 October 2026: BMS Theorem 3.6 pp.77–79, Theorem 4.1/Corollaries 4.2–4.3 pp.94–96, Theorem 5.4/Lemma 5.5 pp.101–103, §§7–11 pp.105–121, §14 pp.128–130, Theorem 15.1 p.131, Appendix A.13–A.23 pp.85–92 and the A.17–A.18 reduction pp.87–89; Serre 1970 introduction/§1 pp.489–492, all §2 pp.492–500 and §3.1 Theorem 6 pp.504–505; the complete Serre 1974 erratum pp.241–244; CG §9.3 around Remark 9.3, physical PDF pp.118–120. Bibliographic details, public URLs and SHA-256 hashes are in the packet and reader. No source excerpts or book files are in the repository. No uncleared book was used.

E116 corrects the p.119 BMS retrospective theorem citation to Theorem 5.4. E117 corrects Serre's p.497 diagonal-power citation to Proposition 3. E118 records the p.103 Dedekind spelling misprint. Published scans and primary correction searches were checked; no correction to these misprints was found. This is not a claim of discovery priority. Parent E112's known 1974 A.23(b) withdrawal and retained A.23(c) are respected; its E115 A.10 correction is inherited.

The stable-range indexing was checked against BMS pp.106–107,110,115: old rank r uses HasStableRange A r for the initial standard form, while the stronger route needs HasStableRange A (r−1) and relative GL_{r−1} transitivity. At old rank two this means stable range one, which a general Dedekind domain need not have; use the Kubota route. The arbitrary target group need not be abelian. The swapped rank-two corner retains d=det a as a unit, rather than setting it to one. Serre's rank condition is r₁+r₂+|S|≥2, admitting the CM-quartic case and excluding imaginary quadratic S=∅.

## Verification and reproduction

The standard packet checker reports **0 errors and 0 warnings**. Definition/API/test name parity, reader/node statement parity, distinct inherited ids, allowed paths and absence of excerpts/local paths were checked separately.

The **complete suggested file elaborated** through lean-check in the existing build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, with automatic implicit variables disabled and exactly 64 proof-placeholder warnings, no errors or other warnings. This is a Mathlib-only slice. Tau Ceti statements were read at f790474821cf4256814db967cb154e7af3d0c369 through pinned source objects; the suggested file does not claim that the complete inherited U.1 file or missing Tau Ceti object files compiled. All four new definition/construction names, twenty API names and sixteen tests occur in it.

Three named completion theorem signatures and the conditional CG application signature are omitted because their actual supplier objects/conditions cannot yet be expressed, as PROTOCOL §13 requires. The mathematical statements and exact gaps remain in the packet and reader; no opaque predicate replaces them.

Independent matrix arithmetic checks used the displayed formulas with deterministic random entries modulo 5,7,11: 1,440 higher-route corner/correction identities at old ranks 2–7 and 1,105 rank-two Bézout/standard-form first-row identities passed. The Gaussian clipped-floor formula passed depths 0–19. These check explicit matrix polynomials and arithmetic profiles; they do not prove the source theorems or Lean placeholders. The packet gives all formulas needed to reproduce them.

Before each sequential lean-check the machine had more than 100 GB available. No build, dependency update, cache download, language server or repository copy was started. No compile remains running. Scratch contains only disposable public sources, scripts and logs and is removed after submission; all continuation information is in these deliverables.
