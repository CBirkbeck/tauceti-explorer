# REV-FIX-RT-RS-01~2

**Accepted in both files, after correction.** Reviewer: Codex, session `codex-7AYw97`, 18 October 2026, [issue #8932](https://github.com/CBirkbeck/tauceti-explorer/issues/8932). This session wrote none of FIX-RT-RS-01~2, its preceding fixes or reviews.

## Summary

The remaining ownership defect, RT-RS-01/30, is resolved. Early R07.3 proves rational Fontaine–Laffaille admissibility and its period comparison; R06.4 imports them. R06.3 owns the general perfect-residue Colmez–Fontaine proof; R07.4 imports it while retaining Kisin's finite-height construction and comparison. R06.2 supplies the proposition and early formalism. These assignments meet the alternatives permitted by the verifier and the decision requested in [REV-FIX-RT-RS-01](REV-FIX-RT-RS-01.md).

I checked the changed source arguments, hypotheses, consumers and dependency graphs, and corrected stale proof references and statement qualifications. All 31 other finding dispositions survive comparison with the verified findings and earlier independent review. The existing 22 layer decisions, 21 owners and 31 links are preserved exactly as JSON values. Both file checkers pass.

This accepts the restructuring/fix decisions. P7 retains its 25 proof gaps and existing vector-bundle scheduling cycle. The external R07 packet and reader/suggested documents still need the explicitly recorded synchronization. No stage is certified closed and no new Lean proof is claimed.

## Finding dispositions

“Retained” means I read the finding, verifier's reason and correction, checked that the current contract preserves the earlier independently reviewed correction, and found no regression. The source-proof audit of those unchanged contracts remains the one in REV-FIX-RT-RS-01; this report does not claim to repeat it. The renewed primary-source reading below concerns /30. The verifier rejected /25, /26 and /29.

| Finding | Verdict | Reason |
|---|---|---|
| /1 | Retained; pass | AI.2 supplies the module lemmas used in its own BKF argument; AI.5 supplies the complex lemmas. The reverse module-supplier dependency remains excluded. |
| /2 | Retained; pass | The good-reduction lattice and late comparison agreement belong to CP.2; CP.3 supplies the independent deformation and its filtered comparison. |
| /3 | Retained; pass | CR.3:Frobenius-isogeny supplies Proposition 13.21 with smooth affine inputs, nonnoetherian base, fixed section and separate canonical DVR specialization recorded. |
| /4 | Retained; pass | AI.3 covers locally noetherian adic spaces. The classical Witt sheaf and BMS's derived-p-completed sheaf remain distinct constructions. |
| /5 | Retained; pass | AI.0 owns finite Witt coherence and the finite-presentation transfer lemmas. CP.0's coherence node is an import alias. |
| /6 | Retained; pass | AI.0 supplies the specialization objects, localization/flatness results and cyclotomic unit with their field hypotheses; CP.0 keeps their normalization dictionary. |
| /7 | Retained; pass | CP.0 keeps the uniformizer construction. Both its coefficient Frobenius and the p-th power in the Teichmüller image remain explicit; no late Kisin supplier is imposed. |
| /8 | Retained; pass | Relocated generic proofs use early AI.0/AI.2 suppliers rather than CP.0. Provenance, hypotheses and node-forwarding obligations are conserved. |
| /9 | Retained; pass | AI.5's complex contracts retain rational freeness, perfectness where required, characteristic/root-of-unity restrictions and the adjacent-degree condition. CP.5 keeps geometric applications. |
| /10 | Retained; pass | The unsupported R06.4 supplier for CP.5 remains withdrawn; CP.5 imports classified R07 objects, with R07.3 linked directly. |
| /11 | Retained; pass | Integral cyclotomic coefficients and the PD envelope have early owners. The criterion still uses Witt coordinate index 1; the corrected μ non-generator case includes p = 2. |
| /12 | Retained; pass | CP.3 owns the constant-coefficient comparison/agreement. P8 applies it to coefficients and families without becoming an input to CP.2. |
| /13 | Retained; pass | The early P8:local-rational supplier includes primitive comparison, lisse coefficients and inverse-limit obligations. AI.5 receives it; the obsolete CP.3:primitive proposal stays removed. |
| /14 | Retained; pass | AI.6 imports CP.3's deformation and owns the semistable comparison; CP.4 imports the resulting agreement. The reverse cyclic choice is absent. |
| /15 | Retained; pass | CR.6 constructs monodromy and change of uniformizer. CP.4 transports their normalized formulas through its comparison. |
| /16 | Retained; pass | PR.8 supplies the log-prismatic realizations with Cartier-type/perfect-log-prism/Kummer-étale scope; CP.4 owns agreement with the other semistable route. |
| /17 | Retained; pass | CR.0 owns the classical PD envelope and Witt reduction on existing carriers. AI.0:integral applies the general construction without supplying it back to CR.0. |
| /18 | Retained alternative; pass | DD.4 owns the regular/lci derived-de-Rham/PD comparison, importing CR.0. The verifier's initially suggested reverse dependency would conflict with DD.0's existing CR.0 input. |
| /19 | Retained; pass | PR.4 owns the source-qualified logarithm on the Tate module of quotient-ring units and the first Chern classes/specializations imported by CP.6. |
| /20 | Retained; pass | PerfectoidSpaces P1 supplies the integral/Tate comparison. Q0's application preserves boundedness and nonzerodivisor conditions. |
| /21 | Retained; pass | The historical endorsement is qualified for the additional duplicates and forwarding obligations. It is not presented as a fresh unrestricted acceptance. |
| /22 | Retained; pass | The direct R06.1 → CP.4 link records B_st and its normalized embedding into B_dR. |
| /23 | Retained; pass | CP.0 keeps cohomological twist and scalar-extension compatibility, importing coefficient-level comparisons from the AI.0 branches. |
| /24 | Retained; pass | Direct edges and reachability remain distinguished. CP.3 → CP.5 is explicit; the new measurements below replace reliance on historical graph counts. |
| /25 | Rejection retained | A restructuring instruction need not itself generate all supplier nodes. The retained AI.5 contract nevertheless records the relevant hypotheses explicitly. |
| /26 | Rejection retained | Reusing one geometric counterexample at several points in a proof/application chain does not assign it several construction owners. |
| /27 | Retained; pass | CP.5 explicitly keeps the CK semistable torsion inequalities and lattice theorem, including ramification factors, torsion assumptions and adjacent-degree restrictions. |
| /28 | Retained; pass | CP.1's O_C agreement and AI.7's S-valued application remain separate. PR.6 supplies perfect-prism uniqueness with symmetric monoidal and Hodge–Tate compatibility; transport to S remains an obligation. |
| /29 | Rejection retained | CP.2's geometric crystallinity corollary and R06.5's application use the common period formalism; they do not construct the general theory twice. |
| /30 | Pass after correction | Both proof suppliers are now explicit, with source-correct scope and usable forwarding. The corrections below remove remaining prose that treated the R06.2 proposition as a proof. |
| /31 | Retained; pass | PR.2 owns the derived extension/initiality package. Q2 imports it; weak initiality with a retract remains distinguished from the stronger regular-quotient and qrsp statements. |
| /32 | Retained; pass | FontaineTheta/BDeRham locators stay within the pinned files. Their carriers are reused; principality, the classical DVR interpretation and the full derived cotangent complex remain additional mathematics. |

## Renewed check of /30

**Fontaine–Laffaille.** Theorem 8.4(i)–(ii), published pp. 595–596, allows perfect k, K = W(k)[1/p], e = 1 and every prime p. Its filtration condition is Fil^j D = D and Fil^{j+p} D = 0: the allowed jump span is p−1. Normalized to [0,p−1], the FL functor is contravariant and identifies with the dual of covariant V_cris. With HT(χ_p) = +1, V_cris has the negatives of the filtration jumps as weights. Thus the dyadic rational span-one case is available to the CF proof. The unrestricted torsion safe interval remains [0,p−2]; the theorem does not remove endpoint restrictions. Proposition 7.17 and Remark 7.18, p. 594, provide dimension/evaluation inputs without proving essential surjectivity onto every stable lattice.

R07.3/fl-admissibility remains before its fl-lattice-correspondence consumer. R06.4's two former proof nodes import fl-admissibility and fl-period-comparison and keep convention/application work. Following the current external packet's local prerequisites gives 12 nodes for the admissibility supplier and 14 for lattice correspondence. Their external inputs include R07.2/dieudonne-ring as well as early R06.1/R06.2 and library references. None imports R06.3, R06.4, R07.4 or R07.5. This qualifies the fix report's abbreviated description of that closure. Broader late examples in the external draft remain separate scheduling work.

**Colmez–Fontaine.** The author version's Theorem A, p. 2, covers complete characteristic-zero discretely valued K with perfect residue field, finite totally ramified over K_0 = W(k)[1/p]. It is not restricted to finite extensions of Q_p. The new R06.3 target follows its first proof (§6.1, pp. 31–33). Proposition 4.5, pp. 24–25, supplies finite-dimensional semistable V_st and its admissible subobject before the general theorem. Propositions 5.1–5.3 and 5.6–5.8, pp. 26–31, give exactness, the non-isomorphism obstruction for δ, the surjectivity criterion and extension closure. The proof does not use the converse numerical criterion that depends on Theorem A.

The separately planned lifting lemma matches Corollary 2.6, p. 17: dim_Qp V = h ≥ 2, length_B2 M = h, dim_C(tM) = 1, surjectivity modulo tM and finite-dimensional kernel of ξ_U. Its sketch retains Proposition 2.1's dichotomy and Lemmas 2.2–2.5's analytic/Hensel argument, pp. 12–17. In particular the finite-image alternative is excluded using the finite-kernel hypothesis. Proposition 6.2 constructs an initial filtration on a simple underlying module using span at most one and early FL. Filtration distance (Proposition 3.2, p. 19), simplicity/neighbor behavior (Proposition 3.5, p. 22) and the length/distance induction then give the general theorem. This route supports the Q̆_p application; the separate Berger route retains its finite-K/Q_p scope.

The two realization nodes with stable R06.2-prefixed IDs now have R06.3 parents. The crystalline-equivalence node imports the actual general theorem; fixed-bound torsor triviality retains its independent proof gap. No R06.3 → R06.2 return is created. R07.4 imports general CF but keeps Kisin's specific map and height/dimension/classification results. Brinon–Conrad Proposition 11.3.3 and Remark 11.3.4, pp. 182–183, support that distinction.

## Corrections made in this review

1. `R06.4/small-weight-admissibility`: its weight-p+1 acceptance case now points to the actual R06.3 theorem routes instead of the R06.2 proposition interface.
2. `R06.2/weak-admissibility`: its recorded essential-image use now names the general R06.3 proof, explicitly retaining R06.2 as the proposition interface.
3. `R06.3/weil-deligne-descent`: statement, hypothesis and proof prose now identify early full faithfulness and the already-listed finite-K/Q_p Berger proof prerequisite. The former prose incorrectly attributed essential surjectivity to R06.2 alone. No prerequisite edge was added.
4. `R06.4/fontaine-laffaille-sign-dictionary`: the statement itself now assumes admissibility and explicitly bounds the FL comparison's range. Its hypotheses/proof already contained these qualifications; they no longer have to repair an overbroad statement.
5. `R06.3/colmez-fontaine-perfect-residue`: added the exact Proposition 3.2/3.5 page locators used in the filtration argument.
6. Both top-level review objects are replaced with this review's dated acceptance and bounded evidence. Earlier review objects are archived in `reviewHistory`, including the independent P7 review and the preceding RS-01 needs-changes verdict. No old `excerpt` field survives.

All 300 pre-fix node IDs, API records, definition tests and library records remain. The two added targets are key theorems, with proof sketches and acceptance cases; they introduce no new data definition needing an API. The packet has 302 nodes, 640 API items and 373 definition tests. Its 25 gaps are retained.

## Sources, libraries and upstream

Public copies read on 18 October 2026; page numbers above are printed numbers in those versions. All mathematical prose is original paraphrase, organized around the supplier decision.

- [Fontaine–Laffaille, published Numdam scan](https://www.numdam.org/item/ASENS_1982_4_15_4_547_0.pdf): §§7.12–7.18 and 8.1–8.5, pp. 592–596. SHA-256 `c049a7bff113a45f8bbcffc93118bd2e651e84f8b4a38305f7cb24b34c2011a2`.
- [Colmez–Fontaine, author copy](https://webusers.imj-prg.fr/~pierre.colmez/CF.pdf): Theorem A, p. 2; §1.4/Proposition 1.3(ii), pp. 8–12; Proposition 2.1 through Corollary 2.6, pp. 12–17; Propositions 3.2/3.5, pp. 19/22; Proposition 4.5 and Corollary 4.7, pp. 24–25; §5, pp. 26–31; first proof, §6.1, pp. 31–33. SHA-256 `f0b5c51191831415b39cd363cc9eb5ba759d1ea7e46d9b4c1d15cea0a7aa6490`.
- [Brinon–Conrad, CMI notes](https://math.stanford.edu/~conrad/papers/notes.pdf): Proposition 11.3.3/Remark 11.3.4 and the following comparison argument, pp. 182–184. SHA-256 `f27d508bc64b3c9e2e9de5041429b2cb6a909b2cd72ff8096c20493f27b5a187`.

I read the coverage index and relevant reviewed AUDIT-37/38 bookkeeping. The R06/R07 batches remain pending in the coverage index; their absence from promoted per-layer coverage is not implementation evidence. At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I re-read Isocrystal.lean, lines 65–135 (fraction-Witt/Frobenius carrier and morphisms), WittVector/Basic.lean, lines 253–267 (coefficientwise map), FontaineTheta.lean, lines 118–213 (map and surjectivity hypotheses), BDeRham.lean, lines 1–98 (completion/localization carriers), and Extension/Cotangent/Basic.lean's presentation map. Tau Ceti's baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. The fix adds no baseline declaration claim; old records remain as independently checked in the P7 review.

Current read-only TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also checked. Targeted readings of AdicSpaces (scope, coefficient construction and Layer 6) and LocalGaloisGroups (ownership/import contracts and cyclotomic declarations) preserve their existing work. Tau Ceti already implements the local cyclotomic character and continuity in FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean. The specialized period choices do not authorize a new character. A concept search found no arithmetic CF/FL implementation or roadmap target there. No upstream file was edited or built.

## Validation and remaining obligations

- `check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**. The target-level planning status remains `complete`, with six stages planned, no stage closed, and the recorded partial P7/P8 work and gaps preserved.
- `check_restructure.py`: **ok**. There are 27 layer records, 23 owners and 50 links; CP.0, CP.5, R06.4 and R07.4 are narrowed.
- Independent read-only `build.assemble(require_distances=False)` with only RS-01 replaced in memory: **5,054 edge-incident vertices, 15,132 edges, acyclic**. The promoted baseline has 15,110 edges. All 50 links have RS-01 application evidence; 44 are inserted at its application point, with none skipped. The final net increase of 22 includes earlier unpromoted corrections as well as this round.
- Every current direct consumer of R06.4 (6) has a direct R07.3 supplier edge; every direct consumer of R07.4 (12) has a direct R06.3 supplier edge. The named essential-surjectivity consumers L7 and R24.5:operations also have the actual proof supplier.
- Adding all raw restructuring/link-map proposal edges yields **5,103 vertices, 15,359 edges, acyclic**. P7's projected prerequisites already give the cycle VB3:general-BC → VB4 → R06.2 → VB3:general-BC before FIX-RT-RS-01~2. The new projection preserves it; none of the 22 newly introduced edges is in a cycle. Neither forbidden return path R06.4 → R07.3 nor R06.3 → R06.2 exists. This does not certify arbitrary unions of all draft packet dependencies.
- `intake.py check-files` and `git diff --check`: pass on the four deliverables. No link map or Lean file is changed, so no separate link-map check or Lean compilation applies.

The FL Barsotti–Tate ring supplier proof, specialized CF analytic development, early perfect-residue invariant/full-faithfulness proofs and fixed-bound torsor proof remain named gaps. This review did not read Fontaine [F2] or the uncleared Dat–Orlik–Rapoport book. External packet and reader/suggested synchronization remains as specified in the fixer's handoff; acceptance does not claim those later jobs have already made the edits. The [review handoff](../handoff/REV-FIX-RT-RS-01~2.md) records the continuation boundary.
