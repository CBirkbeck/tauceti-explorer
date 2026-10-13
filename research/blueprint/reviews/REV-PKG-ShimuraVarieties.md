# REV-PKG-ShimuraVarieties: independent package review

**Reviewer.** Claude (Opus 5.5), session `claude-HnwevD`, issue [#9239](https://github.com/CBirkbeck/tauceti-explorer/issues/9239), 13 October 2026. The package was written by Codex session `codex-drcLi9` (PKG-ShimuraVarieties, issue #9194). This reviewer wrote no part of the plan or the package.

**Verdict: accepted**, with the corrections below applied. All six items of the issue hold. The supplier obligations that the accepted plan records as explicit gaps remain; they are listed under "What remains" for the maintainer.

## What was read

- The method and rules: `PACKAGE_REVIEW.md`, `PROTOCOL.md` §§5, 12, 13 and 20, `UPSTREAM_GUIDE.md` and `WORKERS.md`.
- The whole package: README (2,391 lines before the review), `Suggested.lean` (158 lines) and `metadata.toml`.
- The accepted plan `research/blueprint/packets/ShimuraVarieties.json`: 100 nodes, its 20 gaps, 39 requests and 26 source findings. It supersedes the split packets `ShimuraVarieties--V0.json` and `--V8.json` named in the issue and carries an explicit migration of their 95 nodes.
- Upstream form models: TauCetiRoadmap AdicSpaces (section structure), and the cited upstream sections: ModularCurves Layers 0, 5, 9 and 10; ClassFieldTheory Layers 11 and 13 (`cyclicHasseNorm`, `isGlobalNorm_iff_isLocalNormEverywhere`); ReductiveGroups Layer 7; and AdelicAlgebraicGroups and ReductiveGroupsPartII at commit 0d144d0.
- The tier order `research/blueprint/upstream/CaraianiNewton.md`: ShimuraVarieties is tier 13, bundled with PELModuli, and flagged "cites outside the 94: ComplexMultiplicationAndExplicitReciprocity (5)".

## Items 1–6

| Item | Result |
|---|---|
| 1. Upstream form | The README has the upstream shape: a Summary; Scope and ownership; Conventions; supplier contracts by source; How to read the build; Layers 0–8 with numbered subsections, each layer ending with Examples and Dependencies; Downstream consumers; References. It now has no planning residue (fixes below). |
| 2. Fidelity to the plan | A script checked all 100 plan targets: each has its own subsection headed by its Lean name. All 128 API and check names are present, and every plan statement and hypothesis survives (some only reworded where a stage id was turned into a layer reference). The 13 definitions and constructions each have at least three Checks, and the three new ones have 4, 3 and 4. Boundaries agree with the plan. The roadmap-level link map (`atlas/roadmaps/ShimuraVarieties.json`) lists fewer prerequisites than the plan cites; see "What remains". |
| 3. Own words | No passage is shared with the 12 source texts beyond generic eight-word phrases (a word n-gram scan); sources are cited by theorem, section and page. |
| 4. No process | Fixed (list below). |
| 5. Suggested.lean | `lean-check` exits 0. Its 15 warnings are all "declaration uses `sorry`"; there are no errors. The file is 216 lines, with no sorry'd data, `True` placeholders or `Prop := sorry`. Every README definition is a declaration or is named in the closing comment. |
| 6. metadata.toml | `topic = "math.NT"` (single line); fitting. |

## Corrections to the README

1. **Garbled text.** In the API item `ReflexNorm.map` (4.2) and the statement and proof of `ReflexNorm.map_full` (4.9), every "E0" had been replaced by "the corrected convention", so the formulas were unreadable. Restored from the plan: E0 = E(μ0), E ⊂ E0, f∘r(T0,μ0) = r(T,μ)∘Nm_{E0/E}, art_E(Nm s) = art_{E0}(s)|_{E^ab}. Also removed "The promoted map_full theorem proves it", which now points to §4.9.
2. **Broken cross-references.** "[Layer 5](…)CM converts" in the CM ideal theorem now reads "§5.10 converts" (the main theorem). ShimuraData ids written "ShimuraData 5/effective-free", "5/gl2-congruence-neat", "4/special-image" and "4/central-isogeny-lift" are now `D5/…` and `D4/…`.
3. **Packet slugs in the prose.** About 60 references by plan-node slug ("translation-descent", "codim-one-extension", "gl2-compact-model", "finite-level-maps", "component-reciprocity", "zero-dimensional-shimura-variety", "rational-boundary", "normal-analytic-compactification", "model-uniqueness", "minimal-descent", "minimal-map-extension", and others) are now section references (§4.11, §8.17, …). Unbackticked Lean short names (`full_level_iso`, `codim_one_extension`, …) are now `GL2Modular.full_level_iso` or section references.
4. **Process wording removed or rephrased:** "Use the checked AA.4 …"; "are already planned … do not plan these inputs again … remain the AA.4 request"; "(page images checked)"; "Its exact extension/coherence source must be checked separately, a required construction"; "this missing common CM supplier is explicitly required and a required construction" (it now points to the CM arithmetic contract); "is an required proof input"; "Request only …"; "already planned by SF.1"; "the calibration behind the corrected convention"; "No placeholder existence witness"; "The detailed CM moduli rigidity/descent proof is a specific detailed proof …". The source notes are now stated neutrally: SVI (60)–(61) is read multiplicatively, Lemma 3.8 of Milne 1983 is cited as corrected in the author's annotated copy, the annotated copy's withdrawn rank-one generation claim is mentioned, Milne 1999 Remark 1.3(c) is cited for the omitted continuity condition in Milne 1994, and Milne MF Lemma 8.7 is read with the reference root ζ_ref.
5. **Dangling Check.** In 2.3, "… must satisfy the tests below" pointed at nothing and only repeated the named Checks; it is removed.
6. **BKT erratum.** 3.6 relied on a "corrected" definable structure without citing the correction. It now cites the BKT erratum, §§1.1–1.2 and the corrected Theorem 1.1, pp.1–2: the atlas depends on the maximal compact K∞, and all Siegel sets are taken for the same K∞.
7. **Ambiguous references.** "Layer 10" (five places) is now ModularCurves Layer 10, the prime N ≥ 5 diamond quotients, confirmed in the upstream README. "C2.general and S0.general" now name ShimuraCompactifications Layer C2 and PerfectoidShimuraVarieties Layer S0. "ShimuraCompactifications:C0" and "AutomorphicBundles:B1" are written out. The labels "C0/repair-analytification" and "C4/repair-proper-morphism-algebraicity" now name the targets (the ids are kept in the links).
8. **Supplier contracts.** Merged the three duplicated entries (AlgebraicModuli R09.3, PELModuli M3, ReductiveGroups Layer 7). Added the Mathlib inputs of the CM-type section.
9. **Locator.** SVI Lemmas 5.11–5.13 are on pp.56–58, not pp.57–58 (Lemma 5.11 is on p.56).
10. **Undefined term.** The "norm datum on G_m" in 1.3 is now the one-point torus datum (G_m,{h}), h(z)=z z̄.
11. **Conventions.** The connected adjoint S-map convention used throughout Layers 6–7 now names the conditions (C1)–(C3) of Milne 1983, Appendix.
12. **References.** "TauCetiRoadmap current main at 0d144d0" is replaced by "TauCetiRoadmap commit 0d144d0": that commit is on a pull-request branch, not on main. Added Milne's *Complex Multiplication* notes.
13. **Downstream consumers.** "AutomorphicForms" names no roadmap that cites this one. The paragraph now names the actual consumers found in the packets and the link map: HilbertModularVarietiesAndShimuraCurves, PerfectoidShimuraVarieties, HodgeTateAndCanonicalSubgroups, CompletedCohomologyPartII, HeegnerPointEulerSystems and ComplexMultiplicationAndExplicitReciprocity, besides PELModuli, ShimuraCompactifications and AutomorphicBundles.
14. **Duplicated Check.** The two identical T_p-index Checks in 8.4 are merged.

## A notion moved down (tier rule)

ComplexMultiplicationAndExplicitReciprocity is outside the 94 Caraiani–Newton roadmaps. Its accepted package (`roadmaps/ComplexMultiplicationAndExplicitReciprocity`) states that it depends on ShimuraVarieties Layers 4, 5 and 8. Citing its CM.0 would therefore make a cycle, and an upward edge for a tier-13 roadmap. The five CM.0 citations (`cm-type` twice, `trace-reflex-field` once, `type-product-identities` twice, in 5.2, 5.4, 5.7 and 5.8, old numbering) are replaced by a new **Section 5.1, CM types, reflex fields and reflex norms**:

- `TauCeti.CM.CMType` (definition, with induced and primitive types and the Galois action; 8 API items, 4 Checks). Milne, *Complex Multiplication*, Definition 1.8, p.11; Proposition 1.9, p.12; p.13, footnote 3.
- `TauCeti.CM.CMType.reflexField` (trace and stabilizer descriptions, CM-ness, products, induction, agreement with the cocharacter reflex field of ShimuraData D5/cm-torus; 8 API items, 3 Checks). Milne CM Proposition 1.16 and Definition 1.17, p.13; Proposition 1.18, p.14; SVI Example 12.4(b), p.112.
- `TauCeti.CM.CMType.reflexNorm` and the theorem `typeNorm_identities`: the determinant definition, transitivity, the conjugation and norm identity, the ideal formula, and the reflex-type product for fields. Milne CM Proposition 1.21, Corollary 1.22, Proposition 1.23, Remarks 1.24–1.25, Proposition 1.26 and Example 1.28, pp.15–18. Every locator was read in the cleared public notes (version of 14 July 2020).
- `TauCeti.Shimura.ReflexNorm.cm_type`, moved from the 4.2 API, where it would have been a forward reference. With SVI's convention (μ_Φ has exponent 1 at Φ, Example 12.4(b)), r_{h_Φ} = N_Φ. I checked this by hand for ℚ(i): both send a to φ⁻¹(a).

Layer 5 is renumbered (5.1–5.12 become 5.2–5.13). Every anchor, link text and "Earlier constructions" list was rewritten by a script, and a checker confirms that all 319 internal links resolve. Stage ids (Layer k = Vk) are unchanged, so consumer citations of `ShimuraVarieties:V5` still resolve.

**For the orchestrator.** ShimuraData `D5/cm-torus` (tier 12, below this roadmap) also cites CM.0, and its reflex-field API needs the CM reflex field. When ShimuraData is packaged, it must plan the CM types itself; this Section 5.1 should then become an import from ShimuraData. ComplexMultiplicationAndExplicitReciprocity's CM.0 should import CM types, the reflex field and the type norm from here (or from ShimuraData), rather than plan them again.

## Corrections to Suggested.lean

- Removed `instance singletonAction : MulAction Q PUnit`, which duplicated Mathlib's `PUnit.mulAction`. The examples now use Mathlib's instance.
- Added a Layer 5 section over carriers at the pins:
  - `structure CMType (E) [CommRing E]`: a set of ring maps E →+* ℂ with `star φ ∈ Φ ↔ φ ∉ Φ`, using Mathlib's `RingHom.involutiveStar`, which is `NumberField.ComplexEmbedding.conjugate`.
  - Real-bodied `CMType.conjugate` (the complement, proved), `typeTrace` (a `finsum`) and `reflexField` (`IntermediateField.adjoin ℚ (Set.range typeTrace)`).
  - Theorems `CMType.card` (2|Φ| = [E:ℚ] for reduced finite-dimensional ℚ-algebras) and `typeTrace_conjugate`.
  - Examples: `IsEmpty (CMType ℚ)` (negative control: a real embedding admits no type); the Gaussian type has trace i at i (the full trace would give 0); the Gaussian reflex field is not ⊥.
  - The README states the generality (any commutative ring in Lean; results for CM algebras).
- The module docstring mentions the CM types, and the closing comment adds `TauCeti.CM.CMType.reflexNorm`, which needs a module determinant and stays a README target.
- Spot-checked signatures against the README: `AnalyticPoints`, `mk`, `mk_eq` (the orbit condition with k ↦ k⁻¹, which is correct), `geometricArtin`, `geometricArtin_norm` and its four examples, the order-of-translation matrices, and the CM declarations. None is vacuous, and the hypotheses match.
- `lean-check` (Tau Ceti f790474, Mathlib 082e2d3): exit 0, 15 `sorry` warnings, no errors. The original file had also passed (exit 0, 10 warnings).

## Duplication against current Tau Ceti and TauCetiRoadmap

I searched Tau Ceti a91d3aaf for Shimura data and varieties, reflex fields and norms, CM types, Baily–Borel, canonical models, Hermitian domains, compact open subgroups and the Deligne torus. Its only related material is classical modular-form Hecke operators (`NumberTheory/ModularForms/HeckeSlash`), which is not a Shimura-variety Hecke correspondence. I also searched every TauCetiRoadmap roadmap, including the nine newer ones and `Completed/*`. AdelicAlgebraicGroups and Completed/HodgeStructures defer Shimura varieties explicitly; ReductiveGroupsPartII supplies the Deligne torus, which is cited. Nothing is removed.

## Source spot-checks

I fetched 12 public PDFs on 2026-10-13; their SHA-256 values match the plan's `sourceVersions`. These sources were checked:

- SVI (`f637e617…`): 3.2 p.33; 3.5 p.34; 3.13–3.16 pp.39–40; 5.11 p.56 (locator corrected); 5.13 p.57; 5.16 p.58; 5.17 p.59; 5.20 p.60; 5.21 p.61; 10.3 p.100; 10.5 p.101; 10.8 p.102; 10.10 p.103; 12.3–12.4 p.112; (60)–(62) and 12.8 p.114; 12.10 p.115; 13.3 p.117; 13.4–13.6 p.118; 13.7, 13.8 and (64) with footnote 73, p.119; 14.8 p.122; 14.9–14.10 p.123; 14.12 p.125; 14.14–14.16 p.127.
- Milne 2007c (`cec3ce6f…`): 1.5 p.6; 2.1 p.16; 3.2 p.19; Lemma 3.4 p.21; 3.6 p.21; 3.10 and 3.11 p.22; 3.12 p.23.
- Milne, *Complex Multiplication* (`0ac337a8…`): §1, pp.11–18, all the locators of Section 5.1.
- Milne 1999 (`9ce47be2…`): 1.1 p.1; 1.2 and 1.3(c) p.2; 2.2–2.3 p.4; 2.4 p.5.
- Pink (`6f8aa447…`; printed page = PDF page − 1): 2.9 p.32; 3.4 p.42; 6.2 p.94; 8.2 p.132; 9.25 p.159; 10.9 p.175; 10.20 p.183; 10.21–10.22 p.184; 12.3 p.197; 12.6–12.7 p.198; 12.9–12.10 p.200; 12.12 p.202.
- Deligne 1971 (`054847ce…`): 5.1–5.1.3 pp.153–155; 5.4 p.155.
- BKT (`b559c652…`): Theorem 1.3; §4.6 with Theorems 4.12–4.13, p.18.
- BKT erratum (`86d76a5d…`): §§1.1–1.2 and the corrected Theorem 1.1, pp.1–2.
- KUY (`eed30407…`): Theorem 1.9 p.336; Theorem 4.1 p.344.
- AGHMP (`e1274468…`): §3.1, p.415.
- Milne MF (`977f06a4…`): 8.6–8.8 p.100.

Not re-verified here: Baily–Borel 1966, the only public copy being a third-party mirror (the README links the Annals page); Milne 1983, a scan with no text layer, whose locators the plan's review verified; Milne–Shih; Conrad; Platonov–Rapinchuk.

## Adversarial mathematics pass

| Statement | Instance tried | Result |
|---|---|---|
| Right-translation order (Conventions, 8.2) | u=[[1,1],[0,1]], v=[[1,0],[1,1]] | uv=[[2,1],[1,1]], vu=[[1,1],[1,2]]; correct. |
| Hecke apex K∩gKg⁻¹, g=diag(p,1) | g⁻¹mg ∈ K forces b ≡ 0 mod p | Lower triangular mod p, fixes the line of e₂, index p+1 (3 at p=2); correct. |
| Geometric Artin and χ_cyc (4.1) | arithmetic Lubin–Tate normalization | χ(rec_ℚ(u)) = u⁻¹ and χ(art_ℚ(u)) = u; correct. |
| CM polarization multiplier χ/N(s) (5.11) | ℚ(i), s=2, σ=id | art(2_f) = 1, α = 1/2, multiplier 1/4; correct. |
| Canonical weight (2.3) | ℍ; genus-two Siegel; E₄, j at Γ(3) | Weights 2n and 3n; degree 2 gives 6, i.e. intrinsic degree 3; E₄ is admissible and not cuspidal; j is excluded; correct. |
| Zero-dimensional sets (Conventions, 8.6) | N=1,2,3; maximal level | φ(N) against φ(N)/2 sets, one point at maximal level; correct. |
| Torus level map (1.3) | K(3)⊃K(21), strict torus datum | 1 and 6 points; the effective action is regular C₆; S₆ is the full group; correct. Undefined name fixed. |
| Canonical-model non-example (4.4) | G_m, K(5), σ with χ ≡ 2 | Two classes swapped, so the split model fails; correct (wording clarified). |
| Disjoint reflex fields for GL₂ (4.10) | ℚ(√−p), p unramified in L | Not contained in L, so linearly disjoint (it is Galois of degree 2); correct. |
| j-map degree (8.1, 8.3) | N=3 | φ(3)·\|SL₂(𝔽₃)\|/2 = \|GL₂(𝔽₃)\|/2 = 24; ramified over j=0 and 1728; correct. |
| K₁ conventions (8.14) | {a≡1,c≡0} against {c≡0,d≡1} | Equal intersections with SL₂ (Γ₁(N)). Not conjugate in GL₂(ℤ/N) for N≥3: the normalizer of U is B, which acts trivially on B/U. The README's claim is correct. |
| Row action (Conventions, 8.13) | u=[[1,1],[0,1]], [[0,1],[−1,0]] | (P,P+Q) and (−Q,P); the pairing is raised to det; correct. |
| Koecher codimension (2.8) | Hilbert surfaces, ball quotients, Q-anisotropic forms | Codimension one exactly for PGL₂,ℚ factors; correct. |
| Reflex norm of CM torus (new 5.1) | ℚ(i): r(a), N_Φ(a), N_{ιΦ}(a) | r = N_Φ = φ⁻¹; N_{ιΦ} = conjugate; N(2+i)·conj = 5; transitivity N_{k,Φ}(√2) = −2 for k=ℚ(ζ₈); correct. |
| CMType.card (Lean) | E=0; ℚ; ℚ(i); product | 0=0; no type; 2·1=2; additive; holds for reduced finite ℚ-algebras. |
| typeTrace_conjugate (Lean) | infinite or finite embedding set | The statement needs `Finite (E →+* ℂ)`, which it assumes. |

No false statement was found beyond the garbled 4.9 text.

## What remains (for the maintainer)

1. **Supplier obligations that no roadmap plans yet.** These are the accepted plan's explicit gaps. The README states each as an additional obligation of a named lower-tier owner; none is an upward citation, but none is planned at that owner:
   - an analytic-space category with nilpotents, finite quotients and holomorphic bundle descent (ComplexComparisonPartII and the ComplexComparison carrier);
   - the effective-kernel and integral-level specializations of AdelicAlgebraicGroups AA.3/AA.4;
   - the extensions of ReductiveGroups Part II (rational real density, Q-simple classification by restriction of scalars, corrected finite-place H¹(k,Z) injectivity, adjoint Hasse principle);
   - S-arithmetic arithmeticity and superrigidity (ALS.0, for Milne 1983 §§3.5–3.7);
   - Chevalley's unit-topology theorem (ClassFieldTheory extension);
   - the Serre protorus and Taniyama extension (a shared CM arithmetic layer);
   - o-minimal Chow and period-map definability (ComplexComparisonPartII C4);
   - Hilbert irreducibility with a real open condition (InverseGalois IG.2);
   - the ample-power descent output of SF.1;
   - the relative cocharacter incidence scheme (R09.2).

   Before the TauCetiRoadmap pull request, each must either become a target here or be added to its owner. The proof-level gaps inside this roadmap's own targets (Borel's metric extension in 3.1, Kazhdan's exceptional uniformization in 7.6, the central adjustment in 7.7, the completion density in 7.9, the general finite-extension source in 2.9) are marked in the README as required proof inputs.
2. **Links.** AdelicAlgebraicGroups and ReductiveGroupsPartII are linked at `TauCetiRoadmap/blob/main/…`. Those directories are not on main yet (pull requests #792 and #785 are open), so the links resolve only once they merge; the reference entries are pinned to commit 0d144d0.
3. **Atlas link map.** The roadmap-level `prerequisites` in `atlas/roadmaps/ShimuraVarieties.json` omit suppliers the plan cites: AdelicAlgebraicGroups, ModularCurvesPartII, SchemeAndStackFoundations, NeronModelsAndSemistableAbelianVarieties, InverseGaloisAndArithmeticFundamentalGroups, ReductiveGroupsPartII, and ModularCurves and ReductiveGroups from Tau Ceti. That atlas data is outside this job's files.
4. **Moves to reconcile.** CM types, reflex fields and reflex norms now have their owner here (Section 5.1). Point ComplexMultiplicationAndExplicitReciprocity CM.0 at them. When ShimuraData is packaged, its D5/cm-torus must take them (lower tier), and this section then becomes an import.
