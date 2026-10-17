# EDC.4: revision five (maintainer-directed)

Job [#10133](https://github.com/CBirkbeck/tauceti-explorer/issues/10133), `BP-EtaleDualityAndPerverseSheaves--EDC.4~5`. Worker: Claude — claude-w26htb, 2026-10-17.

This is a finished revision pass, submitted for independent review. The packet has status `complete`, and its only stage, EDC.4, has coverage `planned`. The `review` object of REV-EtaleDualityAndPerverseSheaves--EDC.4~4 is left in place for the next reviewer to replace. Its reviewer and date are unchanged, so the intake does not promote this revision on the strength of that review.

## Why this round exists

The stall detector created this issue at 10:07Z, citing REV~3's non-acceptance. REV~4 was running at the time, and at 10:19Z it accepted the round-four plan after corrections (PR #10137). So there was no open finding from REV~3 left to resolve. This round therefore did three things:

1. It checked each REV~4 correction.
2. It applied the maintainer's generality rule: each target is stated in the generality its consumers use, and the special cases become corollaries.
3. It consumed the open TauCetiRoadmap pull requests that no earlier round had read: LefschetzPencilsAndVanishingCycles #873, DeligneWeightsAndPurity #929 and AdicCoefficientsAndComparisons #965.

## REV~4 corrections checked

All 25 dispositions of REV~4 were re-read against the node text, and each correction is present and kept:

- the enhanced normalized systems;
- the ctf restriction of the §F.5 biduality import;
- the ComplexComparisonPartII imports;
- the diamond right-adjoint checks;
- the Cartier, connectedness and geometric-base hypotheses;
- the two-fibre nef-divisor counterexample;
- the primitive-subspace tests.

The mathematical checks I repeated:

- **Complete intersections:** the degree-unit splitting and the integral induction.
- **Projective bundles:** the plus-sign Chern relation, checked against Milne 23.2, pp. 139–140, and P(O ⊕ L).
- **Blow-ups:** the exceptional columns of the blow-up decomposition.
- **Quadric threefold test:** the 𝔽₂ test, Res = Van = ⟨(1,1)⟩.
- **Nef-divisor counterexample:** P¹ × 𝔾_m has H¹_c = Λ.

One correction is superseded. REV~4's residue-field dévissage for compact vanishing remains valid, but it is no longer needed: compact vanishing now follows from the perverse argument (see below).

## What this round changed

1. **Weak Lefschetz for complexes.** `EDC.4/weak-lefschetz` now has a general form:
   - **Setting:** X separated of finite type over a separably closed field, Y any closed subscheme with affine complement U, and K bounded constructible with j^*K ∈ pD^{≥n+1}(U).
   - **Coefficients:** finite rings with invertible annihilator, O_E, or E.
   - **Conclusions:**
     - (a) restriction on compactly supported cohomology, or on ordinary cohomology for proper X;
     - (b) the supported (Gysin) form;
     - (c) torsion-freeness of the cokernel under p⁺;
     - (d) Galois and Frobenius equivariance;
     - (e) the classical smooth projective case.
   - **Source:** Weil II 6.2.11 (pp. 249–250) is the primary source for the support-bound form.
   - **Imported, not planned again:** EtaleCohomologyFoundations §F.7 (smooth ample sections, constant coefficients) and LefschetzPencilsAndVanishingCycles §7b.9 (ℚ_ℓ, hyperplane sections).

   The Gysin, integral and ample-divisor nodes are re-derived as corollaries. The ample-divisor node now takes any proper X and any K. For hypersurface sections it uses the upstream Veronese embedding (LPV §3.4).
2. **Compact-support vanishing on affine schemes.** `EDC.4/compact-support-vanishing-smooth-affine` keeps its id.
   - **Main statement:** K ∈ pD^{≥a}(U) on an affine U gives H^i_c(U, K) = 0 for i < a.
   - **Integral refinement:** under p⁺ the group H^a_c is torsion-free.
   - **Smooth lisse case:** part (d).
   - **Proof:** EtaleCohomologyFoundations §F.8 for the hearts, with the perverse truncation sequence. The p⁺ step comes from duality and perverse Artin vanishing (EDC.5/integral-dual-perversity, EDC.5/perverse-artin-vanishing).
3. **New node `EDC.4/generic-affine-weak-lefschetz`** (the packet still has 25 nodes, since one is retired).
   - **Source:** Katz, *Affine cohomological transforms*, JAMS 6 (1993), Theorem 3.4, Corollaries 3.4.1–3.4.3 and Lemma 3.5, pp. 180–182.
   - **Proof:** push forward to P^N (EDC.5/quasi-finite-perverse-exactness), use generic base change for the hyperplane family (EtaleCohomologyFoundations §F.3; LPV §7b.7), then apply weak Lefschetz on P^N.
   - **Consumer:** it supplies FiniteFieldsAndCharacterSums:FF.2's open request (Katz's Betti-sum induction).
   - **Bertini:** the smoothness of generic sections is requested from SF.0.
4. **Affine vanishing (e).** Universal homeomorphisms and perfections are now covered (Zhu, Appendix A, pp. 45–50). This is the case the IgusaVarietiesAndTorsionConcentration IG.4 consumer needs, since the partial minimal compactification there is a perfect scheme.
5. **Complete intersections in families (e).** Over any base with ℓ invertible, R^q f_* is constant outside the middle degree. It is generated by η^{q/2} below the middle and by the relative-trace dual generator above it (η^i/2 for quadrics). Over a field this gives the Galois and Frobenius statement (d).
6. **Projective bundles.**
   - **Coefficients:** any finite coefficient ring, which is the domain of EtaleCohomologyFoundations §0.9.
   - **(f) Flag bundles:** complete flag bundles, with a monomial basis and the splitting principle (Grothendieck, *La théorie des classes de Chern*, §1 and §2, Lemme 1).
   - **(g) Section classes:** the zero and infinity sections of P(O ⊕ L) have classes ξ + c₁(L) and ξ.
   - **Pullback:** split injectivity of pullback along flag bundles is added (case (iii)).
   - **Consumer:** this supplies the CohomologyComparisons CP.6 request.
7. **Vanishing and restricted subspaces.** These are now defined for any smooth effective Cartier divisor of a smooth proper X; ampleness is not used. DeligneWeightsAndPurity §9.3(a) is the rational agreement check.
8. **Retired `EDC.4/pencil-axis-blowup`.** LPV §§3.3 and 4.5 state the axis blow-up and its cohomology. The replacement id is `EDC.4/blowup-formula`, whose acceptance records the axis case and supplies the Frobenius equivariance.
9. **Gaps (2 → 0).**
   - The strong diamond-transport gap and its L3 request are already held by the accepted EDC.6 packet. They are removed here (`gapsHeldElsewhere`), with the bare L3 prerequisites, because the two retained diamond nodes assert only right-adjoint recovery.
   - The relative-perversity gap for GlobalShtukas GS.1 is closed (`resolvedSupplierRequests`). Lafforgue's "normalisation relative to X^I" (arXiv v6, Théorème 0.9, p. 11, and §0.12 item 7, p. 39) is the absolute perversity shifted by dim X^I for ULA complexes over a smooth base. So GS.1/GS.2 need EDC.5, ULA (EtaleCohomologyFoundations §F.2.3, ClassicalAdicEtaleCohomology §5.6) and the shift, not a relative t-structure.
10. **Requests (7 → 7).**
    - Removed: the L3 request (held by EDC.6).
    - Narrowed: the SF.0 affine-complement request. The Veronese part is withdrawn because LPV §3.4 states it.
    - Added: an SF.0 request for Bertini smoothness of generic affine hyperplane sections (Katz, Lemma 3.5).
    - Unchanged: SF.0 (exceptional divisor; complete-intersection chains and parameter scheme), SF.3, SF.5 and SF.2.
11. **New upstream imports:** LPV #873 (head 4c7deab), DWP #929 (5f713c4) and AdicCoefficientsAndComparisons #965 (4a7b4d8). The heads of #938, #908, #875 and #848 are unchanged since round four, and SchemeAndStackFoundations on main still has README commit d208139 (main is now at 350e970).
12. **Planets:** unchanged (six on EDC.4, two on EDC.6). The new node has no planet, because the layer is at its limit of six.

## Findings and consumer requests

| Item | Disposition |
| --- | --- |
| Maintainer round 5 (stall detector citing REV~3) | Superseded by REV~4's acceptance; corrections checked; generality rule and new pull requests applied |
| REV~4 gap: strong diamond transport | Held by the accepted EDC.6 packet; removed here |
| REV~4 gap: relative perversity for GS.1 | Closed by Lafforgue's normalisation convention |
| FF.2 (affine weak Lefschetz) | New node `EDC.4/generic-affine-weak-lefschetz` |
| LPV.7 (dual-support compact vanishing) | `EDC.4/compact-support-vanishing-smooth-affine` (b); upstream LPV §7b.9 states the ℚ_ℓ case |
| DWP.0/DWP.7, EDC.7 (Frobenius-equivariant weak Lefschetz, Gysin, blow-ups) | `weak-lefschetz` (d), `weak-lefschetz-gysin`, `blowup-formula` |
| CP.6 (flag bundles, P(O ⊕ L) sections) | `projective-bundle-decomposition` (f)–(g), `pullback-injective-blowup-bundle` (iii) |
| IG.4 (affine vanishing on a perfect scheme) | `affine-vanishing-hypercohomology` (e) |
| LPV.0, WC.5 (quadrics, complete intersections, Frobenius) | `complete-intersection-cohomology` (a)–(e) |
| RT-AREA-etale/3, /16, /17, RT-AREA-geomlanglands/18 | Unchanged from round four (restructure entries); the GS1 entry now cites the Lafforgue resolution |

## For the maintainer

- **Repoint consumers:**
  - WeightsInEtaleCohomology.json, R34.4/finite-field-pencil-descent: `EDC.4/pencil-axis-blowup` → LPV §4.5 plus `EDC.4/blowup-formula`. Until this is done that packet reports one more unresolved prerequisite when checked.
  - FiniteFieldsAndCharacterSums--FF.2, FF.2/smooth-affine-betti-bound: bare stage `EDC.4` → `EDC.4/generic-affine-weak-lefschetz`.
  - The round-four repoint list (GS0, IG.4, ES7, and the text references in SF.0, ET.0 and ET.5) is still in `retiredDraftNodes`.
- **Stage edge EDC.5 → EDC.4 (restructure entry).** It is acyclic in the roadmap's own stage graph, and no EDC.5 node reaches an EDC.4 node. In the atlas-wide packet graph, EDC.4 and EDC.5 were already in one strongly connected component through SchemeAndStackFoundations:SF.0 before this round. A scripted check found the same cycles at base 469f01060, and the new edge stays inside that component.
- **Earlier proposals still open:** the round-four proposal that the roadmap's package cite EtaleCohomologyFoundations for EDC.0–EDC.3, and the L3 → EDC.6 and GS1 edge proposals, are unchanged.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json`, with and without the pinned declaration index: 0 errors, 0 warnings. The packet has 25 nodes (18 theorems, 3 lemmas, 2 comparisons, 1 definition, 1 construction), 12 API items, 12 named unit tests, 8 planets, 3 baseline declarations, 7 requests and 0 gaps.
- Cycle check (script over all packets): there is no node-level cycle through this packet's closure, and no EDC.5 node depends on an EDC.4 node.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.4.lean`: exit 0, and the only warnings are "declaration uses `sorry`". The file has 137 lines and imports Mathlib only. It adds:
  - the exactness step of weak Lefschetz (`restriction_injective_of_exact`, `restriction_bijective_of_exact`), with an example showing that the vanishing hypothesis is needed;
  - the real-bodied `hypersurfacePrimitiveRank`, whose six examples (conic 0, cubic curve 2, quadric 1, cubic surface 6, quartic 21, quintic threefold 204) are proved by `norm_num`.

  Every `TauCetiRoadmap.*` name in the packet occurs in the file.
- The reader is generated from the packet by a script that escapes `\ * _ $`, backticks, `[`, `<` and `>`, but not `]`. The round-four reader had escaped `]` as well, which `src/markdown.js` reads as display mathematics. A Python port of the renderer's inline parser confirms that every packet string renders as itself, and that the only markup is the generator's own labels, links and code spans.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: see the pull request.

## Sources read for this round (2026-10-17)

| Source | Sections | SHA-256 |
| --- | --- | --- |
| Katz, Affine cohomological transforms, JAMS 6 (1993), AMS PDF | §§3.0–3.5, pp. 179–182 | 7ebc08f0… |
| Katz, Sums of Betti numbers, author manuscript | Part I Theorem 2, pp. 2–4; Theorem 8, p. 8 | b1d9f269… |
| Grothendieck, La théorie des classes de Chern, Bull. SMF 86 (1958), Numdam | §1, pp. 137–139; §2, pp. 140–142 | 41eebe0b… |
| Lafforgue, Chtoucas …, arXiv 1209.5352v6 | Théorème 0.9, p. 11; §0.12 item 7, p. 39 | 7d44fe48… |
| Deligne, Weil II, Numdam | 6.2.10–6.2.11, pp. 249–250 | b06eea61… (matches earlier receipt) |
| Zhu, arXiv 1407.8519v3 | A.1.2–A.2.1, pp. 45–50 | 2c23e397… (matches) |
| Milne, LEC v2.21 | 23.2–23.3, pp. 139–140 | ac4f122f… (matches) |
| LefschetzPencilsAndVanishingCycles README, PR #873 at 4c7deab | scope, suppliers, §§2.3, 3.3, 3.4, 4.1–4.5, 7b.7, 7b.9 | 8cf57651… |
| DeligneWeightsAndPurity README, PR #929 at 5f713c4 | supplier contracts, §9.3 | 7602678e… |
| AdicCoefficientsAndComparisons README, PR #965 at 4a7b4d8 | scope, Layer L3, layer headings | 65131c5a… |
| EtaleCohomologyFoundations README, PR #938 at c4ee54f | §§F.2.2, F.3, F.7, F.8 (reread) | d5ade6aa… (matches) |
| SchemeAndStackFoundations README, main 350e970 (file at d208139) | searched for blow-up, ampleness, Veronese, Bertini | 121062fb… (matches) |

No book from the maintainer's library was used. All statements are in my own words, and no source passage is reproduced.

## What remains

EDC.4 is planned, not closed. Its remaining items are the geometric requests to SchemeAndStackFoundations:

- SF.0: the exceptional divisor of a smooth blow-up;
- SF.0: affine complements of ample sections (Stacks 0EKE);
- SF.0: complete-intersection chains and their parameter scheme;
- SF.0: generic affine Bertini smoothness;
- SF.3: the ample-line bridge.

The next step is the independent review REV-EtaleDualityAndPerverseSheaves--EDC.4~5 (#10135).
