# REV-PKG-ReductiveGroupsPartII — fixing review

Reviewer session `cc-8f4089`, 9 October 2026. Verdict: **accepted** (with the fixes below applied).

Package: `research/blueprint/packages/ReductiveGroupsPartII/` — README (7 layers, 172 targets),
Suggested.lean, metadata.toml. Plan checkpoint: `research/blueprint/packets/ReductiveGroupsPartII.json`
(84 nodes; RG2.2, the first half of RG2.3, RG2.4 and RG2.5 were written at package time and got the
most attention here).

## What was checked

1. **Quality bar.** Read against `UPSTREAM_GUIDE.md`, PROTOCOL §5/§12/§13/§20 and the upstream
   ReductiveGroups and OrthogonalSpinGroups READMEs. Structure (introduction, layer table, scope and
   boundaries, conventions, layers with targets, sources) matches upstream. Every one of the 172
   targets has a Sources and a Requires line (checked by script). Every definition/construction (59)
   has an API line and at least three tests including a non-example (checked by script). The style
   is denser than upstream (telegraphic statements); not changed, the file is at the size cap.
2. **Sources.** Three verification passes on the downloaded public texts (He 2018 arXiv v3, He 2021,
   Richarz, Haines–Rapoport, Casselman, Zhu, Kisin–Zhou, Gleason–Lim–Xu, van Hoften, Kisin,
   Bruhat–Tits I/II and 1984 (Numdam), Conrad, Prasad, Fintzen, Kisin–Pappas, Pappas–Rapoport,
   Haines, Buzzard–Gee, Kaletha): every RG2.4 locator, every RG2.2/RG2.3/RG2.5 locator into those
   papers, and 40 Bruhat–Tits/Conrad locators across RG2.0–RG2.3 (well beyond the 15-locator sample).
   Page-1 titles of all downloads verified.
3. **Gaps.** All 132 cited slugs resolve to targets; no upward citation, no
   `FoundationsAndLibraryIntegration`, no `UPSTREAM:`; every backticked Mathlib/Tau Ceti name in a
   Requires line exists at the pins except `TauCeti.maximalUnramifiedExtension`/`maximalUnramifiedFrobenius`,
   which exist in the current library (a91d3aaf, `NumberTheory/LocalField/Unramified/Maximal.lean`)
   but not at f790474 — cited correctly as existing library, not importable by the Lean file.
   Every foreign roadmap layer cited exists upstream (ReductiveGroups 0,2–7,9; LocalFieldsRamification
   0,2,3; ModularCurves 0F; RootSystems 3,4; ProfiniteProPGroups 3; ClassFieldTheory 9).
   Ten forward references (a target citing a later one) were found and resolved by moving targets.
4. **Unit tests.** Read every test of the RG2.2–RG2.5 definitions; checked the small computations
   (|Adm((1,0))| = 3 for GL₂, ℓ(t^{(1,0)}) = 1, (1,0) ≤ (2,−1) via the coroot, Ĝ(PGL₂) = SL₂,
   q+1-regular tree, G_{x,1/2} = G_{x,1} for SL₂ at a hyperspecial vertex, …). None vacuous.
5. **Lean.** `/home/chris/atlas-workers/bin/lean-check <pkg>/Suggested.lean`: exit 0, 587
   `declaration uses sorry`, no other warning (run before and after the edits). No `Prop := sorry`,
   no `True` placeholder (the one `True` is a `HasBasis` index). Ten signatures compared with the README
   statements (valuation existence, Lang, Iwahori–Bruhat, Cartan, Iwasawa, Weil `homEquiv`, compact
   integral points, `LGroup`, Frobenius fixed points, topological group): hypotheses present.
6. **Own words.** 8-word shingles of every README line searched in all source texts: only
   Bruhat–Tits section titles used as locators and one generic phrase match.
7. `intake.py check-files` on the three files: 0 problems; no `/home/` paths.
8. **Duplication.** Current upstream roadmaps (all 49 directories, including the nine newer ones and
   `Completed/*`) grepped for the mathematical objects (point topology on points, Weil restriction,
   Deligne torus, apartments, parahoric/Iwahori, Moy–Prasad, Kottwitz, z-extensions, Néron models of
   tori, Cartan/Iwasawa, dual group/L-group, Lang's theorem): no target is planned elsewhere
   (OrthogonalSpinGroups uses Mathlib's module topology on O(V) ⊂ End, cited; ModularCurves 0F
   Hom-schemes cited; its Néron model is J₀(N)). TauCeti a91d3aaf grepped the same way with positive
   controls: no target exists there. Upstream ReductiveGroups is byte-identical to the atlas copy.
   **No target removed.**
9. **Consumer interface.** AdelicAlgebraicGroups and SmoothRepresentationsOfLocalGroups cite this
   roadmap by layer id only (no Lean names). Present here: locally profinite topology, compact open
   subgroups, Weil restriction with point adjunction, parahoric/Iwahori/pro-p Iwahori with Iwahori
   factorization, Iwasawa/Cartan/Iwahori–Bruhat, the modulus character δ_P (RG2.4), finiteness of
   compact double cosets, the pinned integral dual group with Galois action. See residuals.

## What was fixed

- **Forward references (10).** Moved `general-linear-points-homeomorphism` after
  `integral-points-compact-open`; `quasi-split-root-group-coordinates` and `quasi-split-valuation`
  ahead of `affine-roots-and-filtrations`; `levi-of-apartment-vector` after
  `frobenius-action-on-apartment`; `weil-restriction-building` ahead of `tame-descent-of-building`;
  `toral-embedding-into-gl-building` and `minuscule-toral-embedding` after `gl-building-lattice-chains`;
  `quasi-tame-group` ahead of `r-smoothness-criteria`; `yu-mixed-depth-groups` ahead of
  `moy-prasad-isomorphism`; `affine-tits-system` ahead of `iwahori-bruhat-decomposition`;
  `iwahori-factorization` ahead of `double-coset-cardinalities`. Every move keeps all its Requires
  earlier and all its citers later (asserted by script).
- **Resolvable cross-references.** Requires lines cite italic slugs that nothing defined; every target
  title now carries its slug, `(*slug*)`, and the introduction says so.
- **Process language.** Removed "A8–A9 of the extraction" and the referee-history clause.
- **Wrong statements.** `double-coset-cardinalities`: #(IẇI/I) = q^{ℓ̆(w)} (not q^{ℓ(w)}), ĬṡĬ/Ĭ an
  affine space of dimension ℓ̆(s) (not a finite count), IẇI a union of [I:I_n] I_n-double cosets
  (He 2018 Lem. 4.6 and proof of Thm 5.3; Richarz Prop. 1.11, Rem. 1.13). `neron-lft-model-of-torus`:
  finite type iff X_*(T)_I finite, i.e. anisotropic over K^sh. `gsp-building-self-dual-chains`:
  m ∈ ℝ, the involution's fixed points are B(Sp(V)), B(GSp) = B(Sp) × ℝ.
- **He 2018 numbering.** arXiv v3 numbers by section (Lem. 4.5/4.6/4.7, Prop. 2.3/4.3, Thm 5.3);
  "Lem. 15/16" were the journal count. All He 2018 citations now use arXiv v3 numbers and pages
  (§1.1 p. 5, §2.4 p. 8, §4.2 p. 12, Lem. 4.5 p. 13, Lem. 4.6 pp. 13–14, §6.1 p. 16, …).
- **Locators corrected (~45).** Among them: Haines–Rapoport "§1" → Def. 7 and (3), p. 4, with
  Rem. 10/Rem. 9/Lem. 17 where used; Richarz (1.5)–(1.6), (1.14), Sublemma 1.12, Rem. 1.13;
  He 2021 §2.1 (length/Bruhat), §2.2 p. 5, §4.3 p. 8, footnote 1 §4.1; GLX §2 (2.3)–(2.7), §3.2 p. 19,
  Lem. 4.12, Prop. 4.11 (II); van Hoften §2.2.15 p. 19, Lem. 3.4.2 (tame hypothesis stated), §A.3.2;
  Casselman §1.4 pp. 13–15, Lem. 1.4.5/Prop. 1.4.6 p. 15, Lem. 1.5.1 p. 16, §3.1 p. 32 (the "page of
  the scan" numbers were text-file line numbers); Bruhat–Tits I 6.1.1–2 pp. 107–109, 6.1.3 pp. 109–110,
  (4.4.3) p. 80, (7.3.1) p. 164, (6.4.9) p. 136, (6.4.48) p. 152, §6.5 Théorème p. 154, Lemma 3.2.1
  p. 63, §10.2 pp. 234–240; Bruhat–Tits II 1.5.8/1.5.17, Annexe pp. 169–177, 4.2.2 (3) p. 89,
  5.1.21/5.1.28, Prop. 5.2.12 p. 166 (the "Remarque 5.2.12" was in the wrong volume), §4.4 restricted
  to the finite-type model, 4.6.26 → Tits for the hyperspecial definition, 1.2.13/1.7.6/4.2.15 pages;
  SL₂ tree now cites Bruhat–Tits 1984 §§1.7–1.8, 1.25, 2.1–2.16; Kaletha §5.6 pp. 46–47 (dual root
  datum, Galois action), §5.5 proof of Lem. 5.7; Zhu (1.2.3) p. 11, §0.5 marked notation only;
  Kisin–Pappas arXiv pp. 17–18; Pappas–Rapoport Lem. 6.7 hypotheses stated.
- **Explicit gaps (stated as used, no proving source cited).** Simple reflections of W̃_E as longest
  elements of σ-orbit parabolics; the length formula ℓ(xt^λy) for general y; finiteness, lower-set,
  maximal elements, σ-stability and Adm ⊆ Perm of the admissible set; the Kottwitz-surjectivity (2)
  beyond the tame case; Iwasawa item (3); unimodularity and the K×M×N integration formula; the
  rank-one and GL_n index formulas; the compact-subgroup form of Kisin–Zhou 6.2.1; the lft Néron
  model's mapping property/criterion/components (BLR Ch. 10 not available); hyperspecial existence
  iff unramified and single orbit (Tits's notes); the reductive/semisimple equivalences for Weil
  restrictions; the fppf-quotient clauses of central extensions of parahorics; pinned-automorphism
  items (2)–(3); Levi embeddings of L-groups; products/z-extensions of dual isogenies; the dual of a
  Weil restriction; the dual tori/GL_n facts. The three plan-level gaps (Prasad–Yu 4.1, tame
  subdivision, Adler's lattice comparison) stand as the handoff records.
- **Lean.** 67 API names of 15 definitions (RG2.1–RG2.3) that had no Lean form were absent from the
  closing catalogue; added there (new RG2.1 line, extended RG2.2/RG2.3 lines). File re-checked.

## What remains (for the maintainer; none blocks the draft PR)

- README is 206.9 KB against the "at most 200 KB" guideline; the slug anchors (5 KB) and the explicit
  gap markings account for the growth over the 197 KB the author delivered.
- The two consumer packages attribute to this roadmap notions it does not (and should not) plan:
  AdelicAlgebraicGroups expects from RG2.0 a "comodule/tensor dictionary" (ReductiveGroups layer 1),
  from RG2.1 "relative roots … closed homogeneous embeddings" (relative roots are ReductiveGroups
  layer 7), from RG2.3 "quasi-splitness at almost all places" and "integral Iwasawa decompositions"
  (global, not here), from RG2.4 the Kneser–Tits theorem (absent). SmoothRepresentationsOfLocalGroups
  expects the "positive-root modulus" from RG2.1; it is δ_P in RG2.4 `iwasawa-integration-and-unimodularity`.
  These are defects of those packages' tables, not of this README.
- Twelve cited sources were not obtainable for checking (see review.json); their locators are as the
  author left them. Garrett and Milne carry only standard facts.
- Tits's Corvallis article and Kaletha–Prasad remain uncited (unavailable); the hyperspecial
  definition is now attributed through Bruhat–Tits II 4.6.26's reference to Tits.
