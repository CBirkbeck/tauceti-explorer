# REV-FaltingsFinitenessAndIsogenyTheorems — review of the blueprint of Faltings' finiteness, semisimplicity and isogeny theorems

**Verdict: `needs_changes`.**

- **The packet and the suggested Lean file are corrected in place.** Every node was checked on the page images, every
  baseline citation was read at the pins, and `check_blueprint` reports no errors.
- **The only outstanding change is the roadmap document.** `research/blueprint/readmes/FaltingsFinitenessAndIsogenyTheorems.md`
  is outside this review's files, so it still describes the uncorrected packet. It must be regenerated from the corrected packet
  before promotion.

- **Reviewer:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #406).
- **Author of the blueprint:** Claude Code, session `cc-7b31c4` (BP-FaltingsFinitenessAndIsogenyTheorems, #2838). This
  reviewer took no part in it.
- **Baseline:** Mathlib `082e2d3`, Tau Ceti `f790474`.

## What was read

- **Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, Invent. Math. 73 (1983), 349–366.**
  - Read in full on the page images of the public Göttinger Digitalisierungszentrum scan
    (https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf; SHA-256 `f72a869f…c2f87a`).
  - The blueprint had not re-read the paper, calling it paywalled; its locators and excerpts were inherited from the
    decomposition. They are now checked against the pages, and the excerpts are literal German as printed.
- **Faltings, Erratum, Invent. Math. 75 (1984), 381.** Read on the free Springer PDF, whose SHA-256 matches the one
  recorded.
- **Raynaud, *Schémas en groupes de type (p, …, p)* (1974)** and **SGA 7 I, Exposé IX**, on their public copies at the cited
  passages.
- **J. S. Milne, *Abelian Varieties* (course notes, 2008; public).** It is added as a source for the arguments Faltings only
  cites: Zarhin's idempotent argument and trick (I §§10, 13; IV §2) and the Tate-module isogeny criteria.
- **Libraries.** Every `mathlib:` and `tauceti:` citation was opened at the pinned commit. The reviewed audit records all six
  layers as not built.

## Counts

| | Before | After |
|---|---|---|
| Nodes | 32 | 56 (32 corrected, 24 added) |
| Baseline declarations | 27 | 55 (22 confirmed, 5 removed, 33 added) |
| API items / unit tests | 25 / 17 | 29 / 17 |
| Planets | 18 | 19 |
| Gaps | 13 | 14 (13 replaced or restated, each with its consumers) |
| Requests | 4 | 35 (one per supplier need, with consumers) |
| Source issues | 0 | 22 (all confirmed) |

`python3 scripts/check_blueprint.py --index <pinned index>`: 0 errors, 0 warnings.

## Main corrections

- **Ownership (PROTOCOL §15).** The packet defined objects that other roadmaps own:
  - semiabelian schemes (ShimuraCompactifications C4);
  - the Hodge line, the arithmetic degree and the height (ArakelovGeometryAndAbelianHeights R35.1–R35.3).

  Those two nodes are now a lemma (Faltings' Bemerkungen a)–d)) and a comparison (Faltings' normalisation against R35.1–R35.3).
  Requests carry what the packet needs from the owners. The node ids are kept, so later stages still resolve.
- **Statements refuted by the erratum.** Two R28.2 nodes stated "as printed" the height formula and the local count for A
  itself, which the erratum and Gabber's counterexample refute. They are now stated under the explicit hypothesis that
  V_l(G) ∩ V_l(H_i) is the Tate module of an l-divisible group. R28.3 establishes that hypothesis after the erratum's shift,
  in a new node, and the corrected Satz 2 runs the computation only after the shift. This avoids a stage cycle.
- **Splits and hidden steps: 24 nodes added.** Among them:
  - the logarithmic-singularity definition;
  - the descent and level-structure step, and the √d-isogeny transfer to principal polarizations;
  - the Hodge–Tate determinant;
  - the class-field-theory character lemma;
  - Frobenius weights on the induced Tate module;
  - the differential count along the shifted tower;
  - powers A^k, and the invariance of Satz 3/4 under extension and isogeny;
  - −1 as a sum of four squares in ℚ_l, and Zarhin's idempotent lemmas;
  - Korollar 2 separated from Korollar 1;
  - the Raynaud determinant node split into four;
  - finiteness without a polarization;
  - five elliptic-curve nodes realising R28.6's targets, which no node had realised.
- **Baseline.** Five citations were removed:
  - `NumberField.hermiteTheorem.finite_of_discr_bdd_of_isReal` is a near miss: it covers only fields with a real place. It
    is replaced by `NumberField.finite_of_discr_bdd`.
  - `Module.Dual`, `Module.Finite`, `NumberField.exists_auxiliaryPrime` and `NumberField.Chebotarev.frobeniusPrimeSet` are
    not what their nodes use.

  33 citations were added and read at the pins, among them `IsIsogeny`, `cyclotomicCharacter`,
  `IsCyclotomicExtension.Rat.galEquivZMod`, Tau Ceti's double-centralizer theorem and elliptic-curve Hom group, and
  Mathlib's `hensels_lemma`.
- **Tau Ceti layer prerequisites.** Tau Ceti roadmap layers (Class Field Theory 13, Chebotarev 10, GlobalNumberFields 10,
  EllipticCurves 1, 2 and 4, JacobianChallenge D and E) are recorded under `upstreamPrerequisites`, with a request each, as
  the MordellLawrenceVenkatesh packet does.
- **Cross-roadmap nodes.** Satz 5's argument is exactly MordellLawrenceVenkatesh LV.1's Frobenius test set, whose node is
  used (PROTOCOL §3).
- **Placement.** Satz 7 (Mordell) and Bemerkung 1 (Siegel) no longer realise a stage of this roadmap:
  HeightsRationalPointsAndObstructions RP.4 owns both. They stay as source records, with a gap.

## Source issues (E1–E22, all confirmed)

- **E8 (error, a stated result).** Satz 2 as printed, "h(A_n) = h(A)", is false (Gabber; Faltings' erratum). The corrected
  statement is that the sequence becomes stationary. The proof of Satz 3/4 on p. 361 uses only the corrected form.
- **E9 (error, the proof).** G ∩ H_i need not be l-divisible over K_i, and the closures of its levels need not form an
  l-divisible group: the erratum's two subtleties, located in the proof.
- **E1 (misprint).** The sign factor of the metric: (i/2)^g is negative for g ≡ 2, 3 mod 4. The corrected factor is
  2^{−g} i^{g²}.
- **Gaps in proofs, all filled in the nodes:**
  - Lemma 2 omits the surjectivity its Korollar needs (E4);
  - Tate's Theorem 2 gives only finite image on inertia at the step on p. 360 (E12);
  - the definition of L(A, s) at the bad places (E18);
  - the choice of places in Satz 5 (E19);
  - the independence of K'/K from B in Korollar 3 and Satz 6 (E20);
  - de Franchis finiteness in Satz 7 (E22).
- **The rest are misprints.** Examples: ω_{C/ℤ} for ω_{C/𝔍} (E3); "Théorème 4.11" for Raynaud's 4.1.1 (E13); ⊗_ℤ for
  ⊗_{ℤ_l} in Korollar 2 (E17); Zarhin's paper mis-cited (E21).

## The suggested Lean file

- **As submitted, it was dishonest.** It compiled, but every theorem concluded `True`, and it had 11 `True`-valued structure
  fields and 5 `True`-valued definitions. The 17 unit tests were unnamed `example : True`, and 9 API names were missing.
- **It is rewritten against the corrected packet.**
  - Every node has a stated declaration, and every API item and unit test occurs under its packet name.
  - Objects other roadmaps own are in an "Imported interfaces" section, each docstring naming the owner.
  - There are no `True` or `Prop` placeholders.
- **It elaborates at the two pins, with the imported Tau Ceti modules built at `f790474`.** The only warnings are
  `declaration uses sorry`.
- **Elaborating it exposed two packet errors, both corrected.** `quatMatrix` is the matrix of right multiplication, not left.
  The unit test for the logarithmic metric fails with c₁ = c₂ = 1 near |t| = 1/2, so it now asserts suitable constants.

## Questions for the orchestrator

1. **The roadmap document** must be regenerated from the corrected packet, with the 24 new nodes, the ownership changes and
   the new API and test names, before the packet is promoted. This is the only reason for `needs_changes`.
2. **Lemma 2, its Korollar and the logarithmic-singularity theorem** overlap ArakelovGeometryAndAbelianHeights R35.5. They
   stay here as the record of Faltings' route, since R35.5 has no packet and plans another route. Either R35.5 cites these
   nodes for the Siegel case, or it narrows.
3. **MordellLawrenceVenkatesh and this roadmap now depend on each other at node level.** LV.1's Frobenius test set cites
   this packet's Hermite–Minkowski node, and Satz 5 cites LV.1. The graph is acyclic. If the test-set lemma should be owned
   here (Faltings is its original source), move it and re-point both packets.
4. **The checker** treats every `tauceti:` prerequisite as a baseline declaration. So Tau Ceti roadmap layers cannot be
   ordinary prerequisites, although PROTOCOL §15 says a Tau Ceti roadmap is cited through its layers. This packet uses
   `upstreamPrerequisites`, as MordellLawrenceVenkatesh does.
5. **Zarhin's trick** (A^4 × Â^4 is principally polarized) is needed for finiteness without a polarization, which R28.5's
   text asks for. No node plans it; it is recorded as a gap under R28.1, whose stage text assigns it there.
