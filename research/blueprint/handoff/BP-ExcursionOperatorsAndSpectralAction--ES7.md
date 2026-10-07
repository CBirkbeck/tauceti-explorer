# Handoff — BP-ExcursionOperatorsAndSpectralAction--ES7 (issue #728)

Agent: Codex, session `codex-yiSh7u`. Branch `codex-yiSh7u-es7`.

This completes the target-level planning pass continuing the inherited checkpoint.
The packet has status **complete**. All five scoped stages are **planned**, none is
closed, and every node retains `implementationStatus: unchecked`. The next step is
independent review, followed by the recorded proof and supplier refinements.

## Deliverables and counts

- Packet: `research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES7.json`.
  All 24 inherited node ids are retained; 25 additional targets give **49 nodes**:
  5 definitions, 6 constructions, 29 theorems, 6 lemmas and 3 comparisons.
- Reader: `research/blueprint/readmes/ExcursionOperatorsAndSpectralAction--ES7.md`.
  Approximately 15,900 words; every packet statement, API, test, prerequisite,
  source anchor, request and gap is included.
- Prototype: `research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES7.lean`.
  Algebraic centre-map and twisted-cocycle signatures, normalization and trace
  examples, and an explicit named ledger of omitted native geometric signatures.
- **49 API items, 33 unit tests, 21 planets, 23 baseline declarations, 15 gaps,
  40 supplier requests.** The packet also has five structural proposals and one
  known published-source error with source-version records.

| Stage | Status | Main remaining work |
| --- | --- | --- |
| `ES7:parabolic` | planned | Root/modulus proof; equal-characteristic z-embedding; bounded-modification and constant-term proof refinements; native centre signatures |
| `ES7:GLn-comparison` | planned | ET.6a's O_E tower comparison; infinite-Weil trace separation; equal-characteristic dual-operation transport |
| `ES7:equal-characteristic` | planned | Chain-moduli and formal-module proofs; D̄ uniformization and local finiteness; independent local constants; analytic Hochschild–Serre and Hecke-fibre transport |
| `ES7:function-field-automorphic` | planned | Order gluing and division compactness; EP and simple trace proof sources; corrected graded-weight chain; selected genericity and cohomology concentration |
| `ES7` | planned | Discharge the two characteristic realization inputs and induction prerequisites for the all-local-field assembly |

## Source and statement corrections

FS IX.7.3 uses **b=μ(π_E^{-1}), T_{μ^{-1}}, and Ind_P^Gσ(−d/2)[−d]**.
The normalized-induction dictionary separately fixes geometric reciprocity,
δ_P^{1/2} and its inverse twisting factor. The GL₂ tests distinguish normalized
and unnormalized induction. Twisted cocycles require action invariance and Levi
centrality, in addition to equivariance of the inclusion.

The equal-characteristic definition has **t_i:τE_i→E_{i+1}**, rank d²,
d-periodicity and rank-d cokernels. Res′ is an indexed coproduct with descent.
The fundamental local representation retains the triple-action stabilizer and
the source's finite-order central character. Uniformization uses the different
inner form **D̄**, with formal levels away from o and o-level covers on the generic
fibre. Hausberger's auxiliary supercuspidal transfer place is **outside S**.

Both pages of Kaiser's erratum have been read. Corollary 14.11's second factor
changes to **L((V^bullet)^∨,q^{-1}T^{-1})**: both the dual and exponent change.
The amended graded-chain lemma and proposition are separate nodes; they do not
assert concentration by themselves. Poincaré duality pairs contragredient
automorphic isotypes. Middle-degree concentration is used only for the selected
proven transfer-image globalizations; the unpublished ample-class argument is
not used to infer an arbitrary-isotype theorem. The published self-duality error
in LRS §14.16, p. 306 is recorded under `sourceIssues` with Kaiser as its known
correction.

## Confirmed red-team findings

- **RT-AREA-geomlanglands/2:** ET.6a owns the classical tower diamond/minuscule
  Hecke-fibre comparison downstream of HS2 and its own tower construction, and
  exports it to ES7. Its O_E-module form for E≠Q_p is an explicit request and gap.
  HS3 supplies the cohomology interface. No ET.6a→HS2 edge is proposed. EL/PEL
  Corollary 24.3.5 is outside this scope.
- **/7:** The exact ES1 spectral-to-geometric-centre node is a prerequisite of
  the stratum-map construction. The separate excursion node handles the regime
  without the centre-order condition. Changes needed in ES4 and ES6 are left to
  their owners; this job edits no other packet or atlas graph.
- **/9:** SR.1 is requested to supply the Λ-linear derived Bernstein centre,
  the inverse limit of pro-p Hecke corners and integral ℓ-adic separatedness.
  SR.0's category and SR.3's complex centre do not substitute for it. SR.2 owns
  the induction conventions. The ownership correction is also a structural
  proposal for other consumers.
- **/11:** ES6 owns the full z-embedding, including its cohomological conditions.
  BG1 owns the basic-class/H¹ bridge from Kottwitz's central-extension theorem;
  BG0 owns pure inner twisting and its requested Hecke equivariance. ES7 owns
  the Bun fibre, B-injectivity, central quotient and restriction-detection
  application. Kaletha's standing p-adic hypothesis leaves an explicit
  equal-characteristic extension gap.
- **/12:** Generic function-field adeles and quotients are imported from
  FA.2/FA.6 and AA.0/AA.1. The exact AA.0 Haar node is cited. AA.1's present node
  is number-field only, so its function-field extension is requested honestly.
  ES7 owns the D-specific compactness, spectrum, kernels, EP tests, selected
  transfer/globalization and cohomology. No AF.2–3 or AS.6 number-field theorem
  is used.

## Sources read and acquisition limits

Every source URL, SHA-256, access date and exact reading range is preserved in
the packet's `sources` and `sourceVersions`; no scratch file is needed to resume.

- **Fargues–Scholze:** IX.7, pp. 334–338, in full; relevant VI.11/VI.12 passages,
  pp. 235–239. IX.3/IX.5/IX.6 supplier locators were checked through their
  packets; those sections are not claimed read in full in this run.
- **Hausberger:** §§1.1–1.3; Definition 3.1/Theorem 3.4; Theorems 6.1/6.4,
  7.2/7.3 and 8.1/8.3 with their setups; §§9.1–9.3, 10.1–10.2,
  10.3.2–10.3.3; Appendix A.9–A.12. The full uniformization proof and all
  earlier analytic foundations are not claimed expanded.
- **LRS:** Published journal scan acquired and OCR used for navigation;
  definitions and principal statements/proof passages in §§4–6, §13,
  §§14.9–14.19 and §§15.10–15.17 read. Crucial displayed formulas and
  the quoted self-duality sentence were checked against page images. Printed
  page equals PDF page plus 215.
- **Kaiser:** Both pages visually read, including the dual/exponent replacement,
  amended Lemma 14.14′, Proposition 14.17′ and its application.
- **Kaletha:** Definition 5.1 and Fact 5.5, pp. 78–80, including standing field
  hypotheses. **Kottwitz:** Proposition 10.4/Lemma 10.5, p. 50.
- **Scholze–Weinstein:** Theorem 24.2.5, p. 227, and beginning of its proof.
  The O_E-module variant is a supplier obligation, not a result verified here.

Still to acquire or expand, as named in the gaps: GI16 Theorem 4.26;
Laumon/Kottwitz's primary EP proofs; the precise Deligne–Kazhdan simple trace
formula and Henniart appendix A.4; global-order gluing and anisotropic reduction;
Genestier/Boutot–Carayol/Drinfeld formal-module proofs; Henniart's local-constant
and numerical proofs, LRS §§15.18–15.20 and Badulescu's local character proof.
The packet gives each gap's consuming nodes and next action.

## Verification and Lean limits

- `scripts/check_blueprint.py` with the pinned declaration index:
  **0 errors, 0 warnings**; five planned stages and no closed stages.
- `research/blueprint/intake.py check-files` on the four deliverables:
  **0 problems**.
- Published-source issue schema and version records: **0 errors**.
- `git diff --check`: clean.
- **The suggested Lean file elaborated successfully with `lean-check`: exit 0,
  only the 16 expected `sorry` warnings.** Available memory exceeded 20 GB.
  It imports individual Mathlib modules only, at pinned Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti declarations were
  source-checked at pinned `f790474821cf4256814db967cb154e7af3d0c369`;
  they were not imported in this elaboration. The shared build's Tau Ceti HEAD
  differs from that pin, so no pinned Tau Ceti compilation claim is made.

The algebraic prototype does not implement the native geometric carriers. Its
omission ledger names every omitted API/test and named geometric statement.
There are no proposition-valued stand-ins or tautological theorem assumptions.
When suppliers expose the native carriers, expand those signatures and tests.
Compilation of the present algebraic signatures is no evidence that the
geometric comparison has been formalized.

Resume from the independent review and the 15 gaps/40 requests, rather than
claiming a new target inventory is needed. All declarations remain unchecked.
