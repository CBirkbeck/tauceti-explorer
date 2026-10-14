# PKG-AbelianVarietiesIsogenousToNoJacobian~2 — revision round 2 (complete)

Refs [#9155](https://github.com/CBirkbeck/tauceti-explorer/issues/9155). Claude (Opus 5.5), session
`claude-jepNGl`, 14 October 2026. Branch `claude-jepNGl-pkg-avnojac-2`.

## What was done

The package was rewritten to the binding shape of PACKAGE_REVIEW.md ("Shape of a roadmap",
2026-10-12) and the two required changes of REV-PKG-AbelianVarietiesIsogenousToNoJacobian were
resolved.

- **README.md** (3,374 lines, about 193 KB): `# Roadmap:` title, `**Summary.**`, layer table, Scope and
  ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, TauCetiRoadmap, atlas
  roadmaps), How to read the build, fourteen layers with `### k.n` prose subsections (statement with
  exact hypotheses, locator, proof sketch, API, *Needs:*, *Lean:* where typed, **Checks.**), and
  `### Examples` / `### Dependencies` closing every layer; Downstream consumers; References. All 95
  accepted targets are kept with every API name (85) and test name (57) of the accepted plan
  (script-checked); the reviewer's in-place rewordings (2A, 5E, 7E, 8A, 8B, 8F, 8G, 8H) and the
  mathematical boundaries the review lists (factor 2 in the Rosati trace, enlarged domain, the
  2d⁴+1 offset, strict order >W, genericity exceptions, 2^{16g⁴} versus sixteen-torsion, compact
  image versus hypersurface, Remmert–Stein in the singular ambient) are preserved. Proof sketches
  come from the accepted packet's proof steps, rewritten where they contained planning language.
  22 targets are new (below), 117 in all.
- **Suggested.lean** (586 lines): `import Mathlib`, one module docstring, namespace
  `TauCetiRoadmap.AbelianVarietiesIsogenousToNoJacobian`, layer section comments, real-bodied light
  definitions only (no sorry'd data; `scripts/check_sorry_data.py` passes), and the statements whose
  carriers exist at the pins: Siegel space, Minkowski reduction and the domain F_g with tests, the
  diagonal comparisons and Igusa's comparison, the block-product lemma, the period correspondence
  with its API, the elliptic matrix bound (on `ModularGroup.fd`), the subgroup counts, ψ and its
  sums, the compatibility `κ (I τ) = (I τ) ρ`, the rational Rosati square length with the trace
  identity, submultiplicativity, the determinant bound and all four entry bounds, the denominator
  lemma, theta constants with both shift laws and tests, the level Γ(e,2e) with tests and closure,
  the Fourier index count, the numerical degree bound (checked numerically for g=2,…,12 and with a
  growing margin), the Schottky form with the product factorization and vanishing on 2+2 and 1+3
  products, and the Newton series with its API. A closing comment lists every README target not
  typed at the pins, by layer. `lean-check` on the final file: exit 0, no errors, exactly 60
  warnings, all `declaration uses 'sorry'` (Mathlib 082e2d37e8, Tau Ceti f790474).
- **metadata.toml** unchanged (`topic = "math.NT"`). review.json left in place.

## R1 (Lean interfaces for all API names)

Superseded by the 2026-10-12 shape, which forbids sorry'd carriers and moves every statement whose
carriers are not at the pins into the README. Everything statable at the pins is now typed (61
declarations, five of them type abbreviations, and 23 examples; the previous file typed 3 targets); the geometric targets (Torelli locus, A_g, Λ-forms, Rosati of abelian
varieties, genericity, theta model, definability, isogeny estimates) are README targets.

## R2 (unlocated quantitative supplier contracts)

The three inputs had no owner layer anywhere: the routed owners FaltingsFinitenessAndIsogenyTheorems
Part II (design #3406), LogicAndDefinabilityInNumberTheory Part II (design #3384) and
ComplexMultiplicationAndExplicitReciprocity Part II (design #3405) have no layers, and
LogicAndDefinabilityInNumberTheory LD.6 is unplanned (its packet covers only LD.4). Following
WORKERS.md ("plans that notion itself"), the needed statements are now targets of this roadmap,
stated with exact hypotheses and freely readable sources:

| New section | Target | Source |
| --- | --- | --- |
| 1.1 | `periodTheorem` | Gaudron–Rémond, CMH 89 (2014), Thm 1.1–1.3, pp.345–346 |
| 1.2 | `ellipticIsogenyEstimate` | GR14 Thm 1.4, p.347, Lemme 7.9, p.393; MZ20 Lemma 2.2 |
| 1.3 | `isogenyEstimate` | Gaudron–Rémond, Mém. SMF 176 (2023), Thm 1.9(1), p.15; Tsimerman 2018 Thm 2.3 (MW 1995) |
| 1.4 | `endomorphismEstimate` | MZ20 Lemma 4.4 (MW 1994 main theorem); GR23 Thm 1.9(3) |
| 1.5 | `cuspValueLowerBound` | MW 1993 Lemmas 8.4, 8.6, (7.4), via MZ20 pp.656–657 |
| 1.6 | `averagedColmez` | AGHMP 2018 Thm A, p.392; Yuan–Zhang 2018 |
| 1.7 | `cmFaltingsHeightBound` | Tsimerman 2018 Cor 3.3 and Thm 2.1 (Bost) |
| 1.8 | `cmGaloisOrbitLowerBound` | Tsimerman 2018 Thm 5.2, Thm 4.2; Pila–Tsimerman 2014 Conj 7.1 |
| 1.9 | `cmBoundedDiscriminantFinite` | Pila–Tsimerman 2014 Lemma 7.4; Pila–Tsimerman 2013 Thm 3.1 |
| 2.1–2.2 | `OMinimalStructure`, `RanExp` | Pila 2011 Def 2.1 and pp.1791–1792 |
| 2.3 | `DefinableBlock` | Pila 2011 Def 3.1, Def 3.4, Lemma 3.5 |
| 2.4 | `uniformBlockCounting` | Pila 2011 Thm 3.6, Rem 3.7 (Pila 2009 Thm 3.5(2)) |
| 2.5 | `definableUniformization` | Pila 2011 Prop 4.3; Peterzil–Starchenko Thm 1.1; PT14 Thm 2.6 |
| 2.6 | `ellipticAxLindemann` | Pila 2011 Thm 1.6, Thm 9.1 |
| 2.7 | `WeaklySpecial` | Gao's appendix to ACZ18 §10.2; PT14 Lemma 2.1–2.3 |
| 2.8 | `axLindemannAg` | PT14 Thm 6.1, p.670 |
| 2.9 | `weaklySpecial_hodgeGeneric` | Gao's appendix to ACZ18 Lemma 10.2.6 |

Every affected direct input was re-pointed: 1C, 2D, 2H (→1.2); 2E, 7A (→2.5, 2.1); 2F (→2.6, 2.3);
2G, 7D (→2.4); 7C (→2.4, 2.8, 2.9, 2.7); 3I (→1.5, 0.11); 5F (→1.4); 8C (→1.3); 8I (→1.8, 1.9).
The elementary Rosati facts MZ20 takes from MW 1994 are proved here (5.2 submultiplicativity, 5.3
degree bound), with typed Lean statements.

**Ownership moves to record.** When designs #3406, #3384 and #3405, and the LD.6 blueprint, are
done, they should import Layers 1–2 of this roadmap (or take the targets over by a restructuring
proposal, after which this README cites them). AnalyticNumberTheory AN.4's request
`AN.4/colmez-finite-family` now has a consumer here (1.7 uses the AGHMP form, which needs only the
quadratic character).

## Supplier corrections found beyond the review (packet not edited)

A cross-check against the supplier packages showed that
several stage ids cited by the accepted packet are stale or wrong. The README now cites:

- ArakelovGeometryAndAbelianHeights R35.3/R35.4 (no packet, no package) → FaltingsFinitenessAndIsogenyTheorems
  §R28.1.5 `modularHeight`, §R28.2.1 `height_isogeny`.
- ShimuraCompactifications C5 (now good-prime integral PEL models) → ShimuraVarieties §2.1, §2.7
  `baily_borel`, §2.8 `koecher`.
- AutomorphicBundles B5 has no classical Siegel Fourier expansion → new target 0.11 `LambdaForm`.
- ShimuraData D4 has special points only, no weakly special subvarieties → new target 2.7.
- AlgebraicModuli R09.1/R09.2 (Hilbert/Quot/Hom schemes) do not contain dimension or generic
  projections → SchemeAndStackFoundations `SF.0/algebraic-scheme-dimension`, `SF.4/generic-projection`.
- ComplexComparisonPartII C0 is coherent modules → analytic spaces from AlgebraicModuli §7.10.1
  `ComplexAnalyticSpace`; Remmert–Stein and Chow from §C4.1, §C4.2.
- PELModuli M5 is now "Siegel, Hilbert and unitary examples" → §M6.5 `coarseModuli`, §M3.9; the
  level-one comparison A_g(C)=Sp_{2g}(Z)\ℋ_g is stated nowhere → new target 0.1.
- ModularCurvesPartII R13.4 owns no target → node `R13.4a/modular-polynomial`; R12.1 does not define
  j → ModularForms Layer 0 for j.
- "Integral Lattices, Layer 2F" → GeometryOfNumbersAndQuadraticArithmetic §1.2, §1.5 (the packet
  already cites GN.1 nodes).
- InverseGalois IG.2 → §IG.2.4, §IG.2.6, and §IG.2.5 for the integral thin-set count used in 6.8.

## Old → new numbering

0A–0I → 0.2–0.10 (0.1 and 0.11 new); 1A–1C → 3.1–3.3; 2A–2K → 4.1–4.11; 3A → 5.1, 3B–3J → 5.4–5.12
(5.2, 5.3 new); 4A–4H → 6.1–6.8; 5A–5H → 7.1–7.8; 6A–6N → 8.1–8.14; 7A–7E → 9.1–9.5; 8A–8L →
10.1–10.12; 9A–9F → 11.1–11.6; 10A–10D → 12.1–12.4; 11A–11E → 13.1–13.5. Layers 1 and 2 are new.

## Checks run

- `lean-check` (final file): exit 0, 60 `sorry` warnings, nothing else.
- `scripts/check_sorry_data.py`: pass. `research/blueprint/intake.py check-files`: 0 problems.
- Scripts: every accepted API and test name appears in the README; no unresolved cross-reference;
  every `§k.n` resolves; no forward *Needs*; tables have consistent columns; emphasis balanced; no
  process language. A Sonnet subagent confirmed that all 41 section citations and 8 node citations
  of other roadmaps resolve to the named heading or packet node (one citation corrected), that every
  *Lean:* name is declared, and that every "README k.n" pointer in the Lean docstrings matches.
- Adversarial pass on the typed statements: each was checked by hand (the trace identity by an
  explicit block computation, the entry bound with the constant 1/(√2δ), the elliptic matrix bound
  for every matrix and both orderings of the imaginary parts, the subgroup count ∑σ(n)≤m², the
  Schottky identity in genus one from Jacobi's identity, the shear example, the index count).

## Limits and notes for the reviewer

- Masser–Wüstholz 1993 (periods) and 1994 (endomorphism estimates) are not freely available; 1.4
  and 1.5 use the locators printed in MZ20. Pila 2009 is not free; Pila 2011 Theorem 3.6 (free)
  is the primary source of 2.4. GR23 measures End(A_L) by a Rosati covolume; the README cites it as
  a bound of the same shape and does not assert an exact comparison with D(A).
- MZ20 Lemma 5.5 prints ord(ϕ)≥W; 8.9 keeps the strict order >W obtained from vanishing through W,
  as the accepted plan and review require.
- The research problems of Layers 12 and 13 remain problems; the main theorem does not use them.
