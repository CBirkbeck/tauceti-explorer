# PAPER-BREUIL-HELLMANN-SCHRAEN-19: A local model for the trianguline variety and applications

Christophe Breuil, Eugen Hellmann and Benjamin Schraen, *A local model for the trianguline variety and applications*, [Publ. Math. IHÉS 130 (2019), 299–412](https://doi.org/10.1007/s10240-019-00111-y); arXiv [1702.02192](https://arxiv.org/abs/1702.02192).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1456). Status: **complete**. All five sections and the references were read. The machine-readable extraction is [PAPER-BREUIL-HELLMANN-SCHRAEN-19.result.json](PAPER-BREUIL-HELLMANN-SCHRAEN-19.result.json): 135 items (123 missing, 12 planned), 7 routes, 21 prerequisite entries and 11 source issues.

**Source.** The published Numdam PDF, 114 pages, SHA-256 `34ffd697…6993967a`, read 2026-09-22; **printed page = PDF page + 298**, and every locator is a printed page. arXiv:1702.02192v1 (82 pp., `4c967337…`) was also fetched; its pagination differs throughout, so it is used only to date a reading. Pages carrying a claim that turns on a sub- or superscript, an index or a font distinction were re-read as images at 200–500 dpi.

*A note for whoever extracts the next IHÉS paper:* both identifiers here have to be looked up. The DOI formed by incrementing the volume's pattern, `10.1007/s10240-019-00107-8`, is Galatius–Kupers–Randal-Williams on mapping class groups, and `arXiv:1709.01927` is a hep-th paper on vortex rings. Both were resolved through Crossref and the arXiv API.

## What the paper proves

The **trianguline variety** X_tri(r̄) is the Zariski closure, inside the framed deformation space of a residual r̄ times a space of characters, of the pairs (r,δ) with r trianguline of parameter δ. The paper describes its completed local rings at points of integral weight by a **local model** built from Grothendieck's simultaneous resolution, and cashes that in locally and globally.

**The model.** Let g̃ = {(gB,ψ) : Ad(g⁻¹)ψ ∈ b} and let q : g̃ → g be the simultaneous resolution; set X := g̃ ×_g g̃, whose irreducible components X_w are indexed by the Weyl group. §2 proves X is a reduced local complete intersection, that each X_w is Cohen–Macaulay (Bezrukavnikov–Riche) and — **new in this paper** — **normal** (Theorem 2.3.6), and computes cycles on the Steinberg variety through Beilinson–Bernstein localisation and Kazhdan–Lusztig multiplicities.

**The bridge** is Fontaine's theory of **almost de Rham** B_dR-representations: W ↦ (D_pdR(W), ν_W) is an equivalence onto pairs (vector space, nilpotent operator), and Galois-stable B⁺_dR-lattices correspond to filtrations of D_pdR(W), complete flags when the Sen weights are distinct. A trianguline (φ,Γ_K)-module supplies a second flag. So a point of X_tri(r̄) gives a triple (two flags, nilpotent operator) — a point x_pdR of X — and the main local theorem, the diagram (3.33), says X̂_tri(r̄)_x and X̂_{w,x_pdR} agree **up to formally smooth morphisms**. Since the X_w are normal and Cohen–Macaulay, so is X_tri(r̄) at these points (Corollary 3.7.10); in particular it is locally irreducible, which is exactly what the global arguments need.

**Local applications** (§4): flatness of the character and weight maps; the accumulation property; a tangent-space bound recovering the authors' earlier estimate; the determination of **all** local companion points in the crystalline case (Theorem 4.2.3 — precisely the w with w_x ≼ w); and a locally analytic **Breuil–Mézard type** statement (Conjecture 4.3.4, proved for generic crystalline r in Theorem 4.3.8) writing the cycle of a fibre of X_tri(r̄) as Σ_Π m_{δ,Π}C_{r,Π} with multiplicities from locally analytic principal series.

**Global applications** (§5), for a definite unitary group under the Taylor–Wiles hypotheses, via the patched eigenvariety: **classicality** of generic crystalline strictly dominant points (Theorem 5.1.3); the existence of **all expected companion constituents** in completed cohomology (Theorem 5.3.3), hence of all expected companion points; and **singularity** of the eigenvariety at such a point whenever w_xw₀ is not a product of distinct simple reflections (Theorem 5.4.2), together with Cohen–Macaulayness and flatness of the weight map there. The last is the first systematic source of singular points on eigenvarieties.

## Routing

Two facts decided the routing, and both were checked against `data/atlas.json` rather than assumed: **no stage plans the trianguline variety** — "trianguline" occurs in the atlas only as an adjective inside hypotheses of `CompletedCohomologyAndLocalGlobalCompatibility` and in a GL₂(Q_p) block check, never as the geometric object — and **no stage plans the Springer or Grothendieck resolution, the Steinberg variety or the nilpotent cone**. No other paper extraction has proposed a home for either.

1. **New roadmap `SpringerResolutionAndCharacteristicCycles`** (area `representations`), 29 items: §2 in full — g̃ and the simultaneous resolution, X and its components, reducedness, Cohen–Macaulayness, the new normality result, the Steinberg variety, Beilinson–Bernstein and characteristic cycles, the three bases of the cycle group and the Kazhdan–Lusztig transition matrix, the tangent-space bound. Category O, Verma modules and Kazhdan–Lusztig polynomials, and flag varieties with the Bruhat order, are `planned` imports from the Tau Ceti representation-theory roadmaps (Lie highest weight Layer 3, Lie groups Layer 8) — a source route may not re-plan a Tau Ceti roadmap, so they cannot be routed there.
2. **New roadmap `TriangulineVarietyAndItsLocalModel`** (area `padic`), 67 items: §§3 and 4 — almost de Rham representations and Fontaine's equivalence, lattices versus filtrations, trianguline (φ,Γ_K)-modules and their deformation groupoids, the formal smoothness theorem 3.4.4, the structure theorem 3.6.2, the local model diagram, local irreducibility, all local companion points, and the cycle formalism with the Breuil–Mézard conjecture.
3. **Part II of `CompletedCohomologyAndLocalGlobalCompatibility`**, id `LocalGlobalCompatibilityPartIIEigenvarietyCompanions` (area `automorphic`), 27 items: §5 and the global statements of §1. The parent owns completed cohomology, classical specialisations, Hecke and deformation actions and patched completed modules, but its stages are written for modular and Shimura curves; nothing there plans an eigenvariety for a definite unitary group, the patched eigenvariety, or companion constituents.
4. Four **source routes** carrying the 12 `planned` items to their existing owners: `PhiGammaModulesAndIwasawaCohomology` PG.3 and PG.7 ((φ,Γ_K)-modules over the relative Robba category of Kedlaya–Pottharst–Xiao, and the Herr complex that is this paper's (φ,γ_K)-cohomology), `PadicHodgeTheory` P7 (B_dR, the almost de Rham theory, Berger's functors), `LocalGaloisDeformationRings` R08.1 and R08.3 (the framed deformation ring that is the ambient space of X_tri(r̄)), and `CompletedCohomologyAndLocalGlobalCompatibility` R31.2 and R31.5 (completed cohomology and patched modules).

## Source issues

Eleven, each verified in the published text by this worker and, where a glyph or an index decides the matter, on a rendered page. Crossref records no correction for this paper, and the main follow-up — Wu's *Local models for the trianguline variety and partially classical families* — names no error in it; so unlike the Kisin–Pappas case, these are new findings rather than the authors' own corrections.

Three touch statements rather than typography:

- **E2 (§3.4, p. 352).** The genericity locus is described as the complement of the characters with "δ_iδ_j⁻¹ **and** εδ_iδ_j⁻¹ algebraic for i ≠ j". Since ε is not algebraic those two conditions never hold together, so **as printed T^n_0 = T^n_L** — contradicting the definition given one sentence earlier. Read "or … for some i ≠ j". T^n_0 is the locus the whole of §§3–4 runs on.
- **E3 (proof of Theorem 5.3.3, Step 3, p. 397).** The Claim is stated with "if w_R ≼ w", but w_R is defined only for a refinement of the fixed global ρ while the point y there is a general point of the patched space, whose Weyl element was just named w_y. The induction that proves the Claim uses w_y throughout.
- **E4 (Lemma 5.2.4, p. 393).** Printed as a verbatim repetition of the first assertion of Lemma 5.2.3, which would make it empty; its own proof establishes the statement for an arbitrary object of category O, which is what the later dévissages use.

**E1** is of a different kind: Remark 1.1 is the paper correcting *its own two predecessors*, recording that the hypothesis ᵖ√1 ∉ F is missing from the global results of Math. Ann. 367 (2017) and Invent. Math. 209 (2017). The proof of Proposition 5.4.1 adds a second correction to the latter — the argument of [19, Th. 4.8] needs a Cohen–Macaulayness property, "this was overlooked in the proof of [20, Cor. 5.18]". Neither concerns this paper, but a roadmap built on those two would otherwise carry hypothesis sets their authors have declared incomplete.

The remaining seven (E5–E11) are misprints: a Proposition cited as a Lemma; the Kazhdan–Lusztig indices in the proof of Theorem 2.4.7 printed without their w₀ prefixes, reversing the order relation the paper itself states on the previous page; D_dR for D_pdR in (3.6); a completion point missing its framing α⁻¹; "Corollary 3.2.5" for Theorem 3.2.5 (found independently by two readers); graded pieces required to be "free of rank 1 … for i ∈ Z", impossible for an exhaustive separated filtration; a tuple index inside a difference in (3.16); an undefined `F_W` in a proof; a free index in the definition of z^h; a broken clause in the statement of Corollary 4.3.2; the localised completed cohomology defined as an O_L-module; and an undefined ideal `p_ρ` occurring exactly once.

Reported candidates that could not be confirmed personally were dropped rather than recorded.

## Prerequisites the atlas does not cover

21 entries. The load-bearing ones are Fontaine's *Arithmétique des représentations galoisiennes p-adiques* — the almost de Rham theory the entire local model rests on — Berger's B-pairs, Kedlaya–Pottharst–Xiao for the Robba ring and global triangulations, Bezrukavnikov–Riche for Cohen–Macaulayness, Humphreys and Hotta–Takeuchi–Tanisaki for category O and D-modules, Orlik–Strauch for the locally analytic induction whose multiplicities appear on both sides of the Breuil–Mézard statement, Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin for patching, Emerton for Jacquet modules, and the authors' own two earlier papers.

Two entries carry warnings for a formalisation. **Orlik–Strauch and Emerton** are used in §5 for a product of groups over *different* fields, while the literature states them for one split group over one field; Remark 5.1.2 asserts the proofs extend unchanged, which a roadmap cannot take on trust and which is recorded as a gap. And **Kashiwara–Saito** shows the Kazhdan–Lusztig irreducibility conjecture on characteristic cycles fails for SL_n with n ≥ 8, so irreducibility of the cycles must not be planned.

## Checks

`scripts/check_paper.py`: ok with `"status": "complete"`, which enforces that each of the 123 missing items is routed exactly once. `research/blueprint/intake.py check-files`: 0 problems. All three new or Part II route areas (`representations`, `padic`, `automorphic`) are galaxy ids of `data/galaxies.json`; the three proposed roadmap ids are free in the atlas and in every other paper extraction; and the stage ids were checked against `data/restructure/*.result.json` and `data/roadmap-retirements.json`. That check changed a route: RS-26 touches `PadicHodgeTheory:P7`, and reading it surfaced the roadmap `PhiGammaModulesAndIwasawaCohomology`, whose PG.7 is written for the relative Robba category of Kedlaya–Pottharst–Xiao and keeps triangulations, and whose PG.3 owns the Herr complex. The §3.3 items were moved there from the dagger-algebra stages.

## Review (REV-PAPER-BREUIL-HELLMANN-SCHRAEN-19, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1457](https://github.com/CBirkbeck/tauceti-explorer/issues/1457). **Verdict: accept.**
Nothing needed correcting in place.

- **All 11 recorded mistakes confirmed.** Four are settled by the paper contradicting
  itself: E2 (the "equivalently" clause on p. 352 uses "and", which is unsatisfiable since
  `ε` is not algebraic, so `T₀ⁿ = T_Lⁿ` and the genericity locus collapses); E4 (Lemma 5.2.4
  repeats Lemma 5.2.3 verbatim and is empty as printed, while its proof dévisses to an
  arbitrary object of `O`); E5 (2.2.1 is a Proposition on p. 311, cited as such on pp. 315
  and 320, as a Lemma on p. 313); E6 (one clause on p. 323 writes `P_{w,w′}` without `w₀`
  and `P_{w₀w,w₀w}` with it, against the convention on p. 321).
- **E3 was checked on a page image**, since its relation symbol and its `≠` are single
  glyphs the text layer drops. The extraction's quotation is exactly right, and `w_R` in the
  Claim is indeed a slip for `w_y`.
- **Items and routes:** no library items (correct — nothing here is in the pinned
  libraries); 12 planned items resolving; 123 missing items routed exactly once; both new
  roadmap names free and co-proposed identically by three other papers. No run-together
  numbering anywhere.
- **Referred to the maintainer, not edited:** the Part II title drops "over Q" from its
  parent's title, so it is not literally the "`<base>`, Part II: …" form. It is shared
  verbatim with two co-proposing papers, so changing it here alone would break the merge.

Full report: `research/blueprint/reviews/REV-PAPER-BREUIL-HELLMANN-SCHRAEN-19.md`.
