# Scholze, *Étale cohomology of diamonds*: extraction and routing

Job PAPER-SCHOLZE-17. Claude Code, session `cc-48533a`, 29 September 2026. The machine-readable extraction is `PAPER-SCHOLZE-17.result.json`:

- 617 items: 575 planned, 19 library, 23 missing;
- 5 routes;
- 5 prerequisite papers;
- 73 source issues.

**Version read.** arXiv:1709.07343v4 (14 April 2026), the "final version to appear in Astérisque": 168 pages, SHA-256 `78ca42bb…33efc`. The earlier arXiv versions (v1 2017, v2 2021, v3 2022) were not compared, and the Astérisque version has not appeared. Locators are v4 statement numbers and pages.

**How it was read.** The maintainer asked for this long text to be taken in checkpoints by chapter. It was instead read in full in one pass, by six readers in parallel, each taking a block of sections (§§1–6, 7–10, 11–12, 13–17, 18–21, 22–27). They drafted the items with exact statements, locators and a status against the atlas. The drafts were then merged:

- items that appeared in more than one part were removed (six, most of them outside results);
- one status that two parts disagreed on was settled;
- every library citation (32 declarations) was checked against the index at the pins;
- every quoted passage in the source issues was matched against the text;
- every source issue claiming an error in a stated result, and each principal gap, was checked again against the paper.

The extraction is complete, so no handoff is needed.

## What the paper proves

The paper builds a six-functor formalism for the étale cohomology of diamonds and small v-stacks, with coefficients torsion prime to p. The steps are:

- **§§2–6.** Spectral spaces and perfectoid spaces of characteristic p.
- **§§7–9.** Totally disconnected and w-local spaces; the pro-étale and v-topologies. The v-topology is subcanonical and O⁺ is almost acyclic on affinoid perfectoids (Theorem 8.7). Descent.
- **§§10–13.** v-stacks, diamonds, small v-stacks, spatial and locally spatial diamonds and their underlying spectral spaces, spatial morphisms.
- **§§14–15.** The comparison of étale, quasi-pro-étale and v-cohomology, and the category D_ét. The functor X ↦ X^♢ from analytic adic spaces over ℤ_p, with X^♢_ét = X_ét.
- **§§16–17.** Base change, and the four functors ⊗, RHom, f^*, Rf_*.
- **§§18–19.** Proper and partially proper morphisms, proper base change, and invariance under change of algebraically closed base field.
- **§§20–21.** Constructible sheaves and dimension theory.
- **§§22–23.** Rf_! and Rf^!, with the projection formula and base change.
- **§§23–24.** ℓ-cohomological smoothness, Poincaré duality for smooth maps of adic spaces, and quotients by profinite groups.
- **§25.** Biduality and finiteness over Spa(C, O_C).
- **§26.** Adic coefficients.
- **§27.** The comparison with étale cohomology of schemes.

## What the atlas already has

The atlas's diamond roadmaps were built from this text, and 575 of the 617 items are planned:

- **§§2–6:** PerfectoidSpaces P0–P6 and DiamondsAndVStacks D0.
- **§§7–13:** DiamondsAndVStacks D1–D5.
- **§§14–21:** DiamondEtaleCohomology C0–C9, with D6 and AdicEtaleGeometry for §15.
- **§§22–25:** DiamondSixOperations S0–S6. That roadmap has no packet yet, so these items cite its layer texts rather than nodes.
- **§§26–27:** AdicCoefficientsAndComparisons L0–L6.

ClassicalAdicEtaleCohomology and EnhancedDerivedSheaves supply the classical and ∞-categorical inputs.

Nineteen items are in the libraries, all read at the pins. Mathlib has:

- spectral spaces, spectral maps and the constructible topology;
- quotient maps onto compact Hausdorff spaces, and the Stone–Čech presentation;
- Krull dimension and Krasner's lemma;
- faithfully flat descent and descent data;
- Fontaine's θ;
- cardinal-filtered categories.

Tau Ceti has Huber's Tate rings, power-bounded elements, rings of integral elements and the open mapping theorem.

## Routes

The 23 missing items all go as sources to existing layers; no Part II or new roadmap is needed. They are:

- remarks, and statements made in running text;
- outside inputs the owning layers use in proof steps but do not state.

The five routes:

1. **DiamondsAndVStacks D0, D3 and D4** (8 items).
   - In D0, the foundations the whole paper rests on:
     - π₀ of a spectral space is profinite;
     - the reduction of cofiltered limits to ordinal-indexed ones;
     - the flasque constant sheaf on a spectral space with a generic point (Stacks 02UW);
     - SGA 4 VI 8.7.7 and 5.2 on coherent topoi.
   - In D3, the three algebraic inputs to Lemma 9.5:
     - Grothendieck's refinement of fppf covers of strictly henselian rings;
     - Raynaud–Gruson on finite presentation over valuation rings;
     - lifting special-fibre points of flat formal schemes.
2. **DiamondEtaleCohomology C2, C3, C4 and C7** (4 items):
   - the D⁺ formula for R_Yét;
   - the comparison of Rf_* with the left-completed étale pushforward;
   - Remark 18.2(b);
   - Proposition 20.14, which C7's plan for 20.15–20.16 uses but no node states.
3. **DiamondSixOperations S4, S5 and S6** (5 items). The remarks that bound the six-operation statements:
   - descent of representability along universally open covers, and the formal-smoothness criterion (S4);
   - Rq^! ≠ q^* (S5);
   - the failure, and the conditional extension, of conservativity (S6).
4. **EnhancedDerivedSheaves E3 and E5:presentability** (4 items). Lurie's HTT 5.5.2.2, 5.5.3.12 and 5.5.3.13, and Neeman's compact-objects criterion.
5. **SchemeAndStackFoundations SF.2** (2 items). Proper base change for schemes, and invariance of scheme étale cohomology under extension of algebraically closed field. SF.2 is the layer whose text asks for scheme proper and smooth base change.

## Source issues

There are 73 source issues: 44 misprints, 18 gaps and 11 errors. 25 affect a proof and 7 a stated result; none affects a main theorem of the introduction. Twenty were already recorded in the atlas (in PerfectoidSpaces, AdicEtaleGeometry, DiamondEtaleCohomology and ClassicalAdicEtaleCohomology), and each is cross-referenced; the rest are new.

**Stated results that need a correction:**

- **E14, Lemma 7.2(iii).** "Γ is exact, i.e. commutes with all finite colimits" is false for a disconnected X. On the two-point discrete space, which satisfies (i) and (ii), Γ does not preserve coproducts. The proof establishes, and the later steps use, only commutation with coequalizers.
- **E57, Proposition 20.14.** It is stated over 𝔽_ℓ but used for general Λ in Propositions 20.15–20.16.
- **E66, Proposition 23.16(iii).** It omits the hypotheses on f that make Rf^! defined.
- **E68, Proposition 23.17.** It omits "Λ ℓ-power torsion", which Theorem 1.10(ii) has.
- **E73, Proposition 27.7.** It needs Λ killed by an integer prime to p, the hypothesis of Proposition 27.6, which its proof uses.
- **Already recorded:** E5 (Proposition 4.4 for singular κ, PerfectoidSpaces/E40) and E49 (Lemma 15.3 for non-complete Tate rings, AdicEtaleGeometry/E19).

**Main gaps and errors in proofs:**

- **E1 and E2, Lemmas 2.9 and 2.10.** The generic-point argument intersects all opens U with U ∩ Z ≠ ∅ but never intersects with the preimage of Z, so the point it finds need not lie in Z. On Spec of a DVR with Z the closed point, the only such U is the whole space. The repair intersects with the pro-constructible preimage of Z and uses that Z is irreducible. The node DiamondsAndVStacks:D0/spectral-quotient-criterion copies the step.
- **E4, Proposition 3.5.** "R° ⊂ ⋃_k Φ^{−k}(R₀)" is false: take 𝔽_{p²}((t^{1/p^∞})), R₀ = 𝔽_p + tK°, and λ ∈ 𝔽_{p²} ∖ 𝔽_p. Only ϖR° is covered, which still gives boundedness.
- **E31, Example 11.12.** "For affinoid Z every continuous map |Z| → T to a compact Hausdorff space factors through π₀(Z)" fails for the perfectoid closed disc, whose map to its Berkovich space is not constant. Reducing to strictly totally disconnected Z repairs it. The node D4/compact-hausdorff-diamonds repeats the claim.
- **E33 and E34, Proposition 11.26, Lemma 11.31 and Proposition 12.20.** "The maximal point is open" fails when C⁺ has rank greater than one.
- **E46, Proposition 14.7.** The Čech argument needs H^q = 0 for 0 < q < i on the fibre powers of X′ over X, which are not strictly totally disconnected. As written it proves only i = 1.
- **E60, Theorem 19.5(ii).** Theorem 19.2 is applied to the annulus Y′_n → Spa(C′, C′⁺). That map is not proper when C′⁺ ≠ O_{C′}: the valuative criterion fails, since tⁿ/ϖ maps to a unit outside C′⁺.
- **Other gaps and errors:** in Lemmas 5.4, 7.6, 7.13, 10.13, 16.3 and 23.6, Propositions 6.5, 8.2, 8.3, 9.3, 20.16, 27.5 and 27.6, and Theorem 25.1, each with its correction in the JSON.

Where an atlas node copies a faulty step, the issue says so: DiamondsAndVStacks D0, D1, D3, D4 and D5, and PerfectoidSpaces. The misprints are wrong labels, swapped letters, missing primes and wrong cross-references; all are listed with their corrections.

## Prerequisite papers not yet covered by the atlas

1. Grothendieck, *Le groupe de Brauer III* (1968).
2. Neeman, *The Grothendieck duality theorem via Bousfield's techniques and Brown representability* (JAMS 1996), doi:10.1090/S0894-0347-96-00174-9.
3. Scheiderer, *Quasi-augmented simplicial spaces* (JPAA 1992), doi:10.1016/0022-4049(92)90062-K.
4. Temkin, *Topological transcendence degree* (J. Algebra 2021), doi:10.1016/j.jalgebra.2020.10.002.
5. Huber, *Étale cohomology of Henselian rings and cohomology of abstract Riemann surfaces of fields* (Math. Ann. 1993), doi:10.1007/BF01444911.

The DOIs were confirmed on Crossref. None of these papers was read for this job.
