# Handoff: DESIGN-SmoothRepresentationsOfLocalGroupsPartII (issue #3388)

Worker: Claude (Opus 5.5), session claude-3rhd8z, 2026-10-18. Mechanical cross-checks (source locators, supplier-node statements) by Sonnet subagents; every verdict and edit is the worker's.

## What this job delivered

- `research/blueprint/roadmaps/SmoothRepresentationsOfLocalGroupsPartII.json`: the roadmap "Smooth representations of local groups, Part II: unitary representations, the Fell topology and the unitary spherical dual" (area `representations`, parent `SmoothRepresentationsOfLocalGroups`), eight stages SRU.0–SRU.7. Each stage's `requires` is derived from its nodes' prerequisites.
- `research/blueprint/packets/SmoothRepresentationsOfLocalGroupsPartII.json`: status `complete`, 87 nodes (13 definitions, 8 constructions, 66 theorems), 152 API items, 82 unit tests, 38 planets (at most 6 per layer), 32 baseline declarations read at the pins, 5 requests, 5 gaps, 3 new source findings. Every stage is `planned`, with a `remaining` list of lemma-level refinements. `python3 scripts/check_blueprint.py` with the pinned index gives 0 errors and 0 warnings; `intake.py check-files` reports no problems. Nodes per layer: SRU.0 8, SRU.1 10, SRU.2 7, SRU.3 10, SRU.4 8, SRU.5 27 (Theorem 6.14 is planned type by type, A, B, C, D, G₂, F₄, E₆, E₇, E₈), SRU.6 4, SRU.7 13.
- `research/blueprint/readmes/SmoothRepresentationsOfLocalGroupsPartII.md`: the reader document, about 43,000 words. It has hand-written front matter (scope and ownership, boundaries, conventions) and one block per node generated from the packet: statement, hypotheses, proof route, uses, API, Checks, acceptance, needs, sources. Then come gaps, requests, upstream imports, source findings and references. It was checked with a Python port of the site renderer's `inline()` and with `markdown_it`: no stray mathematics, and emphasis only on labels, short names and titles.
- `research/blueprint/suggested/SmoothRepresentationsOfLocalGroupsPartII.lean`: 452 lines in the compact shape of recent accepted plans (light definitions with real bodies over carriers at the pins, endpoint theorems, a few `example`s); 44 declarations, 7 examples. **It compiled**: `lean-check` (Mathlib 082e2d3, Tau Ceti f790474) reports `sorry` as the only warning. A `run_cmd` audit over the 73 constants of the namespace found no `sorry` in any statement or data value. Packet API names agree with the Lean names for the 32 definitions and lemmas the file states, and 11 theorem nodes name their Lean statements. The reader's *Lean* lines name them; the other API items are reader targets, as WORKERS.md's compact shape prescribes.

## Direction chosen, and the split

The queue gave about twenty Part II continuations of SR, from nine independent directions with over a thousand items. Following the job's instruction ("plan the first here and record a restructure proposal for the rest"), this packet plans the first listed route, Ciubotaru–Harris "unitary spherical representations" (SmoothRepresentationsPartIIUnitarySpherical, 29 items). It also plans the route that brief imports and that nobody owns: Gan–Savin's "unitary dual, Fell topology and isolated representations" (SmoothRepresentationsPartIIUnitaryDual, 14 items), joined by the one Gan–Ichino item routed there. `routeCoverage` in the packet maps all 44 route items to nodes. The `restructure` entry (action `split`) asks for design jobs of their own for SmoothRepresentationsPartII (types and supercuspidals, about 930 items, itself a candidate for a general-group / classical-group split), SmoothRepresentationsPartIIParahoricCenters, UnitaryLevelRaisingTypesAndHeckeOperators, SmoothRepresentationsCharactersPartII, ModPBernsteinCentersAndLocalBaseChange, SmoothRepresentationsPartIIGeneralLinearNewforms (check overlap with AL.2 and QuiverRepresentationsPartII first) and SmoothRepresentationsPartIINewtonCocenters.

## Generality decisions

- Definitions in SRU.0–SRU.1 are for topological groups; the theorems of SRU.1 (Raikov, single-coefficient approximation, Gan–Savin 11.6/11.7) are for second-countable locally compact groups, because the Gan–Ichino route requires Mp₂ₙ(F_S) (with real places) and products with compact groups. For locally profinite groups, Gan–Savin's K-bi-invariant shortcut is recorded in the proof route.
- Gan–Savin Proposition 11.6 is stated in Fell-closure form (PAPER-GAN-SAVIN-23-B/E17), and Corollary 11.7 also in the relative form Gan–Ichino use.
- Ciubotaru–Harris Corollaries 6.32 and 7.5 and Theorem 8.5 are stated for real or central-compact Satake parameters (PAPER-CIUBOTARU-HARRIS-26/E11, E18); the G₂ witness is a node (SRU.5 g2-noncentral-witness), and SRU.7 noncentral-compact-reduction records the Barbasch–Moy reduction to Z_{G^∨}(s_c). The F₄ B₃ point uses the E5 correction.
- Statements from Gan–Savin and Heiermann–Opdam keep characteristic zero; the Ciubotaru–Harris statements hold over any nonarchimedean local field.

## Gaps (in the packet)

1. Nilpotent orbits of g^∨ (Jacobson–Morozov, triple centralisers, graded orbits, Bala–Carter tables): owner pending, DESIGN-LieHighestWeightPartII (issue #3373). Needed by SRU.7 nodes.
2. The equivariant K-theory proof of the Kazhdan–Lusztig classification: no owner (DESIGN-SpringerResolutionAndCharacteristicCycles covers the Steinberg variety's geometry only).
3. Classification of geometric unitary spherical parameters with noncentral compact part: no source proves it. The consumer GlobalShtukasPartIIRamanujanArthur must keep the real or central-compact hypothesis.
4. Miličić's bounded-trace C*-algebra input to milicic-limits.
5. The polynomial-identity input to Bernstein's admissibility theorem (unitary-irreducibles-admissible).

## Requests (stage citations)

SR.3 (two upstream targets that the atlas packets do not yet carry as nodes: harish-chandra-tempered-support and iwahori-components), TauCetiRoadmap ReductiveGroups layer 7, and LieHighestWeight layers 0, 2 and 4. All other cross-roadmap prerequisites are node ids: 106 citations of SR, RG2, ET.4, ES5 and ES7 nodes.

## Upstream imports and notes (outside the atlas snapshot)

`upstreamImports`: NoncompactQuantumSymmetry (TauCetiRoadmap PR #1015, open) supplies the strong-continuity and topological-irreducibility conventions, the bounded unitary Schur lemma and compact-group isotypic projectors, and it owns the comparison of C*-kernel weak containment with the coefficient weak containment defined here. BanachSpaceTheory B5 (main) supplies (L¹)* ≃ L^∞. AutomorphicSpectralTheory §7.0b (PR #925) owns the GL_n unitary dual, and the type-A spherical case is its spherical part. OperatorAlgebraDynamics (main) is a boundary only. `upstreamNotes` records, for SR, that SR.3.3 says "unitary" without defining unitary structures (defined here in SRU.2) and that SR's generic-irreducibility proof route uses [Ber92] Propositions 38 and 41, which are targets here. For NoncompactQuantumSymmetry it records the ownership split.

## New source findings (packet `sourceIssues`)

- E1 (Gan–Savin p. 32): the K-type projector f_τ lacks the factor dim τ; affects nothing.
- E2 (Ciubotaru–Harris p. 17): with their sign convention (6.1), L(ν) is the spherical subrepresentation of X(ν) for dominant ν, not the quotient; affects nothing.
- E3 (Ciubotaru–Harris Corollary 6.32(2)): the proof covers only real or central-compact parameters (gap in the proof; no counterexample claimed).

The paper-level findings used (GS E17; CH E2, E5, E8, E11, E14, E18) are listed in `sourceIssueReferences`.

## Sources

Read (URLs and SHA-256 in the packet): Gan–Savin (published version, Appendix B and §10 uses; arXiv v2 compared); Ciubotaru–Harris arXiv v1 §§4–8; Bekka–de la Harpe–Valette (authors' version) Appendices A.2, C.4–C.5, F.1–F.2 and Exercise F.6.4; Bernstein 1992 notes Ch. IV §1; Casselman 1995 draft §§2.1, 2.3; Casselman 1980 §3 (page image of p. 401); Heiermann–Opdam arXiv v4 §1; Barbasch–Ciubotaru 2009 §§1, 3; Barbasch–Ciubotaru 2013 §1.3 and Corollary 6.2.6; Aubert 1995 (AMS); Cluckers–Cornulier–Louvet–Tessera–Valette §1; Gan–Ichino Appendix A.1; Bernstein–Zelevinsky 1976 §4.21. Not read, cited through the papers that cite them (source `CitedOnly`): Miličić 1973, Tadić 1986/1988, Rodier 1973/1984, Barbasch–Moy 1989/1993/1994, Howe–Moore 1979, Bernstein 1974, Kazhdan–Lusztig 1987, Reeder 1993/2002, Kato 1981, Ciubotaru 2005/2006, Barbasch 2010, Knapp–Stein, Conway. Barbasch 2010 (arXiv math/0609828) was downloaded but not needed beyond Barbasch–Ciubotaru Theorem 3.3.

## Checks run during the job

- Source locators: a Sonnet pass compared 132 citations with the downloaded texts. Eight page or paraphrase corrections were applied: BHV P≤1(G) on p. 382; Remark C.4.13 on p. 378; Casselman 1980 Theorem 3.1 on p. 397; Casselman 1995's P_K text; the BC1 §1.1 claim; the use in Gan–Savin Proposition 10.7; Ciubotaru–Harris p. 25 for the remark on [BC3]; the CH unitary-induction remark. A ninth flag (BHV Exercise F.6.4 'S = T') was a text-extraction artefact: the page image (p. 444) shows the closures.
- Supplier nodes: a Sonnet pass found that all 99 (now 106) cited nodes exist and flagged 12 uses. All were fixed:
  - Macdonald's formula: SR.4/macdonald-formula is the GL_n(E) formula, so Casselman's asymptotics are cited instead.
  - The finite Hecke algebra is obtained through K/I ≅ 𝐆(𝔽_q)/B(𝔽_q).
  - The sign character on St^I is derived from SR's definition of St (Solomon–Kilmoyer).
  - The Iwahori–Matsumoto involution is defined from the presentation.
  - The σ-compactness hypothesis of SR's Schur lemma is added.
  - Exactness and finite length of Jacquet modules now cite SR.2/jacquet-lemma, jacquet-invariants and SR.3/finite-length (2).
  - AZ(1) = St is derived for split G from the Jacquet module.
  - St ⊂ i_B(δ_B^{1/2}) follows by first adjointness.
  - Iwasawa is applied with a minimal Q ⊆ P, and Cartan with the compact part M₁ ⊆ K.
  - ES5/ES7 are used with a fixed ℂ ≅ Q̄_ℓ and the normalised-induction dictionary.
- Self-review corrections: P₁(G) is weak-* closed for discrete G, not compact G; Tadić's compactness argument is rewritten without an unneeded bounded-depth step.

## What a follow-up or reviewer should look at

- Ownership boundary with the open NoncompactQuantumSymmetry PR (#1015). If it merges with its own coefficient weak containment, SRU.1 *weak-containment* and the Fell topology should be re-pointed at it.
- The three cited deep theorems (Miličić, Bernstein's admissibility, Kazhdan–Lusztig) are stated as targets whose inputs are gaps; the classification theorems (Theorem 6.9, 8.3) are cited case analyses (remaining refinements).
- Lemma-level refinements per stage are listed in each coverage record's `remaining`.
- Build scripts were in the scratch directory (deleted at the end of the run); the packet, roadmap and reader can be regenerated from the packet itself, which is the source of truth.
