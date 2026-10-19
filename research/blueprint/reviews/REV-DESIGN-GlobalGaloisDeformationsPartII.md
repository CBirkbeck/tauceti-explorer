# Independent review: Global Galois deformation rings, Part II (G-valued lifting)

**Accepted as a complete target-level planning pass, after corrections in place.**
Issue #3540; job `REV-DESIGN-GlobalGaloisDeformationsPartII`; reviewer Claude,
session `claude-mRT4Pe`; 2026-10-19. This session did none of the design work
(design: Codex, session `codex-csQTUB`, PR #10610). The claim was
[confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/3540#issuecomment-6261567434).
Acceptance concerns the correctness, coverage and supplier structure of the
plan. It does not certify implementation or closure. Every implementation status
remains `unchecked`, and six explicit gaps remain open.

## Inventory and verdict

| Item | Reviewed result |
| --- | ---: |
| Nodes after review | 81 (82 before) |
| Verified / corrected / added | 54 / 27 / 0 |
| Removed duplicate nodes | 1 |
| Definitions / constructions | 13 / 2 |
| Theorems / lemmas / comparisons / applications | 50 / 6 / 7 / 3 |
| API items / unit tests | 45 / 45 |
| Planets (per stage ≤ 6) | 50 |
| Pinned baseline declarations confirmed | 6 of 6 |
| Source findings confirmed / rejected | 46 / 0 (one description corrected, one strengthened) |
| Explicit gaps | 6 (G6 added) |
| Supplier requests | 40 (41 before; five superseded by exact nodes, four added) |
| Stages planned / closed | 11 / 0 |

`packet.review.checked` gives a verdict and a note for every node. The packet
keeps status `complete`. All eleven stages remain `planned`, and their
`remaining` lists were updated.

## Sources read

- FKP22, arXiv:2008.12593v5, and FKP19, arXiv:1904.02374v5. Their SHA-256
  hashes match the packet. Printed pages equal PDF pages in both. I read every
  node locator, including §§2–9 of FKP22, Appendices A–B, and FKP19
  §§3, 5, 6 and Appendices A–B.
- ANT20 v2, Theorem 1.1 (all eight hypotheses). Pan, arXiv:1901.07166v2,
  Theorem 1.0.2 and its p=3 condition (added as source `Pan22`).
- LP11 Theorem 0.2, p.1106.
- The Lazard scan at Numdam. Its hash matches; printed page = PDF page + 3.
  III (3.1.3) is on p.92 and (3.1.7.4) on p.94; V (2.2.2.3) is on p.165,
  (2.2.3.1) on p.166 and (2.4.10) on pp.178–179. All agree with the packet.
- Not reopened: BC14 and Ribet10, whose hosts did not serve the files to this
  session, and BLGGT14/BLGHT11. The nodes using them keep the designer's
  locators. The primary Guralnick text was again unavailable (gap G2).

## Main mathematical findings

1. **E45/G1 holds, and it is stronger than recorded.** I checked the
   designer's counterexample to FKP22 Lemma 3.7: trivial SL₂ image over Q,
   M*=F_p(κ̄)³. The difference of two η-classes at w is unramified at w,
   hence lies in a finite group. The flaw is in the second paragraph of the
   lemma's proof. A nonzero quotient of the product of the fields' Galois
   groups can kill the diagonal image of τ_w.

   The same failure occurs **under C1–C4**. Take k=F_p and M* semisimple with a
   repeated simple constituent. Then for every k-basis, the conjugates of
   inertia at w generate a proper submodule of ∏_b M*_{e_b*}, because a cyclic
   module contains each constituent at most dim times. So L_w has a
   nontrivial subextension that is unramified at w, and hence unramified
   outside T. There are only finitely many such extensions, so two new primes
   share one. The F₄-valued examples of FKP19 Proposition 7.8 are such cases:
   FKP19 Remark 7.9 says their adjoint multiplicities exceed one, and they
   satisfy all the hypotheses of FKP22 Theorem 5.2. The same diagonal-generator
   step reappears on FKP22 p.18, where the t₀ argument separates the
   h-fields from the η-fields.

   G1 is therefore a gap in the proof of Theorem 5.2 within its own
   hypotheses, not just an over-broad lemma. The theorem is not refuted, and
   FKP19 Theorem 6.11 proves the irreducible case by its own route (FKP19
   Definition 5.8). This is recorded in G1, E45, the dual-strong-disjointness
   checks and the irreducible-specialisation hypotheses.
2. **E37 verified with an explicit example.** Three one-dimensional blocks with
   χ₁₂=ψ and χ₂₃=κ̄ψ satisfy Lemma A.9(1)–(3) with the pairwise bounds. Yet
   χ₂₃=κ̄χ₁₂, so C3 fails. The joint-field correction is necessary.
3. **E40 is confirmed by the source itself.** Example 6.8 on p.31 writes
   u⁺=Sym²(ρ̄_f)⊗δ⁻¹, which contradicts Lemma A.11(ii). The other corrections
   in Appendix A and §§6–9 were verified, including those of E20–E23, E28,
   E30–E33 and E42. E32's 'printed' text was wrong: the source infers
   constituentwise irreducibility from GSp-irreducibility on Γ_{F(ζ_p)}, not
   from primitivity. I rewrote it.
4. **Request 32 was false.** It said the Pan case χ̄|Γ_Qp=1 forces p≥5 because
   χ̄ is odd. Counterexample: at p=3, χ̄ the character of Q(√−2) is odd, trivial
   on Γ_Q₃ and different from κ̄⁻¹. Pan's Theorem 1.0.2 does cover this case:
   its only p=3 exclusion is a residual ratio equal to ω at 3. The node now
   cites the accepted node `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`
   and carries this example as a check.

## Supplier and ownership corrections

- **Tau Ceti roadmaps are not extended from the atlas.** Requests 10–13 asked
  TauCetiRoadmap ReductiveGroups layers 7–8 to export large-prime inputs that
  those layers do not state: the equivariant exponential (FKP22 A.1),
  good-characteristic centralizer theorems, the G-semisimplification and
  finite-field root position. These inputs are now gap **G6**, with exact
  statements and consumers. The requests now cite the upstream layers only for
  what they state. The routed catalogue items 98, 105, 108, 115, 116 and 118
  are marked G6.
- Request 14 asked the upstream ReductiveGroupsPartII to add Lazard's analytic
  theory, and the first `restructure` proposal proposed the same. Both are
  rewritten. RG2.0.3 is cited as it stands. The Lazard inputs are requested
  from atlas owners in their direction: p-valued open subgroups from
  `LocallyAnalyticDistributionsPartII:ND.0`; the finite free resolution, the
  Ext description and the comparison (2.4.10) from
  `NoncommutativeAndEquivariantIwasawa:NE.0`; semisimple Lie-algebra
  vanishing and Whitehead from `AutomorphicFormsOnReductiveGroups:AF.1a`.
- **Removed `GG2.10/residual-potential-automorphy-input`.** It duplicated the
  accepted node
  `ModularityAndLanglandsExtensions:ML.2/potential-automorphy-with-steinberg-place`,
  which plans FKP22 Proposition 9.1's potential automorphy. The two-place
  version and the ι-ordinarity that ANT20 (6)(a) needs are now requested from
  that node.
- The ANT20 application now cites its existing owner,
  `PotentialAutomorphyInfrastructurePartII:PL.7/residually-reducible-automorphy-lifting`,
  instead of asking ML.2 to export ANT20. That node's added strong-primitivity
  hypothesis is recorded as a hypothesis, and a request to the owner asks
  whether it can be relaxed.
- The compatible-system target now cites the accepted node
  `ML.2/compatible-system-from-potential-automorphy`, which already owns the
  BLGGT14 Theorem 5.5.1 argument. This replaces the request to
  PotentialModularityAndCompatibleSystems R24.5, which is dropped from the
  roadmap's prerequisites. G5 now names that node's density conclusion as the
  input still missing.
- Several citations now point at exact nodes instead of stages, with requests
  30–34 removed:
  - Skinner–Wiles: `R21.5/theorem-a-over-q` and `R21.5/theorem-a`.
  - Khare–Wintenberger: `R27.6/full-classical-serre-theorem`.
  - Deligne–Serre: `R15.5/deligne-serre-eigenvalue-lifting-lemma`.
  - Lafforgue: `GS.6/the-global-correspondence-for-gl-r`.
- The Chebotarev and Frattini requests are reworded to "use as stated
  upstream". The product-failure estimate is this roadmap's own
  `GG2.3/density-selection`.
- The roadmap definition gains the prerequisites AutomorphicFormsOnReductiveGroups,
  LocallyAnalyticDistributionsPartII, NoncommutativeAndEquivariantIwasawa,
  PotentialAutomorphyInfrastructurePartII and Tau Ceti ClassFieldTheory. The
  latter was cited but not listed. The `requires` lists of GG2.4 and GG2.10
  were recomputed from the node prerequisites; all other stages already
  matched. The summary now says six gaps.

## Locator corrections

The FKP19 v5 locators (printed = PDF) were checked one by one against the
statements in the text and corrected:

- Assumption 2.1: p.14 (was pp.9–10).
- Notation 5.1: pp.25–26.
- Lemma 3.5: pp.17–18 (was pp.13–16).
- Lemma 6.1: pp.44–45.
- Proposition 6.8: pp.47–49.
- Claim 6.14: pp.53–55.
- Theorem 6.21: pp.56–57 (was pp.58–59).
- Lemma B.1: p.64 (was "Proposition B.1, pp.64–65").
- Corollary B.2: p.64 (was pp.65–66).

FKP22 v5 has no §3.2 and no Remark 5.7. The affected locators now point to the
paragraph before Proposition 3.8 on p.16, the proof of Proposition 3.8 on
pp.16–18, and footnotes 6–7 on pp.23–24.

## Other corrections

- `GG2.2/sha-killing` now cites the pinned
  `TauCeti.ContCohomology.explicitInfRes_exact`. It was listed in
  `baseline.declarations` but no node cited it. A Siegel-example acceptance
  check used the letter r for both a weight and a representation; fixed.
- Suggested file:
  - Replaced a tautological test (span equal to ⊤ implies cyclicSpan equal to
    ⊤) and two examples that duplicated API theorems.
  - Added discriminating tests: the image of a ↦ (a,0) is not ⊤; the
    prime-field span of 1 in GaloisField p 2 is not ⊤; invariant minimality.
  - Added FKP22 Lemma 2.1 as the milestone `conj_eq_on_sup_of_isAbelianGalois`,
    using Mathlib `IntermediateField`, `Normal` and `IsAbelianGalois`.
- The reader document was brought fully in line with the packet. Every node
  section, layer acceptance, contract and gap was regenerated from the
  corrected packet with the document's own template, and checked to reproduce
  the original text exactly where nothing changed. The ownership table, build
  table, ownership proposals, bibliography and catalogue rows were updated. An
  independent-review line was added to each E-section.

## Baseline

All six declarations were read in the pinned trees, Tau Ceti `f790474` and
Mathlib `082e2d3`: `TauCeti.ContCohomology.H1` (abbrev; monoid, topological and
continuous-action hypotheses as used), `TauCeti.ContCohomology.explicitInfRes_exact`,
`Submodule.map`, `Submodule.span`, `Representation` and `Subgroup.map` (with its
generated `AddSubgroup.map`). None was removed.

## Checks run

- `python3 scripts/check_blueprint.py` (with the pinned declaration index):
  0 errors, 0 warnings.
- `research/blueprint/intake.py check-files` on the four deliverables: 0
  problems.
- `scripts/check_sorry_data.py`: passed.
- `lean-check` on the revised suggested file at the pinned shared build: it
  elaborates with 19 admitted-proof warnings, no errors and no other warnings.

## Questions for the orchestrator

1. **G6** needs an owner for the large-prime reductive-group facts: either an
   atlas continuation of TauCetiRoadmap ReductiveGroups, or lemma nodes in this
   roadmap. Several other packets also cite ReductiveGroups layer 7 for similar
   facts.
2. `ModularityAndLanglandsExtensions:ML.2/compatible-system-from-potential-automorphy`
   is accepted, but its all-ℓ density claim inherits two problems. FKP22's
   single-v₀ argument fails at the residue characteristic of v₀, and the
   classification/formal-character input is missing (G5). Its sibling node
   omits the ι-ordinarity that ANT20 needs. Both are noted in `upstreamNotes`
   and in requests here, and that roadmap may need a follow-up fix.
3. FKP22 Lemma 3.7 fails within the hypotheses of Theorem 5.2 (finding 1). An
   errata job for FKP22 should carry the strengthened E45. The maintainer may
   also wish to plan FKP19's own proof route (Definition 5.8) for the
   irreducible case, which avoids G1.
