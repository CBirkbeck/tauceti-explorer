# RT-AREA-automorphic-1: fixes, round 2

Fixer: Claude, session `claude-B2lUdi`, 6 October 2026 (issue #6214, job FIX-RT-AREA-automorphic-1~2).
- Findings: `RT-AREA-automorphic-1.result.json`, by `cc-39fac3`. Verdicts: `RT-AREA-automorphic-1.review.json`, by `codex-hjdg0j`. The issue lists the 31 confirmed findings of high or medium severity, /1–/31.
- Round 1: `RT-AREA-automorphic-1.fixes.md`, by `cc-f805bf`. It could not edit finished blueprints, so it described their changes.
- This round was done at origin/main `468b1e72`.
- Disclosure: this session wrote none of the red team, its verification, round 1, the blueprint `QSeriesPartitionsAndMockModularForms` or its review.

## What this round does

One finished blueprint is open to this job: `QSeriesPartitionsAndMockModularForms` (packet, reader document, suggested file). Of the 31 findings, only /20 concerns it. Round 1 described the change in one sentence (its section /20, item 6):

> QSeriesPartitionsAndMockModularForms packet: the general parts of `QM.1/jacobi-group-law`, `QM.1/jacobi-form`, `QM.1/jacobi-cusp-form`, `QM.1/jacobi-fourier-expansion` and `QM.1/theta-decomposition` become MP.6:jacobi nodes; QM.1 keeps their rank-one classical specializations, which import them, and its eta, weak and weakly holomorphic, index-raising and heat-operator nodes. Add a request to `MetaplecticAutomorphicForms:MP.6:jacobi`.

That change is now applied. The other 30 findings concern roadmaps whose blueprints this job may not write; the table below says which job carries each.

Nothing under `content/campaign/` or `data/` was edited. Round 1's edits to roadmap prose, stage edges, integrated decompositions, paper routes, restructuring proposals and audits are for the maintainer and remain as round 1 wrote them. None of the twelve stages round 1 proposes is an atlas stage at `468b1e72`.

## Where each finding went

"Carried by" names the blueprint jobs the issue assigns. The fix each one applies is the section of the same number in `RT-AREA-automorphic-1.fixes.md`.

| # | Finding | Carried by |
|---|---|---|
| /1 | high, missing: GL(3) inputs of Langlands–Tunnell | BP-GL2AutomorphicRepresentationsAndTransfer--R17.3 |
| /2 | high, missing: real representation theory and the archimedean correspondence | BP-AutomorphicFormsOnReductiveGroups; BP-AutomorphicLFunctionsAndLocalFactors; BP-GL2AutomorphicRepresentationsAndTransfer--R16.1 |
| /3 | high, missing: Lazard's theorem for CC.5 | BP-CompletedCohomologyPartII--CC.0 |
| /4 | high, missing: real invariant harmonic analysis, normalizing factors | BP-AutomorphicSpectralTheory |
| /5 | high, missing: convergent intertwiners, pseudo-Eisenstein series | BP-AutomorphicSpectralTheory |
| /6 | high, missing: Kostant's theorem, van Est–Nomizu | BP-ArithmeticLocallySymmetricSpaces |
| /7 | high, missing: Kneser–Tits for strong approximation | BP-AdelicAlgebraicGroups (finished, see below) |
| /8 | medium, missing: Fourier–Whittaker expansion, mirabolic Eisenstein series | BP-AutomorphicLFunctionsAndLocalFactors |
| /9 | medium, error: GL₂ multiplicity one | BP-GL2AutomorphicRepresentationsAndTransfer--R16.1 |
| /10 | medium, error: AL.2 needs AF.3 | BP-AutomorphicLFunctionsAndLocalFactors |
| /11 | medium, error: R17 chain | BP-GL2AutomorphicRepresentationsAndTransfer--R17.3 |
| /12 | medium, error: global Jacquet–Langlands to R18.3 | BP-GL2AutomorphicRepresentationsAndTransfer--R17.3; BP-HilbertModularVarietiesAndShimuraCurves--R18.2 |
| /13 | medium, error: AL.5's consumers | BP-AutomorphicLFunctionsAndLocalFactors; BP-AutomorphicPadicLFunctions |
| /14 | medium, error: owner of the Schwartz–Bruhat space | BP-GL2AutomorphicRepresentationsAndTransfer--R16.1 |
| /15 | medium, error: Scholze's Theorem IV.2.1 | BP-CompletedCohomologyPartII--CC.8; BP-TorsionCohomologyInfrastructure |
| /16 | medium, error: CC.8 as the generic adapter | BP-CompletedCohomologyAndLocalGlobalCompatibility; BP-CompletedCohomologyPartII--CC.8 |
| /17 | medium, missing: admissible Banach representations | BP-CompletedCohomologyPartII--CC.0; BP-PadicLocalLanglandsForGL2Qp |
| /18 | medium, error: the completed Hecke algebra | BP-CompletedCohomologyAndLocalGlobalCompatibility; BP-CompletedCohomologyPartII--CC.8; BP-IntegralHeckeAndGaloisDeterminants |
| /19 | medium, missing: Siegel–Weil instances for GZ.5 | BP-GrossZagierAndArithmeticHeights--GZ.0; BP-MetaplecticAutomorphicForms--MP.0 |
| /20 | medium, duplicate: the Jacobi group and Jacobi forms | **this job**, for QM.1; BP-MetaplecticAutomorphicForms--MP.8, for the owner; BP-AutomorphicCongruences--L0, for L2s |
| /21 | medium, error: MP.3's imports | BP-MetaplecticAutomorphicForms--MP.0 |
| /22 | medium, error: MP.2 and the Hilbert symbol | BP-MetaplecticAutomorphicForms--MP.0 |
| /23 | medium, error: MP.5's analytic imports | BP-MetaplecticAutomorphicForms--MP.0 |
| /24 | medium, duplicate: invariant orbital integrals | BP-AutomorphicSpectralTheory; BP-EndoscopicTransferAndUnitaryTraceComparison--ET.0 |
| /25 | medium, missing: Wigner's lemma, Vogan–Zuckerman | BP-AutomorphicFormsOnReductiveGroups |
| /26 | medium, error: AF.2 and the spherical Hecke algebra | BP-AutomorphicFormsOnReductiveGroups |
| /27 | medium, error: ALS.4's imports | BP-ArithmeticLocallySymmetricSpaces |
| /28 | medium, error: neatness | BP-AdelicAlgebraicGroups (finished, see below) |
| /29 | medium, error: owner of the relative Lie algebra cochain complex | BP-AutomorphicFormsOnReductiveGroups |
| /30 | medium, error: AF.4's cohomological targets | BP-AutomorphicFormsOnReductiveGroups |
| /31 | medium, duplicate: algebraic modular forms | BP-AutomorphicFormsOnReductiveGroups |

**One carrying job has finished since the issue was written.** BP-AdelicAlgebraicGroups was merged on 6 October 2026 (`d3ec497f`, pull request #6654). Its packet, `research/blueprint/packets/AdelicAlgebraicGroups.json`, records both findings: a request to `ReductiveGroupsPartII:RG2.4` for the Kneser–Tits theorem (/7), and the nodes `AA.4/neat-element` and `AA.4/neat-level-exists` (/28). Its independent review, REV-AdelicAlgebraicGroups, was merged the same day (`db57125f`, pull request #6662) with the verdict `needs_changes`; its notes say that it reviewed the three red-team findings assigned to that blueprint. This job did not check those nodes.

**Supplier-side work that no listed job carries.** Round 1's fixes for /3, /7 and /17 each add mathematics to a proposed roadmap that is not in the list above. The consumer will request it; the supplier's own blueprint still has to plan it.
- /3: a node for Auslander regularity and grade in `NoncommutativeAndEquivariantIwasawa` NE.0. That roadmap's packet exists and is partial.
- /7: the Kneser–Tits theorem in `ReductiveGroupsPartII` RG2.4.
- /17: admissible Banach representations in `PadicMeasuresIwasawaAlgebras` L1.

## /20: the Jacobi group and Jacobi forms get one owner, and QM.1 imports it

### The verified fix

The verifier's reason is binding: "Own the reusable Jacobi group/Schrödinger–Weil representation, coefficient/index/multiplier data and Fourier–Jacobi/theta decomposition once, with symplectic and unitary instances; retain MP.8's specific GSp4 cover and QM.1's q-series applications." It rejects the finding's claim about `AutomorphicCongruences:L2`: no L2 edge is added.

### State before this round

- The packet had 536 nodes. Its review, REV-QSeriesPartitionsAndMockModularForms (5 October 2026), is `needs_changes`.
- The packet already named the finding in four places: `ownershipContinuation` ("Pending exact supplier comparison and independent review"), one `restructure` entry, the last item of QM.1's `remaining` list, and the summary. The nodes themselves were unchanged: QM.1 still constructed the slash actions, the Jacobi group law, `J_{k,m}`, `J⁰_{k,m}`, the theta functions and the theta decomposition from Mathlib and MP.7 alone.
- `QM.1/jacobi-form` listed MP.8 among its uses, as a consumer of the classical forms. The atlas has the edge the other way (QM.1 requires MP.7 and MP.8), so that use described a cycle.
- No node of `MetaplecticAutomorphicForms` plans the Jacobi group or Jacobi forms. Its MP.0 packet has nodes for MP.0 only, and its MP.8 packet has nine nodes on Fourier-index shifts.

### What changed in the packet

1. **One request to the owner.** A new `requests` entry, with supplier `MetaplecticAutomorphicForms:MP.6`, asks for the Jacobi theory in the form QM.1 uses. It names the general frame of the finding (the Jacobi group `H(W) ⋊ Sp(W)` with its cover and unitary analogue, the Schrödinger–Weil representation, Jacobi forms with multiplier systems, the theta decomposition), and then states exactly the instance needed, for `Sp(W) = SL₂` and a positive definite half-integral matrix index `F`:
   - (a) the group `J_n(Γ) = Γ ⋉ (ℤⁿ × ℤⁿ)` and its law;
   - (b) its action `|_{k,F}`, for integral and half-integral weight;
   - (c) the spaces `J_{k,F}(Γ, V)` and their cusp forms, with the dictionary between a character of `Mp₂(ℤ)` and a multiplier in QM.1's sense;
   - (d) a treatment of half-integral scalar index under which `ϑ(z; τ)` is a Jacobi form of weight 1/2 and index 1/2;
   - (e) the theta decomposition at the level of the Heisenberg group, and the isomorphism with vector-valued forms for the Weil representation.

   QM.1 uses `n = 1`, `F = m`. The request ends with what QM.1 keeps and does not ask for.
2. **Seven nodes import.** `QM.1/jacobi-modular-slash`, `QM.1/jacobi-elliptic-slash`, `QM.1/jacobi-group-law`, `QM.1/jacobi-form`, `QM.1/jacobi-cusp-form`, `QM.1/jacobi-theta-index` and `QM.1/theta-decomposition` each gain:
   - a first sentence saying which object of the supplier the node is the scalar-index case of, and that nothing general is constructed;
   - a first proof step, the import;
   - the prerequisite `MetaplecticAutomorphicForms:MP.6`.

   Their formulas, hypotheses, API items and unit tests are unchanged. The explicit formulas stay because every later node of QM.1 and QM.4 uses them.
3. **One annotated node.** `QM.1/jacobi-fourier-expansion` gains a sentence and no prerequisite (see "Differences from round 1").
4. **One new node, the dictionary.** `QM.1/jacobi-rank-one-specialisation` (kind `comparison`) states once how the supplier's objects become the classical ones at `n = 1`, `F = m`:
   - (a) the group, and (b) the action;
   - (c) `J_{k,m}(v, 1) = J_{k,m}(Mp₂(ℤ), ℂ(ψ))` under the bijection `ψ(A, ±w_A) = (±1)^{2k}v(A)`, with proof that QM.1's growth condition at rational torsion points is the supplier's support condition `4l − r²/m ≥ 0`;
   - (c′) for `m ∈ ½ + ℤ`, the bijection `φ(τ, z) ↦ φ(τ, 2z)` from `J_{k,m}(v, χ)` onto the forms of index `4m` with an extra half-lattice law, with `ϑ(2z; τ) ∈ J_{1/2,2}(v_η³, 1)`;
   - (d) the Fourier coefficients;
   - (e) the theta functions, the theta decomposition and the Weil representation.

   Its prerequisites are the classical nodes and the stages MP.6 and MP.7. A comparison has no API or unit tests.
5. **A wrong use removed.** On `QM.1/jacobi-form`, the use by MP.8 is replaced by the use in the new comparison node.
6. **Titles and planets.** `QM.1/jacobi-form` is titled "Classical Jacobi forms of weight k and index m", with planet "Classical Jacobi forms J_{k,m}". `QM.1/theta-decomposition` is titled "Theta decomposition in scalar index m", with planet "Classical theta decomposition". The atlas should not show the owner's two key notions a second time under QM.1. The layer still has six planets.
7. **A public source.** `skoruppa-critical-weight`: N.-P. Skoruppa, *Jacobi forms of critical weight and Weil representations*, arXiv:0707.0718v1. It states the lattice-index Jacobi group, action, Jacobi forms with values in a module, theta expansion and Theorem 5 that the request and the comparison node use. A `sourceVersions` record gives the file read and its SHA-256.
8. **Three source issues**, all misprints in that paper that affect nothing: E210 (`w_A(τ) = √(aτ + b)` for `√(cτ + d)`), E211 (cusp forms defined by "condition (i)" for (ii)) and E212 (`(g, z) ↦ χ(z)g` for `χ(g)z`). All three were checked on the rendered pages. Only the arXiv text was read; the published version was not obtained.
9. **Records brought up to date.**
   - QM.1's coverage note says what was rescoped. The `remaining` item for the finding now says what is left: retarget the eight stage prerequisites to the supplier's node ids once they exist, and check the dictionary against the supplier's conventions.
   - The `restructure` entry for QM and MP states the applied change and withdraws this packet's earlier proposal to make QM.1 the owner. It proposes the stage edge `MetaplecticAutomorphicForms:MP.6 → QSeriesPartitionsAndMockModularForms:QM.1`.
   - `ownershipContinuation` gains a `migration` record.
   - The summary gives the new counts: 537 nodes, four comparisons, 54 sources, 25 requests.

The packet's `review` object is untouched.

### Reader document

`research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md` follows the packet:
- the status paragraph, the layer table (QM.1 has 104 nodes, with the two renamed planets) and the counts, which now agree with the checker's;
- "What this roadmap owns, and what it imports", and the source list;
- QM.1's introduction, sources, boundaries, dependencies and acceptance tests;
- an **Import** paragraph at the head of "Jacobi forms", which recalls the supplier's objects, and a sentence on each importing declaration;
- the full statement, proof outline, acceptance tests, prerequisites and sources of the new comparison node, at the end of "Theta decomposition", followed by the three mistakes found in the source;
- the new request under "Requests to other roadmaps", the rewritten structural proposal, and the new `remaining` item in both lists of remaining QM.1 work.

### Suggested file

`research/blueprint/suggested/QSeriesPartitionsAndMockModularForms.lean`:
- The note at the head of the QM.1 section says that the Jacobi theory is owned by MetaplecticAutomorphicForms, which seven declarations are its scalar-index case, and that the formalisation will define them as specialisations once the supplier's declarations exist.
- The doc comments of those seven declarations say the same. No signature changes.
- The comparison node is not stated, and a comment says why: neither Mathlib nor Tau Ceti has the Jacobi group at the pinned commits. This follows the file's treatment of `QM.1/theta-decomposition-weil-representation`.
- **One inherited error is fixed.** The file did not elaborate as received: `mellin_asymptotic_transfer` (QM.5) used `IntegrableOn` where `MeasureTheory` is not open. The line came in with the review's corrections (`bc1464c2`), which were not compiled; the version before it (`aac2a86c`) does not have it. It now reads `MeasureTheory.IntegrableOn`. The statement is the same.

### Differences from round 1's wording

- **The supplier is `MetaplecticAutomorphicForms:MP.6`, not `MP.6:jacobi`.** Round 1's sub-stage is not an atlas stage, and `scripts/check_blueprint.py` rejects a request whose supplier is neither a stage nor a node. The finding itself offers MP.6 ("for example as nodes of MP.6"). The request and the `remaining` item say that it is to be retargeted when the sub-stage exists.
- **`QM.1/jacobi-fourier-expansion` is annotated, not made an import.** It is a lemma about every holomorphic function with period 1 in both variables. QM.1's weak and weakly holomorphic forms and QM.4's meromorphic Jacobi forms need it, and they are not Jacobi forms in the supplier's sense. The node says so, and part (d) of the comparison node ties its coefficients to the supplier's.
- **Three more nodes import** than round 1 names: the two slash operators and `QM.1/jacobi-theta-index`. They are the action and the theta functions of the supplier, so leaving them as independent constructions would have kept the duplication.
- **No general part was moved.** This job may not write nodes of MetaplecticAutomorphicForms. The request states what those nodes must supply.
- **Eichler–Zagier is still unread.** Round 1 left the theta decomposition to be "pinned to a public source". Skoruppa's paper is that source for the lattice-index theory. It does not treat the Jacobi group `H(W) ⋊ Sp(W)` of a general symplectic space, the unitary analogue or the Schrödinger–Weil representation: those are for the owner's blueprint.

### What is left for others

- **The owner.** BP-MetaplecticAutomorphicForms--MP.8 carries /20. The request recorded here is its specification from QM.1's side. The MP.0 packet's gap for MP.7 still says "Existing QSeriesPartitionsAndMockModularForms:QM.1 owns the classical theta/eta/rank-one Jacobi development and consumes the metaplectic input"; round 1 gives its replacement (section /20, item 6). This job may not edit that packet.
- **The maintainer.** The sub-stage of MP.6, the stage edges and the README edits of round 1's section /20, items 1–5. The edge `MP.6 → QM.1` is acyclic: at `468b1e72` QM.1 requires MP.7 and MP.8, MP.6 is already an ancestor of QM.1, and no stage of this roadmap is an ancestor of MP.6.
- **AutomorphicCongruences L2s.** BP-AutomorphicCongruences--L0 carries /20 for it.
- **The revision of this blueprint.** BP-QSeriesPartitionsAndMockModularForms~2 (issue #6517) edits the same three files and should start from this state.
- **Conventions to check when the supplier's nodes exist**: the cocycle of the Heisenberg group and its central character in index `m`, row or column vectors, the treatment of half-integral scalar index, and the form of the cusp condition for forms with multiplier. The comparison node is where a difference would show.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json`, with the pinned declaration index: 0 errors, 0 warnings. 537 nodes (113 definitions, 17 constructions, 250 lemmas, 153 theorems, 4 comparisons), 772 API items, 514 unit tests, 42 planets, 418 baseline declarations, 22 gaps, 25 requests. Before this round: 536 nodes, 3 comparisons, 24 requests, the other counts the same.
- `lean-check` on the suggested file, in the shared build at Mathlib `082e2d37e8`: exit 0, 1467 `declaration uses sorry` warnings and no other message. Before the one-token fix above it reported one error, at `mellin_asymptotic_transfer`.
- The identities the comparison node relies on were checked numerically in double precision, at `τ = 0.21 + 1.13i`, `z = 0.17 − 0.06i`:
  - `U_m[X′]∘U_m[X] = e(m(λμ′ − λ′μ))U_m[X + X′]` and `(U_m[X]φ)|_{k,m}A = U_m[XA](φ|_{k,m}A)`, for real `m` and `X`;
  - the classical group law for integral index, and its failure by the factor `−1` at `m = 1/2`;
  - `ϑ|_{1/2}[l, μ] = (−1)^{l+μ}ϑ` and `U_{1/2}[l, μ]ϑ = (−1)^{l+μ+lμ}ϑ`;
  - the lattice invariance and the half-lattice law of `ϑ(2z; τ)` in index 2, and the equality of its multiplier with that of `ϑ` in index 1/2;
  - Zwegers' `ϑ` is `i` times Skoruppa's;
  - the elliptic invariance and the S-law of `ϑ_{m,μ}` for `m = 1, 2, 3`.
- Every quoted excerpt of Skoruppa's paper was read in the PDF (SHA-256 `a4cc378e16a7dfb361e3914bbaa5e02b10567ced8802267c09fcfa4b368407a0`, from <https://arxiv.org/pdf/0707.0718>, 6 October 2026): pages 4–6 and 10–13. Pages 4, 5, 11 and 13 were also read as rendered images.

Not checked: the 536 inherited nodes, beyond the ones edited; the other roadmaps' packets; the proofs of Skoruppa's Theorem 5 beyond its two-page argument.
