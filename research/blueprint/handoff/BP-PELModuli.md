# Handoff: BP-PELModuli

Agent: Claude (Claude Code), session claude-Q3pbuh. Refs #963.

- The packet `research/blueprint/packets/PELModuli.json` is complete (`"part": null`). It has 91 nodes: 44 theorems,
  23 definitions, 18 constructions and 6 applications. It also has 34 planets, 281 API items, 153 unit tests and 67
  baseline declarations.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PELModuli.json`, with `TAUCETI_BASELINE` pointing at
  the declaration index for the pinned commits, reports 0 errors and 0 warnings. Every cited baseline declaration was
  found in that index.
- The branch is based on main at 468b1e72. The check resolves 23 prerequisites that are nodes of other blueprints,
  among them three in AdelicAlgebraicGroups AA.4.
- Every stage (PELModuli:M0–M6) is **planned**. None is closed, because each stage depends on at least one recorded
  gap or supplier request. Every node's `implementationStatus` is `unchecked`.
- The reader document is `research/blueprint/readmes/PELModuli.md`.
- The suggested Lean file is `research/blueprint/suggested/PELModuli.lean`. It **compiled**; the details are below.

## Binding decisions followed

- **RS-23.** One PEL engine serves everything. M5 accepts the Hilbert example and does not rebuild it. M6 is narrowed
  to the arithmetic moduli. There is no M5 → M6 edge.
- **RS-27.** M1 owns the stack property and effective descent. M2 owns the verification of Artin's criterion and
  rigidification. M6 owns coarse spaces, through R09.5.
- **RS-14.** M5 owns the unitary example: signatures, reflex field, good primes and the `ker¹` caveat.
- **RS-06.** M6 owns the universal family export, the Hodge line and the descent interface between rational families
  and coarse points.
- **RS-02.** Imports come from AbelianSchemesAndArithmeticModuli A1–A6 and from Tau Ceti ModularCurves. Neither
  abelian schemes nor elliptic moduli are re-planned here.

## RT-AREA-algebraicgeometry/3 (analytic spaces)

The finding is confirmed for M3, and this roadmap does not own the carrier. The uniformization morphism and the
algebraization of components need several things:
- complex analytic spaces with nilpotents, with their morphisms and fibre products;
- analytification of schemes and algebraic spaces of finite type over ℂ;
- GAGA.

How the packet handles it:
- **Requests.** It sends requests to ComplexComparisonPartII C0 (the carrier itself, option (i) of the finding), C3
  (GAGA for algebraic spaces) and C4 (Chow, and algebraicity of holomorphic maps).
- **Gap.** It records the gap "Analytic spaces and analytification carrier" against M3/uniformization-morphism and
  M3/algebraization-of-components.
- **Proposed link.** Restructure proposal 3 includes the link ComplexComparisonPartII C0 → PELModuli M3, noting that
  C0 realizes the finding. The link was checked for acyclicity against `data/atlas.json` and the accepted restructure
  links.
- **Lean file.** The analytic family appears only on points, as the quotient `V_ℝ / L_g`. No analytic structure is
  asserted.

## Sources

All sources below were read on 2026-10-06. Their URLs, SHA-256 hashes and the sections read are in `sources` and
`sourceVersions`.
- **Lan**, Harvard thesis (May 2008), the precursor of LMS Monographs 36. Read: Chapter 1 in full where used, and the
  statements of Chapter 2.
  - The author's site refuses scripted access, so a mirror of the same PDF was read.
  - The 2013 book itself was not available. The thesis numbering of Chapters 1–2 agrees with the book for every result
    cited.
- **Kottwitz**, JAMS 1992: §§4–8.
- **Milne**, *Introduction to Shimura varieties* (2017 revision): §§6, 8, 12 and 14. Milne's errata page and Jungin
  Lee's errata list were also searched.
- **Liu–Tian–Xiao–Zhang–Zhu**, arXiv v3: §§3.1 and 3.3–3.5. Where v3 and the Inventiones version differ, the reviewed
  extraction is quoted.
- **Bijakowski–Pilloni–Stroh**, Annals 2016: §1.1 and Remark 1.5.1.
- **Tsimerman**, Annals 2018: Lemma 4.1 and §6.1.
- **Lipnowski–Tsimerman**, arXiv v1.
- **The Stacks Project**, for the tags cited in the nodes.

Not obtained or not read, with the affected nodes:
- Wedhorn, Ann. ÉNS 1999, Theorem 1.6.3. Cited through BPS; recorded as a gap.
- Mumford, GIT, and Mumford, *Abelian Varieties*. Finite type including p | d is a gap. The rigidity statement is read
  through Lan Lemma 1.4.1.10.
- Silverberg 1992 (fields of definition). Requested from A6.
- Tate, Invent. Math. 1966, §2. Its finiteness statement is cited through the reviewed extraction used for
  Lipnowski–Tsimerman.
- Lan, *Example-based introduction to Shimura varieties*, §5.1.3. It would settle the type D comparison (gap 2), but
  the author's site refused access.

## Mistakes found in sources

- **PELModuli/E1 (new).** Milne ISV §8, pp. 87–88, claims SV3 for every PEL datum with h nontrivial. This fails for
  unitary data that are definite at every real place: h is central, `G^ad = PU` is compact, and X is a point.
  - The relevant nodes (M0/pel-shimura-datum and M5/unitary-pel-datum) carry the correction: SV3 holds iff the
    projection of h to every ℚ-simple factor is nontrivial.
  - Neither errata list mentions this.

## Gaps (5)

1. **Nonabelian Galois cohomology, `ker¹` and the Hasse principle.** AdelicAlgebraicGroups was merged to main while
   this job ran. It plans the following in AA.4:
   - G-torsors;
   - Kneser's local vanishing;
   - the Hasse principle for simply connected groups.

   M3/ker1-classification and M3/hasse-principle-cases now take these three nodes as prerequisites. The rest is still
   unowned, and the gap is narrowed to it:
   - `H¹(ℚ, G)` and `ker¹(ℚ, G)` for connected reductive G, with the finiteness of `ker¹`;
   - `ker¹(G) = ker¹(G/G^der)`;
   - Tate–Nakayama duality for tori.

   Restructure proposal 1 asks to extend AA.4 with this material, or else to add a layer to ArithmeticGaloisDuality.
2. **The type D comparison with the identity component.**
3. **Wedhorn's ordinariness theorem.** The source was not obtained.
4. **Finite type of the stack of polarized abelian schemes, including p | d.** Mumford's GIT construction was not read.
5. **The analytic-space carrier.** This is RT-AREA-algebraicgeometry/3; see above.

## Requests (37)

- AbelianSchemesAndArithmeticModuli: A1–A6.
- AlgebraicModuliForArithmeticGeometry: A0-extension (Artin's criterion), R09.2–R09.6.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory: R07.2, R07.6.
- NeronModelsAndSemistableAbelianVarieties: R11.1, R11.3.
- ShimuraVarieties: V0–V6.
- ComplexComparisonPartII: C0, C3, C4.
- ShimuraCompactifications: C5. This is the quasi-projective suffix only.
- HilbertModularVarietiesAndShimuraCurves: H0, H1.
- SchemeAndStackFoundations: SF.2.
- Tau Ceti ClassFieldTheory layer 13 (cyclic Hasse norm theorem).
- Tau Ceti ModularCurves: 0e, 2e, 3c, 5b, 7d, 9e.

Each request states the exact statement used and the nodes that use it.

## Restructure proposals (3)

1. Give the Galois cohomology of reductive groups (the material of gap 1) an owner. The first choice extends
   AdelicAlgebraicGroups AA.4; the alternative is a layer of ArithmeticGaloisDuality.
2. Sub-layers M0a ("PEL data, determinant condition and reflex field") and M0b ("Hermitian and CM linear algebra").
3. The stage links implied by the prerequisites, including AdelicAlgebraicGroups AA.4 → M3 and
   ComplexComparisonPartII C0 → M3. All were checked acyclic, and no M5 → M6 link is added.

## Suggested Lean file

The file imports individual Mathlib modules only. The shared build (Mathlib 082e2d3, the pinned commit) has no
compiled Tau Ceti modules for the cited carriers. Those carriers are named in docstrings where they are intended:
`TauCeti.AlgebraicGeometry.AbelianVariety`, `TauCeti.Hodge.IsPolarization`, `TauCeti.SymplecticForm.Compatible`, and
others.

What the pinned libraries lack is represented by explicit data:
- abelian schemes over `Spec R` with their duals, Lie algebras and torsion, as `AbelianScheme`,
  `AbelianSchemeSupplier` and `TorsionSupplier`;
- `sorry`-valued data for the representing chart, the coarse space, `ker¹`, the double cosets and the deformation ring.

Conditions the carriers cannot express are left out and named in the docstrings. Examples are positivity of
polarizations and the group law. No condition is replaced by an arbitrary proposition. Level structures are modelled
at finite level n, through `ZMod n ⊗ L` and `A[n]`, rather than on `Ẑ^□`.

**Compiled.** `lean-check research/blueprint/suggested/PELModuli.lean` ran `lake env lean` in the shared build at
Mathlib 082e2d3 and exited with code 0. It produced 275 warnings, all of them `declaration uses 'sorry'`, and no
other warnings or errors.

**Agreement with the packet.** All of the following were checked by elaborating `#check @TauCeti.PEL.<name>` for
every name:
- every API name (281) appears as a declaration;
- every node declaration (91) appears. Definitions and constructions use their first API name; theorems use the
  camel-case form of the node slug, for example `siegelModuli`;
- every unit test (153) appears as an `example` preceded by `-- TauCeti.PEL.tests.<name>`.

The tests state properties of the packet's own objects wherever a carrier exists. A few degenerate and non-example
tests are stated over Mathlib objects, for example GSp₂ = GL₂, `Γ(n)` and Weierstrass twists, because the carrier is
missing.

## What remains

Lemma-level refinements, from the packet's `coverage.remaining`:
- **M0.** Split Albert's classification (Lan 1.2.1.13–14) into lemma nodes. Split the self-dual lattice
  classification into Lan 1.2.3.7/1.2.3.10 and Kottwitz Lemma 7.2 (Case C at p = 2).
- **M1.** Promote Lan Corollaries 1.3.5.4 and 1.3.6.7 to lemma nodes.
- **M2.** Refine M2/representability against the exact hypotheses of A0-extension. Lan Appendix B.3 was read only at
  the level of statements.
- **M4.** Check the sign convention of M4/cm-points-reciprocity against ShimuraVarieties V4 once V4 is reviewed.
- **M6.** Polarized-stack finite type waits on gap 4 and on very ampleness of `L^{⊗3}` from A2. The bounded field of
  definition waits on Silverberg from A6.

Closing any stage requires the gaps above to be filled and the suppliers to deliver.

In the Lean file:
- Replace the carriers by the A1–A4 declarations, and the finite-level model of level structures by `Ẑ^□`-adic
  structures, once those exist.
- `isogenyKernelRanks` records only the rank bookkeeping of LTXZZ Lemma 3.4.12(3); the packet node states the full
  lemma.

## Where to resume

The next step is the independent review of the packet, the document and the Lean file. After that, the lemma-level
splits listed above.
