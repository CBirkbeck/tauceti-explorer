# Independent review: MotivicEtaleKTheory M.5d–M.8

**Verdict: needs_changes.** The review is complete. This is a target-level review of BP-MotivicEtaleKTheory--M.5d, written by Codex — codex-ckXiAw, independently reviewed by Codex — codex-kJsFzf on 2026-10-06. The packet records the required reviewer identity and a separate verdict for every node.

| Item | Result |
| --- | --- |
| Nodes | 67: 31 verified, 27 corrected, 9 unverifiable |
| New nodes | 0; no proof-lemma decomposition imposed |
| Definitions / constructions | 2 / 18 |
| API items / named unit tests / planets | 64 / 60 / 30; one constructor API added |
| Scoped audited targets | 26 across six stages |
| Baseline declarations | 26 confirmed; 0 removed, 0 replaced |
| Coverage | Six planned stages, none closed; finished pass remains `complete` |
| Gaps / supplier requests | 14 / 36 after review |
| Source issues | Five confirmed, one rejected; no new issue added |
| Assigned red-team findings | All four checked |

## Evidence and baseline

Read the packet, suggested file, reader document, original handoff, binding protocols, relevant RS-08/RS-28/RS-33 ownership records, all six reviewed AUDIT-30 stage records, external declaration statements and relevant supplier stage contracts. HodgeStructures and GrothendieckEulerForms upstream reader examples were read in full. The 26 audited targets are represented at target level; no reviewed library implementation is replanned. Existing K-symbols, ordinary/derived/Witt differentials, spectrum machinery, supports, motives, elliptic curves, Selmer complexes and determinant functors remain imports.

All 15 public source PDFs matched their recorded SHA-256 hashes. Source reading was confined to the recorded sections, not asserted to cover every paper or every cited proof engine. In particular, original Kato 1982, resolution-free Geisser–Levine, Thomason, Blumberg–Mandell, Gillet/Gillet–Soulé and general Huber realization inputs remain explicit gaps. Those honest refinement gaps do not themselves justify rejection of a target-level finished pass.

Every baseline declaration was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The statements support the cited uses: universal derivations and their Leibniz/power laws; tensor/exterior universal properties and degree-zero/one comparisons; additive quotient maps/lifts and integer quotients; prime-subfield fixed-point lemmas; torsion subgroup; semilinear differential pullback; and p-adic integer/unit carriers. The field fixed-point lemma does not require the ambient field to be finite. The Tau Ceti pullback is semilinear, with its actual `map_D` convention; its compiled module is absent from the shared build, so the prototype retains a typed supplier parameter with explicit D compatibility. No baseline entry needed removal or replacement.

## Corrections made

1. **Locators and excerpts.** Weibel VI 4.9 is **Example** 4.9, pp.485–486; FGV 2.9 is **Proposition** 2.9, pp.12–13; Levine support/tower definitions are §2.1, pp.9–11, rather than §1.2–1.3, pp.5–7. Levine Remark 11.3.4 is on p.64. Weibel Theorem 4.2 is on p.480 and Addendum 4.2.1 on p.481. FS metadata now distinguishes Proposition 13.17 from Theorem 13.18. Isolated `dlog`, `ν`, `n`, `k`, `perfect`, `motives` and `p-adic` excerpts were replaced by identifiable labels/passages. Kato references for local conditions and Frobenius are explicitly conventions-only, with mathematical proofs remaining supplier obligations. Reading/version metadata distinguishes this independent verification from the original worker's ledger.
2. **Chern products and proper pushforward.** Corrected `chern-functoriality`: finite integral Chern classes satisfy universal product identities; rational total Chern characters are multiplicative. Factorial denominators cannot be inverted in arbitrary finite coefficients. Restricted the imported proper GRR assertion to the smooth projective **K₀** scope actually supplied by S.7; that theorem does not supply arbitrary higher proper regulator RR. These conventions follow the [K-book V §11](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), with support products as in [Li–Liu Appendix B](https://www.math.columbia.edu/~chaoli/AIPF.pdf).
3. **Supplier scope.** Replaced the abstract E5-only operation request by E3 coherent diagrams, E2 descent and E5:spectra-comparison exports. Their concrete spectral/sheaf extension remains explicitly requested. Removed S.4's Brown–Gersten/Quillen E₂ comparison as a purported supplier of the filtered HC/FS equivalence. Replaced analytic adic curve H3 by scheme EDC.2:pairings, with MC.2 smooth proper base change and the existing elliptic inputs.
4. **Lean restrictions.** Added D compatibility of semilinear pullback; canonical coefficient insertion/reduction evaluation laws and the Tor-resolution identity; closed-union and codimension-minimum laws for supports; positive weight and K-degree for additive finite Chern classes; explicit finite generation and an existential lattice rank; integer Tate twists; norm/corestriction compatibility for family regulators; and injectivity plus range in the local-condition image for Selmer factorization. The previous prescribed-rank lattice assertion fails even for `I = ℤ` and `r = 0`; omitting finite generation also permits `I = ℚ`.
5. **Specific Soulé family.** Added a constructor API for the actual norm of the supplied unit/Bott powers under their transition law. Its evaluation theorem now concerns that particular family, rather than every arbitrary element of the norm-family equalizer. The projection-formula proof stays with the suppliers; the construction does not assert arbitrary Euler-system existence.
6. **Review records.** Added all 67 node verdicts, all six source-issue verdicts, three precise review gaps, coverage refinements and the PS.4 dependency note. Updated source, signature and graph checks to stop claiming that matching declaration names establishes faithful signatures.

The public source register in the packet gives every URL and hash. Relevant corrected references also include [Levine's homotopy coniveau tower](https://arxiv.org/pdf/math/0510334), [FGV](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), [Friedlander–Suslin](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/23.pdf), [Soulé §4](https://www.numdam.org/item/AST_1987__147-148__225_0.pdf), [Burgos §§10.1–10.4](https://www.icmat.es/miembros/burgos/files/brbr.pdf) and [Kato §2.1](https://arxiv.org/pdf/math/0304233v1).

## Remaining revision requirements

Nine nodes have `unverifiable` verdicts, with precise reasons in the packet:

- **global-model-comparison:** its Lean prototype has levelwise isomorphisms, without transition/augmentation compatibility. The already recorded filtered comparison proof gap remains honest.
- **motivic-exact-couple:** existence of an additive differential map is satisfied by zero. Its arbitrary `j,k` boundary test has no exactness condition. State the actual differential and its square-zero/derived-couple relationship.
- **filtered-adams-operations / rational-motivic-degeneration:** arbitrary `ψ` and `dr` cannot satisfy unconditional weight or vanishing assertions. Supply the compatible filtered actions used by the proof.
- **motivic-spectral-sequence:** `Nonempty` of another additive pullback is again satisfied by zero and does not state page naturality. Several field examples quantify over unbound `HM`/`K`, losing the packet's specified field models.
- **motivic-chern-character:** `motivicChern_weight` quantifies over all `x` and an arbitrary comparison map; its Adams eigenspace restriction and compatibility are missing.
- **norm-compatible-regulator-families:** the degree-only arithmetic example does not test the unit/Bott construction; the transfer example still asserts a square for arbitrary maps. Bind tests to the actual supplied norm/corestriction normalization and provide a computation or non-example.
- **arithmetic-fundamental-line / regulator-determinant-comparison:** PS.4 imports PS.3, whose inputs include M.8 and the late regulator comparison. A whole-stage PS.4 import into M.8 is circular. Separate an independent realization/period/determinant prefix from downstream regulator assembly.

These objections concern algebraic hypotheses and mathematical content that can be expressed, or unresolved supplier scope. PROTOCOL §13's permission to omit unavailable geometric conditions is respected; a missing geometric carrier alone is not a rejection reason. Elaboration with `sorry` cannot establish the disputed statements.

## Source issues and assigned findings

Independently read the entire [published KF appendix](https://msp.org/gtm/2000/03/gtm-2000-03-003p.pdf), visually inspected all six issue passages, and compared them against [arXiv v1](https://arxiv.org/pdf/math/0012134v1) and the [author-hosted volume](https://ivanfesenko.org/wp-content/uploads/2021/10/m3-partI.pdf). The author copy was successfully downloaded in this review and its hash recorded.

| Issue | Verdict | Reason |
| --- | --- | --- |
| E1 | Confirmed | Tame residue has degree n−1; specialization from its kernel has degree n. BK (2.3) separates these. |
| E2 | Rejected | The arrow is unlabeled, not explicitly quotient projection; A2 already defines the Cartier/Artin–Schreier map. Labeling is useful clarification, but the projection counterexample does not demonstrate an asserted misprint. |
| E3 | Confirmed | Componentwise ordering cannot enumerate incomparable `(1,4)` and `(2,3)` as a strict chain. BK uses lexicographic order. |
| E501 | Confirmed | Leibniz plus annihilating the base does not imply additivity; the valuation example over ℚ(t) verifies the missing relation. |
| E502 | Confirmed | The second logarithmic symbol relation contains an unbound a₂ instead of a. |
| E504 | Confirmed | `[k₂:k₁]` omits one p-basis element; the full top-degree interval requires `[k₂:k₀]`. |

The examples were checked independently. Correcting the ordering or degree does not certify the complete supplementary proof. Targeted publisher/arXiv/author searches found no corrigendum; arXiv metadata lists only v1. The MSP contents endpoint failed to render, so no comprehensive publisher errata-list check is claimed. Replaced inherited `known: new` assertions with novelty unestablished.

All assigned findings have the correct mathematical routing in the packet and reader: RT-AREA-ktheory-1/2 has the motivic-complex bridge and separate Dedekind application; 1/3 has an independent Suslin real theorem before the table, with BO/KO requested from RT.4 Part II; 1/13 keeps BGK independent of M.5a–M.5c; 2/18 exports early finite Chern classes to HB.1/HB.2/D.2 without late R.7/D.2 prerequisites. The finite product correction preserves these early exports.

## Orchestrator actions and checks

Schedule revision of the remaining signatures/tests and the independent PS.4 prefix. Synchronize the reader's Chern product/proper-pushforward scope, supplier routes, source labels and six erratum verdicts with the reviewed packet. The reader is outside this issue's authorized deliverables and was therefore read but not edited. Keep the existing original-proof acquisition/refinement gaps distinct from these review defects; do not request lemma-level expansion as a condition of this target-level review.

`python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.5d.json` reports **0 errors, 0 warnings**. The final `lean-check research/blueprint/suggested/MotivicEtaleKTheory--M.5d.lean` exited **0**, with **185 warnings, all declaration uses `sorry`**, and no other warnings or errors, at the pinned Mathlib. Available memory was 104 GB; checks ran sequentially through the shared wrapper. No language server, repository copy, Lake build/update/cache operation or atlas promotion was performed. Every implementation status remains `unchecked`.
